Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id E3C0F7302E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 13:33:46 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id y76so222269406qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 06:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rlWH/LigMbDchOZjmGi9OxnlzQL4tcFJyAlaFSeiSPk=;
	b=ui5WlucnGbPruB2p6639A79fq//tKyxjcCwIFv26n+fHYLgMe6wmWapVT6Jp+6ip+y
	zm1RPUXwBEwThJvm6yu9BwPy/XRxw84kD4fTjETpXTV6zahpiOkXVg7+axKXIZSuH9TI
	M9XO3a/WhB2UxwjGcrmgWyDNJrJoRNUhVjBWzrZAiGPXbJ3slAtfm3Fky0xoOZZSi0xl
	P5cU8AGbARYdmu2McnrmX/DioX/1hqdFZuW6Z/DmFvJI+U/Ue8c1y4ktLglTvXmSNWdV
	5DOYSI21AEvDuCP3Ve9/PjyRyDbfFMInlSJuKu5tfSAyTlcZIfRLKf14+Hj8yc7qMsKS
	fYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rlWH/LigMbDchOZjmGi9OxnlzQL4tcFJyAlaFSeiSPk=;
	b=kTc7mfS684Hoz+unUo7ec/WHd5fJwJoobU4Hwmj/sBnk4IwM5X6VZVctxG5ZJXes73
	M5BvZQniB/JUbBSJRzCPF+iOZsdjEsNBA9F5y9V/yPAPgnfbFlU4KJq3sXyGGMSWlvD8
	qLDssGNftxjBgbxqf8F0RZfGU6G4epafpUSKbLkWuzYFvPfcWbxV781BDYO2KWoTEKct
	xbRnJi1t6RwVzPANr08jsx4vjnZr3G2BQirDzY+F0wAOSt8I9T6Zf8YVtkESpCzF+1+4
	3IFE6AF6D+lvyi9XKykwFxBKRlnm/bsT1tm7cdm+GEDwS4eE7q5qkzh7dKcvLijxdRcn
	xDQQ==
X-Gm-Message-State: AMke39mRP4KHv9HPnojfQX3NyIbivcfWteuKSUIHkN1Kdd0jPweLx0X9kNGpBtiBK3THE0fsBmFevo4kzkYO9q42
X-Received: by 10.55.47.4 with SMTP id v4mr31259133qkh.77.1489412027767; Mon,
	13 Mar 2017 06:33:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 13 Mar 2017 06:33:27 -0700 (PDT)
In-Reply-To: <1489251265-31851-1-git-send-email-mac@mcrowe.com>
References: <1489251265-31851-1-git-send-email-mac@mcrowe.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Mar 2017 13:33:27 +0000
Message-ID: <CAJTo0LbcgpA5FOKPiLQq_92cFsfJSjH09XkVfasvhdKjJ8ofUA@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ccache: Disable CCACHE_HASHDIR by default
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
X-List-Received-Date: Mon, 13 Mar 2017 13:33:47 -0000
Content-Type: multipart/alternative; boundary=001a114f4108d78660054a9cc2fc

--001a114f4108d78660054a9cc2fc
Content-Type: text/plain; charset=UTF-8

On 11 March 2017 at 16:54, Mike Crowe <mac@mcrowe.com> wrote:

> ccache apparently does this so that paths in the debug information will
> always be correct. In an OE world these paths may already be missing or
> incorrect due to rm_work or the use of a shared sstate cache, so it doesn't
> seem as if we're losing much by disabling this feature.
>

In an OE world we tell GCC to rewrite them to be target paths anyway, so
this isn't a problem.  Maybe worth rewriting the commit message?

(see bitbake.conf, -fdebug-prefix-map)

Ross

--001a114f4108d78660054a9cc2fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 March 2017 at 16:54, Mike Crowe <span dir=3D"ltr">&lt;<a href=3D"mail=
to:mac@mcrowe.com" target=3D"_blank">mac@mcrowe.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div id=3D":4a5" class=3D"a3s aXjCH m15abe=
4b7d0cd5d2e">ccache apparently does this so that paths in the debug informa=
tion will<br>
always be correct. In an OE world these paths may already be missing or<br>
incorrect due to rm_work or the use of a shared sstate cache, so it doesn&#=
39;t<br>
seem as if we&#39;re losing much by disabling this feature.<br></div></bloc=
kquote></div><br>In an OE world we tell GCC to rewrite them to be target pa=
ths anyway, so this isn&#39;t a problem.=C2=A0 Maybe worth rewriting the co=
mmit message?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">(see bitbake.conf, -fdebug-prefix-map)</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114f4108d78660054a9cc2fc--
