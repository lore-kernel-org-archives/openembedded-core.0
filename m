Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.16992.1621248084062753313
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 03:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S0ztdrIQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id j6so5401118lfr.11
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 03:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/UZ+fYV8/aNjhLET0oTPiyiKyXXgwhsurqqA7t13yhM=;
        b=S0ztdrIQrpjv7QC8bG9YBlLmZMEs8X55zRpoqe4FhDI4S8A/T1vfjDIyac2zrXg6DQ
         6sp5vuncbSL8W74EVA8TvjFZI4GBBsQcnDIoJYUojauaMEIASm8AJJdrn7gEIy9DKcGH
         ROqnmMuTiqcl7a8M6hKEwQTUuulgtfkKdfCaSBaj6yNX7tVDzGdA8lrh1iyZ2UyMZX6m
         oANq96MUDRis7Ctti7tGGx9yj2Q/Kg0hf3/0iHJp+xYmAbaq/FpIfu5zq7bHR69IY6Jx
         OlOL6eSfAhmRnpKPBdnuXfavnkqKw9qMpWDchzj6+1+LyaCsGJLQj0xKFDfJ5YQLfRiS
         aXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/UZ+fYV8/aNjhLET0oTPiyiKyXXgwhsurqqA7t13yhM=;
        b=Wn6ug+4hMevwt7JS6TZRQIkCCPSkWR2ECDs1ulV1YqLCYV8YgObGCrB3lcWYSo1ADx
         +fmRW73H8g9NB48oXypfAJVkCGhVz7XRtgC1weGPFMn7BmC40HvzmoNOrGgobjT6C3lJ
         f6ap28NJ/N2LAxxncb8Px41uH09UKNFz4/YBs/ToE2hQXH/w1/noXXaj4lbjI2B0kcMs
         SlHvZKGpmwlyu5a8Mk75/k7grJMT8s9pp58UNuydOr+UOjPdlHxnYyr2AolFSn4HlId1
         xB4bIVtDb30h+wlTi5tuH8qVnNtWeYe2iUzs+IBS7yIvatLt3xaHnoFtPODGYK9K71j/
         XMdQ==
X-Gm-Message-State: AOAM532dXF4kVRj0GV32wRU1PRQPTX969bHS9E/AP8Svw7rgjGjM+VYa
	W63WPmMKHIYLtww2wiyxmKnDl2Fe99gTp+3lGSg=
X-Google-Smtp-Source: ABdhPJyIw0AHsPJDZONwuhNAkZe6bdEVvsI0M11BA3cMfL6L5eHI4ansCVkgmxuMXcdMUZR2EsgFPFCal7sK8ifNv4w=
X-Received: by 2002:ac2:5a1b:: with SMTP id q27mr5180107lfn.8.1621248082301;
 Mon, 17 May 2021 03:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj85zmWjRe2KR53u_eF-DDf47eR9eOJnP1Ch0Df6COoAaA@mail.gmail.com>
 <20210415093227.175608-1-vinay.m.engg@gmail.com> <20210415093227.175608-5-vinay.m.engg@gmail.com>
 <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
In-Reply-To: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Mon, 17 May 2021 16:11:10 +0530
Message-ID: <CANUMPcUK6VLHj18e3Kq2qOx00noBubLGScPpWOyobkHT+cGvdw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/8] There are some error messages like, "error: linker `cc` not found" got fixed by adding "cc" in hosttools.
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	vinay.kumar@blackfigtech.com, Alexander Kanavin <alex.kanavin@gmail.com>, 
	kweihmann@outlook.com
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Please excuse the delay in reply, I was loaded with some other priority tasks.

>> I definitely agree this should be fixed elsewhere to use BUILD_CC.
>> We've managed without 'cc' for this long, we shouldn't need to start now

The linker error got fixed by using below setting in config.toml
config.set("rust", "default-linker", e(d.expand("${RUST_BUILD_CCLD}")))

So removed 'cc' from hosttools as per your suggestion.

>> I noticed your patches don't have shortlog entries so the subject lines in these emails are rather long.

Sent v2 version of patches for review with suggested corrections.
link : https://lists.openembedded.org/g/openembedded-core/message/151916

Regards,
Vinay

On Fri, Apr 16, 2021 at 3:47 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2021-04-15 at 02:32 -0700, Vinay Kumar wrote:
> > Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 3438be92b7..83e1b68071 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -483,7 +483,7 @@ HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
> >  HOSTTOOLS += " \
> >      [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
> >      cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
> > -    fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
> > +    fgrep file find flock g++ gawk gcc cc getconf getopt git grep gunzip gzip \
> >      head hostname iconv id install ld ldd ln ls make md5sum mkdir mkfifo mknod \
> >      mktemp mv nm objcopy objdump od patch perl pr printf pwd \
> >      python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
>
> I definitely agree this should be fixed elsewhere to use BUILD_CC. We've managed
> without 'cc' for this long, we shouldn't need to start now!
>
> Also, I noticed your patches don't have shortlog entries so the subject lines
> in these emails are rather long. We'd need to have that fixed to be able to
> handle the patches.
>
> Cheers,
>
> Richard
>
