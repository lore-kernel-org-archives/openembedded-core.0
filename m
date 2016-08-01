Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6CEA5731D6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 16:43:21 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id f6so38685374ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2016 09:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BjvfdsaDsFmFjJ0X/bzzAh17orTCZMJqG6OLzT6uBG8=;
	b=asBVWskB8da4WonGvdT8cK+q6mJO20D/KMcBNPjfa1YhhkvjK9grpyrlqt0ewWWZG1
	OqQCUzDZa+bJ/8COSbT94nZswFNv+WzYM1QEE+IdKLNgo/zrW9XYdDjAnb5PkEer+7bn
	5zObsDaoPCvSJIGNJVcLzWF6p8mVf+YXDGYtxd8JxJh4ebYBosbdn7XkAzn6bPICAHjV
	WrduWPKDFYQQVI8LhSGlghbOAkA2r38Qk3z7uTFaaxLRKO9eV42qdoYcOhtD3LSvhczq
	SlxsdEg6EelZEjUE+ub/8TDGFVN35ImqHg2HaiQN0vvJAx1u7WFvZxbv3a3WGXPY8zHf
	DItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BjvfdsaDsFmFjJ0X/bzzAh17orTCZMJqG6OLzT6uBG8=;
	b=jMHw7d9xOoc8kv6RRFg9ksrd5WTES4110NDWREouYV1q9+BPSQRFrxz4RkKwMTB6Kw
	qbz6bl1uf/D/P5daoYbXbvtYZZj0sjYJ5Cwbc88J0Hnb5q2UVP5aj5OqMl6LdNm0Hgw4
	fTAy2aodglMq+zy2aF4/p6UMLHRCr6Qxn/OBzNdj9e/OxnFGo9sbF4lcCaXfduI+Gkx8
	bUYJWhdXSL1HXeYB+yF73E6ie0QAGOMVZEk3/Sh4q1W1XRNaeQ4zFdshqPf6knI+Z3gy
	KBGkJQl9ovhZECeDoVix7WM8d/gIOFYjyHSjTxp1r3dsYEzKOtx+WLH1u5jAt2msxMHF
	OMzw==
X-Gm-Message-State: AEkoouvBl8QR4awUyYhYXFEVJksSOex95HsNpmuw2uT/K48IKzu9inGsJT770oO9Unq8rFCM4LgvDx2oizWkb9mR
X-Received: by 10.36.131.194 with SMTP id d185mr15239654ite.38.1470069802206; 
	Mon, 01 Aug 2016 09:43:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 1 Aug 2016 09:43:01 -0700 (PDT)
In-Reply-To: <1367a7a6-b6f7-d0e8-d193-39a72b23489a@linux.intel.com>
References: <a3e42644f10b61eb3dce9f12ca91a8e52cbce576.1469656341.git.alejandro.hernandez@linux.intel.com>
	<4da54d831c7002a28d51e3edf23fbee28d98d948.1469656341.git.alejandro.hernandez@linux.intel.com>
	<1469774951.9142.40.camel@linuxfoundation.org>
	<1367a7a6-b6f7-d0e8-d193-39a72b23489a@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Aug 2016 17:43:01 +0100
Message-ID: <CAJTo0LYpe0X=RVX6B1C54TqCG==WoqzA6fvQJ+Rih99eKAUPUg@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] cronie: upgrade to 1.5.1
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
X-List-Received-Date: Mon, 01 Aug 2016 16:43:24 -0000
Content-Type: multipart/alternative; boundary=94eb2c0496525b30130539054c43

--94eb2c0496525b30130539054c43
Content-Type: text/plain; charset=UTF-8

On 1 August 2016 at 17:35, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> Interesting, it didnt break on my build, I'll dig up whats going on
>

You didn't do a build with PAM enabled (DISTRO_FEATURES_append=" pam").

I usually have PAM enabled locally but forgot.  It's worth checking if the
patch needs to be PAM-specific or if we're safe to always apply it.  As
it's patching PAM configuration I expect we can always apply it as it won't
be installed if PAM is disabled.

Ross

--94eb2c0496525b30130539054c43
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 August 2016 at 17:35, Alejandro Hernandez <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">alejandr=
o.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div id=3D":22k" class=3D"a3s aXjCH m15646f7bdf0822e8">Interesting=
, it didnt break on my build, I&#39;ll dig up whats going on<div class=3D"y=
j6qo ajU"><div id=3D":pu" class=3D"ajR" tabindex=3D"0"></div></div></div></=
blockquote></div><br>You didn&#39;t do a build with PAM enabled (DISTRO_FEA=
TURES_append=3D&quot; pam&quot;).</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">I usually have PAM enabled locally but forgot.=
=C2=A0 It&#39;s worth checking if the patch needs to be PAM-specific or if =
we&#39;re safe to always apply it.=C2=A0 As it&#39;s patching PAM configura=
tion I expect we can always apply it as it won&#39;t be installed if PAM is=
 disabled.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--94eb2c0496525b30130539054c43--
