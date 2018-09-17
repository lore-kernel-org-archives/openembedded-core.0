Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay.synopsys.com [198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id 7DF0971974
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 21:29:54 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id E516B10C03AC;
	Mon, 17 Sep 2018 14:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537219795; bh=UkpeWeFEwnOug9cyg7TqWpolrMCvsPbq8CDbB0AJkvA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GsrGAgfsP7yl1kpIm2N917uTZIabcvBgZpomXJsqM/5nG5V3ZQuoHZ9weCo0oXYzc
	CKIrOzTaBMAMmAnNbVmgHH443uQyupf7q3Aroy98R+okYGDTv50YAEThGIICpfAQJ1
	d3q2Yo1jX/5DPWJOk31vb0+ThilPXVw6Bk+7i3k8FfbJXH7mqSZUtDZ5gHLI2Vb6TC
	6gxna8pkkH8urvWCUQjlAipHXG5pa6ECZcWn2/BmC2EpjBeQmd7Ahd3hjekTTQix7u
	tavmMdQ8ezwfwgZr4mw/1fjXRIhKUTirGTFsiSDlZWGls4fJ4O42SYJsnbA1LbRa2z
	cOzDzQZynYWwg==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id A708754C3;
	Mon, 17 Sep 2018 14:29:54 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2018 00:29:34 +0300
Message-Id: <20180917212943.27237-2-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180917212943.27237-1-abrodkin@synopsys.com>
References: <20180917212943.27237-1-abrodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 01/10] siteinfo: Define data for ARC
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
X-List-Received-Date: Mon, 17 Sep 2018 21:29:54 -0000

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 meta/classes/siteinfo.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 86bb853b..dccf122 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -20,6 +20,8 @@ def siteinfo_data(d):
         "allarch": "endian-little bit-32", # bogus, but better than special-casing the checks below for allarch
         "aarch64": "endian-little bit-64 arm-common arm-64",
         "aarch64_be": "endian-big bit-64 arm-common arm-64",
+        "arc": "endian-little bit-32 arc-common",
+        "arceb": "endian-big bit-32 arc-common",
         "arm": "endian-little bit-32 arm-common arm-32",
         "armeb": "endian-big bit-32 arm-common arm-32",
         "avr32": "endian-big bit-32 avr32-common",
-- 
1.8.3.1


