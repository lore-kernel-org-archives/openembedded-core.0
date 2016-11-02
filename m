Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id E341271AE9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 20:42:28 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id q130so33303310qke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 13:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=btzcSnPdzx/uJ6QyocRoM6FyKzddYYCU9FXiwcrqxb0=;
	b=SSsKoUkE1PcaQINKzO+91HHj9JPXTKXeHUoR82vhSA5V3T/0q8HyWQcvazwGLwU53c
	y6pvxuHRUCu7VMtqc6k9oAzrKnXIMUaQeNDzyxQBb9gJskUSUkhgwuL5tMKF6zMgVXY0
	A+hm2nc4/7W0M6d+yXsc1KGdF4nQc8aE0Q5yCobBvLmiXi7TCn9E0dk9EoDnr4owk+3z
	7df8IrOEvlPMCWQ/Zk7nnSsHfTf+maxoDHUGWlyqdGhJeuF5ZA1RDWEd26P22I0Ehnuj
	w4U720e2NReZxY2s/2FQEFOHr01BYvdAuTd3ntyRW+ZfHSOysJxAeHlGIN0JTpRB7Q2c
	28Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=btzcSnPdzx/uJ6QyocRoM6FyKzddYYCU9FXiwcrqxb0=;
	b=eWEKCemg/V7RtnDt8T3kILbTjOD5Nro4VXdLd6d8mo/3yfdmn2ntoctbwSn/DnvvCA
	K8XYocm4LlEvMB3R8yfrViEt9YAfvNOUvUbQ7y9+/PNc4UC92foN5Le7aZMRhcMVpcQ4
	e17eVnFUX7Fy1uJcnHgal11Nj3mvLl9NrA5zzDdkz1qYGtFM0H9kQpntLBwSJkD8glun
	VsCabLjsfWnrgsnl1CACERt5bMjNkCpr2XwYfHJlNVu3aDmZ3jCCWjpVMeyAvETZD928
	UPFBvnaB2aXvzL43ekuo9802Mm7CpwcJx1KAc4h2OQXCsaadq3RKIkqB/b34oBbxJkqz
	HATA==
X-Gm-Message-State: ABUngvdnyKw0BcboGUD2tcEpkVm++rbIpyW7kOuX6EaCRU1tos+kneAt7C4cl6cjo0JlYSYeyb1zs6phpD2Qbclj
X-Received: by 10.55.5.145 with SMTP id 139mr4671882qkf.77.1478119349943; Wed,
	02 Nov 2016 13:42:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Wed, 2 Nov 2016 13:42:09 -0700 (PDT)
In-Reply-To: <1478099232-23987-1-git-send-email-ross.burton@intel.com>
References: <1478099232-23987-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Nov 2016 20:42:09 +0000
Message-ID: <CAJTo0Lb8gkAUwAAvytpRvdA9eL1hmAu2Am0Xsp9vgHPm8wOWJw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/license: copy licenses even if there are no checksummed files
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
X-List-Received-Date: Wed, 02 Nov 2016 20:42:29 -0000
Content-Type: multipart/alternative; boundary=001a114c8f84ca263a0540577ab6

--001a114c8f84ca263a0540577ab6
Content-Type: text/plain; charset=UTF-8

On 2 November 2016 at 15:07, Ross Burton <ross.burton@intel.com> wrote:

> Previously do_populate_lic would bail writing the license files (such as
> the MIT
> license text) to deploy/licenses/${PN}/ if there were no files listed in
> LIC_FILES_CHKSUM.
>
> However this means that recipes that generate their content (such as
> os-release)
> or are otherwise "interesting" (such as perf) don't have their license
> files
> copied over, resulting in warnings from do_rootfs.
>

I just did a bit more digging that I meant to do earlier but failed.  This
has recently become apparent because of
oe-core b18fa5f2f2f46afc6fdc58f4d29679dea9c36c43 which removed redundant
LIC_FILES_CHKSUMs from recipes.  For example, os-release had this:

LIC_FILES_CHKSUM =
"file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

Which prompts the license code to copy COPYING.MIT and generic_MIT into
deploy/licenses.  It was removed because it generally serves no purpose:
you're verifying a license statement that has no relation to the contents
of the recipe (in this case, the content is generated, but other recipes
have no content).  The side effect was that the files are not copied, so my
patch changes the behaviour so that the recipe wide license file is
*always* copied even if there are no files in LIC_FILES_CHKSUM.

I'll update the commit message to reflect this.

Ross

--001a114c8f84ca263a0540577ab6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 November 2016 at 15:07, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><div id=3D"gmail-:3i2" class=3D"gmail-a=
3s gmail-aXjCH gmail-m15825947664f74b5">Previously do_populate_lic would ba=
il writing the license files (such as the MIT<br>
license text) to deploy/licenses/${PN}/ if there were no files listed in<br=
>
LIC_FILES_CHKSUM.<br>
<br>
However this means that recipes that generate their content (such as os-rel=
ease)<br>
or are otherwise &quot;interesting&quot; (such as perf) don&#39;t have thei=
r license files<br>
copied over, resulting in warnings from do_rootfs.<br></div></blockquote></=
div><br>I just did a bit more digging that I meant to do earlier but failed=
.=C2=A0 This has recently become apparent because of oe-core=C2=A0b18fa5f2f=
2f46afc6fdc58f4d29679dea9c36c43 which removed redundant LIC_FILES_CHKSUMs f=
rom recipes.=C2=A0 For example, os-release had this:</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">LIC_FILES_CHKSUM =3D &quot;f=
ile://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420&q=
uot;<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Which prompts the license code to copy COPYING.MIT and generic_MIT into =
deploy/licenses.=C2=A0 It was removed because it generally serves no purpos=
e: you&#39;re verifying a license statement that has no relation to the con=
tents of the recipe (in this case, the content is generated, but other reci=
pes have no content).=C2=A0 The side effect was that the files are not copi=
ed, so my patch changes the behaviour so that the recipe wide license file =
is *always* copied even if there are no files in LIC_FILES_CHKSUM.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I&#39;ll updat=
e the commit message to reflect this.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a114c8f84ca263a0540577ab6--
