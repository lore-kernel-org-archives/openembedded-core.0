Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1FDC86FF23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 14:48:42 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id g185so211754374ioa.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 07:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fj4jyzEHbBml+25MGQn67WrV0m8whxfvSoQI1JtIgVo=;
	b=IH0d6FxvkxSNHv1RETP15x9yTIzsATT8zVDNa63Vty8yT7NxMxWsh9pUbmtvIEXHfP
	cPEuQMVL+5BoH1UsK9cROIeq63SzFVJx9EN+xWTish5kFBicuQYr6caaM+w+UgpK5m3o
	CHm49Q89YcrN1qUq5VfAcM758g0O8i+8KH8xYzEQ2H2dqKgP6ped5l4nf6GJNfrkxTwk
	RhBmHdOmiYJb6hXJyLvdCHl3Hx/8mwHMBl26nPLYNZvUmwalReSjVqqK1XxbqtSJnwv9
	xymEZMIiPKtipb7/FaujnMwXI9mdu2AouUhRIuSZ0hSIsYC7cpmePsJSKhhf+491kawF
	qc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fj4jyzEHbBml+25MGQn67WrV0m8whxfvSoQI1JtIgVo=;
	b=gKH6BT/l3wJQ6YM5CV4sSuxMALZsiRkfilC7r4ZICkXaFxR5vXBnb1DJGPHou134t6
	OYqFtt2VoOGJqdrx46hHhk96fTKm+CgifpTjzSxRni+xyROl4SjBJmx00iZFoTkFrC8T
	Y8Cl/KAgJpNPZ9n2dn3lFbrAigYCwDWMOJ6lhrSluP6Fbc6GT2E2fALutEWYdTl7+k6s
	ujnW+CLIsfb5mY4jc4mXVAlXAZ+w6U3cJ2B7oF4+vJ9VUCPhrTueYxYnv94W7CWwQxwU
	G5GQDacBS0jerl7PafPmRFg5/wwC9TI52A+sePS/MqhOBiTOlAp/7n1qcjGk5nABKfDl
	pQ3g==
X-Gm-Message-State: AD7BkJLzJlkX0TIFyaf6M2TGNCsSfJtAfxswu/lvDuc3tTxoNYY4R9daVCeEybr78rneR6dxY2N+a/wR5EP7S3oy
X-Received: by 10.107.135.74 with SMTP id j71mr26076275iod.133.1460386123499; 
	Mon, 11 Apr 2016 07:48:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Mon, 11 Apr 2016 07:48:24 -0700 (PDT)
In-Reply-To: <CAJTo0LY9PMgCJXqAL8qw=u37UyTo+o=ykzGdb8Vv_4w+5O58ag@mail.gmail.com>
References: <cover.1460085139.git.liezhi.yang@windriver.com>
	<a9ea8a660f37bbcf917c71360512ab155241114e.1460085139.git.liezhi.yang@windriver.com>
	<CAJTo0LY9PMgCJXqAL8qw=u37UyTo+o=ykzGdb8Vv_4w+5O58ag@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Apr 2016 15:48:24 +0100
Message-ID: <CAJTo0LZkC4Q22PNMKnjSA97v-7T1yxvne6kraBydNS9-PVOqjQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pbzip2: fix for rebuild
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
X-List-Received-Date: Mon, 11 Apr 2016 14:48:43 -0000
Content-Type: multipart/alternative; boundary=001a113f9218205fe6053036a4d0

--001a113f9218205fe6053036a4d0
Content-Type: text/plain; charset=UTF-8

On 11 April 2016 at 15:46, Burton, Ross <ross.burton@intel.com> wrote:

> Wouldn't "oe_runmake clean" be simpler?
>

Or not disabling do_configure in the recipe, as base.bbclass's do_configure
includes an invocation to make clean.

Ross

--001a113f9218205fe6053036a4d0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 April 2016 at 15:46, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra"=
>Wouldn&#39;t &quot;oe_runmake clean&quot; be simpler?</div></blockquote><d=
iv><br></div><div>Or not disabling do_configure in the recipe, as base.bbcl=
ass&#39;s do_configure includes an invocation to make clean.</div><div><br>=
</div><div>Ross</div></div></div></div>

--001a113f9218205fe6053036a4d0--
