Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.2438.1617099411590473523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 03:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PxI8BNOE;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: devendra.tewari@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id q26so15290662qkm.6
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Mar 2021 03:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=DIOuApsbKi0ftA/0B94ZN7cuUp7wV2A3/9Rc2N29vuA=;
        b=PxI8BNOEn2DL0L0zsWiO4fo6cpkcqQOLtmvHP/qe94N+lMVg3fPcpjTy6REcy/nYCC
         Hh7lQPYrTf8XW6QSRrw7pTPHhORsJnZ0INGUnelQSlkGBJFIRCkwqLxvMQNtE7ruZ8vP
         1wloqBzbYesi/mNIklbVj/KT6/1D95Vgva+3kFHS+7TL8uftNUUkoKcf1CSpi9gWhQLR
         eWaPIMfuIyy0p/agNDi8DxmrMp/Dz/Onn7WOyIAOVibUrK38CksMk3rGbI3hOtbtBtRN
         ZAAKAGvapdpgh2xhkLF5qqFImjDGV3MUMSP7bKNzmt+NJ0rN6tXbndMT348KPIMKk2I+
         a8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=DIOuApsbKi0ftA/0B94ZN7cuUp7wV2A3/9Rc2N29vuA=;
        b=kIiAfCSre7drnEzAwMUZSp9X8Vv86E9XhCxHVWlDRut+sRFOaV1gUmu1+Sw9Wjg8Ee
         5DsqhOIT+qEkySgwTNSCx5ivR0SxnhdHrV6/K0wGh4r8vpkXx0lgVxb1kOMrJrrqCVwr
         jo41+DLZAO4T7I+ZRBnQaNC7qd82P7S8ZGkd87Tz5iiJolVlVhRhHtmlAQyHdm0Y2p4E
         UEk4N0lpF39cN98j/0r58qwhz42vamKhmoO0D5CoiJrP9pqfb5l5KtNDJ31Z277WD7cV
         wTglmMwY/4ODz5UTbsHh2PIxe7q5OrRK1Qp8FdSaCWmtLOWZqKQafH1iYoDTh+OPFQYd
         MTZw==
X-Gm-Message-State: AOAM532jF5nTP7od6NROsgayRZUXkYJLOYoxInRYDzVmsXnH767gzdr0
	jJbkG08LDga9rnt/OQqD/8w=
X-Google-Smtp-Source: ABdhPJyzrYec3n0HkY+GeXdxuFPaMxGvak5+QF5fAA/x6ryHXw568SPVnkbUxVUBRtxx9PujVEQ+Zw==
X-Received: by 2002:a37:6887:: with SMTP id d129mr29529720qkc.252.1617099410581;
        Tue, 30 Mar 2021 03:16:50 -0700 (PDT)
Return-Path: <devendra.tewari@gmail.com>
Received: from ?IPv6:2804:14d:5487:a7d6:28cd:51dd:6cf0:14e0? ([2804:14d:5487:a7d6:28cd:51dd:6cf0:14e0])
        by smtp.gmail.com with ESMTPSA id i78sm15152121qke.46.2021.03.30.03.16.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Mar 2021 03:16:50 -0700 (PDT)
From: "Devendra Tewari" <devendra.tewari@gmail.com>
Message-Id: <A9FA2E53-37B5-49D5-B5FB-5CA07D230B8C@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
Date: Tue, 30 Mar 2021 07:16:45 -0300
In-Reply-To: <31745632-7CE9-467F-A0AB-7C3A87ECF73D@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
To: Andre McCurdy <armccurdy@gmail.com>
References: <20210329151442.86306-1-devendra.tewari@gmail.com>
 <9e81b71466b771c55d8859e7d156b662e1c3d4f7.camel@linuxfoundation.org>
 <CBEFAFBB-3A73-41E2-A177-BBE047E615D1@gmail.com>
 <CAJ86T=Xn9tLHWrqqr1ZV9rAwZD7sG6x0QsyVRkUSKLwiGQKL8g@mail.gmail.com>
 <D5D63158-3A18-4F86-9262-9280A587D4C2@gmail.com>
 <CAJ86T=W52t-GtrNgPEg5AiJWYPCKFu9H9+PfxRGNUqMJCDJt=g@mail.gmail.com>
 <31745632-7CE9-467F-A0AB-7C3A87ECF73D@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_DB5A748B-4E69-486F-B2F2-3A04FA98F37C"

