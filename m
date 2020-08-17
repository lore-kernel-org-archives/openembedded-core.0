Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.38573.1597648205669768168
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 00:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fYwgQlK3;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: liu.ming50@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id a14so13852920wra.5
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 00:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wzsiy0w6PAR36r8NRfDPgNu2fMgYT2QbjtXPS9Q0O2c=;
        b=fYwgQlK3P73ySnv1t2FaWSpstXXRUJeR0FGv9D9MWjuZmd5Cdo9nFpujDHJD2gmACr
         finy4ML2O8Pn901JR32C123le7t8nfFOFdX3fa0OOCOyo9qLxd4AqZLhf6yU1rkKd/X7
         N/qnJGn6NPMnjJDa99S9ePwfI68fC5yAAP4GFzfke8IA9U39TvdjQ9WkUiJDMYneHGiz
         Wgl8KbTi+wVffiz9tYRMfdBj7/bY8hbCaanLxvps4kA7z/zxYbZ6vhgH3FQygTw2BchG
         pJxYwRsfase18w8w6dwFjPULLAUPlDDWrYyetI90vbvkg2BbTowxO8hfXJHMtDg1iYda
         v8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wzsiy0w6PAR36r8NRfDPgNu2fMgYT2QbjtXPS9Q0O2c=;
        b=YeVLqc2w9cb4lZ+z7GzFh78MsQ45JXjgytQ4jQ8Tvz7KDBb65baiGSxK2yzzTORg6L
         /pFC3i50U6cmDGgS3zhlAL3kdIwmjy2OHCmKiv0Bx1gQ4OU27oGKYqAsAgIOXFAzE2jZ
         TBd7V/gTJVO7OgjRkLaz/T+x+j+x91Za2aKbRuln+1DKw2+9jho1WPtowFelmPwONdgZ
         ohRWdK+3buU8ixLr4268z0P6QkkYd5J2cueujDT0S9fP8flt64ET8pgg/UqzrmvKSEMa
         8zFsCv3g+OHhOqQj28wvfH/ew1aiHVm4WclfKg8Fmf1dkcRro75B/f94Ln2FeLzUElJE
         4BZw==
X-Gm-Message-State: AOAM532qKhDDl0PRMXbpeCSql4n503Tf6ODm02wehJAoaiPZdG5OTVAr
	bWH2CGXR44rQygA0ZJUO7bzZpYOAgpWOpwktcNY=
X-Google-Smtp-Source: ABdhPJznFLmWYDIu5ULEqToU2K0hCCyb0HkvsmR/6AogoNYq9fh0iQuoOifn18Z4cICPZHayejqFL8kn54OAxoU++B8=
X-Received: by 2002:adf:ec08:: with SMTP id x8mr13101248wrn.235.1597648204139;
 Mon, 17 Aug 2020 00:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200814092914.4160-1-liu.ming50@gmail.com> <20200814092914.4160-3-liu.ming50@gmail.com>
 <CAMKF1soXJ0Jm_WzUYCKhNyaE-eAHg9jG4OEemTSaLu7u5t-SSQ@mail.gmail.com> <ccc06ed3053f5c8fb7f64ec50320d494376f4e4b.camel@linuxfoundation.org>
In-Reply-To: <ccc06ed3053f5c8fb7f64ec50320d494376f4e4b.camel@linuxfoundation.org>
From: "Ming Liu" <liu.ming50@gmail.com>
Date: Mon, 17 Aug 2020 09:09:57 +0200
Message-ID: <CALatG=4J0GxgR3h7s25A_g0xyUQBC+ixmic2WCiaPy=20h6cpg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3 2/2] libubootenv: uprev to v0.3
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Adrian Bunk <bunk@stusta.de>
Content-Type: multipart/alternative; boundary="000000000000af0fff05ad0d75ba"

--000000000000af0fff05ad0d75ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Will investigate the build issues. Thanks.

//Ming Liu

Richard Purdie <richard.purdie@linuxfoundation.org> =E6=96=BC 2020=E5=B9=B4=
8=E6=9C=8815=E6=97=A5 =E9=80=B1=E5=85=AD
=E4=B8=8A=E5=8D=8812:06=E5=AF=AB=E9=81=93=EF=BC=9A

