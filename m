Return-Path: <pidge@toganlabs.com>
Received: from burlywood.maple.relay.mailchannels.net
	(burlywood.maple.relay.mailchannels.net [23.83.214.26])
	by mail.openembedded.org (Postfix) with ESMTP id 67F3671A19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 13:50:37 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pidge@toganlabs.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id D3B2B363B28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 13:33:06 +0000 (UTC)
Received: from hp181.hostpapa.com (unknown [100.96.128.152])
	by relay.mailchannels.net (Postfix) with ESMTPA id 5F8C136477A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 13:33:06 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pidge@toganlabs.com
Received: from hp181.hostpapa.com (hp181.hostpapa.com [172.20.55.158])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
	by 0.0.0.0:2500 (trex/5.7.37); Wed, 29 Mar 2017 13:33:06 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|pidge@toganlabs.com
X-MailChannels-Auth-Id: hostpapa
X-Battle-Irritate: 5273e258557bb095_1490794386660_2399013042
X-MC-Loop-Signature: 1490794386660:4233268801
X-MC-Ingress-Time: 1490794386659
Received: from ns325767.ip-37-187-157.eu ([37.187.157.197]:40469
	helo=ns325767.ovh.net) by hp181.hostpapa.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-SHA256:128) (Exim 4.87)
	(envelope-from <pidge@toganlabs.com>)
	id 1ctDij-001PlY-Jt; Wed, 29 Mar 2017 15:33:06 +0200
From: Elizabeth 'pidge' Flanagan <pidge@toganlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 15:45:49 +0200
Message-Id: <1490795149-5450-1-git-send-email-pidge@toganlabs.com>
X-Mailer: git-send-email 1.9.1
X-OutGoing-Spam-Status: No, score=5.0
X-AuthUser: pidge@toganlabs.com
Subject: [PATCHv3] bitbake.conf: Add aws to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Wed, 29 Mar 2017 13:50:38 -0000

This adds aws to HOSTTOOLS_NONFATAL in order to get the s3 fetcher
working again.

Signed-off-by: Elizabeth 'pidge' Flanagan <pidge@toganlabs.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 96a9ed9..d95e39d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -469,7 +469,7 @@ HOSTTOOLS += " \
 HOSTTOOLS += "ip ping ps scp ssh stty"
 
 # Link to these if present
-HOSTTOOLS_NONFATAL += "ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
+HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
 
 # Temporary add few more detected in bitbake world
 HOSTTOOLS_NONFATAL += "join nl size yes zcat"
-- 
1.9.1


