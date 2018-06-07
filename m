Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id E27497852F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 18:48:55 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id c41-v6so6681030plj.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2018 11:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xuuLr50dUSa9j7RhhquhMPvQiYoRxlU/w5JMXFYypPc=;
	b=OZFHVCWrO8XLKBRG9ofhvs/f9KnSRdJqG4wcjuIfKrQ1ZrrvNK5wYeWjWrZJi8Fww+
	InjsSNNC7qwXqcoKx3vyDmtqdcfd+qiSzS34k/3a1GqYvNQ9au3qDm8UvU6GMJ50+E/S
	kgj4PL4FGi8aCZnLOSWjZRKxUH+qeMSXesw+QExac829/y2Gm0bh5W84TCeSGxr+nWqJ
	caMoc6EEOeGnyjtgw7a8DO+zfm5jm5rWg9UEeU3OiUVlqk+6XPepkVS1V1D+hA9dhgj6
	Hyp5z15d4xGzxGJzvn7/QCZqi/bKz7A70mktND6/gO4XKtbQ8WyB3y6HfASWzPteeEKj
	KRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xuuLr50dUSa9j7RhhquhMPvQiYoRxlU/w5JMXFYypPc=;
	b=qQP1V5wuqpyWeTdpCAxg0oVDZgWK1bxQkIeMI2DwEse7b7GO2RYtGiVd8nlPpkmOby
	52x3NQ29M0gnEEbpN393j88lE8WcsgOfBXnGuZWxJdP9hJJYudCZvipeGdLYGCVnGOyB
	2HTLhiue+aCBNzO80ccJHo1+2JiZbX7LZtIYqfiHunLH8hTdusB+sNsTZ2IV1Ljwaqz/
	v600Kspbi1spZnfh60jEJP6aFy1RDtwTwF6qLIWXe+pssO/9sDlNtJStynndUW/FH+n9
	TM5D2rJ8ULpF+VnB5QlK5hINI4Kze11Os4oI+lvXrA+UcZQzsTrOs0LYJkoZD0QVwiOS
	W5IQ==
X-Gm-Message-State: APt69E3YxAWIIhhHxOG7T9aLqx6NWwQU+1ispluuMgZEqII63BbSCRcm
	cgQ1/d/CmfauqukJ9TVjbssk5Q==
X-Google-Smtp-Source: ADUXVKKiLJ69OJAWbxu5Ff4S7yrxVfWS2b4zZWS/xXEtciTb7TiJxs13Tbh28cLQGqvC5ZMny50Qxw==
X-Received: by 2002:a17:902:9883:: with SMTP id
	s3-v6mr3251881plp.194.1528397337043; 
	Thu, 07 Jun 2018 11:48:57 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	f30-v6sm27103558pgn.76.2018.06.07.11.48.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jun 2018 11:48:56 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2018 11:48:40 -0700
Message-Id: <1528397320-32269-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1528397320-32269-1-git-send-email-armccurdy@gmail.com>
References: <1528397320-32269-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 7/7] rootfs-postcommands.bbclass: drop obsolete sshd UseDNS rootfs postprocessing
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
X-List-Received-Date: Thu, 07 Jun 2018 18:48:56 -0000

The sshd UseDNS option has defaulted to "no" since openssh 6.8p1,
so it's no longer necessary to postprocess the rootfs to force the
option:

  https://www.openssh.com/txt/release-6.8

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/rootfs-postcommands.bbclass | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 221869e..9d4d95e 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -36,11 +36,6 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd"
 
 ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
 
-# Disable DNS lookups, the SSH_DISABLE_DNS_LOOKUP can be overridden to allow
-# distros to choose not to take this change
-SSH_DISABLE_DNS_LOOKUP ?= " ssh_disable_dns_lookup ; "
-ROOTFS_POSTPROCESS_COMMAND_append_qemuall = "${SSH_DISABLE_DNS_LOOKUP}"
-
 # Sort the user and group entries in /etc by ID in order to make the content
 # deterministic. Package installs are not deterministic, causing the ordering
 # of entries to change between builds. In case that this isn't desired,
@@ -171,12 +166,6 @@ ssh_allow_empty_password () {
 	fi
 }
 
-ssh_disable_dns_lookup () {
-	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
-		sed -i -e 's:#UseDNS yes:UseDNS no:' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
-	fi
-}
-
 python sort_passwd () {
     import rootfspostcommands
     rootfspostcommands.sort_passwd(d.expand('${IMAGE_ROOTFS}${sysconfdir}'))
-- 
1.9.1


