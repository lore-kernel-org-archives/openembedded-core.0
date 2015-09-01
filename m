Return-Path: <philip.balister@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2329376A51
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 13:47:27 +0000 (UTC)
Received: by qkcj187 with SMTP id j187so39758910qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 06:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=BB4vA/fC5Mpoa490Eo4r9JQ6wPPUxuopm3Q/G7tJ7xs=;
	b=d20lgEak/se69KAoEVB1Yo8Ja3Q3c1zdEhIpqbENpruZ5t84kjt6ZZWzL6QlQo/2nX
	NPCWnz9USNeiAl7/8jKEeSSXHG/9K37ySzA5vvmp4lHyS0OekOK/UGTFiXNT8pLO/tyZ
	6NKDfykCwhn/GrkzokwG1ExJVDdteSIDyKY7O0OJq9NDngWt06texx0nbm7OuZ5csilD
	7K6CbTWA60aXPaM5Z6ys5RwTT83qqQuVxidOZuJ8ALzEVDBtJ/Icp8g4wl+bS1tnqgf5
	zXwcY4hpv1dy6AxLBKiXjLlUFVKh5qTwyPVzseY+Wv/N4yzPKoTmnDnzGb9SuO3oiZhO
	26dQ==
X-Received: by 10.55.52.12 with SMTP id b12mr19962816qka.21.1441115247496;
	Tue, 01 Sep 2015 06:47:27 -0700 (PDT)
Received: from thuvia.localdomain
	(pool-108-44-118-114.ronkva.east.verizon.net. [108.44.118.114])
	by smtp.gmail.com with ESMTPSA id f9sm10768378qhe.7.2015.09.01.06.47.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Sep 2015 06:47:26 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Sep 2015 09:47:22 -0400
Message-Id: <1441115242-10592-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] libevent_2.0.22.bb: Add native and nativesdk support to the recipe.
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
X-List-Received-Date: Tue, 01 Sep 2015 13:47:31 -0000

Build tested against thrift recipe under development.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/recipes-support/libevent/libevent_2.0.22.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libevent/libevent_2.0.22.bb b/meta/recipes-support/libevent/libevent_2.0.22.bb
index 2f49293..58c263c 100644
--- a/meta/recipes-support/libevent/libevent_2.0.22.bb
+++ b/meta/recipes-support/libevent/libevent_2.0.22.bb
@@ -28,6 +28,8 @@ inherit ptest
 
 DEPENDS = "zlib"
 
+BBCLASSEXTEND = "native nativesdk"
+
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/test
 	for file in ${B}/test/.libs/regress ${B}/test/.libs/test*
-- 
2.1.0


