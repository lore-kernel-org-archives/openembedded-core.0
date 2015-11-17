Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8313A60118
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 21:36:58 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so24109619igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 13:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=kxVrtk7RcGydEP2o+yBPIrmHA9lk+h858gs5sAs8RKc=;
	b=1r4LVsdAp6lZVWEE8Pj22AdhU1oF0u7Pg83FFeB68JKoqpOm5tpLEhDHMhpSnxTU9r
	BS+SspA2oAJTEorRiPbIf/ook3hmgwtCvYg3/e1DL0DNtKgX5gSEJ6M2ZFYILdSPBKel
	RjhPztuyJ7PkbxDZnSY7OeaVVFuMM5zzrAiSvt4aAF4XFoZOIxSW/K0W59l8gl+DNyZ8
	Wzp0fH/fuvKjiHuzRvQeFTgtmM9JAlDpeNhOtUI/eBlcmHuexVLCAjpP4NGabjTrbAFP
	OJM3Lt71T1r7bnS3cCShCgz3Zdizgt+Dy0GeZZ9P4uR0IRSWvtw5B0eQ7v968wbjo4VR
	YX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kxVrtk7RcGydEP2o+yBPIrmHA9lk+h858gs5sAs8RKc=;
	b=VX6JZ3sa2+TU9j2hnXZa4sCkcs44NT0DutIuDCiViccAovxEB1dxR/0C2fwetl82Sq
	v21wC/lN+gL8cYZftk2rhwkV0HuGB+ZhP6doPSPt0arih60yidtOusWL711NrQK+NFNP
	nJBLUilOwLILdF/LEb4lLs4zsMVc+P7nYjf9qpx+AkBcrMTakyv26x5rCPR58LernMS+
	y5qgBq1a2WwLQ7qSfUK7ppR4kSX/JZckFZogHj5uJ2RXhAw+X9RXdELe6gdFngTKvnuT
	ycpdZA0jOEVtI+0/GFgdx29SUmAjJ5MedREwc6r34N7Riyomo98ZgQ93BsFnTzwRxSAV
	BH9A==
X-Gm-Message-State: ALoCoQnyGzg5E4IDW83xIT1evNO12ROeOhP/0gMue/i8wykogoWy/LL9S0sHCDeHuDxuxkJkWCIe
X-Received: by 10.50.30.69 with SMTP id q5mr4463577igh.78.1447796218948; Tue,
	17 Nov 2015 13:36:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Tue, 17 Nov 2015 13:36:39 -0800 (PST)
In-Reply-To: <0a2bdfd48b566acec7f05734758da7811980a0bb.1447455202.git.chris_larson@mentor.com>
References: <cover.1447455202.git.chris_larson@mentor.com>
	<0a2bdfd48b566acec7f05734758da7811980a0bb.1447455202.git.chris_larson@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Nov 2015 21:36:39 +0000
Message-ID: <CAJTo0LZYFwj9+5XOS6ewLTKwiWoBd7+YY+uXoCe0V4M7YwYRvg@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 6/6] psplash: add systemd support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Nov 2015 21:37:05 -0000
Content-Type: multipart/alternative; boundary=047d7bdc1c0c568b090524c3536c

--047d7bdc1c0c568b090524c3536c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 13 November 2015 at 23:10, Christopher Larson <kergoth@gmail.com> wrote:

>  meta/recipes-core/psplash/files/psplash-quit.service | 11 +++++++++++
>  .../recipes-core/psplash/files/psplash-start.service | 11 +++++++++++
>  meta/recipes-core/psplash/psplash_git.bb             | 20
> +++++++++++++++-----
>

This causes the selftest to fail:
| =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| FAIL: test_systemd_failed (oeqa.runtime.systemd.SystemdBasicTests)
| ----------------------------------------------------------------------
| Traceback (most recent call last):
|   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-systemd/build/me=
ta/lib/oeqa/utils/decorators.py",
line 106, in wrapped_f
|     return func(*args, **kwargs)
|   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-systemd/build/me=
ta/lib/oeqa/utils/decorators.py",
line 94, in wrapped_f
|     return f(*args, **kwargs)
|   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-systemd/build/me=
ta/lib/oeqa/runtime/systemd.py",
line 65, in test_systemd_failed
|     self.assertTrue(match, msg=3D"Some systemd units failed:\n%s" % outpu=
t)
| AssertionError: None is not true : Some systemd units failed:
|   UNIT                  LOAD   ACTIVE SUB    DESCRIPTION
| =E2=97=8F bluetooth.service     loaded failed failed Bluetooth service
| =E2=97=8F psplash-quit.service  loaded failed failed Terminate Psplash Bo=
ot Screen
| =E2=97=8F psplash-start.service loaded failed failed Starts Psplash Boot =
screen

Ross

--047d7bdc1c0c568b090524c3536c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 November 2015 at 23:10, Christopher Larson <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><div id=3D":5qn" class=3D"" style=3D"ov=
erflow:hidden">=C2=A0meta/recipes-core/<span class=3D"">psplash</span>/file=
s/<span class=3D"">psplash</span>-quit.service | 11 +++++++++++<br>
=C2=A0.../recipes-core/<span class=3D"">psplash</span>/files/<span class=3D=
"">psplash</span>-start.service | 11 +++++++++++<br>
=C2=A0meta/recipes-core/<span class=3D"">psplash</span>/<a href=3D"http://p=
splash_git.bb" rel=3D"noreferrer" target=3D"_blank"><span class=3D"">pspl</=
span>ash_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 +++=
++++++++++++-----</div></blockquote></div><br>This causes the selftest to f=
ail:<br>| =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
>| FAIL: test_systemd_failed (oeqa.runtime.systemd.SystemdBasicTests)<br>| =
----------------------------------------------------------------------<br>|=
 Traceback (most recent call last):<br>| =C2=A0 File &quot;/home/pokybuild/=
yocto-autobuilder/yocto-worker/nightly-qa-systemd/build/meta/lib/oeqa/utils=
/decorators.py&quot;, line 106, in wrapped_f<br>| =C2=A0 =C2=A0 return func=
(*args, **kwargs)<br>| =C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/=
yocto-worker/nightly-qa-systemd/build/meta/lib/oeqa/utils/decorators.py&quo=
t;, line 94, in wrapped_f<br>| =C2=A0 =C2=A0 return f(*args, **kwargs)<br>|=
 =C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-q=
a-systemd/build/meta/lib/oeqa/runtime/systemd.py&quot;, line 65, in test_sy=
stemd_failed<br>| =C2=A0 =C2=A0 self.assertTrue(match, msg=3D&quot;Some sys=
temd units failed:\n%s&quot; % output)<br>| AssertionError: None is not tru=
e : Some systemd units failed:<br>| =C2=A0 UNIT =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOAD =C2=A0 ACTIVE SUB =C2=A0 =C2=A0DESC=
RIPTION<br>| =E2=97=8F bluetooth.service =C2=A0 =C2=A0 loaded failed failed=
 Bluetooth service<br>| =E2=97=8F psplash-quit.service =C2=A0loaded failed =
failed Terminate Psplash Boot Screen<br>| =E2=97=8F psplash-start.service l=
oaded failed failed Starts Psplash Boot screen</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bdc1c0c568b090524c3536c--
