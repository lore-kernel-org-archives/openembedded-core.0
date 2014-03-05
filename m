Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 252B860E07
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 09:43:43 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id i50so2271893qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Mar 2014 01:43:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xiq4UR1tbNFNuYgv87q/J5Jugt0zb7w6NZSpQdl2Sqg=;
	b=jVvaBfKlO8gOZNbN+8rpzDIN/Tft9nZzzGkX969u2PkQ13fi2h/zuZSLhsUNWO6mDQ
	DXcdH2j3SFZCJ94oVZhYfWxQhXj3V+L+kOZGtGuMsVSY5JjOrgWvVeQ3AECeBiMGLqnc
	a8Ob5w7PxHCHJRNs6f9mnIzU3AJW7OwV0vR0q+OvL/zFzhLBJxcI9fPFa8TZTdiMMyAR
	fC0Q1oSe/IvA8O3iQlPr5PeDrRWHuNrlwgLR/VwhMy2qQGpVk3DYV6Xg9PraDrXAkPdk
	NH+LxPljJiczRVG7YtVezEOd0ILei39GhqQ+Xh6C/S0ckPtIX5mJ0rBPh0TIXF2pWoPe
	Ed3g==
X-Gm-Message-State: ALoCoQmeaRTwbkQyhWQCKZoJXOgLC3F3QXanfZUTdhWH3sxILKIgENBfIGLFQygD9F24NIBQD6xr
X-Received: by 10.140.98.203 with SMTP id o69mr1083560qge.102.1394012623988;
	Wed, 05 Mar 2014 01:43:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Wed, 5 Mar 2014 01:43:23 -0800 (PST)
In-Reply-To: <c00e7a2047ec6a4b4f46722f49176b08ded90509.1394010463.git.Chong.Lu@windriver.com>
References: <cover.1394010463.git.Chong.Lu@windriver.com>
	<c00e7a2047ec6a4b4f46722f49176b08ded90509.1394010463.git.Chong.Lu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 5 Mar 2014 09:43:23 +0000
Message-ID: <CAJTo0LYyVf5PeZBW98Ee9seX5t7ONdj1ZZMv29=TYLJTT8mTVQ@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] flex: not to build shared libraries
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
X-List-Received-Date: Wed, 05 Mar 2014 09:43:44 -0000
Content-Type: text/plain; charset=UTF-8

On 5 March 2014 09:18, Chong Lu <Chong.Lu@windriver.com> wrote:
> Some packages do not link successfully using shared libraries.
> When link something to libfl.so, we will get this:
>
>         libfl.so: undefined reference to `yylex'

Isn't that generally because the makefile is doing it wrong, for
example linking the lexer in C++ mode instead of C?

Remove a shared library and forcing everyone to static link doesn't
seem like a long-term solution to me.

Ross