--Apple-Mail=_DB5A748B-4E69-486F-B2F2-3A04FA98F37C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

With the following patch

=46rom f29ec67239094a256fcfc119fb75be90923d3448 Mon Sep 17 00:00:00 2001
From: Devendra Tewari <devendra.tewari@gmail.com>
Date: Mon, 29 Mar 2021 21:11:56 -0300
Subject: [PATCH] Use shutil.move to rename sstate

Incremental build in Docker fails with

OSError: [Errno 18] Invalid cross-device link

When source and destination are on different overlay filesystems.

shutil.move uses os.rename when destination is on the current =
filesystem,
otherwise source is copied to destination and then removed.
---
 meta/classes/sstate.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index f579168162..2e87697e3e 100644
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
@@ -401,7 +402,7 @@ def sstate_installpkgdir(ss, d):
=20
     for state in ss['dirs']:
         prepdir(state[1])
-        os.rename(sstateinst + state[0], state[1])
+        shutil.move(sstateinst + state[0], state[1])
     sstate_install(ss, d)
=20
     for plain in ss['plaindirs']:
@@ -413,7 +414,7 @@ def sstate_installpkgdir(ss, d):
         dest =3D plain
         bb.utils.mkdirhier(src)
         prepdir(dest)
-        os.rename(src, dest)
+        shutil.move(src, dest)
=20
     return True
=20
@@ -638,6 +639,7 @@ python sstate_hardcode_path () {
=20
 def sstate_package(ss, d):
     import oe.path
+    import shutil
=20
     tmpdir =3D d.getVar('TMPDIR')
=20
@@ -664,7 +666,7 @@ def sstate_package(ss, d):
                     continue
                 bb.error("sstate found an absolute path symlink %s =
pointing at %s. Please replace this with a relative link." % (srcpath, =
link))
         bb.debug(2, "Preparing tree %s for packaging at %s" % =
(state[1], sstatebuild + state[0]))
-        os.rename(state[1], sstatebuild + state[0])
+        shutil.move(state[1], sstatebuild + state[0])
=20
     workdir =3D d.getVar('WORKDIR')
     sharedworkdir =3D os.path.join(d.getVar('TMPDIR'), "work-shared")
@@ -674,7 +676,7 @@ def sstate_package(ss, d):
             pdir =3D plain.replace(sharedworkdir, sstatebuild)
         bb.utils.mkdirhier(plain)
         bb.utils.mkdirhier(pdir)
-        os.rename(plain, pdir)
+        shutil.move(plain, pdir)
=20
     d.setVar('SSTATE_BUILDDIR', sstatebuild)
     d.setVar('SSTATE_INSTDIR', sstatebuild)
--=20
2.29.2

The build fails with

