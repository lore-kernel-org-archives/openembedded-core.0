Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f194.google.com (mail-ob0-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4F735731C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:47 +0000 (UTC)
Received: by mail-ob0-f194.google.com with SMTP id tr5so2014829obc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=l0VTKRySc+iE7RSaMMQdJ4PunmNRcBDBERVtRvx3mK4=;
	b=LXWsRimU39zd1gDJDSHFHo+Ey30n+HEylZvUebe5bIBr5tf7fNwEZsBG9sOGXpk+IN
	2u8it5y5Ky55oPZBrgzjH2cbNgud6SG94TI/UGQAckTcU2FY8HmV2+oLVLfBIz03+OKN
	bHyQKwZ6LLYqcKvMFKmYbnfHUm0sf2O1EylFpCeSURiuXTE6WQPRalJJmOPMB8m3maAV
	LWDoYXHDTIWSqZeQdSuIdDUC1kfhjDFWY3tki2eoSi7Soy8SKMRKYyC1jgB2wPacs9qi
	m0CFqmTDt/lS9iqR9l+5ZQN/o2rVQB4pXC6ux/eWAuea0CAU1WKSs0HqN7/yEN9pSM2Y
	HaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=l0VTKRySc+iE7RSaMMQdJ4PunmNRcBDBERVtRvx3mK4=;
	b=kEbHcsb6fO/Udy+1aRObixyEpEMKUYwWMLxONIdFbiZH8hqh3b/tgHVe7A/4W3vYG5
	mbcIJaS56jWXaGEXx81aYMFUpGrg/N0IIM8ylDE3lxNgZkbwr3SAD/xvI+YoFemJ86QX
	SMK4qnjyWHt4O3nNt0YRdnFRF0nFqi7oukK9LRzsa0tjL21gqbdVkS0nVXs0nt+81hqQ
	L3NN4RpWWrc+WWhfiR/+800OriEWOUUekq4Tv8DqfzlcFAjBTJTPiYjrqgwfMGuRgZeq
	NOPYfI7UPrFKAWp0L2QIuALPqa9razJ+OZLF3mvfJcpyHop/45LxsEOQCWdzDF4iwweL
	23aw==
X-Gm-Message-State: ALoCoQn85FQ9PO9EfZKD4YNkh68TdmsFjgi/RB/l1n2uoRt8HwUoqB4cTy0BPYs3r2qdDxItYuazyMNZeblduRas02jfBzKzrA==
X-Received: by 10.182.20.98 with SMTP id m2mr30698052obe.61.1453354668251;
	Wed, 20 Jan 2016 21:37:48 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:47 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:40 -0800
Message-Id: <1453354610-19218-23-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 22/32] gstreamer1.0-plugins-base: update 1.6.2 -> 1.6.3
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:47 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...er1.0-plugins-base_1.6.2.bb => gstreamer1.0-plugins-base_1.6.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.6.2.bb => gstreamer1.0-plugins-base_1.6.3.bb} (83%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb
similarity index 83%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb
index e4297cb..95a012e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb
@@ -12,7 +12,7 @@ SRC_URI = " \
     file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
 "
 
-SRC_URI[md5sum] = "f530fbbe287edce79c55a37bd1a39fe2"
-SRC_URI[sha256sum] = "c75dd400e451526ed71e1c4955e33d470a2581f5e71ecf84920a41c0a5c75322"
+SRC_URI[md5sum] = "3ddde0ad598ef69f58d6a2e87f8b460f"
+SRC_URI[sha256sum] = "b6154f8fdba4877e95efd94610ef0ada4f0171cd12eb829a3c3c97345d9c7a75"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
-- 
1.9.1


