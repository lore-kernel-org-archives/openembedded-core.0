Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 74EC07C6F1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 18:07:45 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id r124so2225991pgr.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 11:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ON7CEHfvI0RyUn/jMJEixqmXzw70McC28uBhjex40Ws=;
	b=S2RIuP4g0VqyodeSlailUGx1zM6alnXBkwHXtNTN4NtmlmaIg0pld1/sAoOT6tutAm
	f8sVU4GDh3NuTqYYih+2D/SeWEYbMSbEQA4dOpJfwr+ygDd8xahf2GEvums8ZMdg+5mI
	wofA0c4Ydmwn2RGOISAD9yGkCj2tlKWJ/9VnvQimpn2DNC4gYvRCrisBLkP53Tp5y+VL
	Qvs2D046LLxx7kIzJ7LsZH+VbDsVFrbc47YZgZ+u86JtiFrLnqvK2Iwa0H9T8gZcTs8F
	dgpX3RuTEtZKVsPdLn6QuxEU+fengwzqZ6G5Pdw16zIONOhQRuSgLLuCcW5TJt0xUetA
	YyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ON7CEHfvI0RyUn/jMJEixqmXzw70McC28uBhjex40Ws=;
	b=qx9M/KOLx1sbEe9IXGUq2eGas6kmhIVfECUevxF4tcWcoqCF+G/B0XhIJlX08aiYnl
	qyahGBOmf2yY8Wa6/ET37BQaCNGAgC7HAxT17BKxfFM2KIrWhtqtUUwjxsTWO64P1wXr
	gTwwd8SObpczxFkrQTjZgqVtBFi1CxlOtVQ4caDk7SxgGKmSx7TpyPNmV0FD69fOPBgc
	S8kCDVWG6TxMG8lrqWUh7x+i2TEREiROlp/QPyeRwP3T7Dt0xfyW83Ov/ZAfdAgPz0IO
	ae1H5/dZAaWbC2k8O/OFscWbfb6nyrXFEnJd+Nh9/HrWMBARqYFpy7j6TCTuBOuvrgek
	bCqg==
X-Gm-Message-State: APjAAAXJ6vUuEOwXEN1hnIU/i7nfrdueuosNocF50BU0HAeSgVKv24FL
	BPs+SQI4ensUIikvYKWXCkEBGB/r
X-Google-Smtp-Source: APXvYqyvitzi60Dbm5gv8PbkGtUw1hzJ+rRkMeizW8emds3BtP9wwGYfZLiZs4MYvzL2Z6HczVTpQA==
X-Received: by 2002:a63:5149:: with SMTP id r9mr838276pgl.142.1552241265476;
	Sun, 10 Mar 2019 11:07:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:18fc:c150:6496:1a0d])
	by smtp.gmail.com with ESMTPSA id y6sm5999607pfy.87.2019.03.10.11.07.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Mar 2019 11:07:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2019 11:07:32 -0700
Message-Id: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 01/12] xhost: update to 1.0.8
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
X-List-Received-Date: Sun, 10 Mar 2019 18:07:45 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-app/{xhost_1.0.7.bb => xhost_1.0.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xhost_1.0.7.bb => xhost_1.0.8.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-app/xhost_1.0.7.bb b/meta/recipes-graphics/xorg-app/xhost_1.0.8.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-app/xhost_1.0.7.bb
rename to meta/recipes-graphics/xorg-app/xhost_1.0.8.bb
index 77490f5..26bec3f 100644
--- a/meta/recipes-graphics/xorg-app/xhost_1.0.7.bb
+++ b/meta/recipes-graphics/xorg-app/xhost_1.0.8.bb
@@ -13,8 +13,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8fbed71dddf48541818cef8079124199"
 DEPENDS += "libxmu libxau"
 PE = "1"
 
-SRC_URI[md5sum] = "f5d490738b148cb7f2fe760f40f92516"
-SRC_URI[sha256sum] = "93e619ee15471f576cfb30c663e18f5bc70aca577a63d2c2c03f006a7837c29a"
+SRC_URI[md5sum] = "a48c72954ae6665e0616f6653636da8c"
+SRC_URI[sha256sum] = "a2dc3c579e13674947395ef8ccc1b3763f89012a216c2cc6277096489aadc396"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.7.4


