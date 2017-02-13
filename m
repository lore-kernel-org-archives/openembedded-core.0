Return-Path: <george.mccollister@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 53D1871E39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 22:07:35 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id 203so782080ith.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 14:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KmXZrDABSKhrPJeblm2/BmrSZtq/+501A2IrHTpRCvs=;
	b=eybGmKa7XznkNpWgkS8iMeiml+rTMPs73Tc59FDxPaV8SgI69z8rDYjN7GekG24SWz
	BZtJdUrE3xr8JhytWHMcdcVZ1r6pfreqBlZP0tJLFzXk56bycLZ6GY42eJgyF9E3eVLK
	Xd/atXrB19G2hcVvCPiJAFOOo+fan0s5lNsEF6+NAYse/gO2BoyxWGm2FwTR8d8vnnVA
	aRloWVVqBE3yH4ko3QaTvXl78cR1gXxPisaMbqcpAC0+Q32PtwR5Wozb09FxP96cHLnS
	d8QkEBMlBNX3sf4AIip/UuLGrhQsv0/pAW4VVug9t4MRRINjDq03X1z54pbS7ce1mXrA
	Hw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KmXZrDABSKhrPJeblm2/BmrSZtq/+501A2IrHTpRCvs=;
	b=paHDY+miYKBM7kphg2W5ijGn4Z5ftvMfkyYPWB+oiLMm9zj87yRHhI/O7C2dkVgUUw
	XcdcgY6Vi/tG/u3Fk3MB7IWYOjq/RXiRp+sF2qkwFqudWJUVFHAsTFOFjlFRzHm6vUXD
	onCDa//t9KaiP18OZ1fALK8GED7neOETKTINUO/VHY2gsUhUHEew8KOz2AJ+Cxs2VkOS
	oldHEqXCHJIrrAEWa6VNhgv3qvdtV+8GnLukIZHk3CU0yfOFg/KgApPQkCrIJsO3Pwra
	a9O+EUcpb52l5r7kfB19lfE/wFc5WHt3q/GO3uLaG2MJ20mhPj26AyzetHWTyw0pbK6i
	Jp1Q==
X-Gm-Message-State: AMke39k55NuupmAhyXO2MnZJu9HNQvbmv5fxZPx8FxfrGXcJoMMDX5MHWYm1Y4eAPBPpJg==
X-Received: by 10.36.83.209 with SMTP id n200mr543252itb.9.1487023656223;
	Mon, 13 Feb 2017 14:07:36 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id m6sm4457659ioa.57.2017.02.13.14.07.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Feb 2017 14:07:35 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 16:06:54 -0600
Message-Id: <d57ca45ab2673b357e525afbfebc82be0ece519a.1487022302.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1487022302.git.george.mccollister@gmail.com>
References: <cover.1487022302.git.george.mccollister@gmail.com>
Subject: [morty][PATCH v2 1/3] python-3.5-manifest: Add imp to importlib
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
X-List-Received-Date: Mon, 13 Feb 2017 22:07:36 -0000

The imp python module is the forerunner of importlib. Include imp in
the importlib subpackage instead of the misc subpackage so that it can
be depended on without bringing in a bunch of unrelated, unused modules.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 3046114..6c690db 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -115,7 +115,7 @@ FILES_${PN}-image="${libdir}/python3.5/colorsys.* ${libdir}/python3.5/imghdr.* $
 
 SUMMARY_${PN}-importlib="Python import implementation library"
 RDEPENDS_${PN}-importlib="${PN}-core ${PN}-lang"
-FILES_${PN}-importlib="${libdir}/python3.5/importlib "
+FILES_${PN}-importlib="${libdir}/python3.5/importlib ${libdir}/python3.5/imp.* "
 
 SUMMARY_${PN}-io="Python low-level I/O"
 RDEPENDS_${PN}-io="${PN}-core ${PN}-math"
-- 
2.8.0


