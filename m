Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A90116E66E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 01:22:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t131MQGG014044
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Feb 2015 17:22:26 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 2 Feb 2015 17:22:25 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Feb 2015 17:22:22 -0800
Message-ID: <a0891364184e121af5992a984e08440c4ce3c46b.1422926504.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422926504.git.liezhi.yang@windriver.com>
References: <cover.1422926504.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] binconfig-disabled.bbclass: fix echo command
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
X-List-Received-Date: Tue, 03 Feb 2015 01:22:27 -0000
Content-Type: text/plain

The ">" should be ">>".

We had got something like the following in pcap-config:
echo '--should-not-have-used-/usr/bin/pcap-config'
exit 1

(Lacks of #!/bin/sh)

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 20150202

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/binconfig-disabled.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/binconfig-disabled.bbclass b/meta/classes/binconfig-disabled.bbclass
index 0acc964..595cd09 100644
--- a/meta/classes/binconfig-disabled.bbclass
+++ b/meta/classes/binconfig-disabled.bbclass
@@ -12,7 +12,7 @@ do_install_append () {
 		echo "#!/bin/sh" > ${D}$x
 		# Make the disabled script emit invalid parameters for those configure
 		# scripts which call it without checking the return code.
-		echo "echo '--should-not-have-used-$x'" > ${D}$x
+		echo "echo '--should-not-have-used-$x'" >> ${D}$x
 		echo "exit 1" >> ${D}$x
 	done
 }
-- 
1.7.9.5


