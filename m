Return-Path: <twoerner@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 64D1F782DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 22:56:16 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id v137so4739150ywg.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 15:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ttM9TTPYUxgG4xGRUIQDZW+dxGknyY1CKtDA6ICb1e8=;
	b=sSyvoBTakgZ5+wTjo0Mw4a+ZvgkQ0N6EU9qnapYLsx1i0xItxzplDgV7tjS0jRCU3e
	3dmqdmEG4v3tHeF6hXfphZVb72chGEq9vfzcw4jk8LaK50Uxeisr7V8W//ZWBpnrppX4
	0jLFz4djEm3FJd+Q6Ze/wuffCc4zllVE8i2HVQHZUG3j9mtLd9SwhwxMcPw8nYUU/XKf
	D3XeHG4I3gTjM37v/oysFpOfa4/gy1tTKWTdTiaFshvzhYKKeDxOqjjbrQt28Ei830xe
	uHVLM9qn4rLoPNjBck4QTgkOGO7gQDeCxToi25y+XfVZah6J3uPha2ZllJMngia0g1nJ
	Jkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ttM9TTPYUxgG4xGRUIQDZW+dxGknyY1CKtDA6ICb1e8=;
	b=dlCG2dZ+nYbyGHRAraMqnWMm4taXjPAFSs3ApLwOZ3MBcSlYjR3AtXCWJmnIquFFf8
	CREqFw0KXvlDuyN6NA5f1wP2UiEhpmue4khKWhCZCMj+aKkOQ/uzDjlfDXBXYagqdjbd
	asf0tGWFS8sb/gCJfZ8fz/MFJNeCFJvGDh8PGZf0mzEEsyr3y39DgVK7HlArGEPX70NE
	rttqh6aGftLQLd5Ua6knEr+RE4qA4/stcrQZS2DBBSpDQ3gtiHTW18tgpIUjE2bpQpLQ
	HN7hKNGx4EPLVFtgVHiwx/aA04oNV4l5qVPeV73WsApQoZSMT3vekhIPMlk+yZNqrC6l
	rJgw==
X-Gm-Message-State: AHPjjUh7ECqVZaREZ3nVuG81HZJh/zdw5bFXde9qPnimiVPSbLYTLsDc
	KCrPdUJCzgvnbYVc9YqOmw6i7QxVIEMtcCeAFHDTUw==
X-Google-Smtp-Source: ADKCNb6XZIVz+GUXVRoy/ATgYzChNxiPl59HAGz4SuWxgwYBqiZkGz3YCN0T/5/TBTkXUVN2whXj80QkQHvUjGPahiY=
X-Received: by 10.37.57.193 with SMTP id g184mr13471113yba.65.1505256977478;
	Tue, 12 Sep 2017 15:56:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.4.205 with HTTP; Tue, 12 Sep 2017 15:56:16 -0700 (PDT)
In-Reply-To: <CAJTo0LaqHGMPDF=JHGw5NcBzvTkFbP2bQfmgcG8o-Zx0hTeD3g@mail.gmail.com>
References: <20170910131446.4555-0-nathan@nathanrossi.com>
	<CAJTo0LaqHGMPDF=JHGw5NcBzvTkFbP2bQfmgcG8o-Zx0hTeD3g@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 12 Sep 2017 15:56:16 -0700
Message-ID: <CAHUNapR12cWeetX_ZgCrN0-G_AQcPi6asDuCaXp==Mocdwn57g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Recipes for Open Source Verilog and Lattice iCE40 FPGAs tools
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
X-List-Received-Date: Tue, 12 Sep 2017 22:56:16 -0000
Content-Type: text/plain; charset="UTF-8"

Nathan, this is awesome!

(haven't tested it yet, but it's great to see this effort!!)

On Mon, Sep 11, 2017 at 1:58 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 10 September 2017 at 14:14, Nathan Rossi <nathan@nathanrossi.com> wrote:
>>
>> Please note whilst this series is sent for oe-core it may be better
>> located in another layer? (e.g. meta-oe). However since the recipes and
>> the tools they build are not specific to a single BSP it did not make
>> sense to keep in a BSP specific layer.
>
>
> Sounds like a dedicated FPGA layer would be ideal.

We already have meta-xilinx (and friends) and meta-altera, looks like
a meta-lattice is in order?