#12 2734.2 2021-03-30 01:14:29 - INFO     - NOTE: recipe =
linux-libc-headers-5.10-r0: task do_package_write_rpm: Started
#12 2734.4 2021-03-30 01:14:29 - INFO     - NOTE: recipe =
lzo-native-2.10-r0: task do_prepare_recipe_sysroot: Started
#12 2734.8 2021-03-30 01:14:30 - INFO     - NOTE: recipe =
lzo-native-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
#12 2734.9 2021-03-30 01:14:30 - INFO     - NOTE: Running task 2441 of =
4982 =
(virtual:native:/home/pi/docker-meta-raspberrypi/layers/poky/meta/recipes-=
support/lzo/lzo_2.10.bb:do_configure)
#12 2735.0 2021-03-30 01:14:30 - ERROR    - ERROR: =
linux-libc-headers-5.10-r0 do_package_write_rpm: Error executing a =
python function in exec_python_func() autogenerated:
#12 2735.0 2021-03-30 01:14:30 - ERROR    -=20
#12 2735.0 2021-03-30 01:14:30 - ERROR    - The stack trace of python =
calls that resulted in this exception/failure was:
#12 2735.0 2021-03-30 01:14:30 - ERROR    - File: 'exec_python_func() =
autogenerated', lineno: 2, function: <module>
#12 2735.0 2021-03-30 01:14:30 - ERROR    - 0001:
#12 2735.0 2021-03-30 01:14:30 - ERROR    - *** 0002:write_specfile(d)
#12 2735.0 2021-03-30 01:14:30 - ERROR    - 0003:
#12 2735.0 2021-03-30 01:14:30 - ERROR    - File: =
'/home/pi/docker-meta-raspberrypi/layers/poky/meta/classes/package_rpm.bbc=
lass', lineno: 342, function: write_specfile
#12 2735.0 2021-03-30 01:14:30 - ERROR    - 0338:        =
localdata.setVar('PKG', pkgname)
#12 2735.0 2021-03-30 01:14:30 - ERROR    - 0339:
#12 2735.0 2021-03-30 01:14:30 - ERROR    - 0340:        =
localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + pkg)
#12 2735.0 2021-03-30 01:14:30 - ERROR    - 0341:
#12 2735.0 2021-03-30 01:14:30 - ERROR    - *** 0342:        conffiles =3D=
 get_conffiles(pkg, d)
#12 2735.0 2021-03-30 01:14:30 - ERROR    - 0343:        dirfiles =3D =
localdata.getVar('DIRFILES')
#12 2735.0 2021-03-30 01:14:30 - ERROR    - 0344:        if dirfiles is =
not None:
#12 2735.0 2021-03-30 01:14:30 - ERROR    - 0345:            dirfiles =3D =
dirfiles.split()
#12 2735.0 2021-03-30 01:14:30 - ERROR    - 0346:
#12 2735.0 2021-03-30 01:14:30 - ERROR    - File: =
'/home/pi/docker-meta-raspberrypi/layers/poky/meta/classes/package.bbclass=
', lineno: 304, function: get_conffiles
#12 2735.0 2021-03-30 01:14:30 - ERROR    - 0300:def get_conffiles(pkg, =
d):
#12 2735.0 2021-03-30 01:14:30 - ERROR    - 0301:    pkgdest =3D =
d.getVar('PKGDEST')
#12 2735.0 2021-03-30 01:14:30 - ERROR    - 0302:    root =3D =
os.path.join(pkgdest, pkg)
#12 2735.0 2021-03-30 01:14:30 - ERROR    - 0303:    cwd =3D os.getcwd()
#12 2735.0 2021-03-30 01:14:30 - ERROR    - *** 0304:    os.chdir(root)
#12 2735.0 2021-03-30 01:14:30 - ERROR    - 0305:
#12 2735.0 2021-03-30 01:14:30 - ERROR    - 0306:    conffiles =3D =
d.getVar('CONFFILES_%s' % pkg);
#12 2735.0 2021-03-30 01:14:30 - ERROR    - 0307:    if conffiles =3D=3D =
None:
#12 2735.0 2021-03-30 01:14:30 - ERROR    - 0308:        conffiles =3D =
d.getVar('CONFFILES')
#12 2735.0 2021-03-30 01:14:30 - ERROR    - Exception: =
FileNotFoundError: [Errno 2] No such file or directory: =
'/home/pi/docker-meta-raspberrypi/build/tmp/work/arm1176jzfshf-vfp-poky-li=
nux-gnueabi/linux-libc-headers/5.10-r0/packages-split/linux-libc-headers-s=
rc'

