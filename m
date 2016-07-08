Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 56E8D60119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 16:05:04 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id i186so45687581iof.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2016 09:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jcEN9WP9Jecfp6p56HsSfRwh/o6s5IsZhy8P1JsDbZ8=;
	b=mMjE/gcc8uy6iPjeXCLskLQjoL/r1qMm1TxdnKrGzc4VmIYizOsQoUEBnG5HnH7poJ
	KKSRId9D2eATLkv9LUDvzTXfi8UGbHeEic4akaudBpLVSCtZ/KdGlJEO6QkcUB7f7IUm
	SCUBN7s8cFSmEWFHza3w2Uo5I4RW7qo9hg+fsF2EWDtQvVyTRKW0ELFOGTg9GlItgO1r
	Yvq5/sozqCVCWfpZ6s82iRcuyvJ3xtm4A7o9qVfuAH37u71N6itT0NV4LhidqD7KoNnx
	lMkafHG6K1Nr7gsP2dr3SID6lakXb5WHuhJgMBAgJezDLB17AZjvMiVHH0LmLpOh9ZHK
	Hn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jcEN9WP9Jecfp6p56HsSfRwh/o6s5IsZhy8P1JsDbZ8=;
	b=MKy/xwmF9VJonWOYBpBCP7NYw/2yKuinVV09IVpQ0g4zkjjHFfV08AAOLUJ0bYS7mo
	itUunM4D3VwzkuxU8AwuY9EgyBaO3C5qt7r/D4YYcRx4jNIVrf3Ui58zKFyhsc89POx/
	ogV1zp6TyR81Ewuh5MDAkMW//6UtuitLXwIhslj0nTLXRMEKXhgxVoX07q+zYmjD1ECN
	L4DeMPykPmWCoStLLefmi81uVAtIpPb2kOu75gZa6dD82vZ87Qpc4uhi7u0s0xPdXXTl
	PuOel32YjB/lHarRo5TfxqOe7GTmSIjJ5w+lowfJn/NP+Izu7BmH1Sg5ivWOW/qATAoR
	Ulgw==
X-Gm-Message-State: ALyK8tK40qWl/arZrtZFa72MZmbjFZQPyocFzVnBLEagUMZ6Hd8gufNS7XQ8UREbo/ENJf9A2fw9WgRX401dfcl+
X-Received: by 10.107.135.161 with SMTP id r33mr8396370ioi.133.1467993905647; 
	Fri, 08 Jul 2016 09:05:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.151 with HTTP; Fri, 8 Jul 2016 09:04:46 -0700 (PDT)
In-Reply-To: <cover.1467905611.git.jussi.kukkonen@intel.com>
References: <cover.1467905611.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Jul 2016 17:04:46 +0100
Message-ID: <CAJTo0LYLC=+PEX=-XxkuQEV+yzHKz2tTxMqUON4BAwRd0VdHyA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Upgrade piglit
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
X-List-Received-Date: Fri, 08 Jul 2016 16:05:07 -0000
Content-Type: multipart/alternative; boundary=001a113ecf5c476134053721f730

--001a113ecf5c476134053721f730
Content-Type: text/plain; charset=UTF-8

On 7 July 2016 at 16:39, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> A word of warning to anyone else using piglit: it was big before and
> has now tripled in size (30000 new tests!). The installed size is over
> 1.5GB and packaging takes a very long time.
>

I did a quick hack to the current piglit in master
(poky-contrib:ross/piglit) to strip the binaries.  We don't get debug
symbols (which are 4gb before the upgrade) and build time on my Xeon drops
from 10 minutes to 5 minutes.

I think this is an acceptable compromise!

Ross

--001a113ecf5c476134053721f730
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 July 2016 at 16:39, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6kt" cla=
ss=3D"a3s aXjCH m155c604d495ea714">A word of warning to anyone else using <=
span class=3D"il">piglit</span>: it was big before and<br>
has now tripled in size (30000 new tests!). The installed size is over<br>
1.5GB and packaging takes a very long time.<br></div></blockquote></div><br=
>I did a quick hack to the current piglit in master (poky-contrib:ross/pigl=
it) to strip the binaries.=C2=A0 We don&#39;t get debug symbols (which are =
4gb before the upgrade) and build time on my Xeon drops from 10 minutes to =
5 minutes.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">I think this is an acceptable compromise!</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ecf5c476134053721f730--
