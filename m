Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 64F726BCD6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 20:43:57 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id f4so11880607ion.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 12:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Bcgcy8jgZ2nURjICwy63/LFat6otQN4NGdfOvvkzEvY=;
	b=cNpWLa/cSxE/sDRIHxPU371K4HnKK4Q13LP76i+d3T9bKGipLph80x/sCC7yBdrdEj
	t2t0Ig/vViwyvPbPCwiB7wrCdEsUC8KpMaujUZoShRZbbez1lCNyeWIju/OkL0BsANm0
	1VkzVXzPxXjW82gpHjQz6YrjsUw5Ci5GOjUyRifSj+jo1Ox1HWvSGDyhOeL6gbHCnXg+
	UOfO26VP/vkoYt2PZfH4zqjSO8GnLYzr882JquoWc1MPPKt/PFgJG+nMJjHF88o16Z8M
	cS1ehsRUFOvKF65hVKD3oKx03iGwUZ0wtyd79919+lTElcSKD+YPgm/JZgtNfrFhlInd
	X3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Bcgcy8jgZ2nURjICwy63/LFat6otQN4NGdfOvvkzEvY=;
	b=QX1j607QeS841s6iof8MbasRkDKm8rO8DAtjM72Lg9sjqKRjdGoX4eBekeqhPJtnhc
	KVZBd/rD5FqW8Ad3DHUeNSzCEJ+AZAhoysqNaN9az8/tpHLrv16XsXpY2SnMcQUzgr4y
	pAkZrMqhOQJoQTCnia8ptPiejO8Mkc5WgiPfDaDD/+TH521Ms16IzljpBbWhokgB5qFc
	YkYrbiXw3LTvfeRveT+79WRnU9l+wj8XXTEfLQDbCXy4tyWr5AmS6BjpfSX5exQvMsD5
	zvzv6HzwVRgsBLjVEHjTctbxY2Rv3GMO3mH5fqjOFOptzuUH2npLREVjgZT4OHvZUZXa
	adUQ==
X-Gm-Message-State: AJcUukcCnXeSdUdAR4LERwwdky80CAuu7mW4+OlvhGn3o7UqrASx9Rsg
	cEar12GpBRQgkEzfTw+Z60S7kJSDANlsR6wgltDjkQ==
X-Google-Smtp-Source: ALg8bN62pZbGOSeL2jKkgK1hgtPB+2aBH4rIXlNGk2l1KsFWoWv0Yed8f4UkUZ2Ck3Wk8rjA1DCQvZrU1tJSz3BufDU=
X-Received: by 2002:a6b:f70a:: with SMTP id k10mr10112689iog.270.1547844238401;
	Fri, 18 Jan 2019 12:43:58 -0800 (PST)
MIME-Version: 1.0
References: <20190117071227.57387-1-kai.kang@windriver.com>
	<CAMKF1srbHBH8ZUT7ChbJXqc=0f2HxGM=ZWJyY=osE=RLzxTW_w@mail.gmail.com>
In-Reply-To: <CAMKF1srbHBH8ZUT7ChbJXqc=0f2HxGM=ZWJyY=osE=RLzxTW_w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Jan 2019 20:43:47 +0000
Message-ID: <CAJTo0Lb-wU6Mre2uqg6e2x=_FAAr21s4sqP_oj-saQznQQsNbA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: reset default value of DEBUG_PREFIX_MAP
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
X-List-Received-Date: Fri, 18 Jan 2019 20:43:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Jan 2019 at 17:55, Khem Raj <raj.khem@gmail.com> wrote:
> I am bit concerned about using -ffile-prefix-map here, its gcc only
> option so will cause clang to fail

It's almost like we need a toolchain override so this can be gcc-specific...

I've been meaning to do that for about a year now :(

Until then, couldn't meta-clang just override the value from the layer?

Ross

