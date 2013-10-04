Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qe0-f48.google.com (mail-qe0-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id D4AC5610FC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 22:23:08 +0000 (UTC)
Received: by mail-qe0-f48.google.com with SMTP id nd7so3505739qeb.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Oct 2013 15:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=8LNbCojWk3UJCYh8TXYHv4JzS78i3B0A7Vpcu1KhIag=;
	b=N/mBZB1LRAPsXuerjA3fAdpsT6B63EipYOOwbP491KWoV15wUsgMEQpofXE/eIg6hj
	3EZWuClTZkIX1icz3Yin+Xffxpd9Pa5WdleLlCPmeIzgGspTq5wCpkeToPDix8cQtsVH
	miX6BOnYeiHSD/YrPYFEel0Ub1Wp10vHBjnbB42GOHb/ohy4GKD55y6gFDL3KCOhdhEJ
	AhQUWBLrj4enJuSSHGjCKRjACnci55Gqpb9xa+BujyEdCzfX++ZjKtmqmSWcjp29BRg3
	lgJWvpbGQiC2dqYmDtEi1RCf5eYKecZYp8PrGNf2UDUJ5jCESf8mAs7767M/qMX33XPW
	C2mA==
X-Received: by 10.224.60.199 with SMTP id q7mr22202420qah.80.1380925390227;
	Fri, 04 Oct 2013 15:23:10 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id n9sm33626784qag.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Oct 2013 15:23:09 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  4 Oct 2013 19:22:45 -0300
Message-Id: <1380925365-18427-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] oe-buildenv-internal: Add UBOOT_CONFIG to environment whitelist
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
X-List-Received-Date: Fri, 04 Oct 2013 22:23:09 -0000

The uboot-config class uses the UBOOT_CONFIG environment setting to
choose which U-Boot option is intended to build. It is convenient to
allow it to be set from the shell, as supported for MACHINE.

This allow, for example, to trigger a build as:

,----
| MACHINE=imx28evk UBOOT_CONFIG=nand bitbake core-image-minimal
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/oe-buildenv-internal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index bba6f8f..f8840c1 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -106,4 +106,4 @@ export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC HTTP_PROXY http_proxy \
 HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy FTPS_PROXY ftps_proxy ALL_PROXY \
 all_proxy NO_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY \
 SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE GIT_PROXY_COMMAND \
-SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR"
+SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR UBOOT_CONFIG"
-- 
1.8.4.rc3


