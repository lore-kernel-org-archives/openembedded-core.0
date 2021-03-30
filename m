Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.3282.1617105310890449041
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 04:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T0k/iUSU;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: devendra.tewari@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id x14so15481871qki.10
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Mar 2021 04:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=yN73c37uaNe9vu2P0OPe6+Uikt6sm+7iibvUe7OdMUE=;
        b=T0k/iUSUa7NouxKYw+bUQWj+2+WbZoE5mX/Ym4caxqne5QTS1CIBC1U+IFpLMXREuG
         3w8/7Amk2o0VZPM5DuqE84zfceM8wU6U6jQ8O12sR/YCtSIaBILT6Vpnw3VN1SdsG/HM
         nbzHfSqR7Sn8IEkllwMej/i4i3lgKdNY0gwVhsQ8fF2rBqebV3Hv5PwwV5AIyxIRzSbm
         V1enT5MUxzpLVJcpo1rvR4O2ASq5SQeGtNR6kHkHflKeksadMDi/LTVNDEGDo3DashQL
         +huHGvN/5QlxfUM82akGQ3V9co/4AVroE4IBW9CFHrEYdpgZtTdRLBW4XFJz05SpPk2k
         T/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=yN73c37uaNe9vu2P0OPe6+Uikt6sm+7iibvUe7OdMUE=;
        b=dQv/Gxez7dW8Ed1Ui6LKEVRhTYDsfPTODCwXdHkHnC3fN9Z1cWjb9MBM+msdG5OxP2
         8QFZKQ8zeck7qryF+yCzNPYhhwtTdanD+UdVceyaHZ5+bQMubvsx/Jp9Q3LJ9kcmFJQo
         SkhNGPuyrXZTaDTZ2Sa+bv/c9iL3Lh9nJfsk9M8idOCwk6lPa4k1z+2o4IzFnc3X6wVp
         uG4bJX6Vp7PZrlHT17y4mOi6oCOm8dYLVwvKvOomMVB8siDi72W0hWlEkZ/xQHSoxA/1
         6yHfeepAYX1N/CjJOyI8LB/wl7wDh4Foc5dRXMPJONvgPc9GC0LgH6uP+DOSidl4jMNH
         jXfA==
X-Gm-Message-State: AOAM530Dry8Bf2Lpd/fOlm2CU8drmVkWjREvtgQS16nF9Qyj8AEAyCkN
	JYxUdMMMRwJLZRMtTNw1RjA=
X-Google-Smtp-Source: ABdhPJz7oCQvhJPaHPSRm3eno3tTEcn0KYOxzRDAt592XLkBdRaUbBFcUywTrdK82A0sePybUHzLXg==
X-Received: by 2002:a37:2c41:: with SMTP id s62mr29733282qkh.205.1617105309927;
        Tue, 30 Mar 2021 04:55:09 -0700 (PDT)
Return-Path: <devendra.tewari@gmail.com>
Received: from ?IPv6:2804:14d:5487:a7d6:28cd:51dd:6cf0:14e0? ([2804:14d:5487:a7d6:28cd:51dd:6cf0:14e0])
        by smtp.gmail.com with ESMTPSA id l6sm15532641qke.34.2021.03.30.04.55.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Mar 2021 04:55:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
From: "Devendra Tewari" <devendra.tewari@gmail.com>
In-Reply-To: <5d0a0ca838cba8fd43d3e2b5a3288f03f6ff8c96.camel@linuxfoundation.org>
Date: Tue, 30 Mar 2021 08:55:05 -0300
Cc: Andre McCurdy <armccurdy@gmail.com>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-Id: <0121485F-194F-4521-82BA-E878B7DC3521@gmail.com>
References: <20210329151442.86306-1-devendra.tewari@gmail.com>
 <9e81b71466b771c55d8859e7d156b662e1c3d4f7.camel@linuxfoundation.org>
 <CBEFAFBB-3A73-41E2-A177-BBE047E615D1@gmail.com>
 <CAJ86T=Xn9tLHWrqqr1ZV9rAwZD7sG6x0QsyVRkUSKLwiGQKL8g@mail.gmail.com>
 <5d0a0ca838cba8fd43d3e2b5a3288f03f6ff8c96.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

I understand that parallel tasks can result in such issues, but would =
expect some kind of dependency graph that would prevent them from =
happening. I wish I had more time to understand the issue fully.

