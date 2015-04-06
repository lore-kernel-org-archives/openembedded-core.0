Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1AB8472A2D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 18:13:31 +0000 (UTC)
Received: by igbqf9 with SMTP id qf9so25837100igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 11:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=q0Vz91HeuiFqRJRHsf717dmP1N67VsgEkIKVSyx6vJg=;
	b=O8EShuoCw8vjo80RqRPM6VwzWmhHCkGU4Swhh6q6r/2sgk+wxYDeDoA4Fn7d3ku2pa
	//tfucvHj95Oz49+0MAgP3lCFtNeet0qYxJWGjIHPIQMMKx8oShjN09fF+EPq76R7BdZ
	yjpZyWXWAjwJDJHNb4EWZg6gxdt5qHyMo+71AQXdGcWnu1GladpdIZO9L1rfKVyhC3UC
	ghexuKTESjVntbVSsAwLa4ZWhXIjf/S4aG4ydO1RdaKtfMPiK8S0f+zg2+2Th+h86VcJ
	64UmHEkJASjai9FNur/xuqrOIPnND3Adz3ISzLI24Y8MYSAF+7Yldxg8GLJ8t4weswJA
	Qg7A==
X-Received: by 10.50.254.99 with SMTP id ah3mr48629434igd.12.1428344012877;
	Mon, 06 Apr 2015 11:13:32 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id l197sm3142852iol.1.2015.04.06.11.13.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 11:13:32 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 11:13:20 -0700
Message-Id: <1428344001-32479-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] libpcap.inc: remove obsolete libnl1 PACKAGECONFIG
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
X-List-Received-Date: Mon, 06 Apr 2015 18:13:33 -0000

There's no libnl1 recipe in oe-core (or any other layer in the layer
index).

Keeping the libnl1 PACKAGECONFIG is likely to cause problems for the
libnl PACKAGECONFIG since libnl and libnl1 both use --with-libnl and
--without-libnl.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/libpcap/libpcap.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index 0c608b5..6f2c985 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -28,7 +28,6 @@ inherit autotools binconfig-disabled
 EXTRA_OECONF = "--with-pcap=linux"
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[libnl1] = "--with-libnl,--without-libnl,libnl1,libnl1"
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 
 CPPFLAGS_prepend = "-I${S} "
-- 
1.9.1


