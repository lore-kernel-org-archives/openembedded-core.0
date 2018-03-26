Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id B0076786B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:31:14 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id m68so7577580pfm.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=srSUXhgCPhUE/Kee0F3eXyfmRuLNq8EF69TTLS7EnYc=;
	b=RVOdmU/yfgy24cCiUvhPbkq8P0BL03DEjM/qfOtj3b3RZIyYvfHOTfbTFE+TC3nhF+
	DDGeXqmNX+OfGcS2L12MXW+0asj104tK5lLJq5iQpVMIAAJ5bNewmcv0QbNKlHfHLQT+
	gi6s+uR+qBnB3Q0oIlhKwHUZBrtL/HV5vlX735EDcdagg9KU+87s4ah+l5jolhJWYNRD
	t/vB8SoQM9by4jh8OYElfvJ9uEmgGrCfSk3Bp9LIwErU/XnT3402I24yzP6KIx+BnH8w
	XKUr91FbTCk37RJIykl41DHoknnCyVFHrcIIdFI6C3hxjB3+nxhvq/TrNKT8Xi2w0iZj
	w05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=srSUXhgCPhUE/Kee0F3eXyfmRuLNq8EF69TTLS7EnYc=;
	b=NQI8QClRUsFZFj5X39LM0k5RwwXiJ0uSnaS+1KWXy9P/Wze/QnETTlevhont8TgD3n
	rFR6to+05Xg1D54gZieSh4jFlHG29S3MfPBWAzf02g6M4aqDOtwZxZlR3SGB3GqdIWWS
	OyA+6BdLDa9wmSwVj0z960RagaHjGebhe9zQ7MIahYmit2TnpM2mRebb1um47z1ml5gU
	ggCa4HZpj9TjuHOmow35SLqlWX9urldlvcdbQ8JHA0DNSuZmsRVBusETLVlcce2lBnDM
	skpvbqOnpBpOxzafbCflUv3c/Pq8Hc6+4aW9JdahwJr6pqTRZY49myZ2fMMqdRdyBS0M
	xWrQ==
X-Gm-Message-State: AElRT7F2Kkpmi9m8xHO6+gSGH4KREsyQLYLirXwPTGDZXHtLGnBBZQnJ
	UXjLP8Fxmr8ZPdiIh7eiwdc=
X-Google-Smtp-Source: AG47ELtjxNaM92Njw5iV+QKMSDYcskwWWa0DXKhusEpwUJTZUHcV1ZS/ZT5r0OmssdzzWeaFzyfqwg==
X-Received: by 10.101.88.196 with SMTP id e4mr28127711pgu.162.1522074675917;
	Mon, 26 Mar 2018 07:31:15 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	j11sm29932492pff.94.2018.03.26.07.30.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 07:30:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 07:30:04 -0700
Message-Id: <ec14a3297ff3909783ce84d22e37f97490673dc1.1521989435.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521989435.git.akuster@mvista.com>
References: <cover.1521989435.git.akuster@mvista.com>
Subject: [PATCH 01/21] ltp: add rdepend for procps
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
X-List-Received-Date: Mon, 26 Mar 2018 14:31:14 -0000

ps: invalid option -- 'e'
BusyBox v1.27.2 (2018-03-17 09:07:25 PDT) multi-call binary.

Usage: ps

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/ltp/ltp_20180118.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ltp/ltp_20180118.bb b/meta/recipes-extended/ltp/ltp_20180118.bb
index 028a957..14fb41b 100644
--- a/meta/recipes-extended/ltp/ltp_20180118.bb
+++ b/meta/recipes-extended/ltp/ltp_20180118.bb
@@ -96,6 +96,7 @@ RDEPENDS_${PN} = "\
     logrotate \
     perl \
     python-core \
+    procps \
     unzip \
     util-linux \
     which \
-- 
2.7.4