Here=E2=80=99s the last version of my patch that still uses os.rename, =
and on error uses shutil.move, with the reasoning explained in the =
commit message. There are tons of os.rename in code elsewhere, and =
I=E2=80=99ve encountered similar issues when doing incremental builds, =
but I=E2=80=99ll leave fixing them to those with more time at hand. =
Cheers.

=46rom aeba1f9728f69cdf2ce4ba285be86761d8024f9d Mon Sep 17 00:00:00 2001
From: Devendra Tewari <devendra.tewari@gmail.com>
Date: Tue, 30 Mar 2021 08:27:40 -0300
Subject: [PATCH] Use shutil.move when os.rename fails

Incremental build in Docker fails with

OSError: [Errno 18] Invalid cross-device link

When source and destination are on different overlay filesystems.

This change handles error with os.rename and retries with shutil.move.
The reason os.rename is still used is because shutil.move is too slow
for speed sensitive sections of code.
---
 meta/classes/sstate.bbclass | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index f579168162..301dfc27db 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):
 def sstate_installpkgdir(ss, d):
     import oe.path
     import subprocess
+    import shutil
=20
     sstateinst =3D d.getVar("SSTATE_INSTDIR")
     d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
@@ -401,7 +402,10 @@ def sstate_installpkgdir(ss, d):
=20
     for state in ss['dirs']:
         prepdir(state[1])
-        os.rename(sstateinst + state[0], state[1])
+        try:
+            os.rename(sstateinst + state[0], state[1])
+        except OSError:
+            shutil.move(sstateinst + state[0], state[1])
     sstate_install(ss, d)
=20
     for plain in ss['plaindirs']:
@@ -413,7 +417,10 @@ def sstate_installpkgdir(ss, d):
         dest =3D plain
         bb.utils.mkdirhier(src)
         prepdir(dest)
-        os.rename(src, dest)
+        try:
+            os.rename(src, dest)
+        except OSError:
+            shutil.move(src, dest)
=20
     return True
=20
@@ -638,6 +645,7 @@ python sstate_hardcode_path () {
=20
 def sstate_package(ss, d):
     import oe.path
+    import shutil
=20
     tmpdir =3D d.getVar('TMPDIR')
=20
@@ -664,7 +672,10 @@ def sstate_package(ss, d):
                     continue
                 bb.error("sstate found an absolute path symlink %s =
pointing at %s. Please replace this with a relative link." % (srcpath, =
link))
         bb.debug(2, "Preparing tree %s for packaging at %s" % =
(state[1], sstatebuild + state[0]))
-        os.rename(state[1], sstatebuild + state[0])
+        try:
+            os.rename(state[1], sstatebuild + state[0])
+        except OSError:
+            shutil.move(state[1], sstatebuild + state[0])
=20
     workdir =3D d.getVar('WORKDIR')
     sharedworkdir =3D os.path.join(d.getVar('TMPDIR'), "work-shared")
@@ -674,7 +685,10 @@ def sstate_package(ss, d):
             pdir =3D plain.replace(sharedworkdir, sstatebuild)
         bb.utils.mkdirhier(plain)
         bb.utils.mkdirhier(pdir)
-        os.rename(plain, pdir)
+        try:
+            os.rename(plain, pdir)
+        except OSError:
+            shutil.move(plain, pdir)
=20
     d.setVar('SSTATE_BUILDDIR', sstatebuild)
     d.setVar('SSTATE_INSTDIR', sstatebuild)
--=20
2.29.2


> On 30 Mar 2021, at 08:10, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Mon, 2021-03-29 at 16:00 -0700, Andre McCurdy wrote:
>> On Mon, Mar 29, 2021 at 3:45 PM Devendra Tewari
>> <devendra.tewari@gmail.com> wrote:
>>>=20
>>> Thanks! My bad. The example I looked up in Python docs had a break =
and I just realized it was a looping example.
>>>=20
>>> Here=E2=80=99s the updated patch (or should I submit it again via =
git send-email?)
>>=20
>> It would be better to use shutil.move unconditionally in all cases,
>> rather than have a separate shutil.move code path which only gets
>> tested by people doing incremental builds in docker.
>=20
> This is a speed sensitive section of code and shutil has traditionally =
proved=20
> to be slow so I disagree with that, rename is very much preferred here =
where
> we can.
>=20
> Cheers,
>=20
> Richard
>=20
>=20

