Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A515C78283
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 07:05:09 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d17so5516355wme.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 00:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9HHnt1srF+eVgL2XM9j65298Tr0UipCuZKiCd0acYbk=;
	b=fW9lO/uFnb1QnsyW/F9q4sR2sJjvMcAQGn4CKhSDmuqYShmH5/32ZNGCcRdyBxbdY9
	q0lwPtnomdlxldolgViNyilpLCDq3bIf6DniUI1CNIDD21zcsAJQ0k8WVlsBttCuBwMv
	4wm8orP8FmP2ih0Ey8aPObkaNrQdWsmnWR6REvtSUWhw0gIqiBreN1kK3oYTsepk0EY1
	lSLBE37/ZohHIrpt7/7IUaSIbXsIz3hqOOayLoZN5OQCGXNA5N8/i0U90KR1b9x7Sw8J
	ycW+6hHDk5z3v9giw1qK2wcBoXLuqifrtGwBqe7P4aQvSa8Tftb+FpX3mGFwHAe4+mDk
	djbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9HHnt1srF+eVgL2XM9j65298Tr0UipCuZKiCd0acYbk=;
	b=sKFUjLblSUH2dPQgQXNJ5AR8rxIbAYSXdUjmvA0LFkUdn6MfmfolRjs/9kA01EjGQG
	mXDycixOV3MySF0+g5WFp25ZVxVhGm3wgTzM+IBr2nMa//sp4Zb8zCP8LQAAoE2JXWDf
	LyjeHKM3oJrthRbdoQoUK7i+YzRDpJIG5JUqXJcYMWhs0g+oItrWQDk+X1pv1mBcae7c
	f4h2zDNCAsve4Zt6MfMDfGpla3aiT+XDewX+qzxVGD7z7gsnM/0B+l5+vbdBIgMsNHv9
	PtvWC4aBk2kUF3SV/uH/YiAf+6YoaJpP5aNkLfJOUfii+c0mXNQ18IfveiIpppuT/qKk
	StTw==
X-Gm-Message-State: AODbwcAinc1yCMEfUEMLuOnYFl8xLIDcWKxVKGp0iIxq6AO0YlIJlh2w
	6DtPqu62WGLlLpKfHPc=
X-Received: by 10.28.170.11 with SMTP id t11mr6099772wme.44.1496991910060;
	Fri, 09 Jun 2017 00:05:10 -0700 (PDT)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id 62sm304574wra.44.2017.06.09.00.05.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 09 Jun 2017 00:05:09 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 09:04:26 +0200
Message-Id: <20170609070429.17376-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH RESEND 0/3] openssh: Package server configuration
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
X-List-Received-Date: Fri, 09 Jun 2017 07:05:10 -0000

This serie of patches provides a way to package OpenSSH sshd configuration. This
way, it should be easier to change the configuration either in distro and/or BSP
layers.
It also simplifies management for R/O rootfs

David Vincent (3):
  openssh: Package server configuration
  core-image: Set default sshd configuration
  rootfs-postcommands: Modify ssh-related commands

 meta/classes/core-image.bbclass                    |  3 +-
 meta/classes/rootfs-postcommands.bbclass           | 17 +++-----
 meta/recipes-connectivity/openssh/openssh_7.5p1.bb | 51 ++++++++++++++++++----
 3 files changed, 50 insertions(+), 21 deletions(-)

-- 
2.13.0


