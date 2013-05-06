Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UZUWs-0007lw-R4
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 01:09:11 +0200
Received: by mail-pb0-f52.google.com with SMTP id xa7so2236862pbc.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 May 2013 15:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=2fcBAC8pCef9kiwvEE9+FY4qm8PPIZ7FoY/ViY8ApV0=;
	b=VWqwAreN9zMCHYjl76xzXxm9uPWR59Tp7BZ2aBQuWjS0LgaHEv3uwggmaFc7v6Qusd
	eyfFzYLol7YXH9VdgCF6ef/m/BQjYBkdeNX3VyPMWK5Ezj/YWeQTG+l7uPDGGx+yTS5T
	XrtAjiN1VBigeZrKZNkKzCf1m4HpkMYo/bubSwc0TB2fbiY0UUi6d1D5tpGSWrLAKkYC
	yh8qqnL43dhcNcAr/7F5eQRzx25YzP5cZ6mmV16wMnOoQu6Z+QzwFdeB4CjT8//w6n3K
	tPP9NT+h/gjHTj3qohx4e/qnrGFhkyqR7iyGX1nqkkBDHCmS9lMoYVDoBNU0hwNXrcp3
	srqw==
X-Received: by 10.68.172.97 with SMTP id bb1mr27286938pbc.198.1367880670132;
	Mon, 06 May 2013 15:51:10 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id z8sm25500980pbt.23.2013.05.06.15.51.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 06 May 2013 15:51:09 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 09:03:15 +1000
Message-Id: <1367881396-32227-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH v7 0/1] syslinux: Update to 4.06
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 May 2013 23:09:12 -0000

Just adding the YOCTO bug ID compared to v6.

Jonathan Liu (1):
  syslinux: Update to 4.06

 meta/classes/boot-directdisk.bbclass               |   2 +-
 .../syslinux/files/cross-build.patch               |  71 --
 .../libinstaller-Avoid-using-linux-ext2_fs.h.patch | 975 ---------------------
 .../recipes-devtools/syslinux/files/no-strip.patch |  31 -
 meta/recipes-devtools/syslinux/syslinux_4.03.bb    |  65 --
 meta/recipes-devtools/syslinux/syslinux_4.06.bb    |  62 ++
 6 files changed, 63 insertions(+), 1143 deletions(-)
 delete mode 100644 meta/recipes-devtools/syslinux/files/cross-build.patch
 delete mode 100644 meta/recipes-devtools/syslinux/files/libinstaller-Avoid-using-linux-ext2_fs.h.patch
 delete mode 100644 meta/recipes-devtools/syslinux/files/no-strip.patch
 delete mode 100644 meta/recipes-devtools/syslinux/syslinux_4.03.bb
 create mode 100644 meta/recipes-devtools/syslinux/syslinux_4.06.bb

-- 
1.8.2.1



