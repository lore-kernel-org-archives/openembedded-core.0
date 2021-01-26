Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web12.11545.1611665319126414617
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 04:48:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KhPcsLX9;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id f22so8918360vsk.11
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 04:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LXsWjwdF7HfjRSWQizhRTTSkOnjhcSvMtGDfzE0gJ4s=;
        b=KhPcsLX9z2N0LfokmQXozBTQlpt5VneXaAKUcJGKULjDtkvUGv3+fcJKMrM9ZmqP1P
         pKSmxd97v/VyN2ahZOKjYuBP8qgAifQD2ijxZQYh4/GtjaJel+/3JgGHeISnu/asls8P
         KD0ghl+S2p/2U4JfxJ6AYlGsduNgU7T2KuOFioV7tBN5TJskEaFk7LTcQsdQnnls7Grk
         fGh+4vitFXrtJWlO5E56WLfxGcs9S7Xk2eVFCEJuVUXzlC6dlYvE5HA8yL1bPSKA3Zdw
         Z41yfTP73MPAxaQ9MKEUVqWzfmdzJbxQ0g82Ibb4zq3AsXj9nFBBXZ4XWiukmSARd4l/
         +pkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LXsWjwdF7HfjRSWQizhRTTSkOnjhcSvMtGDfzE0gJ4s=;
        b=TTieZ3hJW+BMjz6yYwcX9roHeA+y1feI9Ab7VK9s5xK7gDfnK2PwD9pY06L7zTZtII
         Bi/KX1gImsyKq1yg8+x5ua4098bJK2S8plC7QjBamcwgc8eUfY8S6O/8DKkarRdgFbeF
         PaaxK16j3pXtcPrmLAk+vzUkRVdHH1TwpFUdXhAk5pgrMa7ox9cBwmk2xa1uOmVwIy4i
         FLKEjtuSYyt59FJyArNCtfQ52vdXEBvB+shTSTFE74bMPRFio+RtE2cATBUf6F6R7i/v
         c61tboTwimWTTLvVAeWKnivG1bxAy5hzj6eP4ZpgpzAwOqf1rQLzsm7IZN2WH1Elj+yH
         hv/Q==
X-Gm-Message-State: AOAM530cA4ZMpWKulfh3TewwRgN7ZJOwjzkVoIUr5epsQZ6PwiqvPr89
	p+gVkidwHI7cZA96DeoCCyKfLRUpmtc2FMFnHCU=
X-Google-Smtp-Source: ABdhPJzWiBEWmDKJBVrnjwXchsb4ALbHE1iQzvueS3cGUb9BcTZEnqtWcfqE4yggVf+Y15uCwvFjf4UkuYU5Kzp0R5o=
X-Received: by 2002:a67:e014:: with SMTP id c20mr4191805vsl.54.1611665318254;
 Tue, 26 Jan 2021 04:48:38 -0800 (PST)
MIME-Version: 1.0
References: <CAHtQpK71uAoq_hwDGJCvt5O_=kNXHkWFkmHC-BQkzcSCM3ys7A@mail.gmail.com>
In-Reply-To: <CAHtQpK71uAoq_hwDGJCvt5O_=kNXHkWFkmHC-BQkzcSCM3ys7A@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 26 Jan 2021 13:48:27 +0100
Message-ID: <CANNYZj9eoz-9xvEpCSD6mgMwETMn_R8xPEtYc1jVK0FSF3qpSQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell]: gpsd recipe (3.19) build is broken
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ca9d7905b9cd12da"

--000000000000ca9d7905b9cd12da
Content-Type: text/plain; charset="UTF-8"

Can you rather identify a single commit that can be backported to fix the
specific issue you see?

Alex

On Tue, 26 Jan 2021 at 13:13, Andrey Zhizhikin <andrey.z@gmail.com> wrote:

> Hello Steve,
>
> gpsd recipe build breaks on the dunfell branch with following error
> messages:
>
> |
> /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch64-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:
> ./libgpsd.a(ppsthread.o): undefined reference to symbol
> 'pthread_create@@GLIBC_2.17'
> |
> /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch64-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:
>
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
>
> 
>
>

--000000000000ca9d7905b9cd12da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you rather identify a single commit that can be b=
ackported to fix the specific issue you see?</div><div><br></div><div>Alex<=
br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, 26 Jan 2021 at 13:13, Andrey Zhizhikin &lt;<a href=3D"mail=
to:andrey.z@gmail.com">andrey.z@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Hello Steve,<br>
<br>
gpsd recipe build breaks on the dunfell branch with following error messag=
es:<br>
<br>
| /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/re=
cipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch64-fsl-lin=
ux/gcc/aarch64-fsl-linux/9.3.0/ld:<br>
./libgpsd.a(ppsthread.o): undefined reference to symbol<br>
&#39;pthread_create@@GLIBC_2.17&#39;<br>
| /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/re=
cipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch64-fsl-lin=
ux/gcc/aarch64-fsl-linux/9.3.0/ld:<br>
/development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/reci=
pe-sysroot/lib/libpthread.so.0:<br>
error adding symbols: DSO missing from command line<br>
<br>
This cannot be reproduced on the current master branch, where the<br>
version of gpsd recipe has been bumped up from 3.19 to 3.20.<br>
<br>
Can you please consider to cherry-pick following commits from master<br>
in order to upgrade the gspd version on dunfell branch:<br>
<br>
98e61961c gpsd: add new init script<br>
04afc692a gpsd: mark CLEANBROKEN<br>
33a15c790 gpsd: fix build on aarch64<br>
cecab9c4c gpsd: Upgrade 3.19 -&gt; 3.20<br>
<br>
I&#39;ve tried to cherry-pick them locally and they do apply clean. Also<b=
r>
the build of gpsd is successful after this upgrade.<br>
<br>
-- <br>
Regards,<br>
Andrey.<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000ca9d7905b9cd12da--
