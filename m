Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 816A06FE64
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 16:13:05 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id bs8so2953699wib.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 09:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=XA8ZAysrhT1ocTs0A3LV7hEH0yN0WKRcOl6C7ijk3Ag=;
	b=I0gSU37DGqDRWZhnwqUtP90DtEAhszWTRT1QrrVHMilTt0d1Lr5hD7D24lJvkdlWR6
	Feq4XoAl38yKQBSPjE6oPE0XqPM1TNaZC8lrkoZwoewWtb+uhsc+sG9dVp6Be7MgLpt9
	9V0tYhFFr92QO0Qt6v7GMbgNcG0xyRv4SQHqW+WxNDdX32bhakmg5b1vmAiMyaiq/Vkr
	3D2mg1/v5uUTxkY670wnNsAsBbjNrH1O/BFM60nguRvpAFEoy/mQxf4CJleKyXhfmMsU
	B4ugzzeD/IR5oB5qKVmvnae0Xl5hMzlHeHjA7bf4o9cfRoTjsbTEwvndinngrEJCtdwj
	leDQ==
X-Gm-Message-State: ALoCoQlRyGNY+7rXzixokLtwz7O3CNMYJ2ho2m877I9bio+4/voQMpb/BxS13play1mUbnSdeui3
X-Received: by 10.180.198.232 with SMTP id jf8mr23360907wic.37.1410192786920; 
	Mon, 08 Sep 2014 09:13:06 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	ub19sm12379669wib.9.2014.09.08.09.13.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 09:13:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 17:13:00 +0100
Message-Id: <1410192780-16794-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] systemd: disable resolved and networkd
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
X-List-Received-Date: Mon, 08 Sep 2014 16:13:09 -0000

These two services are fairly immature and need careful integration into the
rest of the system, so disable them for now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_216.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index a7fd71e..7f7982d 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -59,6 +59,8 @@ PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
 PACKAGECONFIG[cryptsetup] = "--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"
 PACKAGECONFIG[microhttpd] = "--enable-microhttpd,--disable-microhttpd,libmicrohttpd"
 PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,elfutils"
+PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
+PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 
-- 
1.7.10.4


