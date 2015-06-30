Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2584A72D64
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 15:48:13 +0000 (UTC)
Received: by qgeg89 with SMTP id g89so5814420qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 08:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=72shA8ghJln5SvOBKenX3Zenxf2fsV1gG+lD/FjEq0s=;
	b=fX/z9oR8O5crXQZbbsZMyFHgfd9gMGA5bOP5PU1eiWD4Kx5Sm2QgvQ5ev3+0+F2/eK
	c47JSQ8/1p1TgOPzw7xYG7qKJQwAeut/tnpgGjRsIRPyFARBNYqtXCIRUcwHiUs/xmBo
	U0VmLChOucb1vipi8UCwv4K/3gWG0+SnP+6V2h6+QBdG0h8mqf9DAU7TJdapxQvYs/HZ
	/0rLoBF2Hw6tgRXnJl4gvDkLYWIiXUBvdORQ6m8Ec90PFYBl7fDnMB1MGEH8o5TDjnVY
	3hsrY+azFluYRyMiIEWNEC1MhuxQFLyaq+5vHgYh/4syXYWuYkAUhNIUxW4pc7g9RCsD
	d2wA==
X-Gm-Message-State: ALoCoQkqai39GVFLDa+u8L4ucNoVHX6lyYNa2HVJWaQ4cOhvmWH/stwhtmdnNj5kzSqx1/MOX/Dk
X-Received: by 10.55.15.129 with SMTP id 1mr45295633qkp.29.1435679295033; Tue,
	30 Jun 2015 08:48:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 30 Jun 2015 08:47:55 -0700 (PDT)
In-Reply-To: <0c7f245a788abe31dc96f33860465b32300c05dd.1434464336.git.jussi.kukkonen@intel.com>
References: <cover.1434464336.git.jussi.kukkonen@intel.com>
	<0c7f245a788abe31dc96f33860465b32300c05dd.1434464336.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jun 2015 16:47:55 +0100
Message-ID: <CAJTo0Lb2doffPRhcsfrr_M37XOxdSL13=juHkvLtbjL4=_3qdg@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/6] adwaita-icon-theme: Add new icon theme for GTK+
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
X-List-Received-Date: Tue, 30 Jun 2015 15:48:14 -0000
Content-Type: multipart/alternative; boundary=001a1146f100647e940519be22a4

--001a1146f100647e940519be22a4
Content-Type: text/plain; charset=UTF-8

On 16 June 2015 at 15:22, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
> +inherit autotools pkgconfig gettext gtk-icon-cache

Does this recipe build with allarch?

Would it be sensible to split out the high-resolution icons (the 256x256)
into a sub-package so systems that don't have very high resolution screens
don't need to ship them?  I guess it comes down to how big they are.

> +RRECOMMENDS_${PN} += "librsvg-gtk"

If there's no SVG files in the theme, we don't need to depend on the SVG
loader.

Ross

--001a1146f100647e940519be22a4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 16 June 2015 at 15:22, Jussi Kukkonen &lt;<a href=3D"ma=
ilto:jussi.kukkonen@intel.com">jussi.kukkonen@intel.com</a>&gt; wrote:<br>&=
gt; +inherit autotools pkgconfig gettext gtk-icon-cache<br><br>Does this re=
cipe build with allarch?<br><br>Would it be sensible to split out the high-=
resolution icons (the 256x256) into a sub-package so systems that don&#39;t=
 have very high resolution screens don&#39;t need to ship them?=C2=A0 I gue=
ss it comes down to how big they are.<br><br>&gt; +RRECOMMENDS_${PN} +=3D &=
quot;librsvg-gtk&quot;<div><br></div><div>If there&#39;s no SVG files in th=
e theme, we don&#39;t need to depend on the SVG loader.</div><div><br></div=
><div>Ross</div></div>

--001a1146f100647e940519be22a4--
