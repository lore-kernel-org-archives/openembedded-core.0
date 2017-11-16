Return-Path: <vlsireddy@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3CAD878772
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 15:46:43 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id a19so4074983qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 07:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NzsR1XlQt+qKVKjzKFXZ7fzV7yxSJD6jOg/urtGhKZk=;
	b=QRfYjEwXkDZ+yJkl3vvhBCkZabi+PkzZv+d83VyJqpN4gla0QYTIv6lU5plmYWqVBI
	7mw2A6DnpDJTywPcavSPm8ehyzdVmD+zLkmBX/W/0958N1e1SIbssNrtGE2w/dYBkjeR
	LXRV4NA0v8NUakTjNzqyvFFl6aDkxsm+BW2k2LlQ1NcaGyBaAM1UWSwLwzFKk2N0jp5e
	GZ4h6ok9QE4T2oy5y4cE7Dmq/4JhaIVAtoZEnA1dY2wF4c5wF6REIzHVEEnQ68t9SXug
	O//t6ms5liWWSDRn6bMcgzN3fTe48RKowUY2TZEaabDLRJxfKMdNzmFePS/vDZM4kZho
	Si4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NzsR1XlQt+qKVKjzKFXZ7fzV7yxSJD6jOg/urtGhKZk=;
	b=cZ4pfzaIP4WXFB89YNQh/WnA08UGYNowYAxw602gzM2MPg8UoZ/cWRPvCdktjxd6uF
	pJZY7tvmDcwqaLCT5gfz2gbA1OG0vSA5Q97E74W3Nh5yw7pdYSzkAI4OMxe8lawISwHJ
	w+WcvX2MfTwnm1nnmbZYZ8AqIMgb+cevQ8WZ+xzVfzEE3kNA5Dl7kWnYLMisdGezI3Oq
	2rCteraZeaaNuL/q94IELBgz+vwCFUpxxXL2Bti9GKgRExeIY//RlBYaB25HGioG7JgU
	Z8aK0ZOpFyuRyyx3cH6qXwgxpVtCvwXIQzfu7QY8pVJJ56DEeqARCQENOV6mwiMri+wf
	Bqqg==
X-Gm-Message-State: AJaThX7BqmobNguqZZ118FXfQ5nGw3GGXmb4LEbmg+nLXr8JR4W8lClv
	SZaGarUz7r8DZ3EB7ddskFmcJQ==
X-Google-Smtp-Source: AGs4zMb16j1Wi0AHYc23PS/Hn/qHcbu+yAtEbB3lHpsY+K8sU/zddDHUxErnRHNi+6i5IYanYpzzsQ==
X-Received: by 10.200.11.203 with SMTP id p11mr3051510qti.124.1510847204739;
	Thu, 16 Nov 2017 07:46:44 -0800 (PST)
Received: from airvana.wirelessworld.airvananet.com
	(host-131-239-32-100.customer.veroxity.net. [131.239.32.100])
	by smtp.gmail.com with ESMTPSA id
	e204sm972856qkb.25.2017.11.16.07.46.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Nov 2017 07:46:43 -0800 (PST)
From: RC Reddy <vlsireddy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Nov 2017 10:47:29 -0500
Message-Id: <1510847249-15722-1-git-send-email-vlsireddy@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: RC Reddy <vlsireddy@gmail.com>
Subject: [meta-oe][PATCH]ethool updated to 4.13] ethtool bb: upgraded the .bb to pick latest ethtool-4.13.tar.xz
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
X-List-Received-Date: Thu, 16 Nov 2017 15:46:44 -0000

Tests : - Compiled and tested the ethtool 4.13 package from
https://www.kernel.org/pub/software/network/ethtool/ethtool-4.13.tar.xz
using AARCH64 compiler [compilation succeed and also the binary works]

Signed-off-by: RC Reddy <vlsireddy@gmail.com>
---
 meta/recipes-extended/ethtool/{ethtool_4.11.bb => ethtool_4.13.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_4.11.bb => ethtool_4.13.bb} (88%)

diff --git a/meta/recipes-extended/ethtool/ethtool_4.11.bb b/meta/recipes-extended/ethtool/ethtool_4.13.bb
similarity index 88%
rename from meta/recipes-extended/ethtool/ethtool_4.11.bb
rename to meta/recipes-extended/ethtool/ethtool_4.13.bb
index befe9b9..c862a57 100644
--- a/meta/recipes-extended/ethtool/ethtool_4.11.bb
+++ b/meta/recipes-extended/ethtool/ethtool_4.13.bb
@@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[md5sum] = "8f1072679888c9335e49b17efb798b4c"
-SRC_URI[sha256sum] = "af2fd9692f3159d3ab1e41e6f9b7d8db2a4693f1cb22348c88ba89f70f0e6503"
+SRC_URI[md5sum] = "2ba44eb0ca96752392e9bf8dc83ba302"
+SRC_URI[sha256sum] = "d311c4b557c44c5248ac5436b9e19c391a60d8e4830b6a7f41be16d89c0556de"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
1.9.1


