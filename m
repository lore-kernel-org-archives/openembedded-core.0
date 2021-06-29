Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web12.10181.1624982057671289915
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 08:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qfCgqeTz;
 spf=pass (domain: konsulko.com, ip: 209.85.167.176, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f176.google.com with SMTP id u11so26831765oiv.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 08:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EqGIu3EBq2FjRN1Mvfb9Ya+REpsA+FiJoa2kBdxopv4=;
        b=qfCgqeTz26mt6H2oDNdlDeSNpbCz2CdGPoOrSsgyoXncR+2/M7cx1zfJFv/sQcO3+Y
         S305/1HO7ZLEsh1T7ci9teTTEXK0MFJhiP+lfm56G5xqifsjpLWk/8BucSv72MexiRy5
         YGaWmRcfJhkJ8bYnPsfvEZ90AnLNaj7pzqU0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EqGIu3EBq2FjRN1Mvfb9Ya+REpsA+FiJoa2kBdxopv4=;
        b=my1PUE+Qd7ErQ2Fbocj7NpMyhxI5nMS1HFfMkRgaZcLQTG2z2HYXBi+XKjLQXBfZLu
         AgZKJEzkVW9aQP1mB8zfFRa6slFRtSjmRChPVnbJdg8Lw6fZL2tFu4ZhGuJ+BNVPnrWe
         OINOwRo6N3yBl8MH/Ju4xQ0J3iWxUfrC5COLr1XCsgfAhZyD8nhwEZmKYmjgscAPWbXE
         9Hwr9m28E9837PIcTK7WV4rYKoDZA5v3C15IL8dgqJJm4kTn2KZUNJjUP8LEJhG0Xc6v
         RNTx5ULKav2nrQ0Z8yQ4RTPGKHs+U6Ks8+MVdyOdqCnnQqBWVhWsFKH0oPoDcPj/eJrQ
         gCrw==
X-Gm-Message-State: AOAM533BCskXHiG7i6F7hxKdO9z1Djf6CNlqCO0i/sUGI7OYtb6P1Ma/
	OA3IOUKfX7/nlYyMsXBl0gRnOU9lZ2NkuBrj1dJxMQ==
X-Google-Smtp-Source: ABdhPJxo+uCC3ya4HasBAOrmA2aWT01le6Z5Tg/bp7K5NlYNed4HcQUCDRca4WDl8kZqYhxBN/QpZcX1atrHGqUarZM=
X-Received: by 2002:aca:3047:: with SMTP id w68mr18121263oiw.6.1624982057057;
 Tue, 29 Jun 2021 08:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210629140826.13243-1-akuster808@gmail.com>
In-Reply-To: <20210629140826.13243-1-akuster808@gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 29 Jun 2021 16:54:06 +0100
Message-ID: <CAM9ZRVvTUj6zNH-hg1ymQc+kGmKg5o0WrXAhct=LFqjNZgJ6-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/8] Safe PEP8
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, persianpros@yahoo.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Jun 2021 at 15:08, Armin Kuster <akuster808@gmail.com> wrote:
>
> I am forwarding a pull request;
> https://github.com/openembedded/openembedded-core/pull/71

Looking at the comments on that pull request, "I did this on more than
100 repos" suggests this hasn't been done with any attention to the
specifics of openembedded-core/bitbake. In my opinion that approach is
a waste of maintainer's time.

-- 
Paul Barker
Konsulko Group
