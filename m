Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id CE608731C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:39:28 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id q68so11889484qki.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xoRdVG2Ke5xTyirkgnl5s9T6a70vl1IYP4RkU2tJ2r4=;
	b=i1moxMSHRq7dG6V9B/WRA6WhEYCJkQm9UqSOJEm6ACrfGf2Z8BDn810FHm6XeVyHps
	13Zjav92EQF6C2YGMpMuS0MDfr6A/zZ3go/25WvCCON+aw5mQZD35mCkRrim9JXe+OEz
	5+FMljHE3tr2GcZkwGSO9RQNOvWuZvJg/wKiOmOOd+C2GsqO1hrxeL8FbxIyY4WxeaLa
	wzqgJN0r0zW181Yjv0FV/RRoV1O54K/TXRf7T0+DtjDDOQwVReDKKiQTcAI6H3bhiyeP
	S+Y1OVKP1HAv2z0r/ClpvAWUHToLigmsac95HmCZkRz/OwCZ7vtLRwgL4l/NjOArzO73
	u6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xoRdVG2Ke5xTyirkgnl5s9T6a70vl1IYP4RkU2tJ2r4=;
	b=MXz6ZIlcfESS4XLxkUNx79QJcTwyiYSWCNiHTv9vjOm8OPjBE16xsZcCn4zL1RNf2O
	IIVxWrS3brt+JAvMjI471SFz1MjGIMpc9Te3tt4ravtyY9m8nsNUbFB44zl85WJY1bJf
	yKT/Uim4Ud49WWqh/i+sE9e0s8FVI4SrB2ZCH4rK3Y9zcGEB1vr4y89gdo4nKOVqnPPd
	knBw+hwPCZmsPw+A/MITdjsLSvq75bVwSEbub5Lmv1ZC5dSVl2LgOJ3uBsR9vAXe+3dh
	FmEm8qm8HwVUYgpiDXY+bXjF+eqkyaC4jHJbIwVr5TChFcoYI5WhkE+OzPjzVkSfLJBg
	3U1g==
X-Gm-Message-State: AIkVDXKrwla0HeSljEDjWqJvwfjFt04oH6kFhvn2KAFpoXhBWE7zBzVCKQ2YwsHfRojCETufXQlz0ZZNWBKSRyoC
X-Received: by 10.55.8.20 with SMTP id 20mr1532646qki.3.1482147569645; Mon, 19
	Dec 2016 03:39:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 19 Dec 2016 03:39:09 -0800 (PST)
In-Reply-To: <1482130882-148241-1-git-send-email-wenlin.kang@windriver.com>
References: <1482130882-148241-1-git-send-email-wenlin.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Dec 2016 11:39:09 +0000
Message-ID: <CAJTo0LYgLj4o1srO59zCz5KhSio-C5-GFTnLaAmKcripb04Sgg@mail.gmail.com>
To: Wenlin Kang <wenlin.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnupg: specify explicitly tar path
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
X-List-Received-Date: Mon, 19 Dec 2016 11:39:29 -0000
Content-Type: multipart/alternative; boundary=001a114c9d6064c9880544015f59

--001a114c9d6064c9880544015f59
Content-Type: text/plain; charset=UTF-8

On 19 December 2016 at 07:01, Wenlin Kang <wenlin.kang@windriver.com> wrote:

> +-        AC_PATH_PROG(TAR,"tar")
> +-        _mytar=$ac_cv_path_TAR
>

You don't need to patch configure.ac as you can just set pass
ac_cv_path_TAR=${base_bindir/tar in EXTRA_OECONF.

Ross

--001a114c9d6064c9880544015f59
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2016 at 07:01, Wenlin Kang <span dir=3D"ltr">&lt;<a href=3D"=
mailto:wenlin.kang@windriver.com" target=3D"_blank">wenlin.kang@windriver.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1z8"=
 class=3D"a3s aXjCH m15915e3c168c1608">+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_PAT=
H_PROG(TAR,&quot;tar&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 _mytar=3D$ac_cv_path_TAR<br></div></blockquot=
e></div><br>You don&#39;t need to patch <a href=3D"http://configure.ac">con=
figure.ac</a> as you can just set pass ac_cv_path_TAR=3D${base_bindir/tar i=
n EXTRA_OECONF.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a114c9d6064c9880544015f59--
