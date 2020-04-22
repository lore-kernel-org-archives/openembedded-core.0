Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.6681.1587575101187451240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 10:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P7gYAzjW;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id j1so3339244wrt.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 10:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zhXGv1zNn7Dgu4N1ngExwrGbmdeQpnIW7O8lMig28GM=;
        b=P7gYAzjWlWH2FfaHNR/yTxIyu4szZuxN40ZTMA8RHsp3fXZghW9QDtdwVKH/z5D2xZ
         d0FKla+5C5BEmOHIk6MYCq1Jg0sv8fLYfZibRZFws3TR7mdenuEY22AZY6hMUqWEDObJ
         g71Xj4IPO5A0DN3YcYVG9cQUA1OJJgwo56xNuTxlAFvHHQyGy8jkJ2DQSBBzV+TzVHz6
         TB+LWzHN4oIBxmwMZ0Djq25sOE38xJA1sBt0tUqoTDHlN+j/nIbxP8eDoAZ7R5GqUUma
         IB26HjDOAuqCzZL766lUm9TMuSydrY8CQBy3T12zV8ksjh5+h7qUD+zWxI88fI9ZK+QR
         Qe6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zhXGv1zNn7Dgu4N1ngExwrGbmdeQpnIW7O8lMig28GM=;
        b=sB5H86ugjfUCsxUnGVsy/tbyVXumte/E86Or/g5INsIFkFcojosSQhzTOVRmHctyDa
         C3pDqQC05bhIzn5MbMoeDKHgDXOBwGsqh01NI90/4fXXOiKT4Or7dYKZFBlNS1p2bIc5
         aaU5m86TZZhsfSXZ88XXWwxgV3PKMgv13T1ICUDIc6nRVgPUh4VlwC13/ie3zDPhmeVZ
         RNohepbLhOtgisMibHXuyqryLcfPVRtFjFaqeE4ePMUFbnJvIzuM3oxusRECvMhYDfa4
         oUVKAPKWiK0chxtQMb8VFR6Af4QLe0ied3oH6DDnHK+DSv6jHLQQbUcnMyHys19q1oQo
         +otw==
X-Gm-Message-State: AGi0PuZpL/xlZ0huUJ3T6zHUTa3LpbOoTzmfcjTwNZm1HafFL6MQzwkp
	cpac3ydDK22+jFh4Fw8c/VU=
X-Google-Smtp-Source: APiQypLupX8wNf8hGIKQujnoCcCtD6vcpOUW/RedH22x9L3tLMOouM4JXhssJVqbcGgRLWJRKeM+Pw==
X-Received: by 2002:a05:6000:108e:: with SMTP id y14mr30923wrw.292.1587575099532;
        Wed, 22 Apr 2020 10:04:59 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y63sm8901399wmg.21.2020.04.22.10.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 10:04:45 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 22 Apr 2020 19:04:26 +0200
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [zeus][PATCH] qemu: Replace stime() API with clock_settime
Message-ID: <20200422170426.6uat7mepwdo6yyfc@jama>
References: <20200422143824.2634423-1-Martin.Jansa@gmail.com>
 <21d8e101-e86a-0c23-4c5c-13464d26bd82@gmail.com>
MIME-Version: 1.0
In-Reply-To: <21d8e101-e86a-0c23-4c5c-13464d26bd82@gmail.com>
X-Groupsio-MsgNum: 137390
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m3ergh5nsjuyukhj"
Content-Disposition: inline

