Return-Path: <twoerner@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id EDA8579AE7;
	Fri, 29 Mar 2019 11:37:36 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id p16so1473347iod.2;
	Fri, 29 Mar 2019 04:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=7tPulMuV4liwHbryZ7MwXCYkECazyvwl7JFPpNGUB+E=;
	b=NQ9pVSe/uDQgeocUNKggzPkW8J/RyoRspdh4s/sTZXeVs3MV/ME1Yw3CWmPvO/Wql1
	eHD9SzdcDIqqFOYvguzK8eSJqyrivSNzg25fvcFeEv6CeGP6GLN4axJjoakJxwClXYc3
	VGkMdqYpVXZq7AuLiojXOEpd1TtXArMcqQeCRA1BxsdlbTsUmMaqdZskXl2H+KHgMWk6
	mkWAHSP4gnaRndEGKGAzIjtRLN1gu1O+00hnQ19BrtP41rLvYjvrK+xUtfhWtqF5JjDv
	GLySN9Qq9syZQcGkR8Xe3WOfE79WbQUHB9lWyZ7fsJcIQ3t7M9P26OHluu3AYgJLHDAX
	ul+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=7tPulMuV4liwHbryZ7MwXCYkECazyvwl7JFPpNGUB+E=;
	b=ac4I5XVNSeBF03ZQLQ4rX+pqSCaDlan9+Fx0lSKM/EJCb5em0MNxVYA096IX8YwhLY
	Cj8IBB90qCNq1n9cgYzt0odtc72tuLBEMQBGa/9n1rQxkZueWj0YxqLeGMjy5J6ef6SH
	irQFVfC/JWE5vHeTwpepKEGtpe40mOQ3FkkZ5SkkiOygKoRdiqPcAqy6rpq2Xr2BXz1M
	aIWpUzAGFvXOHFRVzHq62iSPlRoicqk/+TK1dlPnkyH3RlRPrpyc6IfzTJwNEYUOfLzq
	agl4ULhaKu0k7yLBZq+bSoMCDTR3Hwc/zUsD7Odg/buKL29JuzO+jmNU4ryuDxBS5ztc
	zWiw==
X-Gm-Message-State: APjAAAWCoaQ5x9VWv3GKlOhQ3MrEVLysDogm66h1RDnqKf9JK6uEBYZP
	D4jJsvBu443ZwfpRniqQLdg=
X-Google-Smtp-Source: APXvYqy4jP+mVlUlsU2JHLuDAPJuuPm1H8uDa48zhvPiKlyJ6ocWMp2o1wJq+E/QDZTNXzsDxXWPlg==
X-Received: by 2002:a6b:c909:: with SMTP id z9mr33634581iof.244.1553859457764; 
	Fri, 29 Mar 2019 04:37:37 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id f8sm927224itc.27.2019.03.29.04.37.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Mar 2019 04:37:36 -0700 (PDT)
Date: Fri, 29 Mar 2019 07:37:34 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190329113734.GA31182@linux-uys3>
References: <CAMKF1so7w4i4Kw-ymWayPx1Z_mmetRKcNeyb9pADFZwDY=jqmw@mail.gmail.com>
	<20190327161754.GD1598@jama> <20190327163507.GE1598@jama>
	<20190327203907.GF1598@jama> <20190327223257.GG1598@jama>
	<CAMKF1sqyPnVgbDt6yp8w5fAkjj-5S8WudbarJDwpAFXzdtwAog@mail.gmail.com>
	<20190328144033.GA1601@jama>
MIME-Version: 1.0
In-Reply-To: <20190328144033.GA1601@jama>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: glibc broken when linked with gold Was: [oe] State of OE World, 2019-03-16
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
X-List-Received-Date: Fri, 29 Mar 2019 11:37:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu 2019-03-28 @ 03:40:33 PM, Martin Jansa wrote:
> Send for oe-core:
> https://patchwork.openembedded.org/patch/159874/
> but more information might be needed before it gets applied to oe-core
> as discussed with RP. I'll try to get serial cable working on my Nexus 5
> to test it there in runtime, but maybe someone could beat me to it with
> some more easily hackable 32bit arm board.
> 
> > > Can someone confirm that glibc built with gold works for him on arm
> > > (I haven't seen this on x86, aarch64)? Or should we just force bfd in
> > > oe-core recipe?

I have an Olimex imx233-olinuxino-maxi that I build for and test regularly
(arm926ej-s, ARMv5).

Yesterday I performed two builds from master with the following configuration:

	Build Configuration:
	BB_VERSION           = "1.40.0"
	BUILD_SYS            = "x86_64-linux"
	NATIVELSBSTRING      = "opensuseleap-15.0"
	TARGET_SYS           = "arm-oe-linux-gnueabi"
	MACHINE              = "imx233-olinuxino-maxi"
	DISTRO               = "nodistro"
	DISTRO_VERSION       = "nodistro.0"
	TUNE_FEATURES        = "arm armv5 thumb dsp"
	TARGET_FPU           = "soft"
	meta-freescale       = "master:08173f472244817b85fe4af8ab2add7a0090b122"
	meta-fsl-arm-extra   = "master:b4d2c8462220e7038adffc0a151767ef8da07c5d"
	meta                 = "master:aeaca9bb1b1c8bf44818945dc4b2cbd6d4b5cef2"
	meta-oe
	meta-python
	meta-networking      = "master:24dd9328f7ec964bbad25b7061366f9f2ff6194d"

Both builds explicitly included gobject-introspection.

The first build was done as-is (i.e. using the bfd linker). The second build
had the following in conf/local.conf:

	DISTRO_FEATURES_append = " ld-is-gold"

The default build succeeded. The gold build failed as expected while running
qemu trying to build gobject-introspection.

The good build boots on the hardware and runs fine (as far as I can tell):

	OpenEmbedded nodistro.0 imx233-olinuxino-maxi ttyAMA0

	imx233-olinuxino-maxi login: root
	root@imx233-olinuxino-maxi:~# uname -a
	Linux imx233-olinuxino-maxi 5.0.3-fslc+g20d8efe36350 #1 Thu Mar 28 17:09:20 UTC 2019 armv5tejl armv5tejl armv5tejl GNU/Linux
	root@imx233-olinuxino-maxi:~# g-ir-compiler --help
	Usage:
	  g-ir-compiler [OPTION?]

	Help Options:
	  -h, --help                    Show help options

	Application Options:
	  --includedir                  include directories in GIR search path
	  -o, --output=FILE             output file
	  -m, --module=NAME             module to compile
	  -l, --shared-library=FILE     shared library
	  --debug                       show debug messages
	  --verbose                     show verbose messages


