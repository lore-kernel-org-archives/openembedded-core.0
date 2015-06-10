Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E566B60670
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 07:34:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5A7YMJ5024034
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 00:34:22 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 10 Jun 2015 00:34:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jun 2015 00:34:19 -0700
Message-ID: <60fa3f123ff45ab9bac61d5cc9cc05450ca6e7f7.1433921605.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433921605.git.liezhi.yang@windriver.com>
References: <cover.1433921605.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] sysstat: DEPENDS on base-passwd
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
X-List-Received-Date: Wed, 10 Jun 2015 07:34:21 -0000
Content-Type: text/plain

Fixed:
| install -m 644 -g man man/sa1.8 /path/to/tmp/work/i586-poky-linux/sysstat/11.1.4-r0/image/usr/share/man/man8
| install: invalid group `man'

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/sysstat/sysstat.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 566cb08..4063007 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -8,6 +8,8 @@ SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.xz \
            file://99_sysstat \
           "
 
+DEPENDS += "base-passwd"
+
 inherit autotools-brokensep gettext
 
 EXTRA_OECONF += "--disable-sensors"
-- 
1.7.9.5


