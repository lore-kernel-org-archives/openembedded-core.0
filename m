Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 547B07E5F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 22:56:35 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id x15so14226676pgg.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uUFWjicUcz/el1VQtZcwjdn0/TaVn3qdgv4MZ/vYBig=;
	b=JIxYwRb4alJ9DUE9IauaPUQSVn+xcXcIU4iMD+2MQoMThoXvMrsxwqESqLPwxsMPtM
	naZ4xWn5jZOSGW0HjapNIX0Rm1CDErzsB6s/G8mNqyJk65BAbgVXbGXN6V+S39N8n6X4
	sqYK/ylf9RkqhKJyqMyM82L9wSrs2OXpzjFUkACQcgL/wPn3BXLQN8urBok4knqjWVNW
	gLSD8yqcoDTjO732gIgTOcM62fhG5f5d3BXp5p5y+SrXG5b7IDafpuLS5s6TM52hTRrm
	rlPf2ytkBFyCipxWz9fDV9XmHvvANai/g9kkNCxKykBkcNiyRWLXqZNwTyJh2Iyqk9Bh
	BVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uUFWjicUcz/el1VQtZcwjdn0/TaVn3qdgv4MZ/vYBig=;
	b=MVVNFcmvB9bOZv3rlHrPKnzp73t4KLACfSplM3ClA1p2HMdjSyjGJk3lVA/PH3Ibgq
	4x9jMX/Z0pigxMmCnCRQHfD31UEDQTKTYrUl7cltVRuhwW5ufvCMnmxp9FCmJKJ6Ocb8
	JYWTUNQztYvlmN6x/eQLtm09XfFhh00MGqzQZ0jfuNM5X7HtTR+mSkCifnVbaJ/Q5779
	quQqOvmqZWMQQ9DqClDc7HiuZORKUW7Ra29bQnoBLkcGOWVKUeGZFQyxGxIPVXlAZCYT
	HDOG7viYtuLQ8NNJ7Y6ajfswxjDnuw2CFQHBkXkoAYtZMEWg6bQwc6DxNghfolz+7/lQ
	z+tw==
X-Gm-Message-State: APjAAAXkURrT9vemKMnbZfIpk43VAbDJj0Ur5M+llrFK0EtZULDm/jNY
	dqs6ZsG98jN8JndYtuQ4yrZWTprA
X-Google-Smtp-Source: APXvYqwsVIcRmse7Yqj/FQOn95fOCxfLTdTB7tj3kPxgFTybAvrykTN/yMtznERnE5snt3wt4By1FA==
X-Received: by 2002:aa7:9e05:: with SMTP id y5mr54290783pfq.38.1568328996095; 
	Thu, 12 Sep 2019 15:56:36 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id t5sm314024pjw.15.2019.09.12.15.56.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Sep 2019 15:56:35 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2019 15:56:24 -0700
Message-Id: <20190912225624.28572-3-armccurdy@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190912225624.28572-1-armccurdy@gmail.com>
References: <20190912225624.28572-1-armccurdy@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] busybox-inittab: minor formatting tweaks
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
X-List-Received-Date: Thu, 12 Sep 2019 22:56:35 -0000
Content-Transfer-Encoding: 8bit

Add an empty line to inittab before the line(s) which start getty.

Also cleanup indent in recipe do_install().

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../busybox/busybox-inittab_1.31.0.bb         | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.31.0.bb b/meta/recipes-core/busybox/busybox-inittab_1.31.0.bb
index c347daf501..61fb8cbad1 100644
--- a/meta/recipes-core/busybox/busybox-inittab_1.31.0.bb
+++ b/meta/recipes-core/busybox/busybox-inittab_1.31.0.bb
@@ -13,15 +13,16 @@ do_compile() {
 }
 
 do_install() {
-    install -d ${D}${sysconfdir}
-    install -D -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
-    tmp="${SERIAL_CONSOLES}"
-    for i in $tmp
-    do
-            j=`echo ${i} | sed s/\;/\ /g`
-            id=`echo ${i} | sed -e 's/^.*;//' -e 's/;.*//'`
-            echo "$id::respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
-    done
+	install -d ${D}${sysconfdir}
+	install -D -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
+	tmp="${SERIAL_CONSOLES}"
+	[ -n "$tmp" ] && echo >> ${D}${sysconfdir}/inittab
+	for i in $tmp
+	do
+		j=`echo ${i} | sed s/\;/\ /g`
+		id=`echo ${i} | sed -e 's/^.*;//' -e 's/;.*//'`
+		echo "$id::respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
+	done
 }
 
 # SERIAL_CONSOLES is generally defined by the MACHINE .conf.
-- 
2.23.0


