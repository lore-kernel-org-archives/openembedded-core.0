Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 12E45770A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 14:17:15 +0000 (UTC)
Received: by lbcao8 with SMTP id ao8so144648992lbc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 07:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=piG+nkUeLcLTPKcVfsIRGD0J2FNwjjHyzGl/6A4mOis=;
	b=f0RwL7lLelT6cepXaINhbEMhtwaZGC3PL9lfnYwExqlhTuE3YA9qelPZwiWl3Ez0TC
	sfg429hKKsMbkuAMf70sEDERvcf8MVBpFBuiUpLay4RrmsHLmaHd8sJr/Bxf8OgNXDpE
	qlRLp45pjwx2ulSVurZwPDXiGIBthd9GIc8KvJJcyHHinUTkhLtdCXs9bYBBQDTDdD4g
	sEpo6MAEm2TJqqPuVI6Te90ADE328n6CZ88AmI1qdqc6xW9rnnNOKauvqRCAU6JhAWsj
	gb1jas4IWo0gn9C44o5IkPQ1bh2PnDGEIM0d30UTRULorJ2hp83oBldflA71x3VqFIWS
	gRBA==
X-Received: by 10.112.163.193 with SMTP id yk1mr14776641lbb.1.1445264234966;
	Mon, 19 Oct 2015 07:17:14 -0700 (PDT)
Received: from umbar.auriga.ru ([81.95.26.90])
	by smtp.gmail.com with ESMTPSA id
	yb3sm5452380lbb.39.2015.10.19.07.17.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 07:17:14 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 17:17:10 +0300
Message-Id: <1445264230-1126-3-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1445264230-1126-1-git-send-email-dbaryshkov@gmail.com>
References: <1445264230-1126-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 3/3] local.conf.sample: stop adding libsdl-native to ASSUME_PROVIDED
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
X-List-Received-Date: Mon, 19 Oct 2015 14:17:17 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/conf/local.conf.sample | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 3ae24ab..dfdb912 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -205,7 +205,6 @@ BB_DISKMON_DIRS = "\
 # libsdl library available on your build system.
 PACKAGECONFIG_append_pn-qemu-native = " sdl"
 PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
-ASSUME_PROVIDED += "libsdl-native"
 
 
 # CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
-- 
2.6.1


