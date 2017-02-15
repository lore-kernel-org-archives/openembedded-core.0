Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9F1A876643
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 11:21:12 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id c4so30817570wrd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 03:21:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5yn3btbk/TyYSO73YFKB4Cg48ZRl/Yc2wMFZKTKaqrw=;
	b=F3ntjGBGqXBE4fNNUL0eSjjc332lPGKYqQDuXp/YvfJ7TzWahjWysDzWNXYysugaas
	orVxrnNwhFzacjQW47svGIbQqYUOCGRswHmr6a8OZODpJzce8UpMUhSMaktp0ixtM2i/
	JuqIBWI4oZ8tNSkiRBfKqtenB9CCjla33i/nXZ7pPRQVTNXq2CfWZi4Z6rDa5okqAQEn
	bR1OkQ7BMGiZiGbmQ8jumeTV4ebmMpu0UuaC54I4Fu+tqXlau+OdMrZpFyu0Fy+ot6xi
	if82pyNP7vZX90jL7bvJTPottZNRk+Y+6bwOZyCFnwIcyY5VSjxkbbEyrUeV/8QK0JXv
	LJ+A==
X-Gm-Message-State: AMke39mmlDbvz5Xm1IoNgSqumIA3ELzm5PbThNK+DCvs/NKbdX1uoNnitZpLKRXh6rVWIg==
X-Received: by 10.223.165.138 with SMTP id g10mr31041874wrc.105.1487157672309; 
	Wed, 15 Feb 2017 03:21:12 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id y1sm4973748wme.15.2017.02.15.03.21.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 Feb 2017 03:21:11 -0800 (PST)
Message-ID: <1487157670.2824.10.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 11:21:10 +0000
In-Reply-To: <cf49add5-c621-3d50-43eb-66cef09fca8d@intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
	<5eb1a4810bf745c5932feee2d1b47621353e9689.1486997986.git.alexander.kanavin@linux.intel.com>
	<1487154986.2824.6.camel@andred.net>
	<cf49add5-c621-3d50-43eb-66cef09fca8d@intel.com>
X-Mailer: Evolution 3.22.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH 36/36] package_deb.bbclass: Ignore file paths in RPROVIDES
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
X-List-Received-Date: Wed, 15 Feb 2017 11:21:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-02-15 at 12:51 +0200, avalluri wrote:
> 
> On 15.02.2017 12:36, André Draszik wrote:
> > What about opkg - is it OK with PATHs (my blind guess would be no)? Has
> > it
> > been tested?
> 
> Yes, i tested wit 'ipk' packaging, it did not complain about file paths.

OK, thanks :-)

Cheers,
Andre'


