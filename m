Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 952AC7FD82
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 22:18:02 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c9so7531689wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 14:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yQXPsREUHODavD7tg4UfuIM5P87IWrvXXRBbvr0LzpA=;
	b=dkLW2YqBV0fW2a7Rml8rpgzQxsVhj4MmP2ypNWjb5hiEAlIHtWuPKvE1VF06FvsZ7+
	4Ji6iYObX1WxCNWG9Z/JEM2nP0WAyBqiZIINVhCYhRnATq9cmaSJM9YZ0c5MufsY7EmA
	lUyWTxvaGWNz/yKJtRbN+RKftq5VQoD5IeY5PBvh1p6C8t4dmgrmYVCxfD4bwyFmeboV
	unc0wRrpI3htwB+IJvepLzlZ6En7hP/EL/GQv5Yc1VzXtGofYWNarhGO2lgqKQ6vrwaj
	bKF1CiOi+6IHflQotQyZNXlwfsobyEo5q7qtc3FdJ4fCKghQYJgEx+HBuOQeeaXtpZ1h
	bJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yQXPsREUHODavD7tg4UfuIM5P87IWrvXXRBbvr0LzpA=;
	b=XhwNDGxHmIDQ4+6oeVFyk+OsnEX0B+Qzjm1zHDD1SesYcfbjt00C337X+CfQIFaY2K
	toJajZ7IZ1tc5HZ0Cv93iRQ5tiuYJHTiz5H273E8srnyNoA6MoiLQSliWh/GALUMkH90
	wKdB2jDOKolgUGEA8C+azUdcKqUQeJamIKiKJpRR1udDNhQor11iMd+1BcO641eZwKis
	nl6+fJXlq3QFetmdNcbafmZXk91fhSfG/IJM2gMaecogZNyHKr9BdkRW2KA/lh/Z7vaX
	at8Vzx0SugL2adJzXSDZugEPRmHB9/F4y4ulJAMIq5u2G9Y68e1GRHgtEWNm2gtD1z6c
	BzfQ==
X-Gm-Message-State: APjAAAVXfUdmy/QCw05HVTh7w/78EDMNyBvYgibez6OBGQlYHS2WNZlS
	ummGBnslXlf8E0WHOy74hxBA7TlY
X-Google-Smtp-Source: APXvYqyfGow7AObiwDPVzvMMfAmEobvYZ3MbvoH8saiFu/cHk+caaH6OUTwm37xkHyUPvwyfwhlZKQ==
X-Received: by 2002:adf:f448:: with SMTP id f8mr12223900wrp.263.1576793883109; 
	Thu, 19 Dec 2019 14:18:03 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	p15sm7501324wma.40.2019.12.19.14.18.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 14:18:02 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 22:17:48 +0000
Message-Id: <20191219221748.27079-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219221748.27079-1-alex.kiernan@gmail.com>
References: <20191219221748.27079-1-alex.kiernan@gmail.com>
Subject: [PATCH 2/2] rootfs-postcommands: Enable rootfs_check_host_user_contaminated
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
X-List-Received-Date: Thu, 19 Dec 2019 22:18:02 -0000

Enable rootfs_check_host_user_contaminated by default

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/rootfs-postcommands.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 2f171836fa0c..2c0f16cebd4c 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -37,7 +37,7 @@ POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
 SYSTEMD_DEFAULT_TARGET ?= '${@bb.utils.contains("IMAGE_FEATURES", "x11-base", "graphical.target", "multi-user.target", d)}'
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; systemd_create_users;", "", d)}'
 
-ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
+ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile; rootfs_check_host_user_contaminated;'
 
 # Sort the user and group entries in /etc by ID in order to make the content
 # deterministic. Package installs are not deterministic, causing the ordering
-- 
2.17.1


