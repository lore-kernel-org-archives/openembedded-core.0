Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 854376093B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 15:09:05 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b15-v6so4521786wrv.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2018 08:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=SnpzyqN4xv4OEHemIql7LE/rGFw85TmaR1S85ZPaCDc=;
	b=ZqJLxT9DfrVnGR7XvIgU4iKyafEVTxGjvgaYzVQcqJaXEC0LVDbxrieFl4PruQe/NS
	HXDlkDjSCP7ZjYpwpk2qG+IklbueBACMCv/KaQQ6yselZhp5vjO3TWnFMdErydYOC9IS
	lwnedAhCoED+mIuUk9TsG8LpeUScIvG0EgwCl7F6/Dv2sw57vWpQlNfKqWanU1QOKqsE
	osXlD1P1rUOL6838ftyF/YSuTHBUdDa0kZwDakVE5FLz4h0Mc+bJKxsot3mLUv9Io2+K
	Aht4zNBpPOTT35ETpZqXNvKqZ8wEtNuNKX7LeFtjp6Ycu4743cQc68WTVx5ucf2+TNAU
	W5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=SnpzyqN4xv4OEHemIql7LE/rGFw85TmaR1S85ZPaCDc=;
	b=sltYcJ89+oIMg/3QWUWl+x+t5njGj/ql3tgnCTQTaF7wPCHqwHgjxJV1HsVceHVwbL
	DVyedO1uR1q12uK51iNRzpmH1gXepOJ98u3lJE5b7Eon1Mm4oi/Q6BVHOhKqv4PFmXUx
	wDz/YLzSPa5QqK1kS7ZvJRiGgjXVajwDrxL7YsqVYoOFLa3IHG/ul8FFCytxr6ajD7Jv
	6rd/p4iQoTGYBh2q23sJ32mg0ByovkWRg/cyf3B3+1qTZsRiQKwbab35QvOu37zQ8oPe
	vpYT9ZeIU658Y3riP5lV8PGt555S3znqNKRF7NnhcZY5vF63MxQxhLdi5xa58lU6Af5Y
	t1Gw==
X-Gm-Message-State: APt69E3VS04uEmEiAfMahZPy5dMLfLm5z14YDDfRaIo9lAL3AnGdTZrw
	S8sS8duNAdh7x6BDnsk571eB9gjp
X-Google-Smtp-Source: AAOMgpcptcCHUpkpU5300oDyhRxOocoDijBZAK1FzwWjBOL8J7F3nqeuKZaTGX4frKwS7YbqzTOWMQ==
X-Received: by 2002:adf:8dad:: with SMTP id
	o42-v6mr7549534wrb.274.1530889746131; 
	Fri, 06 Jul 2018 08:09:06 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j12-v6sm2831184wrn.29.2018.07.06.08.09.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 08:09:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jul 2018 16:08:58 +0100
Message-Id: <20180706150859.28081-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] setuptools.bbclass: depend on python-setuptools
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
X-List-Received-Date: Fri, 06 Jul 2018 15:09:06 -0000

python-distribute is obsolete and is now simply a PROVIDES of python-setuptools,
so use the right name.

The identical change for setuptools3.bbclass was done in 2015 in 8922e60.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/setuptools.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools.bbclass
index 56343b1c731..157ef63b687 100644
--- a/meta/classes/setuptools.bbclass
+++ b/meta/classes/setuptools.bbclass
@@ -1,6 +1,6 @@
 inherit distutils
 
-DEPENDS += "python-distribute-native"
+DEPENDS += "python-setuptools-native"
 
 DISTUTILS_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
-- 
2.11.0


