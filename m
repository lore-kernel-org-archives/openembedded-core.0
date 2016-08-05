Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id F105A770D0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 09:40:50 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id b62so295012796iod.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 02:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KaSsXJ18th+s2W6mNYKN2PllNq/eWTkgpCqBqn9c1oQ=;
	b=MMkvF01SH3YlNoQzzbwOra5AJH3aOUTPhJYLe6S0ftu8GfFaupwMDg+Nfyet1uULxF
	rC4sEZVlqk5f/gChWvdy5DvhJsgNwSTvTfB5zy+lD1rZtj0j7M/X+9fJ6L7XM13oIB0Z
	IGtb4d2il3tsTI/owowG5Y6Kcf0d0BTqbHsvcXuVkFBQpFEMQxokyYduIWt8wTpJiQjZ
	OENytPFe7pwiE4O6XlmG03PjEyKbKMI7Bq84+eaZyqjKX1hQqlhkQkrIPgygqHitclsg
	qyRcGFKEqRk9p/prTTr6t1efD35s5QxGGK+sGsH2f3DTXwv2QfyuWfcvS3g/r9DnTNc2
	vUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KaSsXJ18th+s2W6mNYKN2PllNq/eWTkgpCqBqn9c1oQ=;
	b=lw/VH9lMPE0o7tARiQ24iK+tIm4yfPt2y5jPEe49ccxR21VLzs4MKUM5bdfMZqV4UP
	w7A0kR/UobSqmjO1vgDazgcPmjqA6hkJqyfro6n3RFbMoAzSiIy93cnDLDx87h2nkIFG
	h1lWcXxVZltZo4umP2owDvycgXZbiog5vmHQ6qAXVWxoJN4iYWZAK43hi/P7Nue+L1MO
	rK96wfydhLNBZOlfeup2bE3/yV3E8ImHrHpEhbhyaIKu39k0QgzUbkppv09pDa+s6zo7
	pSDAVwQB3feOV8MF1ODyHUjBLXUjy5tIze/3XXsefmWAZuTIOQUFov/Ot3Ztgqk65DkX
	b4QQ==
X-Gm-Message-State: AEkoouvR4BuGdBnko8houkNVrqG2z2mV7o+isVr+AUm7YLgcSAl1QypqRxuLRZoGqybXhkpkdUbc1/ysqErolIcz
X-Received: by 10.107.154.196 with SMTP id c187mr75652067ioe.99.1470390050890; 
	Fri, 05 Aug 2016 02:40:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 5 Aug 2016 02:40:30 -0700 (PDT)
In-Reply-To: <1470389692-9787-1-git-send-email-git@andred.net>
References: <1470389692-9787-1-git-send-email-git@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Aug 2016 10:40:30 +0100
Message-ID: <CAJTo0LZFq2W5oisKKenYMSQkEzE0hY7qz0wBuO94vz_V81ZMMw@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cml1.bbclass: explicitly set workdir
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
X-List-Received-Date: Fri, 05 Aug 2016 09:40:51 -0000
Content-Type: multipart/alternative; boundary=001a1140e81eaa46b205394fdc4e

--001a1140e81eaa46b205394fdc4e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5 August 2016 at 10:34, Andr=C3=A9 Draszik <git@andred.net> wrote:

> bitbake rev 67a7b8b02 "build: don't use $B as the default cwd for
> functions" (included in current bitbake master) breaks the assumption
> that do_menuconfig / do_diffconfig run inside the build directory.
>

Already merged into master with 614d976ee97d6386c37afb54add5b83741ca401e.

Ross

--001a1140e81eaa46b205394fdc4e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 August 2016 at 10:34, Andr=C3=A9 Draszik <span dir=3D"ltr">&lt;<a href=
=3D"mailto:git@andred.net" target=3D"_blank">git@andred.net</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex"><div id=3D":v0" class=3D"">bitbake rev 67a7b8b02=
 &quot;build: don&#39;t use $B as the default cwd for<br>
functions&quot; (included in current bitbake master) breaks the assumption<=
br>
that do_menuconfig / do_diffconfig run inside the build directory.</div></b=
lockquote></div><br>Already merged into master with=C2=A0614d976ee97d6386c3=
7afb54add5b83741ca401e.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a1140e81eaa46b205394fdc4e--
