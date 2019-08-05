Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 27FE77F343
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 11:57:34 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id f17so72693686wme.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 04:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4FNr/ZZyBb4od389x7YcbueEPD1Bx5mDl6E7qK7Ve0w=;
	b=uJpD8QgFqxQ7C0bbubmwFlPZb6PDRLUMPNp7hUon/VilMAz5bD4XivztSOrOvYbkSu
	6ysNZkCT3AFvAMMerlV70SXc3Lr4HcPDfrHyo1wbr9UGKorUT1FwP8dcULr7o3rUXZkl
	H7sLN3s0+zgZHFCQfny+kbQPPaES4rtxYD/O/ieYHtC1RAM1CN2n/Jif7x7IZzEBRbeD
	hOg5Yusd3uyh4r7yxkQ6sfljjPQusC93Dbvb76Qi/j3xeaAZV8kva74JQ7lrmw680/zv
	qCB3C+iyHzTd5FbT1zYWYaMongvMSbh1Yy4ci5vDaJbWJhDCkLIK9cTsKOARvBO4WXcU
	o5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4FNr/ZZyBb4od389x7YcbueEPD1Bx5mDl6E7qK7Ve0w=;
	b=UQuINUAosb1BNm9vJ909TVJnCwCfDrmb5aci6we9x1e150++yqhlX9ggK5h4qx6d+K
	pCQHt1kDLJzCxpczrTPxxGeZn403zAL2vvrIvuJFfhcP9Aqn7go/I9WBaIirRdFl6Njf
	fYWX+mZroDZtyLLbRKFspwIprFUrQahT6p02I+61uxAU+7Hc1is9hyVqIF4SLOQOioyW
	ST4kwqEQuRZECGNEpDk/bwQc+NaKzneMjDaMZiO9Vc6Io2pGsBV1Pasr92Qb86sMq9LC
	ajk7GiqxyJFS9SF7KBJUV52IPMsQ1MCgxZBCrCDrrh5UoMY5kX6yqjAg9PM+847v3Wwu
	DrEQ==
X-Gm-Message-State: APjAAAUyeqhzku4r0OWDB3bBRGDloXiG+LF1WxpbhLtGnNp4J+jTKFIn
	xmz+nfjpKGkSV1MxujNKBQL6uxz6CZU=
X-Google-Smtp-Source: APXvYqziR2QISwLCa7/LxsEKyhaCjRqJZeA735e5UlwPcYItVif8pvrqKzvJgyGuTta7ZD8+dfhj8Q==
X-Received: by 2002:a1c:7c08:: with SMTP id x8mr18590260wmc.19.1565006254570; 
	Mon, 05 Aug 2019 04:57:34 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 5sm71884733wmg.42.2019.08.05.04.57.33
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 05 Aug 2019 04:57:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org,
	open.source@oleksandr-kravchuk.com
Date: Mon,  5 Aug 2019 13:57:28 +0200
Message-Id: <20190805115728.31260-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] maintainers.inc: give python recipes to Oleksandr Kravchuk
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
X-List-Received-Date: Mon, 05 Aug 2019 11:57:34 -0000

Derek Straka has been inactive for about a yer; Oleksandr
has been the de facto maintainer meanwhile.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 60 ++++++++++++------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0df1d8c929b..bc13be2fd4f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -586,38 +586,38 @@ RECIPE_MAINTAINER_pn-ptest-runner = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-pulseaudio = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-pulseaudio-client-conf-sato = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-puzzles = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-python = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python-native = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python-nose = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python-numpy = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python-scons = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python-scons-native = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python-setuptools = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3 = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-async = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-dbus = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-docutils = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-extras = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-file-utils = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-git = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-gitdb = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-iniparse = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-mako = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-native = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-nose = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-numpy = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-pbr = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-pip = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-pycairo = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-pygments = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-pygobject = "Derek Straka <derek@asterius.io>"
+RECIPE_MAINTAINER_pn-python = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python-native = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python-scons = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python-scons-native = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3 = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-async = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-dbus = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-docutils = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-file-utils = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-native = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-pbr = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-pip = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-pycairo = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-pygobject = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-scons = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-scons-native = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python3-setuptools = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-six = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-smmap = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-subunit = "Derek Straka <derek@asterius.io>"
-RECIPE_MAINTAINER_pn-python3-testtools = "Derek Straka <derek@asterius.io>"
+RECIPE_MAINTAINER_pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-six = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-smmap = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-subunit = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-testtools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-qemu = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-qemu-helper-native = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-qemu-native = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-- 
2.17.1


