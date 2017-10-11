Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4849E6079F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 10:35:40 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id 72so2370718itl.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 03:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5hBvS5xxxShAJtYuBLoMjDwbylUk4WqutN572DcM+hA=;
	b=jA1OWR+h8xFNOGv+TvGOikWOdPuT9RR8pEN7cErfiGtVRrfCVgGdcTnR/n77NFeHPp
	IZlnmksa9RFCljSfK+O+CIynGNW3YDyjU2t3Y+zIrI29RcsBTENB8fxMje00MbKH7c57
	wnpNboZQakFUo3nfmKEHE8kXF1LtlbDVQle/mGPtIkqgDHyn09wKyDWXulk6DUFeSWmf
	TETp/SZldmx9FLPzUlAvq7E1lNj+Qge65XclWdJevy/GHX0+66o15W3KJCldfxCsLJj1
	tIntPnQbJ1TwhPdO54ZxjnXHngQZSWfkL5zSSbwMLjK8MMpmXll5L0a8a+x0Lhllmcnb
	5bMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5hBvS5xxxShAJtYuBLoMjDwbylUk4WqutN572DcM+hA=;
	b=DK1G7W8YvnpRB2lKrpkJcT2NdnFHkP85ZD2STE1dng7hjtSObp0L5tclVHmVprOlI2
	UZcTuQVWm9wVwNU7Ep53WjcOfyw1mhsQJ91HWtm8yaskmw8Xs+CBL/TIGKVLfoFB4VeN
	oEJF+aaGEKUJhR5yTpRJXeQe0lSnd1nHxGUsXQWo3oDCtfpdDm6BJ/60C0oL85NAhrui
	wDqSsyPgC957FgNT62Lmka2opppI/Ud8ic/M7XD72i89b8PQ+4hDJOpzYLS1IBBSOdkE
	ALvQCIQs0kWpf63m27GjnXjyVgs+nafQnFlUBZZ6qrBySk2Ng8MziCXJSl8N0oJtx+wQ
	4kaw==
X-Gm-Message-State: AMCzsaVs6V9WXKO0j37R4HD+Ninr5tceLmbQu/iIXG7d54bVoXmGp8uk
	QStUbX1gMl4IhJg1aPVnjnRFJ4inycwF92OE1g5Y8g==
X-Google-Smtp-Source: AOwi7QAdaxnzECujeBXaLxUWGgGZiSl1QivODB9JJoH/RkkyHdK2LvOS7SzM3VHnjKFqYlvbtwllxlArJl+fVFtLNio=
X-Received: by 10.36.197.129 with SMTP id f123mr24782620itg.27.1507718142261; 
	Wed, 11 Oct 2017 03:35:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.205 with HTTP; Wed, 11 Oct 2017 03:35:21 -0700 (PDT)
In-Reply-To: <4077545.9283kxmC9p@peggleto-mobl.ger.corp.intel.com>
References: <1493825320-356-1-git-send-email-pascal.bach@siemens.com>
	<4077545.9283kxmC9p@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Oct 2017 11:35:21 +0100
Message-ID: <CAJTo0LY1Cm_RA16+jZS=sZq5jLNobABCGyh4vc-5exUy+PzQJA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image.bbclass: allow override of image LICENSE
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
X-List-Received-Date: Wed, 11 Oct 2017 10:35:41 -0000
Content-Type: multipart/alternative; boundary="94eb2c07aab04a9119055b42fcaf"

--94eb2c07aab04a9119055b42fcaf
Content-Type: text/plain; charset="UTF-8"

On 10 October 2017 at 21:56, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> Sorry to dredge this up, but when do you see the need to specify a
> different
> image LICENSE?
>
> Logically, an image recipe's LICENSE can only refer to the recipe itself
> and
> whatever files might be pulled in by it directly (usually none, but some
> people re-enable do_fetch and do_unpack to allow this), since otherwise the
> contents of the image are covered by the licenses of all of the recipes
> that
> build the packages that go into it, and we already assemble a license
> manifest
> for the image to cover those. Does that match your interpretation?
>

In the general case this is true but I guess rootfs postinstall hooks can
create file which are not covered by the package licenses.

Ross

--94eb2c07aab04a9119055b42fcaf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 10 October 2017 at 21:56, Paul Eggleton <span dir=3D"lt=
r">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">p=
aul.eggleton@linux.intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_e=
xtra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Sorry to dr=
edge this up, but when do you see the need to specify a different<br>
image LICENSE?<br>
<br>
Logically, an image recipe&#39;s LICENSE can only refer to the recipe itsel=
f and<br>
whatever files might be pulled in by it directly (usually none, but some<br=
>
people re-enable do_fetch and do_unpack to allow this), since otherwise the=
<br>
contents of the image are covered by the licenses of all of the recipes tha=
t<br>
build the packages that go into it, and we already assemble a license manif=
est<br>
for the image to cover those. Does that match your interpretation?<br></blo=
ckquote><div><br></div><div>In the general case this is true but I guess ro=
otfs postinstall hooks can create file which are not covered by the package=
 licenses.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--94eb2c07aab04a9119055b42fcaf--
