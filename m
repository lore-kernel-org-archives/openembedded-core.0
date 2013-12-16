Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3A2666E488
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 13:53:12 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id ld13so3117281vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 05:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YFPx6XK4lSIC/k4CPFzhZ2Ut3THlcmFUhsmMajJVCBw=;
	b=N0blrO6MmuMGgK+rFDMD+vY2e+5F/6QYOZfpy+OwbeOjQHFyjR6kdlYyIZ4CxkfkY+
	9ZzrNJc1RBblfP6rqFDyn51g7WAS5nrEN18ntyJ1N6bRcdMy66pRdHfeWG1nv85THLAT
	T2xIflMBz2PLU5jGxdOcyAPGDo9bmFX4yd5uXiJQC3dPJNhjV6Yw/gXeKJA35YiT0db4
	nYP/Wt4WxjTS9eKo3Ir2wNBD4XdfOJoUmfGXseUHvpjQuTBwWhHjbZPLwqnRWeEEc1I5
	miwHBpDTPk8RR3cej4mfbisVFiWO5lc2Y9vwAtfgESBgZ8FKlUumx3l1o1PVeTRFmN2e
	v0dA==
X-Gm-Message-State: ALoCoQkxTo2hRhTbMVJRlRiCaXE7QTeeBW8uYmNVTqBJaBBRbNSQYqNKALGp214PztjpNoJ0IX+E
X-Received: by 10.52.0.142 with SMTP id 14mr226595vde.94.1387201991680; Mon,
	16 Dec 2013 05:53:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 16 Dec 2013 05:52:51 -0800 (PST)
In-Reply-To: <20131216135209.GD3706@jama>
References: <1387199725-19052-1-git-send-email-Martin.Jansa@gmail.com>
	<3470792.PBUdbl2oFv@helios> <20131216135209.GD3706@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Dec 2013 13:52:51 +0000
Message-ID: <CAJTo0La_Y7gz=wg7wDYWky4+i-FBkHaCX3xaJpfzTLG95+treA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk+: Add PACKAGECONFIG for directfb
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
X-List-Received-Date: Mon, 16 Dec 2013 13:53:12 -0000
Content-Type: text/plain; charset=UTF-8

On 16 December 2013 13:52, Martin Jansa <martin.jansa@gmail.com> wrote:
> I must admit that my real motivation is to really disable x11/xlib in
> gtk+, not to use it with directfb backend (In order to resolve
> unsatisfied dependency mdbus2 -> vala -> gtk+ in distro without x11
> DISTRO_FEATURE). After enabling directfb PACKAGECONFIG in gtk+ _AND_
> cairo it builds fine.

Why not make vala's GTK+ dependency configurable in some way?

Ross

