Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id ECAF77F45C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 10:29:48 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id v15so81285823wml.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2019 03:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BS4esew3RWVRUex9CRupxjw28vQYOasgcWvZ5Uv/KXo=;
	b=a45mRyM3zUcrzFU1OPnmwJb11linz9ldoRtZZUvuLywna2m4H1wuE5z1N4bWd0IggZ
	7swwnw1RZUWaAi0pkEGMIBbUesv7aB05uOD5D04P5iQLkFBzlZe7zi52dTGrKhCJ39Th
	M6MBi8GSYM7NnufjBwt18eukeC/bXahWVg68MWrlG8/EagaguqBOhaMu9Qe4Ar8sMrBt
	+tebxMIBeCZ3+uWcO+vAP2MxKV6zSpkuNM7xQX+P0ihtreMYOS0wvMMAkPBCrBoikeb7
	F0hMq3MHF9o0FK0ZJ/Y0fL4p8jdlao6bEMM3LkJ9MqjY+BEd+YAn0ZZqjUdH021wtIAf
	HwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BS4esew3RWVRUex9CRupxjw28vQYOasgcWvZ5Uv/KXo=;
	b=U8+nP0CmrLlLkMRZfL/6ICKCYlHzgIiIqiIQvNE30mjwmJTfNHwvenXkZfvXxCBF26
	bnXl3aYr+IdJAoF0xiKChbxW+k8s0YGy8l0/SzVikWYQb2H+S9+u13L1dVi/SXMJzbbZ
	spddOUWqnj7OVpqYWWop7N2lJn4XbIzm1Co713uTeBgvZkFwDUAOF+Wu68wJeHE79bTh
	0rvAaobnXyO7Q2WHXP56fKyqHiPwsgtEP4FqC5hAPd049ZmFzt1GxEPeaYk5iVCcKcxd
	5iH4Hc1HX6SIHacxLxN8d3jL8B8P/J15SIemxHkm2sjNHcxUaAvNRtmgDNocrxlPdNNS
	54XA==
X-Gm-Message-State: APjAAAWZCql6GLAWiOEWBH8meYHT059l+t1f+2mQMoHjFWG19kBxQcNf
	XBn6IyZjphwsxVrcFjbqM8dHqvl5Jqq0+w==
X-Google-Smtp-Source: APXvYqydgVlhpahr4zSjF0msSXyXXj6SE3V2doV2M0BiZVG8hEIUs5R6Hiwkv0rjnFpD2g7DRwVPuA==
X-Received: by 2002:a1c:b146:: with SMTP id a67mr9819893wmf.124.1565173789523; 
	Wed, 07 Aug 2019 03:29:49 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o3sm79705336wrs.59.2019.08.07.03.29.48
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 03:29:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Aug 2019 12:29:39 +0200
Message-Id: <20190807102939.12760-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807102939.12760-1-alex.kanavin@gmail.com>
References: <20190807102939.12760-1-alex.kanavin@gmail.com>
Subject: [PATCH 7/7] bluez5: correct the python3 runtime dependency
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
X-List-Received-Date: Wed, 07 Aug 2019 10:29:50 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 28aaeea418f..bffd174c0a0 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -139,7 +139,7 @@ def get_noinst_tools_paths (d, bb, tools):
 
 FILES_${PN}-noinst-tools = "${@get_noinst_tools_paths(d, bb, d.getVar('NOINST_TOOLS'))}"
 
-RDEPENDS_${PN}-testtools += "python3 python3-dbus"
+RDEPENDS_${PN}-testtools += "python3-core python3-dbus"
 RDEPENDS_${PN}-testtools += "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'python3-pygobject', '', d)}"
 
 SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'bluetooth.service', '', d)}"
-- 
2.17.1


