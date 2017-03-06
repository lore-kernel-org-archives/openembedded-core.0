Return-Path: <freesilicon@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 482E577682
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 08:47:42 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id u48so111194557wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 00:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Z5Ehj2CQ7a4JMjrkH/Q6q6YPX6jkvwLwLhoMiNJmCZU=;
	b=JUOk60Ht805T0oqppN0sikB9L2kzWr6j0AjgRHnHoqiDk27H6W9W4z5KDiVj68+YHT
	87Jdjp8Gd3tOkG4yJGvE5TE8T6qtxQTG0LMJKLb/0tDUvnjG6+H3mKzabz/nOeU84KBh
	xeQj1FsA4JjYDZawf0IWG/fJ2h0JB6YJ29K5moW4I66oG8zqKhFFmIfynivqyi7EKQ6o
	NnJjORQbp3mIq6WoykCNeWRcXTqxsN+721B5JX8dEHPosVaT9ipyJFRdkAvbXgtjbHDN
	w26tEL3n3x/hGbNGes8aYPVI5eIfX1wrL+O6ajA/ya24rfBu2cADl8XBAHFp5HkhqH1W
	++7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z5Ehj2CQ7a4JMjrkH/Q6q6YPX6jkvwLwLhoMiNJmCZU=;
	b=pJB2SRMJXLH8LlX9OXXdWgZ5oz7s5CXrAzBWusSFUJ+s11BBtTeEnEtbI5Y/MBPr8X
	N1GBH04XEgufQw6lZomQaomLqHhzpHpr0MZBWi58dQXjpeI0r7izZzSRk3xCPBVLOmZI
	PoIUb3rFTbLjUPnAn9Sk985QeNeKS4YRBz4TYTE6TOQozU5NTubkpMRNG7prv4CcLprR
	tjSvimZPIXTmJ1kzjh9OS/3ybPWsViJvyxLAy4dZ18eIuU18mUySsJi0F3VvQ39p6HnE
	qKvnm2gCC4Z44l5Tgwu7M386Ld9oiPAvDOZGlkwe0iSx1kujvEb+4xGPfMv9Jx1dTFgO
	LqaQ==
X-Gm-Message-State: AMke39mVugvAVAlYW6LD7o48xhHoIA5OFFSFL/d0dTIQ4OFa/7hFiHy/HBmNvI4InzyUhA==
X-Received: by 10.223.155.129 with SMTP id d1mr6198283wrc.67.1488790063904;
	Mon, 06 Mar 2017 00:47:43 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	x69sm13916067wma.15.2017.03.06.00.47.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Mar 2017 00:47:43 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Mar 2017 09:46:08 +0100
Message-Id: <20170306084611.12507-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH v4 0/3] openssh: Package server configuration
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
X-List-Received-Date: Mon, 06 Mar 2017 08:47:43 -0000

This serie of patches provides a way to package OpenSSH sshd
configuration. This way, it should be easier to change the configuration
either in distro and/or BSP layers.

It also simplifies management of configuration for r/o rootfs.

David Vincent (3):
  openssh: Package server configuration
  core-image: Set default sshd configuration
  rootfs-postcommands: Modify ssh-related commands

 meta/classes/core-image.bbclass                    |  3 +-
 meta/classes/rootfs-postcommands.bbclass           | 17 +++-----
 meta/recipes-connectivity/openssh/openssh_7.4p1.bb | 51 ++++++++++++++++++----
 3 files changed, 50 insertions(+), 21 deletions(-)

-- 
2.12.0