A fully reproducible build can be found at =
https://github.com/tewarid/docker-meta-raspberrypi/tree/ee083820c565da646b=
745bc25e439c13f3205dbe. Please see build instructions in the readme.

I can=E2=80=99t seem to find a root cause and don=E2=80=99t have the =
time to look into this any further.

> On 29 Mar 2021, at 20:13, Devendra Tewari <devendra.tewari@gmail.com> =
wrote:
>=20
> Will do. Thanks.
>=20
>> On 29 Mar 2021, at 20:10, Andre McCurdy <armccurdy@gmail.com> wrote:
>>=20
>> On Mon, Mar 29, 2021 at 4:07 PM Devendra Tewari
>> <devendra.tewari@gmail.com> wrote:
>>>=20
>>> I did try that but got an error that does not happen when we try =
os.rename first. I'll try to reproduce it again.
>>>=20
>>> I suspect there may be subtle differences in os.rename vs =
shutil.move with respect to what happens when origin and/or destination =
do not exist or are invalid.
>>=20
>> If there are subtle issues which you don't yet understand then that's
>> all the more reason for not hiding the new shutil.move code behind a
>> test which will pass for 99.9% of users. Please figure that out =
before
>> sending another version of the patch.
>>=20
>>>> On 29 Mar 2021, at 20:00, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>>>>=20
>>>> On Mon, Mar 29, 2021 at 3:45 PM Devendra Tewari
>>>> <devendra.tewari@gmail.com> wrote:
>>>>>=20
>>>>> Thanks! My bad. The example I looked up in Python docs had a break =
and I just realized it was a looping example.
>>>>>=20
>>>>> Here=E2=80=99s the updated patch (or should I submit it again via =
git send-email?)
>>>>=20
>>>> It would be better to use shutil.move unconditionally in all cases,
>>>> rather than have a separate shutil.move code path which only gets
>>>> tested by people doing incremental builds in docker.
>>>=20
>=20


--Apple-Mail=_DB5A748B-4E69-486F-B2F2-3A04FA98F37C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">With =
the following patch<div class=3D""><br class=3D""></div><div =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);" class=3D"">=46rom f29ec67239094a256fcfc119fb75be90923d3448 Mon Sep =
17 00:00:00 2001</span><br style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D"">From: Devendra Tewari &lt;<a =
href=3D"mailto:devendra.tewari@gmail.com" =
class=3D"">devendra.tewari@gmail.com</a>&gt;</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">Date: Mon, 29 Mar 2021 21:11:56 -0300</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">Subject: [PATCH] Use shutil.move to rename sstate</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">Incremental build in Docker fails with</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">OSError: [Errno 18] Invalid cross-device link</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">When=
 source and destination are on different overlay filesystems.</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">shutil.move uses os.rename when destination is on the current =
filesystem,</span><br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);" class=3D"">otherwise source is copied to destination and =
then removed.</span><br style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D"">---</span><br style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color:=
 rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">&nbsp;meta/classes/sstate.bbclass | 10 ++++++----</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">&nbsp;1 file changed, 6 insertions(+), 4 =