> On Fri, 2020-08-14 at 13:12 -0700, Khem Raj wrote:
> > for qemumips I am still seeing
> >
> > 00:01:59.669 WARNING: No bb files in default matched
> > BBFILE_PATTERN_odroid-extras
> >
> '^/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-odroid/meta-odroi=
d-extras/'
> > 00:02:03.245 ERROR: Nothing RPROVIDES 'u-boot-default-env' (but
> >
> /mnt/jenkins/workspace/yocto-world-glibc/sources/openembedded-core/meta/r=
ecipes-bsp/u-boot/
> libubootenv_0.3.bb
> > RDEPENDS on or otherwise requires it)
> > 00:02:03.534 ERROR: Nothing RPROVIDES 'libubootenv-dev' (but
> >
> /mnt/jenkins/workspace/yocto-world-glibc/sources/openembedded-core/meta/r=
ecipes-bsp/u-boot/
> libubootenv_0.3.bb
> > RDEPENDS on or otherwise requires it)
> > 00:02:03.534 No eligible RPROVIDERs exist for 'libubootenv-dev'
>
> Its also breaking sstate testing:
>
> "oe-selftest -r sstatetests.SStateTests.test_sstate_sametune_samesigs"
>
> causing:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1248/st=
eps/8/logs/step2d
>
> 2020-08-14 19:36:15,406 - oe-selftest - INFO -
> sstatetests.SStateTests.test_sstate_sametune_samesigs
> (subunit.RemotedTestCase)
> 2020-08-14 19:36:15,407 - oe-selftest - INFO -  ... FAIL
> 2020-08-14 19:36:15,407 - oe-selftest - INFO - 9: 38/38 378/414 (153.36s)
> (sstatetests.SStateTests.test_sstate_sametune_samesigs)
> 2020-08-14 19:36:15,407 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent call
> last):
>   File
> "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/self=
test/cases/sstatetests.py",
> line 449, in test_sstate_sametune_samesigs
>     self.assertCountEqual(files1, files2)
>   File "/usr/lib64/python3.6/unittest/case.py", line 1200, in
> assertCountEqual
>     self.fail(msg)
>   File "/usr/lib64/python3.6/unittest/case.py", line 687, in fail
>     raise self.failureException(msg)
> AssertionError: Element counts were not equal:
> First has 1, Second has 0:
> '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3335289/t=
mp-sstatesamehash/stamps/core2-32-poky-linux/libubootenv/0.3-r0.do_package_=
write_rpm.sigdata.05d757878a1583dd222357a916105e1723de0b287d61d4d217953102e=
f4b6710'
> First has 1, Second has 0:
> '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3335289/t=
mp-sstatesamehash/stamps/core2-32-poky-linux/libubootenv/0.3-r0.do_package_=
qa.sigdata.d5d478843b014fcf9715070611562e969b0ebf37e49b284509293a5956d3544b=
'
> First has 1, Second has 0:
> '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3335289/t=
mp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libubootenv/0.3-r0.do_=
package_qa.sigdata.f8638f649c6aebeda30a11f6d2e9379c7e389ded8b84f6b5b57fa36c=
18868bfb'
> First has 1, Second has 0:
> '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3335289/t=
mp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libubootenv/0.3-r0.do_=
package_write_rpm.sigdata.f74b2e6332d343f4800eefa823f0462649a549edd90c2c671=
f623493f9598756'
> First has 0, Second has 1:
> '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3335289/t=
mp-sstatesamehash/stamps/core2-32-poky-linux/libubootenv/0.3-r0.do_package_=
qa.sigdata.a60efa593fff1e0ed60834ecd0fb7f20b94a9534bb66e1b5fd968aca5a9eb831=
'
> First has 0, Second has 1:
> '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3335289/t=
mp-sstatesamehash/stamps/core2-32-poky-linux/libubootenv/0.3-r0.do_package_=
write_rpm.sigdata.b7097c279aba4be43e13e35cfeccc331bdf11dc2d6240da12430c9539=
26796b1'
> First has 0, Second has 1:
> '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3335289/t=
mp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libubootenv/0.3-r0.do_=
package_write_rpm.sigdata.0cd26580e083cbf8ac677e1deb8cbfa1c4ef4c35e29b2ea2b=
b61282b48cda68a'
> First has 0, Second has 1:
> '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3335289/t=
mp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libubootenv/0.3-r0.do_=
package_qa.sigdata.89a10fd2c56db51620a1b5492a894abacb4b38e9eee8ba05fe70f4ca=
46278ccd'
>
> Cheers,
>
> Richard
>
>

