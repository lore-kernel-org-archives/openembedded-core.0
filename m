Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.12793.1611671392970512551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:29:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HhnG/cCs;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.51, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f51.google.com with SMTP id a1so16690512wrq.6
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WldaWdpgFYKi8eLPKjxrSDs9m/8EELhBatGzkBJhkbU=;
        b=HhnG/cCsmyO5vNof8whYXlsQh7n1h9eGqUx9WYUpfrTA7j64TTkU2P16QTv8lmY7rJ
         X75wJLjsRAMMDA5UAzjVtSIxwr4b2U7kTITXJWnveSHY7t4OOcNsUSNOAa+EC1KnEGsV
         upqwxkUxLqiB2k+qy3rprjIr5RCHZxvsieuSToeQ6kbhyPEbQM49kA7WZR1sGRiNSAI+
         T9F2sToerHF/BKkYQ6rsdPiguPidj3AlNi7CPeCsG/hi3gCnLwM6DDWtd5RM8uDMdsoT
         2gI8DUyNGsnur2qXw2AN1Nhc/duPgCS9NET+NDNb4l9OAqKyeKvghIUR9WyEUP0p5mYY
         VNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WldaWdpgFYKi8eLPKjxrSDs9m/8EELhBatGzkBJhkbU=;
        b=Jdcd31ocLIROjAj3L78T/lK1UXGeGlwzFouKmY2iSpUtx3V6M00sNJjrPOWoSTrEVI
         1hn7IC7pPwiYrgkVSbKMhD+U0fDD0j2uyzDEB29pIVxxIMqUz4PGVxlA/pEmsYMqG/K6
         8mJ0Qq2GY8anYeTtDfYw55+pWFRx+5Bt8XHzv8Ro1IJtY2Q8rvvYLlE6Wo4vZ4eiPL3n
         pBgPJHtfO6spQgiAkZbPRNRrxjXA+lpFNfUb+6WA2srqhavIMl56K7UMoZFvEs9A8C0o
         YQVwab9qkuwn9LdXmmTR52Jj9wKbFjblE1GqnqtD1NHJy5Y29YOjGM8FFSdTPoYyJWPH
         aPaw==
X-Gm-Message-State: AOAM531e2bqSNfgNzKskIQQrm2KLtyJH3ui4mzuuM8FX2cvPdyBqeXOl
	8iD7/aaGztjdTQa0DPmBTNsnaZjDJroA4Ek+UIXTbg==
X-Google-Smtp-Source: ABdhPJwrHHp83qQ6rufbhfdxzE7gyATBNeg5BeA1rlX0QSiB+5g1Up7I24Mu7feMeRtfCmCPbTRrylEXN7VjbBNugzw=
X-Received: by 2002:adf:f18a:: with SMTP id h10mr6287191wro.299.1611671391465;
 Tue, 26 Jan 2021 06:29:51 -0800 (PST)
MIME-Version: 1.0
References: <CAHtQpK71uAoq_hwDGJCvt5O_=kNXHkWFkmHC-BQkzcSCM3ys7A@mail.gmail.com>
In-Reply-To: <CAHtQpK71uAoq_hwDGJCvt5O_=kNXHkWFkmHC-BQkzcSCM3ys7A@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 26 Jan 2021 04:29:39 -1000
Message-ID: <CAOSpxdZ_0+QOwnpaCMMm=+1WUcedQ7aqnm=rmg1=_bU8TWOELQ@mail.gmail.com>
Subject: Re: [dunfell]: gpsd recipe (3.19) build is broken
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Armin Kuster <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andrey,

Thanks for reporting this issue.

I'm the maintainer for the dunfell branch of oe-core.  The gpsd recipe
is part of meta-openembedded. I'm copying Armin, who is the maintainer
for the dunfell branch of meta-openembedded.

That said, I'm surprised you are seeing this issue since the gpsd
recipe has been fairly stable for quite some time.  I know that Armin
does test builds quite frequently.

FWIW, I tried doing a gpsd build with oe-core, meta-openembedded,
meta-freescale, and meta-freescale-distro on an Ubuntu 20.04 and it
completed successfully.

Perhaps more information on your environment might help.  What
distro/version is the OS on your build machine? What other layers are
enabled in your build? What are you using for MACHINE and DISTRO?  Do
any of your layers have a .bbappend for gpsd?

Regards,

Steve

On Tue, Jan 26, 2021 at 2:13 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> Hello Steve,
>
> gpsd recipe build breaks on the dunfell branch with following error messages:
>
> | /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch64-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:
> ./libgpsd.a(ppsthread.o): undefined reference to symbol
> 'pthread_create@@GLIBC_2.17'
> | /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch64-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:
> /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot/lib/libpthread.so.0:
> error adding symbols: DSO missing from command line
>
> This cannot be reproduced on the current master branch, where the
> version of gpsd recipe has been bumped up from 3.19 to 3.20.
>
> Can you please consider to cherry-pick following commits from master
> in order to upgrade the gspd version on dunfell branch:
>
> 98e61961c gpsd: add new init script
> 04afc692a gpsd: mark CLEANBROKEN
> 33a15c790 gpsd: fix build on aarch64
> cecab9c4c gpsd: Upgrade 3.19 -> 3.20
>
> I've tried to cherry-pick them locally and they do apply clean. Also
> the build of gpsd is successful after this upgrade.
>
> --
> Regards,
> Andrey.
