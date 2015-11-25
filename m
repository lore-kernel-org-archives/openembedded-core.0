Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 18254605FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 08:31:00 +0000 (UTC)
Received: by iofh3 with SMTP id h3so46880799iof.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 00:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=YUmvcbdpwepMFLH0+hQp4zoCD4+TCCL2tJ7xFLIIFWY=;
	b=duWNoQxE5TlsRm3dSmsqvGy+3yhQFIzdXsA3j4z4RJLyv9IfcmSrrdfKgFRHUMtS2w
	tt/PUM3f4LpbdJrWThD1BDah8+HiVc/04mhH+Qk2B81pp941kg9uopGZs1Jx5y6x4mxx
	WlTujLL5bd5bCT3n5RyctkvNDpvNT0iTRQz5vjufWIEVwZfTIWk6S4tdGS450OaxfDYf
	6LyWq+GgRsCTQhJDZsIOQHdrM4vljvyi+q1ahxMXddEBKMJNP98N+GpkxBVyP4NChn8r
	eON8hdKG2HMYKYblYgoZcpBL3RPwV8luMeKYyR1NyfzaWFdxBdtQPa+X4Y5Q4zUWSAkx
	UdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=YUmvcbdpwepMFLH0+hQp4zoCD4+TCCL2tJ7xFLIIFWY=;
	b=K1KLrFGcLrQ/xAmUKE2djAkMCOb3aHhj02mV65LEle9i4sSg7Z74wECiND/o8CQn1f
	TeAv52qBRhzAvXB1ogSM7w9CJBplAzQrz9mfq40fZ1GUU4Tl4GWdJYnKkfCAVeCMhQ8m
	brkyuImGylilZCbxncoRau8MdXSdMMN4Zv3WIefq5orz6mT1xy/Ty23DeFi3QxQlIyH1
	r/7zo8B78ISCE+h+3vjEQZ4IcDL10qziGbMJXQjcgMF9ZaWIqzRj9XgAG7rNDX851S3p
	D6yjtDmUWW9vY0rPt2X1Tv7DPxZ7EZe8e9tAsPWgrcgQHKTHMh7wStYqqvbbd4ve2cWk
	orgw==
X-Gm-Message-State: ALoCoQmk0VW6lPaaH9DkWHc5uf6hGWyFki7brmLL90UtNBysa2korniF7TLzGFLfnOUY5YDjA/sa
X-Received: by 10.107.38.83 with SMTP id m80mr39904856iom.98.1448440261515;
	Wed, 25 Nov 2015 00:31:01 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56CC0.dip0.t-ipconnect.de.
	[87.165.108.192]) by smtp.gmail.com with ESMTPSA id
	i69sm8398302iod.27.2015.11.25.00.31.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Nov 2015 00:31:01 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Nov 2015 10:30:31 +0100
Message-Id: <b6ff08c7eb1b7ec9117d3cb79ba7ca68da8309c9.1448442869.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1448442869.git.patrick.ohly@intel.com>
References: <cover.1448442869.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1448442869.git.patrick.ohly@intel.com>
References: <cover.1448442869.git.patrick.ohly@intel.com>
Cc: paul.eggleton@linux.intel.com, alexander.kanevskiy@intel.com
Subject: [PATCH 3/4] buildhistory-extra.bbclass: simplify usage
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
X-List-Received-Date: Wed, 25 Nov 2015 08:31:01 -0000

From: Ismo Puustinen <ismo.puustinen@intel.com>

Instead of expecting the user to put InHERIT += "buildhistory
buildhistory-extra" into the local.conf, now only listing
buildhistory-extra is needed because the base class will always
be inherited.

[Change from Ismo, commit message from Patrick]

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/buildhistory-extra.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/buildhistory-extra.bbclass b/meta/classes/buildhistory-extra.bbclass
index e9fea5d..2dd5c5f 100644
--- a/meta/classes/buildhistory-extra.bbclass
+++ b/meta/classes/buildhistory-extra.bbclass
@@ -4,6 +4,8 @@
 # Copyright (C) 2015 Intel Corporation
 # Licensed under the MIT license
 
+inherit buildhistory
+
 BUILDHISTORY_EXTRA_PKGVARS ?= "PACKAGECONFIG EXTRA_OEMAKE EXTRA_OECONF EXTRA_OECMAKE EXTRA_OESCONS EXTRA_QMAKEVARS_PRE EXTRA_QMAKEVARS_POST OE_FEATURES SUMMARY DESCRIPTION HOMEPAGE LICENSE"
 
 python buildhistory_emit_pkghistory_append() {
-- 
2.1.4