--m3ergh5nsjuyukhj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2020 at 09:54:20AM -0700, akuster808 wrote:
>=20
>=20
> On 4/22/20 7:38 AM, Martin Jansa wrote:
> > From: Khem Raj <raj.khem@gmail.com>
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-devtools/qemu/qemu.inc           |  1 +
> >  ...linux-user-remove-host-stime-syscall.patch | 61 ++++++++++++++++++=
+
> >  2 files changed, 62 insertions(+)
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0011-linux-user-re=
move-host-stime-syscall.patch
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtoo=
ls/qemu/qemu.inc
> > index f451017f6d..ad4ff52892 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -27,6 +27,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.=
tar.xz \
> >             file://0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-t=
arget.patch \
> >             file://0009-Fix-webkitgtk-builds.patch \
> >             file://0010-configure-Add-pkg-config-handling-for-libgcryp=
t.patch \
> > +           file://0011-linux-user-remove-host-stime-syscall.patch \
> >             file://CVE-2019-15890.patch \
> >             file://CVE-2019-12068.patch \
> >             file://CVE-2020-1711.patch \
> > diff --git a/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-ho=
st-stime-syscall.patch b/meta/recipes-devtools/qemu/qemu/0011-linux-user-re=
move-host-stime-syscall.patch
> > new file mode 100644
> > index 0000000000..659e6be45d
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stim=
e-syscall.patch
> > @@ -0,0 +1,61 @@
> > +From 0f1f2d4596aee037d3ccbcf10592466daa54107f Mon Sep 17 00:00:00 200=
1
> > +From: Laurent Vivier <laurent@vivier.eu>
> > +Date: Tue, 12 Nov 2019 15:25:56 +0100
> > +Subject: [PATCH] linux-user: remove host stime() syscall
> > +
> > +stime() has been withdrawn from glibc
> > +(12cbde1dae6f "Use clock_settime to implement stime; withdraw stime."=
)
> > +
> > +Implement the target stime() syscall using host
> > +clock_settime(CLOCK_REALTIME, ...) as it is done internally in glibc.
> > +
> > +Tested qemu-ppc/x86_64 with:
> > +
> > +	#include <time.h>
> > +	#include <stdio.h>
> > +
> > +	int main(void)
> > +	{
> > +	=09time_t t;
> > +	=09int ret;
> > +
> > +	=09/* date -u -d"2019-11-12T15:11:00" "+%s" */
> > +	=09t =3D 1573571460;
> > +	=09ret =3D stime(&t);
> > +	=09printf("ret %d\n", ret);
> > +	=09return 0;
> > +	}
> > +
> > +        # date; ./stime; date
> > +        Tue Nov 12 14:18:32 UTC 2019
> > +        ret 0
> > +        Tue Nov 12 15:11:00 UTC 2019
> > +
> > +Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcom=
mit;h=3D0f1f2d4596aee037d3ccbcf10592466daa54107f]
> > +Buglink: https://bugs.launchpad.net/qemu/+bug/1852115
> > +Reported-by: Cole Robinson <crobinso@redhat.com>
> > +Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> > +Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > +Message-Id: <20191112142556.6335-1-laurent@vivier.eu>
> Who signed this patch off?

Are SOBs in .patch files more strict for .patch files for zeus than for
master?

It was merged to master here:
https://git.openembedded.org/openembedded-core/commit/meta/recipes-devtool=
s/qemu/?id=3D2cca75155baec8358939e2aae822e256bed4cfe0
in this exact form with SOB from Laurent Vivier, if you think it's worth
modifying the .patch just for this, then I'll send v2 with SOB from
Khem.

At least the .patch was already removed from master in:
https://git.openembedded.org/openembedded-core/commit/meta/recipes-devtool=
s/qemu/qemu?id=3Dca276b77904429a1ff3188d2373535a462afe266
so it won't show as unnecessary diff between zeus and dunfell.

> - armin
> > +---
> > + linux-user/syscall.c | 8 +++++---
> > + 1 file changed, 5 insertions(+), 3 deletions(-)
> > +
> > +--- a/linux-user/syscall.c
> > ++++ b/linux-user/syscall.c
> > +@@ -7651,10 +7651,12 @@ static abi_long do_syscall1(void *cpu_en
> > + #ifdef TARGET_NR_stime /* not on alpha */
> > +     case TARGET_NR_stime:
> > +         {
> > +-            time_t host_time;
> > +-            if (get_user_sal(host_time, arg1))
> > ++            struct timespec ts;
> > ++            ts.tv_nsec =3D 0;
> > ++            if (get_user_sal(ts.tv_sec, arg1)) {
> > +                 return -TARGET_EFAULT;
> > +-            return get_errno(stime(&host_time));
> > ++            }
> > ++            return get_errno(clock_settime(CLOCK_REALTIME, &ts));
> > +         }
> > + #endif
> > + #ifdef TARGET_NR_alarm /* not on alpha */
> >
> >=20
>=20

--m3ergh5nsjuyukhj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXqB5GgAKCRA3VSO3ZXaA
HOsjAJ9o1TNO+I4YjsxkwPKyPKR4E8z3oACgjy1nuryUbL4ijcUgnp3nDfmu32c=
=Oh36
-----END PGP SIGNATURE-----

--m3ergh5nsjuyukhj--
