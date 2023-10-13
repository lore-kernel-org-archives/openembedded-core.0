Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB638CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 09:03:08 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.34375.1697187783818744907
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 02:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="137480407"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="137480407"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 18:03:02 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DCFFCDDC64
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:02:58 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1714ED9A89
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:02:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 55D5520050184;
	Fri, 13 Oct 2023 18:02:57 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] openssh: upgrade 9.4p1 -> 9.5p1
Date: Fri, 13 Oct 2023 17:02:38 +0800
Message-Id: <1697187758-4439-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10--8.205600-10.000000
X-TMASE-MatchedRID: 82BO9bqjodKjz0nOeth/yUIIxwDaU5mrmZiw53dqSN+e38zXnNg9Q4O3
	HyUMPRbHvrBV8+rZuUPcL6ACd2BGu/XNEkgZOg/Ofc7cX82yHHms4IQYg+G3CEZCAhWuYEvk+BM
	UD0RbBaxei9k/Ct78UrhrwPZ8pqtZ0PbfMyDUCcRoMLOoNHsM9m+twLxyosqh2Rj4ohvEzHMdq6
	xnvK2Wy84b571oAike56H4KF+Err1DfKpRuRX+oCrLqyE6Ur/jP8UQejhp29pGH1Y2a6Iqt7vpa
	egzCez+u8ifaWw+xYgL7O7jOvy7FS8RBbzC4lPfXRdl4he6rQiEDRWMikvPrzKIerHAhfYxhU5Y
	xdCU9R9ny03aprSl5L+NGXTE0PnNH/XdxG/McYEapIb9znReAzYvC/PFFfSAxqfnM6P/ymW4kRS
	Z1g8ZJavl7CrHADp9Dcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZcFfXzPlfY7e+l5wW
	trjgOtFOqCrCUH7Igua2HxxNDjveVHGbcDbAq6FEUknJ/kEl4BpRCTkRk5SfoLR4+zsDTtyMdyH
	Kes7lsoy/4iXIghdQXwLdAPHFLYbyFbDWGEIeeJyP8I/Cx7Ww==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 09:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189044

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Potentially incompatible changes
--------------------------------

 * ssh-keygen(1): generate Ed25519 keys by default. Ed25519 public keys
   are very convenient due to their small size. Ed25519 keys are
   specified in RFC 8709 and OpenSSH has supported them since version 6.5
   (January 2014).
    
 * sshd(8): the Subsystem directive now accurately preserves quoting of
   subsystem commands and arguments. This may change behaviour for exotic
   configurations, but the most common subsystem configuration
   (sftp-server) is unlikely to be affected.

New features
------------

 * ssh(1): add keystroke timing obfuscation to the client. This attempts
   to hide inter-keystroke timings by sending interactive traffic at
   fixed intervals (default: every 20ms) when there is only a small
   amount of data being sent. It also sends fake "chaff" keystrokes for
   a random interval after the last real keystroke. These are
   controlled by a new ssh_config ObscureKeystrokeTiming keyword.
    
 * ssh(1), sshd(8): Introduce a transport-level ping facility. This adds
   a pair of SSH transport protocol messages SSH2_MSG_PING/PONG to
   implement a ping capability. These messages use numbers in the "local
   extensions" number space and are advertised using a "ping@openssh.com"
   ext-info message with a string version number of "0".
    
 * sshd(8): allow override of Subsystem directives in sshd Match blocks.

Bugfixes
--------

 * scp(1): fix scp in SFTP mode recursive upload and download of
   directories that contain symlinks to other directories. In scp mode,
   the links would be followed, but in SFTP mode they were not. bz3611
    
 * ssh-keygen(1): handle cr+lf (instead of just cr) line endings in
   sshsig signature files.
    
 * ssh(1): interactive mode for ControlPersist sessions if they
   originally requested a tty.
    
 * sshd(8): make PerSourceMaxStartups first-match-wins
    
 * sshd(8): limit artificial login delay to a reasonable maximum (5s)
   and don't delay at all for the "none" authentication mechanism.cw
    bz3602
    
 * sshd(8): Log errors in kex_exchange_identification() with level
   verbose instead of error to reduce preauth log spam. All of those
   get logged with a more generic error message by sshpkt_fatal().
    
 * sshd(8): correct math for ClientAliveInterval that caused the probes
    to be sent less frequently than configured.
    
 * ssh(1): fix regression in OpenSSH 9.4 (mux.c r1.99) that caused
   multiplexed sessions to ignore SIGINT under some circumstances.

Portability
-----------

 * Avoid clang zero-call-used-regs=all bug on Apple compilers, which
   for some reason have version numbers that do not match the upstream
   clang version numbers. bz#3584

 * Fix configure test for zlib 1.3 and later/development versions. bz3604

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openssh/{openssh_9.4p1.bb => openssh_9.5p1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.4p1.bb => openssh_9.5p1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.4p1.bb b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_9.4p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.5p1.bb
index e2508aa63a..67087c5157 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
@@ -26,7 +26,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://add-test-support-for-busybox.patch \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            "
-SRC_URI[sha256sum] = "3608fd9088db2163ceb3e600c85ab79d0de3d221e59192ea1923e23263866a85"
+SRC_URI[sha256sum] = "f026e7b79ba7fb540f75182af96dc8a8f1db395f922bbc9f6ca603672686086b"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.34.1