deletions(-)</span><br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0);" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);" class=3D"">diff --git a/meta/classes/sstate.bbclass =
b/meta/classes/sstate.bbclass</span><br style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, =
0, 0); color: rgb(0, 0, 0);" class=3D"">index f579168162..2e87697e3e =
100644</span><br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0);" class=3D"">--- a/meta/classes/sstate.bbclass</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">+++ =
b/meta/classes/sstate.bbclass</span><br style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, =
0, 0); color: rgb(0, 0, 0);" class=3D"">@@ -384,6 +384,7 @@ def =
sstate_installpkg(ss, d):</span><br style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D"">&nbsp;def sstate_installpkgdir(ss, =
d):</span><br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);" class=3D"">&nbsp; &nbsp; &nbsp;import oe.path</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">&nbsp; &nbsp; &nbsp;import subprocess</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">+ =
&nbsp; &nbsp;import shutil</span><br style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D"">&nbsp;</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">&nbsp; &nbsp; &nbsp;sstateinst =3D =
d.getVar("SSTATE_INSTDIR")</span><br style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D"">&nbsp; &nbsp; =
&nbsp;d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">@@ =
-401,7 +402,7 @@ def sstate_installpkgdir(ss, d):</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">&nbsp;</span><br style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D"">&nbsp; &nbsp; &nbsp;for state in =
ss['dirs']:</span><br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);" class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;prepdir(state[1])</span><br style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D"">- &nbsp; &nbsp; &nbsp; =
&nbsp;os.rename(sstateinst + state[0], state[1])</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">+ =
&nbsp; &nbsp; &nbsp; &nbsp;shutil.move(sstateinst + state[0], =
state[1])</span><br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0);" class=3D"">&nbsp; &nbsp; &nbsp;sstate_install(ss, d)</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">&nbsp;</span><br style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D"">&nbsp; &nbsp; &nbsp;for plain in =
ss['plaindirs']:</span><br style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D"">@@ -413,7 +414,7 @@ def =
sstate_installpkgdir(ss, d):</span><br style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, =
0, 0); color: rgb(0, 0, 0);" class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;dest =3D plain</span><br style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;bb.utils.mkdirhier(src)</span><br style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, =
0, 0); color: rgb(0, 0, 0);" class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;prepdir(dest)</span><br style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D"">- &nbsp; &nbsp; &nbsp; =
&nbsp;os.rename(src, dest)</span><br style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D"">+ &nbsp; &nbsp; &nbsp; =
&nbsp;shutil.move(src, dest)</span><br style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, =
0, 0); color: rgb(0, 0, 0);" class=3D"">&nbsp;</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">&nbsp; &nbsp; &nbsp;return True</span><br style=3D"caret-color:=
 rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">&nbsp;</span><br style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D"">@@ -638,6 +639,7 @@ python =
sstate_hardcode_path () {</span><br style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D"">&nbsp;</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">&nbsp;def sstate_package(ss, d):</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">&nbsp; &nbsp; &nbsp;import oe.path</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">+ =
&nbsp; &nbsp;import shutil</span><br style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D"">&nbsp;</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">&nbsp; &nbsp; &nbsp;tmpdir =3D d.getVar('TMPDIR')</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">&nbsp;</span><br style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D"">@@ -664,7 +666,7 @@ def =
sstate_package(ss, d):</span><br style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;continue</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;bb.error("sstate found an absolute path symlink %s pointing at %s. =
Please replace this with a relative link." % (srcpath, link))</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bb.debug(2, "Preparing tree =
%s for packaging at %s" % (state[1], sstatebuild + state[0]))</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">- =
&nbsp; &nbsp; &nbsp; &nbsp;os.rename(state[1], sstatebuild + =
state[0])</span><br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0);" class=3D"">+ &nbsp; &nbsp; &nbsp; &nbsp;shutil.move(state[1], =
sstatebuild + state[0])</span><br style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D"">&nbsp;</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">&nbsp; &nbsp; &nbsp;workdir =3D d.getVar('WORKDIR')</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">&nbsp; &nbsp; &nbsp;sharedworkdir =3D =
os.path.join(d.getVar('TMPDIR'), "work-shared")</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">@@ =
-674,7 +676,7 @@ def sstate_package(ss, d):</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pdir =3D =
plain.replace(sharedworkdir, sstatebuild)</span><br style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color:=
 rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;bb.utils.mkdirhier(plain)</span><br style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color:=
 rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;bb.utils.mkdirhier(pdir)</span><br style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color:=
 rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">- &nbsp; &nbsp; &nbsp; =
