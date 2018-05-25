Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5624E745B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 22:07:25 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id a3-v6so2817492pgt.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 15:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MKkfQLqld2NybfZDHxVY26MSMamXJqTlP2OhNhDMv+k=;
	b=hAXMdBRI/rTvt2ZDK4vOUTMFbDUgwtrVlLaB2slvSpS3uchtjMPy0bZsy7Vi1dlAcT
	jA+DVnFpfO5oyX02nEIEQ4I7NuARTMf9EOZJvFQohnR4R+Y1Q+S56NndHtHfCj7/Nxxt
	5+rZ54j/IDYRP+Vt1SbmGvzkwUQIIHpdEKMH+nsNF5MFHe1DuDwGzj/EwGfsCjowgLHz
	nExLWa337IKT2+a/zI965UB1aZRENccXaYspXzHS7a9p6TIc3iduCOb3KmPX5lc+RoDK
	MUUcFTuLz3hpAygd9XaRGJG5yR6HQnzgNlAI7qJ5OXCQBwrUFoV5a31KcDT459Bu/OSz
	AiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MKkfQLqld2NybfZDHxVY26MSMamXJqTlP2OhNhDMv+k=;
	b=gbmN7FoxR8JxMRyfdj3agUFc8eyHJGizgUWde+vypMSihI3n9Sr6vAjWlogg1gImFQ
	sEgsopcGImPdE7l3Y6UzoGMin5ZiLp6fCPDrJ0fjlsOKDTnHeeCOLCEMU+ZfNeIo7s/w
	ToxSlr6Ij7Op8+qfR2jjIXaYzyFvTa6auIBfBhAgMskhmAIOADNtg0uYaEaXWPGAV4lN
	uqmKl/reffqIzLks9gPxg5rIUir5hTeeUSeg7dvhnYU9peLXvT5pdS3Qz5Jv4QTQaqhI
	vDRZblXuDjcqEdE7PKqOvZ8B1KsFTyIJzqGmTVNpe41Anpl28SjKeqWopwwv76cR1qlH
	3EVA==
X-Gm-Message-State: ALKqPwerTUOcsdr2DDXluMNDbIGr94sdCRNc+azWezoczzaXTuQtFl6W
	XMmN/nzM5F3GmiFyaf4JV7w+ZQ==
X-Google-Smtp-Source: AB8JxZrma0aMnUQy88dCDOKDZtPUxt7MrQ/rxy5zspumanwvnzt/e9xMhOpVOozbOxJfVqybJHf3fA==
X-Received: by 2002:a65:65c8:: with SMTP id
	y8-v6mr3354380pgv.320.1527286046830; 
	Fri, 25 May 2018 15:07:26 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	m5-v6sm5664347pfa.93.2018.05.25.15.07.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 May 2018 15:07:26 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 15:07:20 -0700
Message-Id: <1527286040-11947-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] openssh: drop sshd support for DSA host keys
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
X-List-Received-Date: Fri, 25 May 2018 22:07:26 -0000

DSA keys have been deprecated for some time:

  https://www.gentoo.org/support/news-items/2015-08-13-openssh-weak-keys.html

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh/sshd_check_keys | 8 --------
 meta/recipes-connectivity/openssh/openssh/sshd_config     | 1 -
 meta/recipes-connectivity/openssh/openssh_7.6p1.bb        | 1 -
 3 files changed, 10 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
index 5463b1a..be2e2ec 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
@@ -60,9 +60,6 @@ done
 HOST_KEY_RSA=$(grep ^HostKey "${sshd_config}" | grep _rsa_ | tail -1 | awk ' { print $2 } ')
 [ -z "${HOST_KEY_RSA}" ] && HOST_KEY_RSA=$(grep HostKey "${sshd_config}" | grep _rsa_ | tail -1 | awk ' { print $2 } ')
 [ -z "${HOST_KEY_RSA}" ] && HOST_KEY_RSA=$SYSCONFDIR/ssh_host_rsa_key
-HOST_KEY_DSA=$(grep ^HostKey "${sshd_config}" | grep _dsa_ | tail -1 | awk ' { print $2 } ')
-[ -z "${HOST_KEY_DSA}" ] && HOST_KEY_DSA=$(grep HostKey "${sshd_config}" | grep _dsa_ | tail -1 | awk ' { print $2 } ')
-[ -z "${HOST_KEY_DSA}" ] && HOST_KEY_DSA=$SYSCONFDIR/ssh_host_dsa_key
 HOST_KEY_ECDSA=$(grep ^HostKey "${sshd_config}" | grep _ecdsa_ | tail -1 | awk ' { print $2 } ')
 [ -z "${HOST_KEY_ECDSA}" ] && HOST_KEY_ECDSA=$(grep HostKey "${sshd_config}" | grep _ecdsa_ | tail -1 | awk ' { print $2 } ')
 [ -z "${HOST_KEY_ECDSA}" ] && HOST_KEY_ECDSA=$SYSCONFDIR/ssh_host_ecdsa_key
@@ -79,12 +76,7 @@ if [ ! -f $HOST_KEY_ECDSA ]; then
     echo "  generating ssh ECDSA key..."
     generate_key $HOST_KEY_ECDSA ecdsa
 fi
-if [ ! -f $HOST_KEY_DSA ]; then
-    echo "  generating ssh DSA key..."
-    generate_key $HOST_KEY_DSA dsa
-fi
 if [ ! -f $HOST_KEY_ED25519 ]; then
     echo "  generating ssh ED25519 key..."
     generate_key $HOST_KEY_ED25519 ed25519
 fi
-
diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_config b/meta/recipes-connectivity/openssh/openssh/sshd_config
index 31fe5d9..b7c3ccd 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_config
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_config
@@ -22,7 +22,6 @@ Protocol 2
 #HostKey /etc/ssh/ssh_host_key
 # HostKeys for protocol version 2
 #HostKey /etc/ssh/ssh_host_rsa_key
-#HostKey /etc/ssh/ssh_host_dsa_key
 #HostKey /etc/ssh/ssh_host_ecdsa_key
 #HostKey /etc/ssh/ssh_host_ed25519_key
 
diff --git a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb b/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
index e11e8d7..a527a7c 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
@@ -110,7 +110,6 @@ do_install_append () {
 	install -m 644 ${D}${sysconfdir}/ssh/sshd_config ${D}${sysconfdir}/ssh/sshd_config_readonly
 	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config_readonly
 	echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
-	echo "HostKey /var/run/ssh/ssh_host_dsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 	echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 	echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 
-- 
1.9.1


