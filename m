Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 922606011F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 11:49:34 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id 5so56043272igt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 03:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=poqHDgYeb51cUcSCJKNz7Ot8A0ozNMFqIT5n0UEsPXU=;
	b=RBDk3l9LLTvDblvT+CBJa0JL0bRSw/IImzpoUzFcBRJfqm7SZTGg9G2wmGURchHVPM
	SomRfa43Mhv8Zo8ebiZ5vsbGNmv4+uBeArMdPjf1x1ik3i6RsUu4rpb4yv2m/DaXr1KR
	m1GyuIGMOIXHcQCoSQE4jmKeG+6wpKYbjTSjF1HztLGKRGvR5ln9SROQ8Yof8qkh/Nyr
	OBfc0Fc5qRR5UB50Dz5E/zypka0B3t9WF/o5CRGOp7v4tCbU60Z0nngaY0/pwe2QZ9kf
	qhh7RHudLmTNq55cAhLmyvxRjX7FdiKJktmCDDe4H6IjFiW8RJoHpikdf431EgNZjjIW
	XKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=poqHDgYeb51cUcSCJKNz7Ot8A0ozNMFqIT5n0UEsPXU=;
	b=RmUYkq9I8yymVCxcG2/quzAwJ5NcGmZOfbDg7U3HQeh4qCtnFVmoxOAxfTYvqlCoA8
	xrQaxptU+4puygQy9PddQ0DcopzSj9DUfLNYRgKGo7SiBEo8P0ycVWXXIeHEFbgHxbEP
	YpEM5K7J0I5XMYWXO+P2pZ7D2cyctJxWcyIjOPU11Da9WYdUJ9atkzMe9oT/2WLVFdxb
	9cxz/qrp0OK/kCPCJq9l8c2C7zHF2Gr5Q9bRkZEQXpiMCz1Mee8nH+89b1cuebczmvK9
	HpbK/2I5gThatSrRFSgh9ztfGaGZUd2FuxXQQuTY0M5Bgyb4+bHVM7JolyU/STA5YYQQ
	SiEQ==
X-Gm-Message-State: AG10YOQf89FttAbA3RfLuJQuH13xAIFw2KznoIsigk994JbSEvSx2j0Rjx98Dl6XJ3QIS5IcF0UJ5ybxniEAsBoC
X-Received: by 10.50.111.111 with SMTP id ih15mr23835775igb.78.1454932174568; 
	Mon, 08 Feb 2016 03:49:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 8 Feb 2016 03:49:15 -0800 (PST)
In-Reply-To: <1454695470-8205-1-git-send-email-mac@mcrowe.com>
References: <1454695470-8205-1-git-send-email-mac@mcrowe.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Feb 2016 11:49:15 +0000
Message-ID: <CAJTo0LbrD3JrzKM--emSMxDyERK4qstMVsMQ4VXisMpc6AvqqA@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/15] Prepare for EXTRA_OEMAKE = "" in bitbake.conf
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
X-List-Received-Date: Mon, 08 Feb 2016 11:49:35 -0000
Content-Type: multipart/alternative; boundary=089e0149be34701921052b40cb42

--089e0149be34701921052b40cb42
Content-Type: text/plain; charset=UTF-8

On 5 February 2016 at 18:04, Mike Crowe <mac@mcrowe.com> wrote:

> This series (sent only to openembedded-core) fixes various recipes
> that rely on the current default value of
> EXTRA_OEMAKE = "-e MAKEFLAGS=" to explicitly set that value in the
> hope that bitbake.conf can set EXTRA_OEMAKE = "" in the future.
>

We need to also vet all instances of EXTRA_OEMAKE in recipes.  I did a
build with the EXTRA_OEMAKE change in bitbake.conf and hdparm failed to
pass QA because the binary was already stripped, as the recipe does
EXTRA_OEMAKE += "STRIP=echo".  That assignment isn't getting through to the
makefiles without -e.

Ross

--089e0149be34701921052b40cb42
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 February 2016 at 18:04, Mike Crowe <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:mac@mcrowe.com" target=3D"_blank">mac@mcrowe.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div id=3D":x9" class=3D"a3s" style=3D"o=
verflow:hidden">This series (sent only to openembedded-core) fixes various =
recipes<br>
that rely on the current default value of<br>
<span class=3D"il">EXTRA_OEMAKE</span> =3D &quot;-e MAKEFLAGS=3D&quot; to e=
xplicitly set that value in the<br>
hope that bitbake.conf can set <span class=3D"il">EXTRA_OEMAKE</span> =3D &=
quot;&quot; in the future.</div></blockquote></div><br>We need to also vet =
all instances of EXTRA_OEMAKE in recipes.=C2=A0 I did a build with the EXTR=
A_OEMAKE change in bitbake.conf and hdparm failed to pass QA because the bi=
nary was already stripped, as the recipe does EXTRA_OEMAKE +=3D &quot;STRIP=
=3Decho&quot;.=C2=A0 That assignment isn&#39;t getting through to the makef=
iles without -e.</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--089e0149be34701921052b40cb42--
