Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7B35E65DA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 08:33:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAE8XG5T013089
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 00:33:16 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 14 Nov 2014 00:33:16 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Nov 2014 16:35:15 +0800
Message-ID: <9cb8e916d701dab7ea9f2796621a94ba45029591.1415953970.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415953970.git.Qi.Chen@windriver.com>
References: <cover.1415953970.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] util-linux: use ALTERNATIVE mechanism to manage 'nologin'
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
X-List-Received-Date: Fri, 14 Nov 2014 08:33:17 -0000
Content-Type: text/plain

Both shadow and util-linux provide 'nologin' command, so use the
ALTERNATIVE mechanism in OE to manage it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index ffb84c4..900d73b 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -169,7 +169,7 @@ ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root"
 ALTERNATIVE_${PN} += "mkfs.minix hexdump last logger mesg renice wall"
-ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject getopt sulogin"
+ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject getopt sulogin nologin"
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
@@ -181,6 +181,7 @@ ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
 ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
+ALTERNATIVE_LINK_NAME[nologin] = "${sbindir}/nologin"
 ALTERNATIVE_TARGET[getopt] = "${bindir}/getopt"
 
 ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 utmpdump.1 reset.1"
-- 
1.9.1


