Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.6098.1592521470190176268
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 16:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lbXpLde5;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id n9so3135793plk.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 16:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:references:to:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=LH322OaFWlHgEVnBFi9nhPstLNPQ0V7nlhJ07apDufA=;
        b=lbXpLde5WK2t/Vs5VkiJhZl9soVnHAMWRY7DgbPBn/Duh99Ihuzup9/VDWTe9W9YGl
         fry+4bF8mS+vlbHUJjGgxJy7XfKz9rDVP8mPbm4xkBTcnR88hdsx57mnB+04PPdbJ8Tv
         +7s4FYsY/alBFe8Bu/uN1f7F0pEMZIHl7axwG4t22Maf1bhKVpgp+iLyqmzQH8zg2OGV
         vKKIfmZN86/FoLLjThFpNWDxEhoJ1VVj/UuGVwJ+G4LVSUk0todto6+OD5pXTZW5G/ML
         IDbQGqZUQHwxcCYIp0C2W0v6YhENjzJtohNZq3ONsTxa/g8UZrcRJjmeQQ/83xDr36FT
         yJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:references:to:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=LH322OaFWlHgEVnBFi9nhPstLNPQ0V7nlhJ07apDufA=;
        b=j/BEL3KH2389QesyEboe4QLiy8K7E36JLQ1sOWlLcfJ/7B0ii4isgTrAmy3dUXUXxM
         SQFiBNmFgUa75W6Gp7K1IvW8plpJuU/kPvgRuseH51T+6pkE35qBzD4IJwzNBdWnJau+
         y/zn/cmDInCd7UUmEA07FJBv1b5B6yLy792tFEq7Yx02OGjwwk1Z7ruFdiMhTQVoNF8Q
         ho9CQPGF4/Kdlidlxq59mHmVpfGiq1kP/HVZ+fjWtd0OBDAq2Oe4lpx3kbpf1E2A9Iho
         sTuofveQTdGPNmoB1CD9y5x/TUm0p2F03iHWREpVCpMUUU4+GgDstJw6cXfRPJCG+9IS
         WL2g==
X-Gm-Message-State: AOAM531PdSse+MDmEPoVbPVEc3Rlyi+EfzMy9Muq6NBCvDcrd1XUOhOi
	fsSP1Lpoe4FDbFtaWHFmR2CXafG8
X-Google-Smtp-Source: ABdhPJwyFNuBoLixPlIzUjh9ZgDCCPPmcxHEqw81qTJ0Mjb2PR2h7BaUiqkBh3p0LDnlbc6DJ1kt8A==
X-Received: by 2002:a17:90b:1b06:: with SMTP id nu6mr643693pjb.106.1592521469323;
        Thu, 18 Jun 2020 16:04:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:dcab:46d6:88c3:a9ce? ([2601:202:4180:a5c0:dcab:46d6:88c3:a9ce])
        by smtp.gmail.com with ESMTPSA id a63sm2462709pfd.111.2020.06.18.16.04.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 16:04:28 -0700 (PDT)
Subject: Re: [AUH] bind: upgrading to 9.16.3 FAILED
References: <20200617082230.09F25E01D1A@yocto-www.yoctoproject.org>
To: openembedded-core@lists.openembedded.org
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <496f5668-a08b-b24e-4632-ad0cffa606cd@gmail.com>
Date: Thu, 18 Jun 2020 16:04:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200617082230.09F25E01D1A@yocto-www.yoctoproject.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 6/17/20 1:22 AM, auh@auh.yoctoproject.org wrote:
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *bind* to *9.16.3* has=
 Failed (devtool error).

Its on my list to update the work i did awhile back.

-armin
>
> Detailed error information:
>
> The following devtool command failed:  upgrade bind -V 9.16.3
> NOTE: Starting bitbake server...
> INFO: Creating workspace layer in /home/pokybuild/yocto-worker/auh/buil=
d/build/build/workspace
> Loading cache...done.
> Loaded 0 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 775 .bb files complete (0 cached, 775 parsed). 1330 targets,=
 33 skipped, 0 masked, 0 errors.
