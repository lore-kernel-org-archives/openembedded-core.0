Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7051C6D350
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 06:53:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAL6rWBt012251
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 22:53:33 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 22:53:32 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 00:53:26 -0600
Message-ID: <1385016807-21986-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1385016807-21986-1-git-send-email-mark.hatle@windriver.com>
References: <1385016807-21986-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/2] acpid: fix acpid boot error
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
X-List-Received-Date: Thu, 21 Nov 2013 06:53:33 -0000
Content-Type: text/plain

From: Baogen Shang <baogen.shang@windriver.com>

when booting board,the acpid daemon display some error information.
the information as follow:
acpid: opendir(/etc/acpi/events): No such file or directory
the path "/etc/acpi/events" does not exist,so building the directory
to fix the bug.

Signed-off-by: Baogen Shang <baogen.shang@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
---
 meta/recipes-bsp/acpid/acpid/init      | 1 +
 meta/recipes-bsp/acpid/acpid_1.0.10.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/acpid/acpid/init b/meta/recipes-bsp/acpid/acpid/init
index 9f2c0d4..726d9ff 100755
--- a/meta/recipes-bsp/acpid/acpid/init
+++ b/meta/recipes-bsp/acpid/acpid/init
@@ -2,6 +2,7 @@
 
 test -x /usr/sbin/acpid || exit 0
 test -d /proc/acpi || exit 0
+mkdir -p /etc/acpi/events
 
 case "$1" in
   start)


