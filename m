Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 78933786DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 18:28:48 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id j7so10770146ita.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 10:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YN3yZGUdHT9kYTP8zbVt/hCgFhkP+LjuY4U1PeEuUaQ=;
	b=ski8VoAdmxAFj+GI4YsJnDRx0caASllPcR0h7kNCFp4gJYdDbJ0P9uRxY7ECJickLp
	wNZmeFA884ldoay9goUYj1uxHxjpJtzfabg5u/SHQivQAyE5kZqLzfZd4WYWcdiCigrf
	zcGSLaFNqFwRZIG7+mNAT/sBFz2PJEuKyKTpPDkLoPE9f4A1HsIoFKP5LFKZ+uOI9sEp
	xwF6OLx2hDnAJE9IWxM38zpqu80575VNg3VoxUDEB2qE9bi1d9rGTDN3rX7L2HZbVNop
	dGjQF86ugFIXr1yueiSV24wj6wMmwQQ/jAU3pVMnDaB7E73uVkYimR+oVyIpQ8sxYmE9
	3dTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YN3yZGUdHT9kYTP8zbVt/hCgFhkP+LjuY4U1PeEuUaQ=;
	b=N3BWxj7JuSJkEpDmYzhPK0qGcGBIKxu5+ykrhGClw8R3V5L6uNdcUhKmdcRixr8pJ3
	JyMJHGSoINefdSWuLXRa05CHxRT8R9Y0OzaxKRJzgJWYjg7mhGRc8soDRUzuIxLypb20
	1s93elDqWZzMvo2QTYlkZt5Vk4FQjtjGmyWrIhynHZXONsknwr5z6nMV44zRZQzaAr8+
	O1mpMMkqGb63yO3iCHTjs6ZI+ZiaM/cWXCizFq7RAG2/ihDUOmLtwJrdjDIHBg/VI5Cs
	Rzu7785et+tsrHBGaKS+HMR6ECLtPL6VOUANta0JTAftooBJP+MpfWrX3iBKiU+2FCMS
	Wf8g==
X-Gm-Message-State: APf1xPAO73mQmCvn7a/Ou0dB/Dgo70xikey5rl00QS4QHF0iupCam6ET
	zJX0VbBJjdH7V+MJpliYrwT9r0Z0
X-Google-Smtp-Source: AH8x225u7tkhQoqMGve87ySjw1Z1f4R5ouBBb4cH9Xg/xatoWWKhZtZU0S5jmmfAzkuG4ms6kQkJQg==
X-Received: by 10.36.210.130 with SMTP id z124mr13656731itf.116.1519669729449; 
	Mon, 26 Feb 2018 10:28:49 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g65sm5837956itd.3.2018.02.26.10.28.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 26 Feb 2018 10:28:48 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 12:28:28 -0600
Message-Id: <20180226182828.31421-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Cc: alexander.kanavin@intel.com
Subject: [PATCH] maintainers: Change icecc-create-env maintainer
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
X-List-Received-Date: Mon, 26 Feb 2018 18:28:48 -0000

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 50392487903..16bd9fc6b0e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -266,7 +266,7 @@ RECIPE_MAINTAINER_pn-help2man-native = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-hicolor-icon-theme = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-hwlatdetect = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-i2c-tools = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-icecc-create-env = "Alexander Kanavin <alexander.kanavin@intel.com>"
+RECIPE_MAINTAINER_pn-icecc-create-env = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-icon-naming-utils = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-icu = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-ifupdown = "Maxin B. John <maxin.john@intel.com>"
-- 
2.14.3


