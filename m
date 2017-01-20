Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4F3B7731AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 13:38:25 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id 203so20128359ith.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 05:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=uMCVTc/sSM9gtT8lh34HEAiapTrEBMkRFW97EChkR1Q=;
	b=0WsWqJ9ZyWxsIaUli7eyYVLwSijbuhDnSal2j5IWSY0J53cNWRWbaANlTalLpEiZQw
	+SbE+RgTOSEgWyW8NE81OgkGnBxGLiLDuvnSuNnZMEshAy1khmEReVgcSoFbnTb5BgyC
	piPyKNvOxFRMhMtx6UuSOVXgCqqWPPX3osmeqgvOUV/t+3T/AbVVi7KzJOLATf+nHCJt
	nZ2rbfFqZ5jmid+dWSYsu51ZlA6kMeVvR+T/BJWMGneJ3AKEzSet1sa3mELaAlt5ar+N
	urRzc63noE7/pZM9UmFOxDUaPf4LifbIVeCKjIfcrvX0qekSR1M9iqMFp0JGFSGhIPEv
	xWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=uMCVTc/sSM9gtT8lh34HEAiapTrEBMkRFW97EChkR1Q=;
	b=fo+AqKFCtXF7p5Rrwys+475u6PYnf5c0fVBi6///NB8X9zTJd+2viHSw2XOAMY1wFu
	zTpZY/TLD5Lx9/j6/wJ+9R1loGMgPBusBU3IeUi5sHOFXKnbL0qkL3u6lFIFzuX4bMIl
	zEiFdQiVII/NF/ah+77Km0pwr7N9vWiaSnKaj/42teLMDw5FRD66H8KUjjKimLpAtaj1
	aEV7FrRJwNtbR4zDALjWakaHnionmX+1gU9N2nX1bfRE1MiM5GZsF7BQSBuJtMxW4Zgj
	eoTl7OL449PlZIoVFna1HXOrXN0zLHJJNdWRbYGGmKWNZidAIiVJJnguC7UKyr41V6RQ
	tOcA==
X-Gm-Message-State: AIkVDXIkbLVKqIZrhx+zMVtfNcvlu3TdCqEitRTsN2Ioxt0bT0Vmz3wWUUZ1p7oo5QU0D9Bu
X-Received: by 10.36.69.79 with SMTP id y76mr3482232ita.20.1484919506598;
	Fri, 20 Jan 2017 05:38:26 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56DD5.dip0.t-ipconnect.de.
	[87.165.109.213])
	by smtp.gmail.com with ESMTPSA id e24sm1362361itd.6.2017.01.20.05.38.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 05:38:25 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 14:38:00 +0100
Message-Id: <250caa9cb68196b4141ca0c73cc2b94498fddc4f.1484919259.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
References: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
In-Reply-To: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
References: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
Subject: [PATCH v3 03/12] ovmf: explicitly depend on nasm-native
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
X-List-Received-Date: Fri, 20 Jan 2017 13:38:26 -0000

Fixes a build issue when nasm was not build already because of
something else.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index e722db5..13b583b 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -20,6 +20,8 @@ DEPENDS_class-native="util-linux-native iasl-native ossp-uuid-native"
 
 DEPENDS_class-target="ovmf-native"
 
+DEPENDS_append = " nasm-native"
+
 EDK_TOOLS_DIR="edk2_basetools"
 
 # OVMF has trouble building with the default optimization of -O2.
-- 
git-series 0.9.1

