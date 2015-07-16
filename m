Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 19A44607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 22:22:35 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so59746850qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 15:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HqZCpvTSwdVnXo1S81Gak3REZyLcsGDbPjxY4ATHo0M=;
	b=GuErQrrt/HBf3x/tJ8GsF+49yhrYxxkUlM6YnipzoyxqRcr8Dzq27rEfxlWX8Kw8CM
	LJzTe1neXYpEkQ0xBAYZvn1kJLvZPBcNZ7XkpRtxc8oCijuZjY6m9/g9bDSf3nFzuNVs
	R+2oe/Enh4VPCFjxtY/8WIpHasoHez7Zjh3q2sA10qDLA2eAFW/Ni2KhX3VaivUuOH53
	AHuaKdteRra0g7RZcdB6aA3akwe5PLMIWta318h5mBLxa3RJ/Kkb7whAOE2I+4jTHyTq
	LFA7yeisaxQoJX+Cbt0FSibUFLS76g0drPLVJy9/UdueK4jiYchYsreMTl9LssCTSuT7
	KlLg==
X-Gm-Message-State: ALoCoQmDewpt9j0O/rMT3AHF+Gz9cWY7AfMsur6bluJeaqArpHxoTM4GxqokTXo/mKUZ3wPmhdDk
X-Received: by 10.55.43.95 with SMTP id r92mr20565732qkh.67.1437085355720;
	Thu, 16 Jul 2015 15:22:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 16 Jul 2015 15:22:16 -0700 (PDT)
In-Reply-To: <20150716212956.GA7193@jama>
References: <20150714142140.GC2184@jama> <20150716212956.GA7193@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Jul 2015 23:22:16 +0100
Message-ID: <CAJTo0LaC2922F34uaejPiMAqyZTtrE6yW-wno+a36nN_Ty_tdg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: dbus-test no longer built for dbus-ptest after last bitbake changes
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
X-List-Received-Date: Thu, 16 Jul 2015 22:22:36 -0000
Content-Type: multipart/alternative; boundary=001a1147b8dc23d863051b0582f9

--001a1147b8dc23d863051b0582f9
Content-Type: text/plain; charset=UTF-8

On 16 July 2015 at 22:29, Martin Jansa <martin.jansa@gmail.com> wrote:

> ERROR: Nothing PROVIDES 'gtk+-native' (but
> virtual:native:/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/libwmf/
> libwmf_0.2.8.4.bb DEPENDS on or otherwise requires it). Close matches:
>

So libwmf does this:

DEPENDS_virtclass-native = "freetype-native libpng-native jpeg-native"
DEPENDS = "freetype libpng jpeg expat gtk+"

Interestingly changing this to _class-native fixes the problem.

Ross

--001a1147b8dc23d863051b0582f9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 July 2015 at 22:29, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><div id=3D":24t" class=3D"" style=3D"ov=
erflow:hidden">ERROR: Nothing PROVIDES &#39;gtk+-native&#39; (but virtual:n=
ative:/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-ext=
ended/libwmf/<a href=3D"http://libwmf_0.2.8.4.bb" rel=3D"noreferrer" target=
=3D"_blank">libwmf_0.2.8.4.bb</a> DEPENDS on or otherwise requires it). Clo=
se matches:<br></div></blockquote></div><br><div class=3D"gmail_extra">So l=
ibwmf does this:</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra"><div class=3D"gmail_extra">DEPENDS_virtclass-native =3D &quot;fr=
eetype-native libpng-native jpeg-native&quot;</div><div class=3D"gmail_extr=
a">DEPENDS =3D &quot;freetype libpng jpeg expat gtk+&quot;</div><div><br></=
div><div>Interestingly changing this to _class-native fixes the problem.</d=
iv><div><br></div><div>Ross<br></div></div></div></div>

--001a1147b8dc23d863051b0582f9--
