Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7F49877339
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 22:35:02 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id 9so99148866iom.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 14:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/H9iF7ZMpD83MSCllNNAmV82ahoXrghpo4w+04FWjrs=;
	b=Tk/7xWpNCVvxXWq/1hq9VQ/g+eGDCJKl5IR7YBc/dicS6ELTaTFVl3uv5yvNEh3R7n
	LDhMgcErPX/qwcE9JCFYmXnUq6IL6Rm41uxl5GmxsfiIk2ZmlB+RqgMvY5UZ+I13493F
	D9OkRj8PHR+txc1AF+/AFBpfOyg9/3HiAltFjmzsqrQlhJKxgg6me9r0uWeJJ/Pykhtn
	LBuIMxSDo8ct9kGLlk36g8pArmR+jCB2f6OnpyOKBgXTKxBcKKaxRO2MgSeNCAYro1iC
	fe8gmI5ZY1dhMz7oBxvQg1weBqlf/SXPkqqJOK/LY66e+kP1zUzEoZbmQYI41yoOqvsl
	b8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/H9iF7ZMpD83MSCllNNAmV82ahoXrghpo4w+04FWjrs=;
	b=cbqLrlQBpsekTzjNzQqn7To+kioVI/ARUXGE5rBOlV/uqao6zvdynWwyCW6Iss2qjM
	q1M7pR3abMxEs3y1zXCB197kry7W0jwT1ArgQ5wSXQClGSzMI/6YrDLpTAQNmnYGmhdS
	5MvyCkMriiNU11+TLuHbhm9MUfRIr6WE8n6TZ7Zcm4ffkWYQvdeeqIR/upapU3hNdvxA
	GZ1frJgLmzOp0rzfkopiE1BKBL/xx97PeA4qDvP/DtVzGzKihDOBalrerGU5umRp9XFE
	jtvwMK5bStjS3OwBzU+mHuPflaPwO0hHVwYAL0oOoib+2pF8xO6izP+jP89DnJ+H4J3D
	vHLg==
X-Gm-Message-State: AG10YOQgkZiozAGNVX0WQDUNRS1wlwpDWaZKLrJ0D315d40OiBoL1f1hFAFJnlozMxxU4DyK4rJ2ACTi51b0siaP
X-Received: by 10.107.3.220 with SMTP id e89mr4960970ioi.99.1456439702952;
	Thu, 25 Feb 2016 14:35:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 25 Feb 2016 14:34:43 -0800 (PST)
In-Reply-To: <cover.1456423924.git.mark.hatle@windriver.com>
References: <cover.1456423924.git.mark.hatle@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Feb 2016 22:34:43 +0000
Message-ID: <CAJTo0LZX67n-DicK5gWBA39sh5eyr52VvhehQNZRDd5=F=N4Ww@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Upgrade RPM 5 to 5.4.16 (CVS HEAD)
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
X-List-Received-Date: Thu, 25 Feb 2016 22:35:03 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7c21d295052c9fcbcb

--001a113f0e7c21d295052c9fcbcb
Content-Type: text/plain; charset=UTF-8

On 25 February 2016 at 18:18, Mark Hatle <mark.hatle@windriver.com> wrote:

> There is not yet an official RPM 5.4.16 release, however one will be
> coming
> soon.  Until then, 4 distinct patches are used to upgrade RPM 5.4.15 to
> 5.4.16.  These patches are part of the commit (compressed w/ .xz).  However
> I am not sending them as part of the email as it's not very interesting
> to review base64.  :P
>

Sorry Mark...

| In file included from ../../rpm-5.4.15/rpmio/keccak.c:71:0:
|
/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/lib/i586-poky-linux/gcc/i586-poky-linux/5.3.0/include/emmintrin.h:753:1:
error: inlining failed in call to always_inline '_mm_setzero_si128': target
specific option mismatch
|  _mm_setzero_si128 (void)
|  ^
| ../../rpm-5.4.15/rpmio/keccak.c:656:10: error: called from here
|      Zero = ZERO128(); \
|           ^
| ../../rpm-5.4.15/rpmio/keccak.c:666:36: note: in expansion of macro
'thetaRhoPiChiIotaPrepareTheta'
|  #define thetaRhoPiChiIota(i, A, E) thetaRhoPiChiIotaPrepareTheta(i, A, E)
|                                     ^
| ../../rpm-5.4.15/rpmio/keccak.c:1957:2: note: in expansion of macro
'thetaRhoPiChiIota'
|   thetaRhoPiChiIota(17, E, A) \
|   ^
| ../../rpm-5.4.15/rpmio/keccak.c:2026:5: note: in expansion of macro
'rounds'
|      rounds

(qemx86)

Ross

--001a113f0e7c21d295052c9fcbcb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 February 2016 at 18:18, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);=
border-left-style:solid;padding-left:1ex"><div id=3D":g6s" class=3D"" style=
=3D"overflow:hidden">There is not yet an official <span class=3D"">RPM</spa=
n> 5.4.16 release, however one will be coming<br>
soon.=C2=A0 Until then, 4 distinct patches are used to upgrade <span class=
=3D"">RPM</span> 5.4.15 to<br>
5.4.16.=C2=A0 These patches are part of the commit (compressed w/ .xz).=C2=
=A0 However<br>
I am not sending them as part of the email as it&#39;s not very interesting=
<br>
to review base64.=C2=A0 :P</div></blockquote></div><br>Sorry Mark...</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=
=3D"gmail_extra">| In file included from ../../rpm-5.4.15/rpmio/keccak.c:71=
:0:</div><div class=3D"gmail_extra">| /data/poky-master/tmp-glibc/sysroots/=
x86_64-linux/usr/lib/i586-poky-linux/gcc/i586-poky-linux/5.3.0/include/emmi=
ntrin.h:753:1: error: inlining failed in call to always_inline &#39;_mm_set=
zero_si128&#39;: target specific option mismatch</div><div class=3D"gmail_e=
xtra">| =C2=A0_mm_setzero_si128 (void)</div><div class=3D"gmail_extra">| =
=C2=A0^</div><div class=3D"gmail_extra">| ../../rpm-5.4.15/rpmio/keccak.c:6=
56:10: error: called from here</div><div class=3D"gmail_extra">| =C2=A0 =C2=
=A0 =C2=A0Zero =3D ZERO128(); \</div><div class=3D"gmail_extra">| =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div class=3D"gmail_extra">| ../../rpm-5=
.4.15/rpmio/keccak.c:666:36: note: in expansion of macro &#39;thetaRhoPiChi=
IotaPrepareTheta&#39;</div><div class=3D"gmail_extra">| =C2=A0#define theta=
RhoPiChiIota(i, A, E) thetaRhoPiChiIotaPrepareTheta(i, A, E)</div><div clas=
s=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</d=
iv><div class=3D"gmail_extra">| ../../rpm-5.4.15/rpmio/keccak.c:1957:2: not=
e: in expansion of macro &#39;thetaRhoPiChiIota&#39;</div><div class=3D"gma=
il_extra">| =C2=A0 thetaRhoPiChiIota(17, E, A) \</div><div class=3D"gmail_e=
xtra">| =C2=A0 ^</div><div class=3D"gmail_extra">| ../../rpm-5.4.15/rpmio/k=
eccak.c:2026:5: note: in expansion of macro &#39;rounds&#39;</div><div clas=
s=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0rounds</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">(qemx86)</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a113f0e7c21d295052c9fcbcb--
