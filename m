Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (unknown [209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 82F5365E58
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 09:37:48 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id l6so7690594qcy.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 02:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=raiK3DEQLheayz6ppHzO7K5F+gYnKXggQSb0Ovw+wqo=;
	b=XPLA3XBFGb4ZXEFH0Isn1EEI3ZfWDtj9gW13V4yjiwGUyEnkeB4P98H6ILNvpq1bwH
	U75EsZvYquegjqvf0PkDhL9k5nuBfvnavoxmHTFqJ/BeZS+lj+IE8R41l3mLcS94YZat
	xosZ6ozGB0KTt3AZjQeCWSc4B7dTQQCWdgMNUM61SPgcm7cwQI1zx0D/zQztPN4W5hVv
	FNtnBrTXiQZmuuvY/GBdWQO//hMPc44+CNLyUh9w9Vx5B5uTJ+2ftr3eMEC0XJ9FvnbD
	NSi3YXT2tik71TpAhcBu2pIXCwDlzzr1n9TUSG9QkRwhaqyRsZACIioZsHzNfEVsUX27
	qk5Q==
X-Gm-Message-State: ALoCoQkXhVIHPKTlKV5Gn7nyGQ1JksQDMwG32nizwZ+24s6z0ZiG41I8VntW04Xt9abUbT/o3Tbx
X-Received: by 10.224.121.72 with SMTP id g8mr4345967qar.79.1400837869660;
	Fri, 23 May 2014 02:37:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Fri, 23 May 2014 02:37:29 -0700 (PDT)
In-Reply-To: <006d01cf764a$2b710b80$82532280$@com>
References: <1400226321-5201-1-git-send-email-b40527@freescale.com>
	<CAJTo0Lar8Hbc1Gsa3k631M697ZHDOufJ1k7ugTUU=AWXaHjMAQ@mail.gmail.com>
	<000501cf70f0$2f2d17a0$8d8746e0$@com>
	<CAJTo0LavgOS4HyXLB2ur6PsH3yAaWW7SQf5qFcoz1yia_uMfqA@mail.gmail.com>
	<003001cf7311$13ceec40$3b6cc4c0$@com>
	<CAJTo0LbFKcv+riCYiNSJ0vOZHb4j6hi5hfLNpFya=pAkMyZ1kg@mail.gmail.com>
	<006d01cf764a$2b710b80$82532280$@com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 May 2014 10:37:29 +0100
Message-ID: <CAJTo0LZ=BrLh7hifqNDXH4nxsAN+LZ3CpBY+Z=xUFv+oo_LBOA@mail.gmail.com>
To: Zongchun YU <b40527@freescale.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] Add api-doc class
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
X-List-Received-Date: Fri, 23 May 2014 09:37:53 -0000
Content-Type: text/plain; charset=UTF-8

On 23 May 2014 06:45, Zongchun YU <b40527@freescale.com> wrote:
> OK. Can you explain the details to use GENERATE_API_DOCS? I am not sure the meaning.

We'd have a distro-level variable GENERATE_API_DOCS.  It can default
to 0, but distros or users can set it to 1 in their own distro or
local.conf and then all recipes that have API documentation, can
generate API documentation.

Alternatively, it could be set per-recipe if you only wanted to enable
some documentation, i.e. GENERATE_API_DOCS_pn-glib-2.0 = "1" would be
used to generate just glib-2.0 documentation.

Ross

