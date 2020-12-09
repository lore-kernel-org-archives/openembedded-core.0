Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.2209.1607545431912338410
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Dec 2020 12:23:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Biw38fXB;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.43, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f43.google.com with SMTP id i24so2998885edj.8
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Dec 2020 12:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ia6bE7BXQjqS3wLm/mji3QpmO05RVluoshZ3r4x463Y=;
        b=Biw38fXBTIu3y2OgxZ8RN8Hs3o7iekWzkOFKdOXCoKA4TtMQXpSegtbeQl935OJrGj
         9G97Rit8Pyz7OVfjg4M4OeazYCcd8mz6RCmtNbAWX2PXLChbaBFlaDn+kerWaU0x8kip
         0dVNwR5vNCt56ze6csLRAlQD22HMxxk8d7SoozDeSPgDMtSVd7D/5msryG/vPAIOyvUV
         vKAFKz3m6lQ2AcgN3M66k7gAlFHzbOig+8Plo3i2ZZq3U88fke2IOqdex/a9kPLKhTZn
         4O8GeupARw/K9egPNAZmOC0y4hzxy62gltcE0P7qlLgWa9EkaI00zhTZvYEx+aQc4vZK
         UHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ia6bE7BXQjqS3wLm/mji3QpmO05RVluoshZ3r4x463Y=;
        b=imVRWmSPn5saXHVxZr69QQuTOWLnyjzu9fodZwGdxCAlr0ncZCAEGClhqUcmTJWAwn
         VqdLARMW9mtwrmaarQI+ibVLN1ECKA77ewus1j6aVcmOVjbLxzfzeHVXkPru9G3UxKHk
         uYbggmrldFzz5VDHPtCxaOsga0RUVT6237NJE2yCtVxra6tjV5xdAZ0aIIhtgd9yY0bV
         9PwjZIKiZhAg+Y11tigDgS3QlSY9cPwj2yzbR45/IWIpkBuo9OQ+4DjTTxbypbS6oTo3
         M1Uj1alk1UePdMZU+gLQetzGDU2NJGJomiyKW9MYMaML/Wu6vwharo1hcSr3Mfrlg5dF
         cfQA==
X-Gm-Message-State: AOAM533I3GTGoKvzdvU/AIRc/hT1LTd6Lg5XIlmGtY5jPrGxsGAxZjHq
	kGG1srUmtWgTJ+GdKNuAC2ezdHWtf/WkTfriXJv0vw==
X-Google-Smtp-Source: ABdhPJxHNRZ7+LZv01DtrjYNisiEDFSN/9ifnFDiqxeek7w/6dTR/gJrI9x5vjPHMo5+XSV9NE3BF7Kn8vqhi8Sgjck=
X-Received: by 2002:a50:d60f:: with SMTP id x15mr3563843edi.224.1607545430343;
 Wed, 09 Dec 2020 12:23:50 -0800 (PST)
MIME-Version: 1.0
References: <20201209192111.21817-1-dmurphy@ti.com> <20201209192111.21817-2-dmurphy@ti.com>
 <CAOSpxdbceaaD4NKn34zwb73+jP1Y9ra7UwYi82LNL-KmPLGs5g@mail.gmail.com> <95a23893-b7ea-68b3-18ab-f11cd2209a19@ti.com>
In-Reply-To: <95a23893-b7ea-68b3-18ab-f11cd2209a19@ti.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 9 Dec 2020 10:23:39 -1000
Message-ID: <CAOSpxdZeotQV7wy-oYS1qbbWnKxyUohYb4_5mn2iq9-o3jQ64Q@mail.gmail.com>
Subject: Re: [OE-core] [dunfell] [PATCH 2/2] lz4: upgrade 1.9.2 -> 1.9.3
To: Dan Murphy <dmurphy@ti.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 9, 2020 at 10:03 AM Dan Murphy <dmurphy@ti.com> wrote:
>
> Steve
>
> No it has some enhancements.

If it has enhancements then it probably isn't appropriate for LTS, we
should stick with 1.9.2

> I was not sure if we wanted to use the dev
> branch as opposed to the release branch.

Is 1.9.2 available in the release branch?  If so then that seems to be
appropriate.

Steve


> On 12/9/20 1:55 PM, Steve Sakoman wrote:
> > Hi Dan,
> >
> > I already have the first patch of this series in testing.  Is version
> > 1.9.3 a bug fix only release?
> >
> > Steve
> >
> > On Wed, Dec 9, 2020 at 9:21 AM Dan Murphy via lists.openembedded.org
> > <dmurphy=ti.com@lists.openembedded.org> wrote:
> >> From: Alexander Kanavin <alex.kanavin@gmail.com>
> >>
> >> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> >> ---
> >>   meta/recipes-support/lz4/{lz4_1.9.2.bb => lz4_1.9.3.bb} | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>   rename meta/recipes-support/lz4/{lz4_1.9.2.bb => lz4_1.9.3.bb} (90%)
> >>
> >> diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.3.bb
> >> similarity index 90%
> >> rename from meta/recipes-support/lz4/lz4_1.9.2.bb
> >> rename to meta/recipes-support/lz4/lz4_1.9.3.bb
> >> index 455d2a5141f0..00f2dd32fedd 100644
> >> --- a/meta/recipes-support/lz4/lz4_1.9.2.bb
> >> +++ b/meta/recipes-support/lz4/lz4_1.9.3.bb
> >> @@ -9,9 +9,9 @@ LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc \
> >>
> >>   PE = "1"
> >>
> >> -SRCREV = "fdf2ef5809ca875c454510610764d9125ef2ebbd"
> >> +SRCREV = "d44371841a2f1728a3f36839fd4b7e872d0927d3"
> >>
> >> -SRC_URI = "git://github.com/lz4/lz4.git;branch=dev \
> >> +SRC_URI = "git://github.com/lz4/lz4.git;branch=release \
> >>              file://run-ptest \
> >>              "
> >>   UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
> >> --
> >> 2.29.2
> >>
> >>
> >> 
> >>