&nbsp;os.rename(plain, pdir)</span><br style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, =
0, 0); color: rgb(0, 0, 0);" class=3D"">+ &nbsp; &nbsp; &nbsp; =
&nbsp;shutil.move(plain, pdir)</span><br style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color: rgb(0, =
0, 0); color: rgb(0, 0, 0);" class=3D"">&nbsp;</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">&nbsp; &nbsp; &nbsp;d.setVar('SSTATE_BUILDDIR', =
sstatebuild)</span><br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);" class=3D"">&nbsp; &nbsp; &nbsp;d.setVar('SSTATE_INSTDIR', =
sstatebuild)</span><br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0);" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);" class=3D"">--&nbsp;</span><br style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><span style=3D"caret-color:=
 rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">2.29.2</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><br =
class=3D""></div><div class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D"">The build fails with</span><br =
class=3D""><div class=3D""><br class=3D""></div><div class=3D""><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><font color=3D"#000000" face=3D"Menlo" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-size: 11px;" class=3D"">#12 =
2734.2 2021-03-30 01:14:29 - INFO &nbsp; &nbsp; - NOTE: recipe =
linux-libc-headers-5.10-r0: task do_package_write_rpm: =
Started</span></font></div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal;" class=3D""><font color=3D"#000000" =
face=3D"Menlo" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-size: 11px;" class=3D"">#12 2734.4 2021-03-30 01:14:29 - INFO =
&nbsp; &nbsp; - NOTE: recipe lzo-native-2.10-r0: task =
do_prepare_recipe_sysroot: Started</span></font></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><font color=3D"#000000" face=3D"Menlo" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-size: 11px;" class=3D"">#12 =
2734.8 2021-03-30 01:14:30 - INFO &nbsp; &nbsp; - NOTE: recipe =
lzo-native-2.10-r0: task do_prepare_recipe_sysroot: =
Succeeded</span></font></div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal;" class=3D""><font color=3D"#000000" =
face=3D"Menlo" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-size: 11px;" class=3D"">#12 2734.9 2021-03-30 01:14:30 - INFO =
&nbsp; &nbsp; - NOTE: Running task 2441 of 4982 =
(virtual:native:/home/pi/docker-meta-raspberrypi/layers/poky/meta/recipes-=
support/lzo/lzo_2.10.bb:do_configure)</span></font></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><font color=3D"#000000" face=3D"Menlo" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-size: 11px;" class=3D"">#12 =
2735.0 2021-03-30 01:14:30 - ERROR &nbsp; &nbsp;- ERROR: =
linux-libc-headers-5.10-r0 do_package_write_rpm: Error executing a =
python function in exec_python_func() =
autogenerated:</span></font></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(0, 0, 0);" class=3D"">#12 2735.0 2021-03-30 01:14:30 - =
ERROR&nbsp; &nbsp; -&nbsp;</div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo; color: =
rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">#12 2735.0 2021-03-30 01:14:30 - =
ERROR&nbsp; &nbsp; - The stack trace of python calls that resulted in =
this exception/failure was:</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">#12 =
2735.0 2021-03-30 01:14:30 - ERROR&nbsp; &nbsp; - File: =
'exec_python_func() autogenerated', lineno: 2, function: =
&lt;module&gt;</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo; color: =
rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">#12 2735.0 2021-03-30 01:14:30 - =
ERROR&nbsp; &nbsp; - 0001:</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">#12 =
2735.0 2021-03-30 01:14:30 - ERROR&nbsp; &nbsp; - *** =
0002:write_specfile(d)</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">#12 =
2735.0 2021-03-30 01:14:30 - ERROR&nbsp; &nbsp; - 0003:</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">#12 2735.0 2021-03-30 01:14:30 - ERROR&nbsp; &nbsp; - File: =
'/home/pi/docker-meta-raspberrypi/layers/poky/meta/classes/package_rpm.bbc=
lass', lineno: 342, function: write_specfile</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">#12 2735.0 2021-03-30 01:14:30 - ERROR&nbsp; &nbsp; - =
0338:&nbsp; &nbsp; &nbsp; &nbsp; localdata.setVar('PKG', =
pkgname)</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo; color: rgb(0, =
0, 0);" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">#12 2735.0 2021-03-30 01:14:30 - =
ERROR&nbsp; &nbsp; - 0339:</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">#12 =
2735.0 2021-03-30 01:14:30 - ERROR&nbsp; &nbsp; - 0340:&nbsp; &nbsp; =
&nbsp; &nbsp; localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) =
+ ":" + pkg)</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo; color: =
rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">#12 2735.0 2021-03-30 01:14:30 - =
ERROR&nbsp; &nbsp; - 0341:</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">#12 =
2735.0 2021-03-30 01:14:30 - ERROR&nbsp; &nbsp; - *** 0342:&nbsp; &nbsp; =
&nbsp; &nbsp; conffiles =3D get_conffiles(pkg, d)</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">#12 2735.0 2021-03-30 01:14:30 - ERROR&nbsp; &nbsp; - =
0343:&nbsp; &nbsp; &nbsp; &nbsp; dirfiles =3D =
localdata.getVar('DIRFILES')</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">#12 =
2735.0 2021-03-30 01:14:30 - ERROR&nbsp; &nbsp; - 0344:&nbsp; &nbsp; =
&nbsp; &nbsp; if dirfiles is not None:</span></div><div style=3D"margin: =
0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">#12 =
2735.0 2021-03-30 01:14:30 - ERROR&nbsp; &nbsp; - 0345:&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; dirfiles =3D =
dirfiles.split()</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo; color: =
rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">#12 2735.0 2021-03-30 01:14:30 - =
ERROR&nbsp; &nbsp; - 0346:</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">#12 =
2735.0 2021-03-30 01:14:30 - ERROR&nbsp; &nbsp; - File: =
'/home/pi/docker-meta-raspberrypi/layers/poky/meta/classes/package.bbclass=
', lineno: 304, function: get_conffiles</span></div><div style=3D"margin: =
0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">#12 =
2735.0 2021-03-30 01:14:30 - ERROR&nbsp; &nbsp; - 0300:def =
get_conffiles(pkg, d):</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">#12 =
2735.0 2021-03-30 01:14:30 - ERROR&nbsp; &nbsp; - 0301:&nbsp; &nbsp; =
pkgdest =3D d.getVar('PKGDEST')</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">#12 =
2735.0 2021-03-30 01:14:30 - ERROR&nbsp; &nbsp; - 0302:&nbsp; &nbsp; =
root =3D os.path.join(pkgdest, pkg)</span></div><div style=3D"margin: =
0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">#12 =
2735.0 2021-03-30 01:14:30 - ERROR&nbsp; &nbsp; - 0303:&nbsp; &nbsp; cwd =
=3D os.getcwd()</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo; color: =
rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">#12 2735.0 2021-03-30 01:14:30 - =
ERROR&nbsp; &nbsp; - *** 0304:&nbsp; &nbsp; =
os.chdir(root)</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo; color: =
rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">#12 2735.0 2021-03-30 01:14:30 - =
ERROR&nbsp; &nbsp; - 0305:</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">#12 =
2735.0 2021-03-30 01:14:30 - ERROR&nbsp; &nbsp; - 0306:&nbsp; &nbsp; =
conffiles =3D d.getVar('CONFFILES_%s' % pkg);</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">#12 2735.0 2021-03-30 01:14:30 - ERROR&nbsp; &nbsp; - =
0307:&nbsp; &nbsp; if conffiles =3D=3D None:</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">#12 2735.0 2021-03-30 01:14:30 - ERROR&nbsp; &nbsp; - =
0308:&nbsp; &nbsp; &nbsp; &nbsp; conffiles =3D =
d.getVar('CONFFILES')</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">#12 =
2735.0 2021-03-30 01:14:30 - ERROR&nbsp; &nbsp; - Exception: =
FileNotFoundError: [Errno 2] No such file or directory: =
'/home/pi/docker-meta-raspberrypi/build/tmp/work/arm1176jzfshf-vfp-poky-li=
nux-gnueabi/linux-libc-headers/5.10-r0/packages-split/linux-libc-headers-s=
rc'</span></div><div class=3D""><br class=3D""></div><div class=3D""><span=
 style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">A =
