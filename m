Return-Path: <pidge@toganlabs.com>
Received: from egyptian.birch.relay.mailchannels.net
	(egyptian.birch.relay.mailchannels.net [23.83.209.56])
	by mail.openembedded.org (Postfix) with ESMTP id C461A77BCD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 09:47:37 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pidge@toganlabs.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E3CC91021D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 09:47:36 +0000 (UTC)
Received: from hp181.hostpapa.com (unknown [100.96.129.119])
	by relay.mailchannels.net (Postfix) with ESMTPA id 6ADFA1031DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 09:47:36 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pidge@toganlabs.com
Received: from hp181.hostpapa.com (hp181.hostpapa.com [172.20.63.14])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
	by 0.0.0.0:2500 (trex/5.7.37); Wed, 29 Mar 2017 09:47:36 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|pidge@toganlabs.com
X-MailChannels-Auth-Id: hostpapa
X-Exultant-Abortive: 2f2b3e9b4ef445f7_1490780856731_3687260011
X-MC-Loop-Signature: 1490780856731:414866610
X-MC-Ingress-Time: 1490780856730
Received: from ns325767.ip-37-187-157.eu ([37.187.157.197]:38354
	helo=ns325767.ovh.net) by hp181.hostpapa.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-SHA256:128) (Exim 4.87)
	(envelope-from <pidge@toganlabs.com>)
	id 1ctACR-000Yle-Ii; Wed, 29 Mar 2017 11:47:32 +0200
From: Elizabeth 'pidge' Flanagan <pidge@toganlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 12:00:08 +0200
Message-Id: <1490781608-1841-1-git-send-email-pidge@toganlabs.com>
X-Mailer: git-send-email 1.9.1
X-OutGoing-Spam-Status: No, score=5.0
X-AuthUser: pidge@toganlabs.com
Subject: [PATCH] bitbake.conf: Add aws to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Wed, 29 Mar 2017 09:47:40 -0000

This adds aws to HOSTTOOLS_NONFATAL in order to get the s3 fetcher
working again. It also sets FETCHCMD_s3 for completions sake.

Signed-off-by: Elizabeth 'pidge' Flanagan <pidge@toganlabs.com>
---
 meta/conf/bitbake.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 96a9ed9..bfa8dd8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -469,7 +469,7 @@ HOSTTOOLS += " \
 HOSTTOOLS += "ip ping ps scp ssh stty"
 
 # Link to these if present
-HOSTTOOLS_NONFATAL += "ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
+HOSTTOOLS_NONFATAL += "ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo aws"
 
 # Temporary add few more detected in bitbake world
 HOSTTOOLS_NONFATAL += "join nl size yes zcat"
@@ -640,6 +640,7 @@ FETCHCMD_cvs = "/usr/bin/env cvs"
 FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate"
 FETCHCMD_bzr = "/usr/bin/env bzr"
 FETCHCMD_hg = "/usr/bin/env hg"
+FETCHCMD_aws = "/usr/bin/env aws"
 
 SRCDATE = "${DATE}"
 SRCREV ??= "INVALID"
-- 
1.9.1


