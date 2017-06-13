Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id CD3B5782DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 07:41:47 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id m47so32877616iti.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 00:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=96+8cL/LBEEMaexJdBxihpL51yJD5NjhiwzpYtes57o=;
	b=Ew0gGZ77G1yoPwRclTdilSbKDCrMY9e2CMLnLGqCrj2zaWc7MUwLPM8LmDHhmjZAAB
	UjKyXLG4JximQZZKHcDzhHOckeL5F6RtcoLkX4X+qkWkXBNUzoE9tqjbXpVsihezP7TG
	1FAzp/zbg2a4sRGf6hTs4Zk2S0bwIWFD5VSi9EPyf1ko9rlnZx+XG6alIM5tNFw+qHy3
	3bykh1sdA54Y2JypE7kJtwYmo0usmdTBqWGQgvGc3A0SMUAeijGw3w8i45y7tA+7+pg3
	yGyhEaK3W9jltuBn64dEPjgbwsLBph25EtWg0a7mEVcS+ZBKUI6p09DbPqGUokEc5dCm
	OdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=96+8cL/LBEEMaexJdBxihpL51yJD5NjhiwzpYtes57o=;
	b=eLimUq1cl+nkV+bv4iHbtPBOtJclAYpbcHrcyz8gYZ1zGMRJx179Mio653USVOEia5
	KDdDjWLkQF6mhhsYK/R6CczuFBWN2MKp5fo212KCr4U8Ds6icoMbJksjef6e7MDkbH1+
	K7ZJtUtD67PwY1nOeEshwjpEpG64SAsbn4gxaHpc8UAb0TutyBKVVK3EdWJeVGiwn1FO
	G0xtXV1hxNY/n0Bo7pjfKLeENsIwxEyWRWOM3RrCEYWvY4DiqlkqAJw3IAhprlLOycjr
	i6F1RmM3xd0sqWQo6kf2lDnfAgsIUT9WzdWLwwu2N/p9TgcMwBRZb3UIqgXTClXIwrg9
	gb8g==
X-Gm-Message-State: AODbwcDSXZ3ojT6L1cLbKHdOd63qJ49j6o22kttDK/GDL6F86/E5ogW3
	v4Tyq5pmnLXajSOrCP0=
X-Received: by 10.36.22.137 with SMTP id a131mr15614454ita.115.1497339708482; 
	Tue, 13 Jun 2017 00:41:48 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D5A8.dip0.t-ipconnect.de. [93.232.213.168])
	by smtp.gmail.com with ESMTPSA id n3sm540151itg.3.2017.06.13.00.41.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Jun 2017 00:41:47 -0700 (PDT)
Message-ID: <1497339704.30163.334.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 09:41:44 +0200
In-Reply-To: <cover.6a3be6133a9172fdd3e435528c8d98c4be1d9dd1.1496069310.git-series.patrick.ohly@intel.com>
References: <cover.6a3be6133a9172fdd3e435528c8d98c4be1d9dd1.1496069310.git-series.patrick.ohly@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/1] bblayers sanity: bblayers.conf.sample specific update code
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
X-List-Received-Date: Tue, 13 Jun 2017 07:41:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Ping?

On Mon, 2017-05-29 at 16:49 +0200, Patrick Ohly wrote:
> In an experimental branch of refkit I bumped LCONF_VERSION from 4 to 5
> and ran into the problem mentioned in the commit message: instead of
> raising an error as before, the code (incorrectly) claimed to have
> updated the bblayers.conf file.
> 
> Perhaps refkit should have started with LCONF_VERSION as in the
> current OE-core bblayers.conf.sample file to avoid being affected by
> this - too late for that now, though.
> 
> As an ugly workaround I'm currently jumping from 4 to 8 directly,
> which produces some extra (and wrong) output about "automatically
> updated" before finally raising the expected error (twice, for some
> reasons).
> 
> I'm not sure how this code was meant to work for different distros
> based on OE-core. Depending on when a distro forked from OE-core and
> how it continued with numbering its bblayers.conf.sample file, there
> must have been such conflicts already before.
> 
> Note that I have only checked that the code gets called when placed in
> the expected location, and the code itself was copied verbatim. As it
> refers to ancient changes, I've not actually tried to set up a build
> dir where that upgrade path is necessary. Perhaps the code could even
> be removed entirely?
> 
> Patrick Ohly (1):
>   bblayers sanity: bblayers.conf.sample specific update code
> 
>  meta/classes/sanity.bbclass               | 121 ++++-------------------
>  meta/conf/lib/bblayers_update/__init__.py | 104 ++++++++++++++++++++-
>  2 files changed, 130 insertions(+), 95 deletions(-)
>  create mode 100644 meta/conf/lib/bblayers_update/__init__.py
> 
> base-commit: ccf630e78aad488da7b80f2981037d3d0559cfad



