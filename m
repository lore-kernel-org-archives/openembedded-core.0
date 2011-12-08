Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RYgCN-0007g0-A0
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 16:47:51 +0100
Received: by ghrr13 with SMTP id r13so1562133ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 07:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=kGvCUjZIyDQCEvErpr3Z2zfsmNJdmpudVamjkFj0IvU=;
	b=Jeq6iSfKsESL3iKpAefcYUDpomcJALI/wpjK/ljen3mMHJpravYbLh44jAuxGypp+d
	fiwJtkGS0XVOIg0ReCT1tJzzO7qoQ31PAX2ZtpNJAn5bcwO8i2WKOnOi2j4Sm3k/EbxW
	LKnlfbeAZS29Pbr8nm/73k+yTKNt4hIX0GIfg=
Received: by 10.236.135.77 with SMTP id t53mr5316718yhi.49.1323358860472;
	Thu, 08 Dec 2011 07:41:00 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 32sm15415340anu.10.2011.12.08.07.40.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Dec 2011 07:40:59 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2011 15:40:46 +0000
Message-Id: <cover.1323358819.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/3] Misc fixes/improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Dec 2011 15:47:51 -0000

The following changes since commit 60f0b866b4b7c4aa337a2ff764455741a73665da:

  package.bbclass: Adding license collection (2011-12-08 15:23:58 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (3):
  cross.bbclass: add virtclass handler
  dosfstools: update native to 2.11
  scripts/send-pull-request: allow sending of patches without a cover
    letter

 meta/classes/cross.bbclass                         |   50 +++++++++++++
 .../dosfstools/dosfstools-native_2.10.bb           |   19 -----
 .../dosfstools/dosfstools/2.6.20-syscall.patch     |   72 -------------------
 .../dosfstools/dosfstools-2.10-kernel-2.6.patch    |   74 --------------------
 .../dosfstools/dosfstools/mkdosfs-bootcode.patch   |   68 ++++++++----------
 .../dosfstools/dosfstools/mkdosfs-dir.patch        |   62 ++++++++---------
 .../recipes-devtools/dosfstools/dosfstools_2.10.bb |   24 ------
 .../recipes-devtools/dosfstools/dosfstools_2.11.bb |   11 ++-
 scripts/send-pull-request                          |   21 +++---
 9 files changed, 131 insertions(+), 270 deletions(-)
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools-native_2.10.bb
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/2.6.20-syscall.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/dosfstools-2.10-kernel-2.6.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools_2.10.bb

-- 
1.7.2.5



