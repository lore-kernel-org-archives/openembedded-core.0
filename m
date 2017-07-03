Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 445AB6FF7F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 13:56:39 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id v143so62266839qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 06:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LSCcwOW2WGPDQirKo4PItE4xGsJu586XLTp0MEPvxuo=;
	b=h6o/5HyqVITj5qbos/1+jePv2t0dTNKdook6HQNMy+SdZoSgsodGoNfzTF7+QTRRd+
	LagLj6kj8Y9AXNIxFPuOSmNPJhKzEyduKSjiOPCrYMmDRfJQiTvjHwFAfkOhnhg31nvI
	WDsfdypd1vCaJtoIbq55mI79G4q3GQn2b40Q3alT/Fgh9+p2vRx1nWifamQbYAFsB2C5
	oH+5DQwGFNH3e/4d0ScwGfAINSXgcRIoC1g3pW7V9ceielK0ga83kw1812hO49C3P3kg
	5qz3xchBd24Gc/Lb5EKN+w5+OBecrN/q8Znjk/CcIi4cSE4bJasDiUafq77yWFz/+wkC
	j8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LSCcwOW2WGPDQirKo4PItE4xGsJu586XLTp0MEPvxuo=;
	b=DNbYlJlU/Q9o3W5HgHgq3PhD3Yk/y7PReAriKpCWUGqKNGRJl8jAZdj9XDXXWcuxXZ
	Ike7x2fpEn1vtTwGrNXmbF2TyjnG/mW2Y/mJOXCA9/lRFlhh/kUQDH55s7Z0uthnoLvb
	xixZXngekdocFVWL4LFQTGgzilqIjpGeJrVNQBVu78w/3ljFI35q0NlX/d+7AW0AQZTc
	A+uroEWDK4XxXpacfg7+dnVRHAuzT7bhAhqSDVoBPyi9xkf2JrnlT5bSNKfKVb+/R0aS
	N0VeBUV4+V7JmGq1Kwg8AxfipNGCaC8/qLeNE9Xb0VYO8MyYHz+fVHbL1s2zGhU6J1x6
	J8Gg==
X-Gm-Message-State: AIVw111ksH/0Br/bAss5mG2ImFheTpzqQwXZexaTOISwGMfq+x6zxESW
	J8j0TRG+B5cOVyn1WLU/1JXefeCm0ang
X-Received: by 10.55.22.20 with SMTP id g20mr18982524qkh.228.1499090200665;
	Mon, 03 Jul 2017 06:56:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Mon, 3 Jul 2017 06:56:20 -0700 (PDT)
In-Reply-To: <20170703123433.23528-2-gordan.markus@pelagicore.com>
References: <20170703123433.23528-2-gordan.markus@pelagicore.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Jul 2017 14:56:20 +0100
Message-ID: <CAJTo0LYCWai_UhPcfv7VV3iB+NCRdCvPjsLdbE=iv3f9CSzA0Q@mail.gmail.com>
To: =?UTF-8?Q?Gordan_Marku=C5=A1?= <gordan.markus@pelagicore.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cairo: fix QA Issue
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
X-List-Received-Date: Mon, 03 Jul 2017 13:56:42 -0000
Content-Type: multipart/alternative; boundary="001a11493922e5b4fe05536a227e"

--001a11493922e5b4fe05536a227e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 3 July 2017 at 13:34, Gordan Marku=C5=A1 <gordan.markus@pelagicore.com> =
wrote:

> -FILES_${PN}-dev +=3D "${libdir}/cairo/*.so"
> +FILES_${PN}-dev +=3D "${libdir}/cairo ${libdir}/cairo/*.so"
>

I just spent five minutes working out *why* this fixes the QA issue you
were getting.

A better fix would be to delete ${libdir}/cairo using:

  rmdir ${libdir}/cairo || :

or

  rmdir --ignore-fail-on-non-empty ${libdir}/cairo

(former is POSIX compliant, but I can't think of a situation where that is
only a hypothetical problem)

Then in the commit message you can say that the directory is always created
but it only has content if you disable cairo-trace.  At least, I hope you
are explicitly disabling cairo-trace as there's no other way I can see for
you go get this.

Ross

--001a11493922e5b4fe05536a227e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div><div class=3D"gmail_extra"><div class=3D"gmail_qu=
ote">On 3 July 2017 at 13:34, Gordan Marku=C5=A1=C2=A0<span dir=3D"ltr">&lt=
;<a href=3D"mailto:gordan.markus@pelagicore.com" target=3D"_blank">gordan.m=
arkus@pelagicore.com</a>&gt;</span>=C2=A0wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div id=
=3D"gmail-:yn" class=3D"gmail-a3s gmail-aXjCH gmail-m15d087d2c6436eea">-FIL=
ES_${PN}-dev +=3D &quot;${libdir}/cairo/*.so&quot;<br>+FILES_${PN}-dev +=3D=
 &quot;${libdir}/cairo ${libdir}/cairo/*.so&quot;<br></div></blockquote></d=
iv><br></div><div class=3D"gmail_extra">I just spent five minutes working o=
ut *why* this fixes the QA issue you were getting.</div></div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">A better fix would be to=
 delete ${libdir}/cairo using:</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">=C2=A0 rmdir ${libdir}/cairo || :</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">or</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">=C2=A0 rmdir=C2=A0--igno=
re-fail-on-non-empty ${libdir}/cairo</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">(former is POSIX compliant, but I can&#39;t =
think of a situation where that is only a hypothetical problem)</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Then in the commi=
t message you can say that the directory is always created but it only has =
content if you disable cairo-trace.=C2=A0 At least, I hope you are explicit=
ly disabling cairo-trace as there&#39;s no other way I can see for you go g=
et this.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a11493922e5b4fe05536a227e--
