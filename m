Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0E56477404
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 15:31:04 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id j18so62945180ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 07:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uMCVTc/sSM9gtT8lh34HEAiapTrEBMkRFW97EChkR1Q=;
	b=J1VbYAARo/Y6HxqBi3wKLjydhVUfi988JCjCq7APAgmrd6YCdosJ94495hYJRQ0Bmq
	6asHOtM0/nD9By8ZNvwhvjC2eql8fmXtKCavGb9aacXfmTSdVYadl7q7OJO8GYHCF0oe
	+KLopHESj9d5+mKyxC9HnnQUO7ZrZjhH4Y/19IVoKRXpp0dItBdj0f8W+iwA+jd5aoon
	8hcCIQRjIlipVXd4F8+phzicDKGR4JzxOAyJw91xd7eksLm87GNQ0gGTDAq7AMIt/n48
	bM4HeNEqwVy/AqUjC3KVOG5JHMl4kQ4ZRD7U8T+Vyu81Upk/GtxK/+t6ShScQIHGa/mq
	5tiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uMCVTc/sSM9gtT8lh34HEAiapTrEBMkRFW97EChkR1Q=;
	b=RtJkc30zN43g5d1/rTtKMxyPZRIgk82e4/CazoSVMf7DFwowaHWv2bsfYu0t9BuyQE
	XyEGtN2cVfjr9N2V2w0Bp4FSzz6GxRFqcXaiAAe9alsTp1zDkPU9CZT6kR5ZMZL5nQTM
	YyGqzW0XLAU2enfn5BVgcXHZSUTH5lhb2oDhnUGNm8+LvwPolvMpB3aJ76PO2gUvHGb9
	M3/onfKyEE5pDaarEyMk+JJhqE68+lvKj6X0bFyf/r/FITybgRbW81JCqDYtHeJm5TFq
	Xametviuh/G9xrHasghNePfP8mrtB6Rgknkt423z4fZKxsEph7575HwCMls8nFVX/0BC
	oJug==
X-Gm-Message-State: AIkVDXLPD2ZeH70OqbeDOKGPMzQYWAg++VzM1Dtf9icM92VwkWeR31SLT2V7JsMQhu0gDu6/
X-Received: by 10.107.174.4 with SMTP id x4mr7396346ioe.125.1485531065250;
	Fri, 27 Jan 2017 07:31:05 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DB2E.dip0.t-ipconnect.de.
	[93.232.219.46]) by smtp.gmail.com with ESMTPSA id
	a128sm1542174itg.22.2017.01.27.07.31.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jan 2017 07:31:04 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 16:30:34 +0100
Message-Id: <0a57ab7cdda3839ca69c9cc16079e5b748683ac4.1485530988.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
References: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
Subject: [PATCH v5 04/12] ovmf: explicitly depend on nasm-native
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
X-List-Received-Date: Fri, 27 Jan 2017 15:31:05 -0000

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