> INFO: Extracting current version source...
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "1.46.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "x86_64-poky-linux"
> MACHINE              =3D "qemux86-64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "3.1+snapshot-20200616"
> TUNE_FEATURES        =3D "m64 core2"
> TARGET_FPU           =3D ""
> meta                =20
> meta-poky           =20
> meta-yocto-bsp       =3D "tmp-auh-upgrades:816a12758bfcb5409accbf636ec5=
8d9fa917cdb6"
> workspace            =3D "master:816a12758bfcb5409accbf636ec58d9fa917cd=
b6"
>
> Initialising tasks...done.
> Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% co=
mplete)
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be r=
erun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 8 seconds
> INFO: Adding local source files to srctree...
> INFO: Extracting upgraded version source...
> INFO: Fetching https://ftp.isc.org/isc/bind9/9.16.3/bind-9.16.3.tar.gz.=
=2E.
> Loading cache...done.
> Loaded 1330 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 776 .bb files complete (774 cached, 2 parsed). 1331 targets,=
 33 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "1.46.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "x86_64-poky-linux"
> MACHINE              =3D "qemux86-64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "3.1+snapshot-20200616"
> TUNE_FEATURES        =3D "m64 core2"
> TARGET_FPU           =3D ""
> meta                =20
> meta-poky           =20
> meta-yocto-bsp       =3D "tmp-auh-upgrades:816a12758bfcb5409accbf636ec5=
8d9fa917cdb6"
> workspace            =3D "master:816a12758bfcb5409accbf636ec58d9fa917cd=
b6"
>
> Initialising tasks...done.
> Sstate summary: Wanted 0 Found 0 Missed 0 Current 0 (0% match, 0% compl=
ete)
> NOTE: No setscene tasks
> NOTE: Executing Tasks
> WARNING: Failed to fetch URL https://ftp.isc.org/isc/bind9/9.16.3/bind-=
9.16.3.tar.gz, attempting MIRRORS if available
> ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=3D1; unset=
 _PYTHON_SYSCONFIGDATA_NAME; export ftp_proxy=3D"http://proxy.yocto.io:51=
87/"; export FTP_PROXY=3D"http://proxy.yocto.io:5187/"; export PATH=3D"/h=
ome/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x=
86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scr=
ipts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipeto=
ol-jyvexl6r/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/po=
kybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-jyvexl6r/w=
ork/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/=
build/build/build/tmp/work/recipetool-jyvexl6r/work/recipe-sysroot-native=
/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/rec=
ipetool-jyvexl6r/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto=
-worker/auh/build/build/build/tmp/work/recipetool-jyvexl6r/work/recipe-sy=
sroot-native/sbin:/home/pokybuild/yocto-worker/auh/
>  build/build/build/tmp/work/recipetool-jyvexl6r/work/recipe-sysroot-nat=
ive/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/ho=
me/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HO=
ME=3D"/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp --no-c=
heck-certificate -P /home/pokybuild/yocto-worker/auh/build/build/build/do=
wnloads 'https://ftp.isc.org/isc/bind9/9.16.3/bind-9.16.3.tar.gz' --progr=
ess=3Ddot -v failed with exit code 8, output:
> --2020-06-16 20:06:17--  https://ftp.isc.org/isc/bind9/9.16.3/bind-9.16=
=2E3.tar.gz
> Resolving ftp.isc.org (ftp.isc.org)... 2001:4f8:1:f::49, 149.20.1.49
> Connecting to ftp.isc.org (ftp.isc.org)|2001:4f8:1:f::49|:443... connec=
ted.
> HTTP request sent, awaiting response... 404 Not Found
> 2020-06-16 20:06:18 ERROR 404: Not Found.
>
>
> ERROR: Fetcher failure for URL: 'https://ftp.isc.org/isc/bind9/9.16.3/b=
ind-9.16.3.tar.gz'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/b=
uild/build/build/tmp/work/recipetool-jyvexl6r/work/temp/log.do_fetch.4078=
8
> NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rer=
un and 1 failed.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 1 seconds
> ERROR: Failed to fetch URL https://ftp.isc.org/isc/bind9/9.16.3/bind-9.=
16.3.tar.gz
>
>
>
> Please review the attached files for further information and build/upda=
te failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/ente=
r_bug.cgi?product=3DAutomated%20Update%20Handler
>
> Regards,
> The Upgrade Helper


