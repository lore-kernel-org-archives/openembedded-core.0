Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8673C62133
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 14:21:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2GELCNu006157
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 07:21:12 -0700 (PDT)
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 07:21:11 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Mar 2017 10:20:56 -0400
Message-ID: <1489674056-21470-6-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489674056-21470-1-git-send-email-paul.gortmaker@windriver.com>
References: <1489674056-21470-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] sysklogd: use update-alternatives for more manpages
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
X-List-Received-Date: Thu, 16 Mar 2017 14:21:11 -0000
Content-Type: text/plain

To fix:

   file /usr/share/man/man8/syslogd.8 conflicts between attempted installs
   of inetutils-doc-1.9.4-r0.core2_64 and sysklogd-doc-1.5.1-r0.core2_64

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/recipes-extended/sysklogd/sysklogd.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index f9af0a4833de..78b8d7a98529 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -64,6 +64,9 @@ ALTERNATIVE_PRIORITY = "${@bb.utils.contains('DISTRO_FEATURES','systemd','10','1
 ALTERNATIVE_${PN} = "syslogd klogd syslog-conf \
     ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','syslog-init','',d)}"
 
+ALTERNATIVE_${PN}-doc = "syslogd.8"
+ALTERNATIVE_LINK_NAME[syslogd.8] = "${mandir}/man8/syslogd.8"
+
 ALTERNATIVE_LINK_NAME[syslogd] = "${base_sbindir}/syslogd"
 ALTERNATIVE_LINK_NAME[klogd] = "${base_sbindir}/klogd"
 ALTERNATIVE_LINK_NAME[syslog-init] = "${sysconfdir}/init.d/syslog"
-- 
2.7.4


