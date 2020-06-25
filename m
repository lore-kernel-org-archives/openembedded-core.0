Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.5687.1593071079506340429
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 00:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=T/94FLpp;
 spf=pass (domain: konsulko.com, ip: 209.85.167.176, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f176.google.com with SMTP id w17so3473143oie.6
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 00:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=anY/ProUNILlFFYvorbZmk0j3dsgaGNemwzxrTMQxhc=;
        b=T/94FLppsHThWQfuWq/CXmBZq2C0UIrU9EObPDeaDENTVdYnWtyr+EHGKw1ZVj/diD
         8LDUlZW5wFsFzeGNbuGPgDv6AcYjJCT/HLqAVl2rl3dbtbRFssUvXiaziSddnQ7nYoTR
         iLqwBHl1hx6EirvuLTM+HiaUxAGOc2qJE6TSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=anY/ProUNILlFFYvorbZmk0j3dsgaGNemwzxrTMQxhc=;
        b=PDSVxcyD52pzNmeMjh1m7rsbAv3v6DlnIdcWgnsVBW5wDc1n0mw0wvuqbsVzwlQ5Zw
         EWR+F3JND59QqkrRKH9BdWhrz9i4rQD4Iy47WVra5Zx1GSEybXFMSWi+om+SZagCnE+6
         iHLngPa5rZWGmlf0Uv288VWBEka2yuWi78RWU2NMWnGWt0v4k4xzOok0H/63EjpMkUjJ
         OKLDXQ6+XKqyhe6b8EFXWXFg/9LMh7kZ0EnYP2LZFOCbfIZVVz8eWQVZL7I2ZD59SDRJ
         vB4BPb2hZ6DxjcjcUbjaf7InKxD9gLyJTWx2W3SWlJUCIx5GUUTqukp0kG79lVZHO2t8
         cYkA==
X-Gm-Message-State: AOAM532ZuQ0Hvjgsp+kEUkVZGjhyZ5u/EsHQ+MJIjwbrfSvRDFBZg9PM
	aPGBK+jUxRWQRolRiOHw2LmiiVten2uHy+KTaowXhw==
X-Google-Smtp-Source: ABdhPJysbCu4Pup32aHCyBHhTLqKA8q2et4gnMhkk+6XfaJ3zvv30gESoabXO9BWha44Ifoy89wL1KQPMeqRTHbLZ6Y=
X-Received: by 2002:aca:49cb:: with SMTP id w194mr1128708oia.152.1593071078825;
 Thu, 25 Jun 2020 00:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <HwH9.1592848739113991729.4KYH@lists.openembedded.org>
 <CAMKF1srh_irBczqSkJo8jcqFc6aLWJZp1zEChz=0F8djZ=ecYA@mail.gmail.com> <CANv91vM2A94cH8HQ0275gfzCB1OtARxt0hTVrBNB5a1ZuYXNzA@mail.gmail.com>
In-Reply-To: <CANv91vM2A94cH8HQ0275gfzCB1OtARxt0hTVrBNB5a1ZuYXNzA@mail.gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 25 Jun 2020 08:44:28 +0100
Message-ID: <CAM9ZRVvtKj7-1Mj-WAvPm+VmK9WvkjdX9Zr3HovkOJKVAcd1bw@mail.gmail.com>
Subject: Re: [OE-core] package bzip2-ptest requires /usr/bin/sh, but no providers found in RDEPENDS_bzip2-ptest
To: Rahul Kumar <rahulk@mvista.com>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jun 2020 at 08:04, Rahul Kumar <rahulk@mvista.com> wrote:
>
> Hi khem Raj,
>
> Create a patch to update.sample where it asks for /bin/sh instead
>
> I don't think we can create a patch to update.sample file because this is git hidden file.
>
> .git/hooks/update.sample
>
> In my Patch fetching bzip2-tests.git repository as mentioned below Is there any issue with below line.
> SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
>            git://sourceware.org/git/bzip2-tests.git;name=bzip2-tests \
>
> At my local system i am not able to face this issue but when this patch built with open source auto-builder then reporting below error
> do_package_qa: QA Issue: /usr/lib/bzip2/ptest/bzip2-tests/.git/hooks/update.sample contained in package bzip2-ptest requires /usr/bin/sh, but no providers found in RDEPENDS_bzip2-ptest? [file-rdeps]
> step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
>
> I have stuck here. I am not aware why do_package_qa is reporting errors with git hidden files.

Do you need to install the whole git repository? Typically this issue
wouldn't be seen as .git would not be part of the installed package.

Perhaps instead of running `cp -rf $(srcdir)/../git
$(DESTDIR)/bzip2-tests` you need to copy a more specific subset of
files & directories.

-- 
Paul Barker
Konsulko Group
