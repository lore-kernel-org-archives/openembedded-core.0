Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 31D6A78249
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 00:18:41 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id y129so15757573pgy.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 17:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=EkjnJUfPZk/X20LnqOyxAZSOY3GpuZ6OOUqUN8/L5xM=;
	b=R0H2KVIPwh1HlyoyV84M10mGk+rMKO+yottaWi8SV0LoI3hQI9KJqxziFsnDsAFCzG
	isuJrY00rhDV/+ce93SMyaFtYZWid9wY2l5RZI3EYBVp2jqKT4Wmeq6F2YvxEWkjXedN
	sUFGFfFDtSKb0RkC/LEmAS1xnog1OdzY3cZ5CS4GbSlVkqV+KLy6yadk/qZmLR4XhFkg
	6oxhZZ84flWjReZL8epAwayEl8rtzUb8sQoYVV8Yt1vgGokvqo5sfFPrGnOUhQmtm/Nk
	diJf8r46ue8TApMWkHNEdagnD9kRqjuLiaJvXvhKyRjqpyGVKcZhJR4zu035oxHaht5v
	+UzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EkjnJUfPZk/X20LnqOyxAZSOY3GpuZ6OOUqUN8/L5xM=;
	b=tZRO7A8HJdEMGRlUrttPnehYTL0Wb9zxRPd0hXhhgwGjnL3RgA+cmVbH8hiwN5mGwP
	E4vruRkbOL5/EaDxFZFf92AXXBNbYiPwAmAmDAMtdhAQ+Xe6T0aw7tu4gmqYJ3WZLlAG
	Y4oRsusHclU1pyWqu4BFqIGRu6KI6GppXE4xHoV9x6QVQPAVc7wyNSK6KmHcnkqtqChc
	WAz/1noYsJ8ZwOVeUC/1vrpGs1PdX3j0IwsGj75QRODEwGWzr5O9Uuq0CY+iCx+aztqt
	TnEqUXVH9MLUPo1Kuk+lbXKJLUsxNIui88hNjiPDUyyIJTH2+XGKCXkuhC3DaDHoDzP5
	LJKg==
X-Gm-Message-State: AIVw111DT33MFMbNE0BVxmy/R0Q21VMqSQP8BC0DZqY3R5K5ODOAKIZL
	YREhoZ0hcavx9Eds
X-Received: by 10.99.114.1 with SMTP id n1mr1615740pgc.63.1501028323109;
	Tue, 25 Jul 2017 17:18:43 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	e5sm31531979pfd.41.2017.07.25.17.18.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Jul 2017 17:18:41 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 17:18:35 -0700
Message-Id: <1501028316-27462-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] gnu-config: update SRC_URI to new savannah.gnu.org hostname
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
X-List-Received-Date: Wed, 26 Jul 2017 00:18:42 -0000

http://sv.gnu.org/ now redirects to http://savannah.gnu.org/

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 072726f..f1c7788 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -11,7 +11,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 SRCREV = "b576fa87c140b824466ef1638e945e87dc5c0343"
 PV = "20150728+git${SRCPV}"
 
-SRC_URI = "git://git.sv.gnu.org/config.git \
+SRC_URI = "git://git.savannah.gnu.org/config.git \
            file://gnu-configize.in"
 
 S = "${WORKDIR}/git"
-- 
1.9.1


