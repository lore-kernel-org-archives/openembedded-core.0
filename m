Return-Path: <pidge@toganlabs.com>
Received: from egyptian.birch.relay.mailchannels.net
	(egyptian.birch.relay.mailchannels.net [23.83.209.56])
	by mail.openembedded.org (Postfix) with ESMTP id CFE2E77A91
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 11:35:39 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pidge@toganlabs.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 529BA7C3B13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 11:28:26 +0000 (UTC)
Received: from hp181.hostpapa.com (unknown [100.96.133.151])
	by relay.mailchannels.net (Postfix) with ESMTPA id C1E417C3AB6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 11:28:25 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pidge@toganlabs.com
Received: from hp181.hostpapa.com (hp181.hostpapa.com [172.20.72.20])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
	by 0.0.0.0:2500 (trex/5.7.37); Tue, 28 Mar 2017 11:28:26 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|pidge@toganlabs.com
X-MailChannels-Auth-Id: hostpapa
X-Army-Relation: 41f4d2cd174b7938_1490700506058_1359228810
X-MC-Loop-Signature: 1490700506058:894512875
X-MC-Ingress-Time: 1490700506057
Received: from ns325767.ip-37-187-157.eu ([37.187.157.197]:37755
	helo=ns325767.ovh.net) by hp181.hostpapa.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-SHA256:128) (Exim 4.87)
	(envelope-from <pidge@toganlabs.com>)
	id 1cspIU-000UTE-QP; Tue, 28 Mar 2017 13:28:23 +0200
From: Elizabeth 'pidge' Flanagan <pidge@toganlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 13:40:51 +0200
Message-Id: <1490701251-20408-2-git-send-email-pidge@toganlabs.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1490701251-20408-1-git-send-email-pidge@toganlabs.com>
References: <1490701251-20408-1-git-send-email-pidge@toganlabs.com>
X-OutGoing-Spam-Status: No, score=5.0
X-AuthUser: pidge@toganlabs.com
Subject: [PATCH 2/2] bitbake.conf: Add aws-cli support
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
X-List-Received-Date: Tue, 28 Mar 2017 11:35:40 -0000

This commit adds aws-cli support to bitbake in order to support
the s3 fetcher in bitbake.

Signed-off-by: Elizabeth 'pidge' Flanagan <pidge@toganlabs.com>
---
 meta/conf/bitbake.conf | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fa5445b..f21b8d3 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -458,8 +458,8 @@ HOSTTOOLS += " \
     bash sh cut sed gcc ld git rm install which find xargs cat true mktemp \
     grep tar gzip touch cp mv basename dirname tr getopt sort awk head tail \
     mkdir patch uniq perl python chmod python3 ar strip expr ls make as \
-    ranlib egrep echo chown cpio tee wc wget bzip2 stat date rmdir od diff \
-    md5sum dd chrpath file pod2man gunzip python2.7 ln g++ [ false true \
+    ranlib egrep echo chown cpio tee wc wget aws bzip2 stat date rmdir \
+    od diff md5sum dd chrpath file pod2man gunzip python2.7 ln g++ [ false true \
     uname test hostname nm objdump objcopy cmp printf env readlink gawk fgrep \
     expand pwd sleep diffstat chgrp flock ldd strings rpcgen du makeinfo \
     getconf mknod cpp readelf split \
@@ -640,6 +640,7 @@ FETCHCMD_cvs = "/usr/bin/env cvs"
 FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate"
 FETCHCMD_bzr = "/usr/bin/env bzr"
 FETCHCMD_hg = "/usr/bin/env hg"
+FETCHCMD_s3 = "/usr/bin/env aws s3"
 
 SRCDATE = "${DATE}"
 SRCREV ??= "INVALID"
-- 
1.9.1


