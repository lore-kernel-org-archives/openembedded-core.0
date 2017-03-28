Return-Path: <pidge@toganlabs.com>
X-Greylist: delayed 424 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Mar 2017 11:35:34 UTC
Received: from egyptian.birch.relay.mailchannels.net
	(egyptian.birch.relay.mailchannels.net [23.83.209.56])
	by mail.openembedded.org (Postfix) with ESMTP id 2277E77A46
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 11:35:34 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pidge@toganlabs.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 44D557C1E99
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 11:28:10 +0000 (UTC)
Received: from hp181.hostpapa.com (unknown [100.96.135.247])
	by relay.mailchannels.net (Postfix) with ESMTPA id E7C347C284E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 11:28:09 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pidge@toganlabs.com
Received: from hp181.hostpapa.com (hp181.hostpapa.com [172.20.66.218])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
	by 0.0.0.0:2500 (trex/5.7.37); Tue, 28 Mar 2017 11:28:10 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|pidge@toganlabs.com
X-MailChannels-Auth-Id: hostpapa
X-Shoe-Squirrel: 04441e24406003e2_1490700490162_942027420
X-MC-Loop-Signature: 1490700490162:895682194
X-MC-Ingress-Time: 1490700490162
Received: from ns325767.ip-37-187-157.eu ([37.187.157.197]:37755
	helo=ns325767.ovh.net) by hp181.hostpapa.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-SHA256:128) (Exim 4.87)
	(envelope-from <pidge@toganlabs.com>)
	id 1cspIH-000UTE-3A; Tue, 28 Mar 2017 13:28:09 +0200
From: Elizabeth 'pidge' Flanagan <pidge@toganlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 13:40:50 +0200
Message-Id: <1490701251-20408-1-git-send-email-pidge@toganlabs.com>
X-Mailer: git-send-email 1.9.1
X-OutGoing-Spam-Status: No, score=5.0
X-AuthUser: pidge@toganlabs.com
Subject: [PATCH 1/2] aws-cli_1.11.66.bb: Initial commit of aws-cli
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
X-List-Received-Date: Tue, 28 Mar 2017 11:35:35 -0000

With fetch2 supporting s3, having an aws-cli recipe makes sense.

Signed-off-by: Elizabeth 'pidge' Flanagan <pidge@toganlabs.com>
---
 meta/recipes-devtools/aws-cli/aws-cli.inc        | 14 ++++++++++++++
 meta/recipes-devtools/aws-cli/aws-cli_1.11.66.bb |  5 +++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-devtools/aws-cli/aws-cli.inc
 create mode 100644 meta/recipes-devtools/aws-cli/aws-cli_1.11.66.bb

diff --git a/meta/recipes-devtools/aws-cli/aws-cli.inc b/meta/recipes-devtools/aws-cli/aws-cli.inc
new file mode 100644
index 0000000..e9a2677
--- /dev/null
+++ b/meta/recipes-devtools/aws-cli/aws-cli.inc
@@ -0,0 +1,14 @@
+SUMMARY = "Amazon Web Services Command Line Interface"
+DESCRIPTION = "The AWS Command Line Interface (CLI) is a \
+unified tool to manage your AWS services." 
+HOMEPAGE = "https://aws.amazon.com/cli/"
+SECTION = "console/utils"
+
+SRC_URI = "https://github.com/aws/${BPN}/archive/${PV}.tar.gz"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=71a3e14f29ac5c23e1b5b934ca4ddfc9"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/aws-cli/aws-cli_1.11.66.bb b/meta/recipes-devtools/aws-cli/aws-cli_1.11.66.bb
new file mode 100644
index 0000000..a96b71e
--- /dev/null
+++ b/meta/recipes-devtools/aws-cli/aws-cli_1.11.66.bb
@@ -0,0 +1,5 @@
+require aws-cli.inc
+
+SRC_URI[md5sum] = "c556adb58d0234eb661520488b9b467f"
+SRC_URI[sha256sum] = "2c1da406203e0a9b5c717004bd463228e4fa4fa8fe47208f0e1836c02bee6f60"
+
-- 
1.9.1


