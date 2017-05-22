Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id AF49771A36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 21:32:19 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id k15so34364957wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 14:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CZZ/1tO0fpLcwhDw9yIY7v4mK7pp29sm2aFRLiqPbFU=;
	b=hOYvP2gAXeWQ2BfqVz++VU6KHvaTgKx7MBb+0xIwDCp4Orja6V7QhTWCzqg9uPnDws
	e3a5KuXIVBOZRH0rMQcYyI/9V06QcklNWQO7TA1ZRCPCw2sI9BiLKQHYXKMghU7HjnKZ
	fa4PU8LwBVg5DRU8wjMS1utXUqXYShkDcNPPPjQWCqkS9qmqObIk2RIX9QvwEv7v64Ji
	gurRTr7OHhj5pyp5FOOJhpMW3vN3alGNVPK5JGdyln/nvloN4x0FppUvbgfAD10HD1zV
	fRhTNXwZVDDPxjeYYQ2CgMGyl9o1U29O60I1Scas4W/AK9Npzvfgwh3lPlypYJzr3DSA
	U67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CZZ/1tO0fpLcwhDw9yIY7v4mK7pp29sm2aFRLiqPbFU=;
	b=tPE5oY6cIAcUAUZQhJuYh+/S3rr5Pnx9GB4Uv9nJY2LFJVJg4928Cm3uv2jRiys9pD
	3Mf0hfUXJLqUnVxKSE6QvyvaF2AWnINGLQ0gM0WyLP07oRPorNOPNG6AlODa7788+oTA
	QvOWlz7IpVc3WlaZIFEBid7b8zBeypwvdqNZYDEWlDFdDpaOlBLOB4wJrnd3zGUE9zLq
	iR9ITnJnl5eg3xU17IUMMFQ5wRu8tte+kz7tW8otX8uVAgPef7DV/sWKRadXwSoLiUcE
	3CBb7VqgOAjQKkVryaRk7h+MFarqomoZIHY0VfwAds0JRAw1255FFy8UcT1LBhABr/bV
	CmKQ==
X-Gm-Message-State: AODbwcBllUpdXCPIdZoPJn3FG4cCHyNU2kMVgmCH6Ym7xrmp5oZPPXU8
	fY8T2oPKbYoNXQ==
X-Received: by 10.80.129.229 with SMTP id 92mr18131830ede.161.1495488739993;
	Mon, 22 May 2017 14:32:19 -0700 (PDT)
Received: from Saturn.local.all (138-14-48-195.pool.dsl-net.ch.
	[195.48.14.138]) by smtp.gmail.com with ESMTPSA id
	h29sm9544368eda.45.2017.05.22.14.32.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 May 2017 14:32:19 -0700 (PDT)
Message-ID: <1495488738.2723.18.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 22 May 2017 23:32:18 +0200
In-Reply-To: <ea81f53d-203f-183b-3a51-b0d71301b384@linux.intel.com>
References: <20170519154856.21505-1-max.krummenacher@toradex.com>
	<ea81f53d-203f-183b-3a51-b0d71301b384@linux.intel.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [PATCH v2] libsolv: don't pick up bundled db from host rpm
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
X-List-Received-Date: Mon, 22 May 2017 21:32:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Alex

Am Montag, den 22.05.2017, 16:08 +0300 schrieb Alexander Kanavin:
> On 05/19/2017 06:48 PM, Max Krummenacher wrote:
> > +   # check if rpm contains a bundled berkeley db
> > +-  CHECK_INCLUDE_FILE(rpm/db.h HAVE_RPM_DB_H)
> > ++  CHECK_LIBRARY_EXISTS(rpm.so db_create_rpmdb "" HAVE_RPM_DB_H)
> 
> Sorry Max, this is actually worse than the first version. HAVE_RPM_DB_H 
> has to accurately reflect the presence or absence of the header, as that 
> header is later included or not included depending on that. You cannot 
> set it based on checking some library.
Well, that is somewhat true.
The test explicitly tests that the header file is available, but then
implicitely assumes that when the header file is available no standalone
needs be linked.

Turning that assumption to explicitly test that rpm.so provides the db
functionality and from that assuming that rpm/db.h is available is IMHO
equally right or equally incomplete testing.

> So please either fix CHECK_INCLUDE_FILE, 
The reason why I didn't fix it as follows is that this would break
the test for the non native (target and nativesdk) case.

+  CHECK_INCLUDE_FILE(rpm/db.h HAVE_RPM_DB_H "-nostdinc")

For the non native case the OE rpm headers are actually stored in
the compiler's standard include path, so searching for rpm/db.h
with -nostdinc wouldn't pick up the file even if it would exist.

> 
> or let's revert to the first 
> version of the patch, as it at least doesn't introduce a new issue.
v1 unconditionally assumes that rpm is provided without a bundled db.
v2 tries to find out from the to be linked librpm.so if it db is bundled.
Both versions work for libsolv, libsolv-native, and nativesdk-libsolv.

I can send a v3 with either variant plus the rebase on top of the now
updated libsolv recipe.

What do you think?

Max




> Alex

