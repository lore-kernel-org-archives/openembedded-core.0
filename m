Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 984AB78242
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 23:22:02 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id t3so1890936pgt.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 16:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4urzVON0qwL0A7ZJLh6OassW3DePm2+3fY67VjpWq1E=;
	b=lvTJNk9mN6qjN/YHX9m/OxZUtfAZHypc7BTXkeYLF+4xYwrlE/xQfYkrH/YPN3rDuM
	qz0d+BwyEMe/IRap0pF5u6dS5rUAiZp8kpTve7NoTv7kb6wDVYIIXQhckG9P2Utos+Ky
	Ll/6pfkgfFooEFV32BYT4aLXmwNtw6OJLCV/V7t1Qw53HUsoMOObc1r6z5fCN1vuks+v
	x2JqO28vyE4l+2Qa/uzpYN7VfHy/c5I89yeE/5YmpIyI51e7SGQ2gJHiQ8GMoMFoCUj5
	SV/ZKPdnk/dUQHqUu2Wil76H8hcUSwZf9H/2zWDTWvmYm8mQsb303e1RWiEv4PuEM/d6
	LglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4urzVON0qwL0A7ZJLh6OassW3DePm2+3fY67VjpWq1E=;
	b=uc7y5KigkE7gLpKC55URNUM+j3dek+2q0p6RXknSORA7CTAMCrDCvMfIq8+8PNbBkD
	Pmf44XxpxXyBBgibvAEveeRcknlcBICBuGGjZuglhQqJNXq0tx4BO7xrwi4NxmMIWi/s
	fv+PapanmF99oHAFGBKTd0lhmYdXlHuYCFnIOrpsoZHQjP4AN1+63QSq7g6nDwisjOb3
	THOzR5akEdRoKRB/DiET9I/N8Awf6DH6x59Y5/TcywkfrfXjxbhmpCiEwBgzBzgbuERR
	O6S0+RP3I8r0uoJUERdWP/2qxll0cUzhEYT0Gk3pU73OOUYCfmIyQUc/Sk+4VWgBL7Qw
	W5JA==
X-Gm-Message-State: AHPjjUhUJUskuC/Bv0NNgYBXPkFEEj0QIpeWyC+FqlA1KamAzNf2xr5O
	tmxbNJsf7KTBxwlC
X-Google-Smtp-Source: ADKCNb5AHYG4W/WcNh08E7LbfXkz2+7TtBW/7I89sSr1B4kBeX+VT3+YGa0laZ+6XeNNx6UYkSP2Eg==
X-Received: by 10.99.50.71 with SMTP id y68mr4710547pgy.190.1504912923478;
	Fri, 08 Sep 2017 16:22:03 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q13sm5510822pfi.110.2017.09.08.16.22.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Sep 2017 16:22:02 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 16:21:37 -0700
Message-Id: <1504912911-23120-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
References: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
Cc: Yue Tao <yue.tao@windriver.com>,
	Jonas Zetterberg <jonas.zetterberg@windriver.com>
Subject: [daisy][PATCH 01/15] setserial: add missing depends on groff-native
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
X-List-Received-Date: Fri, 08 Sep 2017 23:22:02 -0000

From: Yue Tao <Yue.Tao@windriver.com>

[YOCTO #6526]

setserial needs groff-native to build

Signed-off-by: Jonas Zetterberg <jonas.zetterberg@windriver.com>
Signed-off-by: Yue Tao <yue.tao@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a1d1d89b490703ec163b82ba93f10a7d3e93270)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-bsp/setserial/setserial_2.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/setserial/setserial_2.17.bb b/meta/recipes-bsp/setserial/setserial_2.17.bb
index 65d6068..f1e8cd3 100644
--- a/meta/recipes-bsp/setserial/setserial_2.17.bb
+++ b/meta/recipes-bsp/setserial/setserial_2.17.bb
@@ -8,6 +8,8 @@ LICENSE = "GPLv2.0"
 LIC_FILES_CHKSUM = "file://version.h;beginline=1;endline=6;md5=2e7c59cb9e57e356ae81f50f4e4dfd99"
 PR = "r3"
 
+DEPENDS += "groff-native"
+
 inherit autotools-brokensep
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/setserial/${BPN}-${PV}.tar.gz \
-- 
1.9.1


