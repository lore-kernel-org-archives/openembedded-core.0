Return-Path: <B40290@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe005.messaging.microsoft.com [207.46.163.28])
	by mail.openembedded.org (Postfix) with ESMTP id A7BB461883
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 08:19:58 +0000 (UTC)
Received: from mail62-co9-R.bigfish.com (10.236.132.232) by
	CO9EHSOBE019.bigfish.com (10.236.130.82) with Microsoft SMTP Server id
	14.1.225.22; Wed, 31 Jul 2013 08:19:58 +0000
Received: from mail62-co9 (localhost [127.0.0.1])	by mail62-co9-R.bigfish.com
	(Postfix) with ESMTP id 93708A0158	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 08:19:58 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h8275bh1de097hz2dh2a8h668h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail62-co9 (localhost.localdomain [127.0.0.1]) by mail62-co9
	(MessageSwitch) id 1375258797399696_23876;
	Wed, 31 Jul 2013 08:19:57 +0000 (UTC)
Received: from CO9EHSMHS032.bigfish.com (unknown [10.236.132.240])	by
	mail62-co9.bigfish.com (Postfix) with ESMTP id 5A293B0004E	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 08:19:57 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS032.bigfish.com
	(10.236.130.42) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 31 Jul 2013 08:19:57 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.136.1; Wed, 31 Jul 2013 08:19:56 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r6V8JqiS016790;	Wed, 31 Jul 2013 01:19:53 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Jul 2013 16:19:43 +0800
Message-ID: <1375258783-9009-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] base-files: remove symbolic link from /etc/mtab to /proc/mounts
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
X-List-Received-Date: Wed, 31 Jul 2013 08:19:59 -0000
Content-Type: text/plain

    *If /etc/mtab is a symlink to /proc/self/mounts,
     mounting fails because addmntent returns an error.
     As a consequence, the Private directory is unusable
     because /proc/self/mounts is read-only feature.

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 054fefa..1843bdd 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -100,7 +100,6 @@ do_install () {
 	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
 	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
 
-	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
 }
 
 do_install_basefilesissue () {
-- 
1.7.5.4



