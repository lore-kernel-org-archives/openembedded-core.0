Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.40553.1629212952712920589
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 08:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KPrXuIgk;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id az7so23410092qkb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 08:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a7lIREu3Ud9wxewm5OZUVmz6xdZf278LpvwEQHG/YT8=;
        b=KPrXuIgkpA3m2KR+zYkyHARcfcdl0UOlmq/95dXr9oyTfqPeNQyYb9zO0LMWizxK2w
         k9m8+lJrFnlqSXb6SzVFc5g6tLUx0pmKOFw2jPCEhYPguLNr9sZYWuwjVUVfLwpEpXVL
         DHm6lb4s4pv/4XfynKCXjYhFiHmRpKJ5KPxYWCTXz6JX0M5fw3CahBsO4ktRyDNVD6GJ
         nEcr0VgZv+Bz/ZJakKP6rXxQhNV05THD/5q3V4I8JsIa+l//wW3avT8G5YZlbu6OP4y3
         0gvcFR/EBt1WA6pYlCmtFDyDxImkPv9bF+EwUSzSHAHu0NKf33bBFgrB2tCI0r1QFHbo
         dPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a7lIREu3Ud9wxewm5OZUVmz6xdZf278LpvwEQHG/YT8=;
        b=r2wJr+2K60XDoL82Ast6mi++WGs0sTcYegSURv6k9V3trnMnARfVtd6P+vVvC47Neh
         dsMBvgykcL2K+v+0qdaHbxA/O7AtnwVPDGqnPbte0O1eRrkqPga0rz/h4rUBMrPz/yk3
         6fmBNDDVenOlT+Z7vNX5qqdyGy6TPmoAEgqIdFJu04ImhGuXUcy/fznkgZypzFKn+sig
         iasM7amJNPK20Sb1HHrG6NvvHW5msiRjpPZE2zIqXhsbTlXW4KkVfka2K0WtJ2QW5xHh
         Q+D2Jd7PGwN88uudIJEl8QzFJ9u0P64R/sKYXEY98c8+YQU7ycprcpnCBHewZLk3euzw
         PSdg==
X-Gm-Message-State: AOAM533wXJ6pn1jqsMe+dH+7E//yhyakt+NWS+VtmlRn+ya8RZGocHjk
	V5Crpm4OLmI7lJX/kT3u5Do9Dh6f1YZkZQZa4hI=
X-Google-Smtp-Source: ABdhPJxqTbVG+jZXw2XYJ1HACTzxcT2wLWPf+4OpMZlm/vkT5DKxLluA7u/eHZF+CCYlXaCqzd/6ngGz5mY5np07kvo=
X-Received: by 2002:a37:bc8:: with SMTP id 191mr4409753qkl.25.1629212951816;
 Tue, 17 Aug 2021 08:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <1628579261-7380-1-git-send-email-purushottam.choudhary@kpit.com>
 <CAOSpxdbihGhrEUqEd8+vgj5hvv-5wexzr2fN0zwpTMBuyp-5pg@mail.gmail.com> <CA+chaQdf7Yp77OWxYDcFSCfQ_Y=8xnjv3KVCgvNUfqeZ8sRaYw@mail.gmail.com>
In-Reply-To: <CA+chaQdf7Yp77OWxYDcFSCfQ_Y=8xnjv3KVCgvNUfqeZ8sRaYw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 17 Aug 2021 08:08:45 -0700
Message-ID: <CAMKF1spo8PvwkjYz+PB2UgmmuN=DkGJYiJ6z5Xk8sqjeLdEcnA@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] python3: Remove unused python3 recipe
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, 
	Purushottam choudhary <purushottam.choudhary@kpit.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, Mikko Rapeli <Mikko.Rapeli@bmw.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 17, 2021 at 8:00 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Tue, Aug 17, 2021 at 4:52 PM Steve Sakoman <steve@sakoman.com> wrote:
>>
>> On Mon, Aug 9, 2021 at 9:08 PM Purushottam choudhary
>> <purushottam.choudhary@kpit.com> wrote:
>> >
>> > Currently in dunfell branch python3 version is 3.8.11.
>> > so, python3_3.8.10.bb is not needed.
>> > Hence, removed.
>>
>> I don't feel good about removing a recipe from a stable release.
>> There may be people who are using 3.8.10 for whatever reason and
>> removing the recipe would break their builds.
>
>
> IMHO removing 3.8.10 is correct in this case, normally the upgrade to 3.8.11 from:
> https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=1ba51ee2d52ee92bbdede9f2cd2f9ed9ff04ddb6
> would remove the older version like the upgrade to 3.8.10 did couple days before:
> https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=471d19fa70c4c2b43a039909c9538e2223996335
>
> 3.8.10 recipe existed in dunfell only for about 2,5 weeks (and probably only by accident it wasn't removed with 3.8.11 upgrade), if someone started to depend on this exact version for whatever reason, then something is wrong with him or her :).
>

right. 3.8.11 is a bugfix release so keeping 3.8.10 around will also
mean CVEs we will carry with 3.8.10
> Regards,
>
>
