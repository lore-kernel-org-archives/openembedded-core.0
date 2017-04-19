Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 16B3571A19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 08:53:14 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id g60so13671572qtd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 01:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y/70tKtWwIuYOlViTj8ZFm8eJEfCh8SVUcYxofXWrR0=;
	b=FIb7pk25hXe9fkGNl2mR+a5frjBN7rK2AQJ2W1xBOFR4QpWP4JfeQPdi/26bTphhmC
	VDiqDzXcPgttzimPzTiXRuj2L5xSXCVb0jMvUsVKhGUCPiIJ+pvCihBxX3ArBk6RA3No
	nclB70MIl8d23PMGuRrXW9vr3HZbc2aRHxJoD7vWlXy560sREvuwRhr8OiRIeP13sewS
	CxysJ3g0DmSwoKY2M2OzgU5FWsCSJsy8OxsgTZX0eY2Psi/D8+D7QcuE17KYCQskC/vB
	by0yetOiNTArhI7eQHOMIe2D1WFhab744pvAmC3zjcBt0RR243t4UuQNosldWRxn5deg
	xnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y/70tKtWwIuYOlViTj8ZFm8eJEfCh8SVUcYxofXWrR0=;
	b=nDF7NpivJDv2pnd9nJClkFKQ2KkNzt7/e5wUndIl9LSAdBCvKpcDohhSCE7l9n46wX
	l/Id9O5yCVRRNi4Z36dz2j81UPpqIBJm7l6A5+eXd5ok580LrLz7FBdP0uqPKyWD2PpM
	BFT0xR/sIe+vajXwswsL4seXIPxuJ87jUkMa7/RS7nQ9wSHd5rnHGhUw578mGBDyUKab
	0wG5aS+uBK3qv4w61snYdS8NhOfoNNILZhQ+rU1uleScQLQH9CyTloI6qCwUTvrEaoAS
	HCIe6F5ce2Z09/gsXCDQo2st4uHfsCjwqvpJAAe13KqdITgru1eCoUDCuxQ4Nxh39FSv
	7ekQ==
X-Gm-Message-State: AN3rC/4X+r/GMh92Xo/FJP8zTURhVor/WiHomMXMggpONnwCyBJNLPzJ
	SkF6X0R1FNhd+XyTGiYkET7ShtPhz+Ix
X-Received: by 10.200.34.242 with SMTP id g47mr1373052qta.109.1492591995991;
	Wed, 19 Apr 2017 01:53:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 19 Apr 2017 01:52:55 -0700 (PDT)
In-Reply-To: <20170419015839.1294-2-raj.khem@gmail.com>
References: <20170419015839.1294-1-raj.khem@gmail.com>
	<20170419015839.1294-2-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Apr 2017 09:52:55 +0100
Message-ID: <CAJTo0LandPvX8nK+oPW0vj8DSC+jU7mBEZc+LEE4uq3TmkubHw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] libtirpc: Expose key_secretkey_is_set API
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
X-List-Received-Date: Wed, 19 Apr 2017 08:53:17 -0000
Content-Type: multipart/alternative; boundary=001a114037d4b74999054d812736

--001a114037d4b74999054d812736
Content-Type: text/plain; charset=UTF-8

On 19 April 2017 at 02:58, Khem Raj <raj.khem@gmail.com> wrote:

> +-    key_secret_is_set;
> ++    key_secretkey_is_set;
>

This removes key_secret_is_set, was this a typo upstream or a mistake in
the patch?

Ross

--001a114037d4b74999054d812736
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 April 2017 at 02:58, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":cg" class=3D"a3s aXjCH m=
15b83effa633d39b">+-=C2=A0 =C2=A0 key_secret_is_set;<br>
++=C2=A0 =C2=A0 key_secretkey_is_set;<br></div></blockquote></div><br>This =
removes key_secret_is_set, was this a typo upstream or a mistake in the pat=
ch?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--001a114037d4b74999054d812736--