--000000000000af0fff05ad0d75ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Will investigate the build issues. Thanks.<div><br></div><=
div>//Ming Liu</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; =E6=96=BC 2020=
=E5=B9=B48=E6=9C=8815=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=8812:06=
=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Fri, 2020-08-14 at 13:12 -0700, Khem Raj wrote:<br>
&gt; for qemumips I am still seeing<br>
&gt; <br>
&gt; 00:01:59.669 WARNING: No bb files in default matched<br>
&gt; BBFILE_PATTERN_odroid-extras<br>
&gt; &#39;^/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-odroid/met=
a-odroid-extras/&#39;<br>
&gt; 00:02:03.245 ERROR: Nothing RPROVIDES &#39;u-boot-default-env&#39; (bu=
t<br>
&gt; /mnt/jenkins/workspace/yocto-world-glibc/sources/openembedded-core/met=
a/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.3.bb" rel=3D"noreferre=
r" target=3D"_blank">libubootenv_0.3.bb</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt; 00:02:03.534 ERROR: Nothing RPROVIDES &#39;libubootenv-dev&#39; (but<b=
r>
&gt; /mnt/jenkins/workspace/yocto-world-glibc/sources/openembedded-core/met=
a/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.3.bb" rel=3D"noreferre=
r" target=3D"_blank">libubootenv_0.3.bb</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt; 00:02:03.534 No eligible RPROVIDERs exist for &#39;libubootenv-dev&#39=
;<br>
<br>
Its also breaking sstate testing:<br>
<br>
&quot;oe-selftest -r sstatetests.SStateTests.test_sstate_sametune_samesigs&=
quot; <br>
<br>
causing:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/79/build=
s/1248/steps/8/logs/step2d" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1248/steps/8/logs/s=
tep2d</a><br>
<br>
2020-08-14 19:36:15,406 - oe-selftest - INFO - sstatetests.SStateTests.test=
_sstate_sametune_samesigs (subunit.RemotedTestCase)<br>
2020-08-14 19:36:15,407 - oe-selftest - INFO -=C2=A0 ... FAIL<br>
2020-08-14 19:36:15,407 - oe-selftest - INFO - 9: 38/38 378/414 (153.36s) (=
sstatetests.SStateTests.test_sstate_sametune_samesigs)<br>
2020-08-14 19:36:15,407 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/oe-selftest-centos/build/met=
a/lib/oeqa/selftest/cases/sstatetests.py&quot;, line 449, in test_sstate_sa=
metune_samesigs<br>
=C2=A0 =C2=A0 self.assertCountEqual(files1, files2)<br>
=C2=A0 File &quot;/usr/lib64/python3.6/unittest/case.py&quot;, line 1200, i=
n assertCountEqual<br>
=C2=A0 =C2=A0 self.fail(msg)<br>
=C2=A0 File &quot;/usr/lib64/python3.6/unittest/case.py&quot;, line 687, in=
 fail<br>
=C2=A0 =C2=A0 raise self.failureException(msg)<br>
AssertionError: Element counts were not equal:<br>
First has 1, Second has 0:=C2=A0 &#39;/home/pokybuild/yocto-worker/oe-selft=
est-centos/build/build-st-3335289/tmp-sstatesamehash/stamps/core2-32-poky-l=
inux/libubootenv/0.3-r0.do_package_write_rpm.sigdata.05d757878a1583dd222357=
a916105e1723de0b287d61d4d217953102ef4b6710&#39;<br>
First has 1, Second has 0:=C2=A0 &#39;/home/pokybuild/yocto-worker/oe-selft=
est-centos/build/build-st-3335289/tmp-sstatesamehash/stamps/core2-32-poky-l=
inux/libubootenv/0.3-r0.do_package_qa.sigdata.d5d478843b014fcf9715070611562=
e969b0ebf37e49b284509293a5956d3544b&#39;<br>
First has 1, Second has 0:=C2=A0 &#39;/home/pokybuild/yocto-worker/oe-selft=
est-centos/build/build-st-3335289/tmp-sstatesamehash/stamps/x86-pokymllib32=
-linux/lib32-libubootenv/0.3-r0.do_package_qa.sigdata.f8638f649c6aebeda30a1=
1f6d2e9379c7e389ded8b84f6b5b57fa36c18868bfb&#39;<br>
First has 1, Second has 0:=C2=A0 &#39;/home/pokybuild/yocto-worker/oe-selft=
est-centos/build/build-st-3335289/tmp-sstatesamehash/stamps/x86-pokymllib32=
-linux/lib32-libubootenv/0.3-r0.do_package_write_rpm.sigdata.f74b2e6332d343=
f4800eefa823f0462649a549edd90c2c671f623493f9598756&#39;<br>
First has 0, Second has 1:=C2=A0 &#39;/home/pokybuild/yocto-worker/oe-selft=
est-centos/build/build-st-3335289/tmp-sstatesamehash/stamps/core2-32-poky-l=
inux/libubootenv/0.3-r0.do_package_qa.sigdata.a60efa593fff1e0ed60834ecd0fb7=
f20b94a9534bb66e1b5fd968aca5a9eb831&#39;<br>
First has 0, Second has 1:=C2=A0 &#39;/home/pokybuild/yocto-worker/oe-selft=
est-centos/build/build-st-3335289/tmp-sstatesamehash/stamps/core2-32-poky-l=
inux/libubootenv/0.3-r0.do_package_write_rpm.sigdata.b7097c279aba4be43e13e3=
5cfeccc331bdf11dc2d6240da12430c953926796b1&#39;<br>
First has 0, Second has 1:=C2=A0 &#39;/home/pokybuild/yocto-worker/oe-selft=
est-centos/build/build-st-3335289/tmp-sstatesamehash/stamps/x86-pokymllib32=
-linux/lib32-libubootenv/0.3-r0.do_package_write_rpm.sigdata.0cd26580e083cb=
f8ac677e1deb8cbfa1c4ef4c35e29b2ea2bb61282b48cda68a&#39;<br>
First has 0, Second has 1:=C2=A0 &#39;/home/pokybuild/yocto-worker/oe-selft=
est-centos/build/build-st-3335289/tmp-sstatesamehash/stamps/x86-pokymllib32=
-linux/lib32-libubootenv/0.3-r0.do_package_qa.sigdata.89a10fd2c56db51620a1b=
5492a894abacb4b38e9eee8ba05fe70f4ca46278ccd&#39;<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--000000000000af0fff05ad0d75ba--
