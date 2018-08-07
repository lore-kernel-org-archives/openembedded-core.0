Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id B6435754D0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 10:44:40 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id h10-v6so15288616wre.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2018 03:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kUQF3lnsK1e0+pD1hc4HELVDRmXZM4HX7bG/TAN//ME=;
	b=UcLhBUVdPdLnqFgY95IxEAgdJ81KUyVHkFG0COq5GAAxfvEbnHeZOwwjpBgoMUzRM3
	t4YyIdycBkc/QqMHdw6hv/OCKa20FxAW6Ib4dlQb5LRc4f8lMc+yn95cxspIwmeF7T8o
	rrCfXfvmfC1hiyjZAxEBM5q1TU3u/+e3ESCCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kUQF3lnsK1e0+pD1hc4HELVDRmXZM4HX7bG/TAN//ME=;
	b=PwGZ3vfewI4SlwnD+7z3qwsXDg3gWubwDkB5U7tDsfaIqEgIHOdDtS4lGOJZrbrRLV
	OQ7nNFc+sbMv1DbyRihiOhlcExjOf+mLYbTJX1rO82xrVH+Mmk3S9yN8QQfjcvITbzlL
	BtjnG4k6aTewsnPl4EOGW0DrGNnJBxbBW2/P38/eocbudOnNxqLXGyK7VYU3kKuKOM/s
	SizF1C6DYsaX9myPSw6Q15yP2/qbnAnEdhVzMEuWMiBClviP+1jgVb676DJMVMxujD2q
	+hn/QBT6jvVLunvwYgqbmbhS5s8Zi6BN2lovwO6YOn3yTiCPcbKSwUM/eTIuO7NDvzIL
	+JUQ==
X-Gm-Message-State: AOUpUlEcfaNOFTLvitpApSQ1nqr2IdbD0OTIyzTGt3qW27tOSqqbT0wZ
	AHeTue46zmr1DJIxlsBT/yMgdw==
X-Google-Smtp-Source: AAOMgpc2cHIBpIz7Uj1JfoJahU7vRhgJCkm0B76vxcK5IEIPJ3b2ufwUWgEzPKUdYWj9+EFHK1VQPA==
X-Received: by 2002:adf:e687:: with SMTP id
	r7-v6mr13149219wrm.35.1533638681431; 
	Tue, 07 Aug 2018 03:44:41 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l15-v6sm940304wrt.67.2018.08.07.03.44.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 Aug 2018 03:44:40 -0700 (PDT)
Message-ID: <0f9d0236ac43b464c8586d1b09505cddae0265b5.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Kang Kai <Kai.Kang@windriver.com>, Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 07 Aug 2018 11:44:38 +0100
In-Reply-To: <a8d925bb-8463-ddd2-ea9b-aa74a5ed9394@windriver.com>
References: <20180803014947.23598-1-kai.kang@windriver.com>
	<20180803014947.23598-2-kai.kang@windriver.com>
	<178d4c597dac03d0d39b55450f023c57bd6c7c3e.camel@linuxfoundation.org>
	<504e6f59-83c5-9019-f2df-a1ce88e9a9f4@windriver.com>
	<a8d925bb-8463-ddd2-ea9b-aa74a5ed9394@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] remove allarch from recipes which rdepends on TUNE_PKGARCH packages
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
X-List-Received-Date: Tue, 07 Aug 2018 10:44:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-08-07 at 17:37 +0800, Kang Kai wrote:
> On 2018年08月06日 22:51, Mark Hatle wrote:
> > On 8/3/18 4:28 PM, richard.purdie@linuxfoundation.org wrote:
> > > On Fri, 2018-08-03 at 09:49 +0800, kai.kang@windriver.com wrote:
> > > > From: Kai Kang <kai.kang@windriver.com>
> > > > 
> > > > The following allarch packages rdepends on TUNE_PKGARCH
> > > > packages. So
> > > > remove allarch from these recipes.
> > > > 
> > > > ca-certificates -> openssl
> > > 
> > > Should we reverse this, i.e. have openssl RRECOMMENDS ca-
> > > certificates?
> > 
> > I believe this is what other distros do.  I think the dependency on
> > ca-certficiates was there because there is a script included that
> > uses OpenSSL
> > to generate the certificates.  (Theoretically you can use this
> > script post
> > install to update the certs.)
> > 
> > /usr/sbin/update-ca-certificates
> > 
> > I suspect the others had similar dependencies.. some included
> > script needed
> > something from another package to run.
> > 
> > Not sure if this changes the suggestion though...
> > 
> > --Mark
> > 
> > > > docbook-xsl-stylesheets -> perl
> > > > font-alias -> font-util
> > > > initramfs-module-setup-live -> udev-extraconf
> > > > initramfs-framework -> ${VIRTUAL-RUNTIME_base-utils} (busybox
> > > > by
> > > > default)
> > > > ppp-dialin -> ppp
> > > 
> > > ppp RRECOMMENDS ppp-dialin?
> 
> ppp-dialin installs script ppp-dialin which calls /usr/sbin/pppd.
> 
> 
> > > 
> > > > resolvconf -> bash
> > > > weston-init -> weston kbd
> > > 
> > > weston RRECOMMENDS weston-init?
> 
> weston-init install init file which calls weston or weston-launch
> from 
> package weston and openvt from package kbd.

Agreed.

My worry is that this move effectively makes allarch usesless since any
script using an interpreter will now need to be not allarch since most
interpreters are not allarch.

I'm not sure this is a good move...

Cheers,

Richard


