Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id B5CF1722B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 16:10:04 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id f51so4855086qge.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 08:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=CfWqveanpHziQV1S/DYG5HvSe50diHMQ52ocWPpZTSQ=;
	b=SPAVpgACp64FVKefAxKOqdWjbZES1sCob06nQN7LM/vOkFgRbOhUEZU6zcGk/BqdFz
	fIoWpl6VGWunnA6O4x9T7FXxUCAEqVM4IpihfpNFdxJDrwCgpFyzsUs5UTrF5f0oJj58
	g9dY+6xfLYP0RGFpSRtxqEenkZjgoQFK6m64HCxSvitSfSmcbdBTFhxRpkAW27Nhpz7R
	63F20zj4DXl1bN2phTEdJxYiq2iWnhbaHAk6nXlpxwIuIcm8XjM6RWZaFUt7ic2KQHA8
	EXnPtL0Qj9LALl4IR0VYoM0i4XZGTBkFjeXkbcdlPM6EG6FxBGMEnbx4aF5AvGflTm6y
	QtDQ==
X-Gm-Message-State: ALoCoQlU3plsit145bjVV/JDBJXdwgzgztgppncmnqNGULtvjq3cN7OxXS228yy9DeStxf0aeZ2/
X-Received: by 10.140.109.135 with SMTP id l7mr34942571qgf.80.1417191004293;
	Fri, 28 Nov 2014 08:10:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Fri, 28 Nov 2014 08:09:44 -0800 (PST)
In-Reply-To: <1417188989-30734-1-git-send-email-ross.burton@intel.com>
References: <1417188989-30734-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Nov 2014 16:09:44 +0000
Message-ID: <CAJTo0LZaWzqryXhfvkrpEAA_xXc0AcXp-4XBgpC4nctGs=679g@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash: use EXTRA_AUTORECONF to disable autoheader
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
X-List-Received-Date: Fri, 28 Nov 2014 16:10:07 -0000
Content-Type: multipart/alternative; boundary=001a113a4eb263e29f0508ed7e42

--001a113a4eb263e29f0508ed7e42
Content-Type: text/plain; charset=UTF-8

On 28 November 2014 at 15:36, Ross Burton <ross.burton@intel.com> wrote:

> +EXTRA_AUTORECONF = "--exclude=autoheader"
>

That should have been += for consistency, fixed in my local branch.

Ross

--001a113a4eb263e29f0508ed7e42
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 November 2014 at 15:36, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1pa" class=
=3D"a3s" style=3D"overflow:hidden">+EXTRA_AUTORECONF =3D &quot;--exclude=3D=
autoheader&quot;<br></div></blockquote></div><br>That should have been +=3D=
 for consistency, fixed in my local branch.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113a4eb263e29f0508ed7e42--