fully reproducible build can be found at&nbsp;<a =
href=3D"https://github.com/tewarid/docker-meta-raspberrypi/tree/ee083820c5=
65da646b745bc25e439c13f3205dbe" =
class=3D"">https://github.com/tewarid/docker-meta-raspberrypi/tree/ee08382=
0c565da646b745bc25e439c13f3205dbe</a>. Please see build instructions in =
the readme.</span></div><div class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><br =
class=3D""></span></div><div class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">I =
can=E2=80=99t seem to find a root cause and don=E2=80=99t have the time =
to look into this any further.</span></span></div><div class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><br =
class=3D""></span></div><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 29 Mar 2021, at 20:13, Devendra Tewari &lt;<a =
href=3D"mailto:devendra.tewari@gmail.com" =
class=3D"">devendra.tewari@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Will =
do. Thanks.<br class=3D""><br class=3D""><blockquote type=3D"cite" =
class=3D"">On 29 Mar 2021, at 20:10, Andre McCurdy &lt;<a =
href=3D"mailto:armccurdy@gmail.com" class=3D"">armccurdy@gmail.com</a>&gt;=
 wrote:<br class=3D""><br class=3D"">On Mon, Mar 29, 2021 at 4:07 PM =
Devendra Tewari<br class=3D"">&lt;<a =
href=3D"mailto:devendra.tewari@gmail.com" =
class=3D"">devendra.tewari@gmail.com</a>&gt; wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D""><br class=3D"">I did try =
that but got an error that does not happen when we try os.rename first. =
I'll try to reproduce it again.<br class=3D""><br class=3D"">I suspect =
there may be subtle differences in os.rename vs shutil.move with respect =
to what happens when origin and/or destination do not exist or are =
invalid.<br class=3D""></blockquote><br class=3D"">If there are subtle =
issues which you don't yet understand then that's<br class=3D"">all the =
more reason for not hiding the new shutil.move code behind a<br =
class=3D"">test which will pass for 99.9% of users. Please figure that =
out before<br class=3D"">sending another version of the patch.<br =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D""><blockquote=
 type=3D"cite" class=3D"">On 29 Mar 2021, at 20:00, Andre McCurdy &lt;<a =
href=3D"mailto:armccurdy@gmail.com" class=3D"">armccurdy@gmail.com</a>&gt;=
 wrote:<br class=3D""><br class=3D"">On Mon, Mar 29, 2021 at 3:45 PM =
Devendra Tewari<br class=3D"">&lt;<a =
href=3D"mailto:devendra.tewari@gmail.com" =
class=3D"">devendra.tewari@gmail.com</a>&gt; wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D""><br class=3D"">Thanks! =
My bad. The example I looked up in Python docs had a break and I just =
realized it was a looping example.<br class=3D""><br class=3D"">Here=E2=80=
=99s the updated patch (or should I submit it again via git =
send-email?)<br class=3D""></blockquote><br class=3D"">It would be =
better to use shutil.move unconditionally in all cases,<br =
class=3D"">rather than have a separate shutil.move code path which only =
gets<br class=3D"">tested by people doing incremental builds in =
docker.<br class=3D""></blockquote><br =
class=3D""></blockquote></blockquote><br =
class=3D""></div></div></blockquote></div><br =
class=3D""></div></div></body></html>=

--Apple-Mail=_DB5A748B-4E69-486F-B2F2-3A04FA98F37C--
