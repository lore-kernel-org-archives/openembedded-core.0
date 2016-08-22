Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 666E870016
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 13:18:37 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id i5so143915866wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 06:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=7cCsON/oQaNMgRIrj7KAl3MBlvF48hmGlDRm4kgcpv8=;
	b=xVuinv206DRdORu++IDwMwiyBBoQQHx3ciMzI46xXOo2HDveap9Wu6ouvnOkxJ3Noy
	7rDj1XB7+1i4124RajOu/oFu8gIvRSFLohuKYNFtkIeKGRpg8lJJtwOiHDya5WxTxbla
	7NqVGHqgX+r96MBOvYk3sOsjODLiWJexxRFy8XZ01zWoR1V13AZizOZqrpTWKXBV4j4+
	7PoaTeUUTvSE+jXOwQhqVAvBu/gKDIFtwn0Yl8L3+jlJCjngWjMz45WUYctVpmpobarj
	JVWXcXHxq0tW4WeS/ivEZeloyk1GIXuPxyGIR6Q1ScKaaJTHN8ypAMM3bzC8U2WtBXFu
	41ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7cCsON/oQaNMgRIrj7KAl3MBlvF48hmGlDRm4kgcpv8=;
	b=DHvxSQHNuJXB94stzV1fGud0zMhgtt0ytHF30ZtEHJHLvjCwoRQIsQhfhn4A8MOfyw
	2i9XaYPcCgvUwgAQp/j6t2QQCBjLsHh4G92scO9S0r++E42i9CyKQA2Gm5CCflMKkl4u
	YQgapF8rgDRsgBb8CTqqU+l8s4QFVzU78n2ND3xnXKWtTfDdfrOFx7ngXxXZiEpzkYrZ
	2Chz7tES5mmJxgznFIaFDUCI/n4eQ9pDPQ0VyQSvmUfwaew0XpoflB8TzBrcXfxVYc13
	6XraY9RikGV8+/1scY+/eO5Vw5Cyw1I4w420QLMdoVg6qmHH2BJ0FQpPChw4jvRMxOzj
	jAtQ==
X-Gm-Message-State: AEkooutzU+zMefv2ySx5kO+UbyHquM5e/JVxOb30ShtP2vtBBACHkgZ6a+mugnddQWW4jh5J
X-Received: by 10.28.111.213 with SMTP id c82mr15796195wmi.47.1471871916871;
	Mon, 22 Aug 2016 06:18:36 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	190sm21383601wmk.13.2016.08.22.06.18.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 06:18:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2016 14:18:32 +0100
Message-Id: <1471871913-24095-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] inputproto: explicitly disable asciidoc to avoid floating dependency
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
X-List-Received-Date: Mon, 22 Aug 2016 13:18:38 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-proto/inputproto_2.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-proto/inputproto_2.3.2.bb b/meta/recipes-graphics/xorg-proto/inputproto_2.3.2.bb
index ae50b87..eb5e66b 100644
--- a/meta/recipes-graphics/xorg-proto/inputproto_2.3.2.bb
+++ b/meta/recipes-graphics/xorg-proto/inputproto_2.3.2.bb
@@ -18,3 +18,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "b290a463af7def483e6e190de460f31a"
 SRC_URI[sha256sum] = "893a6af55733262058a27b38eeb1edc733669f01d404e8581b167f03c03ef31d"
+
+EXTRA_OECONF += "--without-asciidoc"
-- 
2.8.1


