Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8A6D2606A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 07:55:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2T7t3Lx019056
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 00:55:03 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 29 Mar 2016 00:55:03 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Mar 2016 00:55:01 -0700
Message-ID: <4618757d9910b199d7bf79235efd9bf0b2514da2.1459237938.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1459237938.git.liezhi.yang@windriver.com>
References: <cover.1459237938.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] runqemu: fix for iso
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
X-List-Received-Date: Tue, 29 Mar 2016 07:55:04 -0000
Content-Type: text/plain

It should be the similar type as hddimg, rather than ext234 or btrfs.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index ab7c4f3..49ccd18 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -125,10 +125,10 @@ while true; do
             [ -z "$MACHINE" -o "$MACHINE" = "$arg" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
             ;;
-        "ext"[234] | "jffs2" | "nfs" | "btrfs" | "iso")
+        "ext"[234] | "jffs2" | "nfs" | "btrfs")
             check_fstype_conflicts $arg
             ;;
-        "hddimg" | "hdddirect" | "wic" | "vmdk" | "qcow2" | "vdi")
+        "hddimg" | "hdddirect" | "wic" | "vmdk" | "qcow2" | "vdi" | "iso")
             check_fstype_conflicts $arg
             IS_VM="true"
             ;;
-- 
2.7.4


