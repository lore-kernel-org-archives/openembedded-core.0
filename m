Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id C673865C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 11:03:32 +0000 (UTC)
Received: by wibbs8 with SMTP id bs8so6064550wib.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2015 03:03:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bpq1BCIO/8nVvhk4fE0ZCNenA6rh8Lzkjngm2kI9hwI=;
	b=gJt8AnQk2/3JC+Hz1JHaEXP9wYzMaFvLaNt7gG64gPJ0ydFHFlwJziMWXoGQ6eHrHL
	fJI04VLK5MllN96Zn6VUJggR7nXImHNMcMIXwWyJ4uX4l6L4koLco/TNN6od0vIVOU1D
	YOsMPy5HrWb5fkSZtYgUJVXJG1n3WRRtZf42nElxEsr/y+2FPTDpO67e/UD+SaIUNcbQ
	P26rSDxyOQrcxwI37T65050Z0UKbYGdSmA//Qk7W58Di65rkeV2mq1V7a8nS/c9FABXw
	OYd5kT/4jS5AE60x6hicMQqbBc2hl0Yqa1Ms+PJTqsH8BlvgB5yxNGXx78/4HrRgm6+M
	2pQQ==
X-Gm-Message-State: ALoCoQnN2w5aEXnY6N9p3b5rZJGFdiYmYPZIKuc0Vu/QQQD/t4QPnUOu42QNEskeEK8PgRyAxgaM
X-Received: by 10.194.88.131 with SMTP id bg3mr17539228wjb.119.1425553413639; 
	Thu, 05 Mar 2015 03:03:33 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id kr5sm10010497wjc.1.2015.03.05.03.03.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 03:03:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Mar 2015 11:00:58 +0000
Message-Id: <1425553258-2941-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] gdb: add whitespace to _append
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
X-List-Received-Date: Thu, 05 Mar 2015 11:03:39 -0000

Add leading whitepace to EXTRA_OECONF_append so it doesn't rely on the original
value ending with trailing whitespace.  Spotted by Robert P. J. Day.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 844dce9..4fd60a6 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -11,7 +11,7 @@ RDEPENDS_${PN} += "nativesdk-python-core nativesdk-python-lang nativesdk-python-
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 
-EXTRA_OECONF_append = "--with-python=${WORKDIR}/python"
+EXTRA_OECONF_append = " --with-python=${WORKDIR}/python"
 
 SSTATE_DUPWHITELIST += "${STAGING_DATADIR}/gdb"
 
-- 
1.7.10.4


