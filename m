Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web11.10621.1589538732456749531
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 03:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=o/bKBBMB;
 spf=pass (domain: konsulko.com, ip: 209.85.167.194, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f194.google.com with SMTP id v128so1766930oia.7
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 03:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZisWglhil3n0sdpZwGaLXObJAhlFNVM1JNlXHgsQRXA=;
        b=o/bKBBMB2ZBRyXETy2Q6MV55BuOLykDdn2LCjI1VVCloHYXYHZDOiWuxWsuSdPor4M
         6SFK4uSjhVchD7ci78Pj9QGn8AHTraiYrAcjn7KoLT566QBlgXCuBDEbEAripEVtMnMd
         mDhx3DgyPV8OxRm19b8IandE4yAHat+8Wffxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZisWglhil3n0sdpZwGaLXObJAhlFNVM1JNlXHgsQRXA=;
        b=aClOdnOVV8BDzDgZw4RbDASBB4W5nKr4iT0s8P+Ns49C1GxmsSUqKh3sSSizbLBrh9
         DkLsykLSwseRupqqm+wgib01hyXfMMmQRB3YZvMJ0mf4wF2b+Bpc2sKD/PaDbzxSCENw
         JsHYps4NoQh3yP8kyt7dOT+etr/v9dLy1jqHATL9DmxUg95e91itQ5G9Qr9KBzxCDrdn
         etcAXM+B3Lo4kBOEI4JRT+g2f5f0eooJxkCpE5se0JAU37rbTepDgPQKCGICK3Zz94Sw
         KC0AqasFQMmDI7jRqGxRwWWEVDvVIvnlCzgJxxGZZP71cXI37Ne+LeXEifeoYbfOqgkw
         1wTQ==
X-Gm-Message-State: AOAM531H+GDpB3PYDIRiKzqReEDwYuYbTUr5ZTVUbxYBzdLH0EFoXzP/
	2VQ4l7J7/Z8fA2AI28BwnZlivgw0DFSB6LQmMtAgWQ==
X-Google-Smtp-Source: ABdhPJx182nohI7UHjWxp9lC1w3z6WDSxqTqd40vz50TMOyU3diH9N09z2+D45ldPZaDQwvvNVq1QMyG0vW0BbG2PG4=
X-Received: by 2002:aca:ea46:: with SMTP id i67mr1494811oih.152.1589538731771;
 Fri, 15 May 2020 03:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589536566.git.liezhi.yang@windriver.com>
 <38eda2606c19cf817d09b35f1eb49d50170a52ae.1589536566.git.liezhi.yang@windriver.com>
 <CAM9ZRVuv+aL55apdEvFeqrHx_Nq=CKA1EAk=QkfhC92+9UrSMw@mail.gmail.com> <cb24e3cb-d771-7100-dc4a-7c59ee002b7d@windriver.com>
In-Reply-To: <cb24e3cb-d771-7100-dc4a-7c59ee002b7d@windriver.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Fri, 15 May 2020 11:32:00 +0100
Message-ID: <CAM9ZRVsZ0z1PVWTd4cFoL1b+=wgAjcN2J98Koe7PrQux9U0BTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] archiver.bbclass: Add ENABLE_COPYLEFT_FILTER to enable/disable copyleft_filter.bbclass
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 May 2020 at 11:22, Robert Yang <liezhi.yang@windriver.com> wrote:
>
>
> On 5/15/20 6:16 PM, Paul Barker wrote:
> > On Fri, 15 May 2020 at 10:57, Robert Yang <liezhi.yang@windriver.com> wrote:
> >>
> >> Set it to 0 can make it archive all the used sources during the build, nothing
> >> will be filtered out, this is useful when we want to archive all the sources.
> >>
> >> This equals to:
> >> COPYLEFT_LICENSE_INCLUDE = "*"
> >> COPYLEFT_LICENSE_EXCLUDE = ""
> >>
> >> But there are a lot of settings in copyleft_filter.bbclass, so it may not work
> >> when its default settings are changed, add the var ENABLE_COPYLEFT_FILTER will
> >> make it more reliable.
> >
> > Why would copyleft_filter.bbclass not work when the settings are
> > changed? They're intended to be configurable.
> >
> > I've been using `COPYLEFT_LICENSE_INCLUDE = "*"` in several projects
> > for years now. I'm not sure that we need another overlapping variable
> > which could confuse users further.
>
> As you know, there other settings in copyleft_filter.bbclass may affect
> the result, such as:
>
> COPYLEFT_RECIPE_TYPES
> COPYLEFT_PN_INCLUDE
> COPYLEFT_PN_EXCLUDE
>
> These settings maybe changed, and it's not easy to detect the changes,
> the ENABLE_COPYLEFT_FILTER can make it more reliable.

I still don't think I understand sorry. Why can't changes be detected?
What's unreliable in the existing code? Are there specific failure
cases we can give examples of?

I think there's a good argument for renaming copyleft_filter.bbclass
and all the variables since the names are confusing when you want the
archiver to include non-copyleft packages. But that would cause churn
and break lots of people's configs so I've never proposed it. Not sure
we need a master variable to enable/disable the whole class though.

Thanks,
Paul
