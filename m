Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9ACD67D0ED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 15:00:24 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id z6so2609755wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 08:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hfEWcq2O5V35v8ve+7IlEGsme2bsXtDHB6YZstyabuY=;
	b=NPxWb4lrIIjx28/z0N3Nk4dPZUkwiOCcEc6p2/XqFhR7sS4h8+4aXqruFyW22cK87V
	s53IatkTFxGW2aaTy9nlpherQBTjEsgfVIA0bqnYDmaNr+4Lxv1sarjWpqok4iyY2ba/
	02lbPQFW7wFsNGkXVC38CfqWPwK1BkMS9qxFVADlLcb7f7HawCyLfrhbK+M/21YkNV+5
	hQwiyS6dyItgVafiiRJJJsDrgEmzr4VeZIwOQwGtm1Opm64kEr8vz/DCMTNqMeeLO1yP
	CxRy+uE+agH5ELWjfVlGMB1MBZPMUC2gvD0BWM5tnufe/fUdRXTmBvIh3EDmtF6Ykkeh
	WJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hfEWcq2O5V35v8ve+7IlEGsme2bsXtDHB6YZstyabuY=;
	b=TjhjeAsAIZ46QKJR6tuPUDCVdVvo2yFOCxGpEQtE45CUS1bRmrL10zUVl/k66eXsI5
	v54OBHIUl2kremf0bpuPj63gRl0AFN78hyBjN8XzJIICLk6XYC3LaId+uj/1Chc+d7NH
	nIyoxwi7W9Mdyh01PIAHuDr5FkdrYfmDGyW6rIiwedXidGvjVXbRNKtM3bS05ms9u79M
	i+tmQXXHRBPG0oib9PWAig9NV/vurYfpi42xOKYsrLHtYrSgOTpCHJ1uXH/4CFOH9DDg
	BCkrgckYq7b1Kyg9ofIC1wYbv4u1xuu+gAMpQ3g7/2FanLXxQE325B7gEE2yvA/5oZfC
	Am+Q==
X-Gm-Message-State: APjAAAWWrYqOYDk9EJ5nXXumACKwCuvJJ0bTpMARWYb3vw9pf8JkGs7r
	uRFa7vjG5Is12FhNaZDWaATyAY1p
X-Google-Smtp-Source: APXvYqzTCwpGK8vQpAaphpWlrpnb7ruLp12rtmu2Z/prsHW4CTQwbS76n3J2+kf1itRAKKfJUuq8ZQ==
X-Received: by 2002:a1c:2b41:: with SMTP id r62mr14671882wmr.94.1553612425162; 
	Tue, 26 Mar 2019 08:00:25 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	d6sm21957974wrx.62.2019.03.26.08.00.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Mar 2019 08:00:24 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2019 16:00:11 +0100
Message-Id: <20190326150011.8608-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] less: upgrade 549 (terribly broken) -> 550
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
X-List-Received-Date: Tue, 26 Mar 2019 15:00:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Test case:

* open xfce4-terminal
* run 'echo | less'
* press arrow up/down few times
* exit less with 'q'
=> From now on all mouse(wheel) buttons create strange inputs on terminal

Release note says [1]: "Sometimes the terminal was left in mouse-reporting mode
after exiting less."

http://www.greenwoodsoftware.com/less/index.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-extended/less/{less_549.bb => less_550.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_549.bb => less_550.bb} (89%)

diff --git a/meta/recipes-extended/less/less_549.bb b/meta/recipes-extended/less/less_550.bb
similarity index 89%
rename from meta/recipes-extended/less/less_549.bb
rename to meta/recipes-extended/less/less_550.bb
index 140c89fcb0..bb1618f1eb 100644
--- a/meta/recipes-extended/less/less_549.bb
+++ b/meta/recipes-extended/less/less_550.bb
@@ -28,8 +28,8 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[md5sum] = "d12863d348077739a4d3bc67ad9b7f00"
-SRC_URI[sha256sum] = "eec42357903faabfb294ffcc41ff08cbb29db54db46568cd8d0ed15a0482e19d"
+SRC_URI[md5sum] = "8caff88e34afff512b663d7c690bd2cf"
+SRC_URI[sha256sum] = "6a53639f08d7ed05b6e104b82c32193f79ac01a3eddb20e114e1c261948bd57b"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.20.1


