Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RadWa-00057D-JL
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 02:20:48 +0100
Received: by ghrr15 with SMTP id r15so256527ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 17:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=LYSUzat+ANpM9JKB9/kuBPWox8NpYfBU2kRtCTSlFAY=;
	b=vdS3QOKWCJFMqNB24Peh/4Iu+6Mv5ri20aMoWokcrZY/JMhL2CG2BdawX4IO4bWJN/
	R4fRnjsrWIGhmPo5OHhb/G+d2YP9lHvUUlxmh4Fl292MkpxtNBwoPzKyq2kehNqDh6Ce
	6wfi8HhYlKYujPzy12HbDQpZkPzK1OnLFs0b4=
Received: by 10.236.197.9 with SMTP id s9mr8049667yhn.71.1323825232142;
	Tue, 13 Dec 2011 17:13:52 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q52sm1308849yhh.3.2011.12.13.17.13.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 17:13:51 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2011 01:13:36 +0000
Message-Id: <cover.1323825176.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/3] Remove PRIORITY field set as optional as it is the default
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
X-List-Received-Date: Wed, 14 Dec 2011 01:20:48 -0000

The following changes since commit b9dfccc018f32a47fc045f35d5f53d7269d791ed:

  gdk-pixbuf: Ensure the binaries can be relocated (2011-12-13 18:00:18 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (3):
  grub-efi-native_1.99.bb: drop 'PRIORITY = "optional"' as it is the
    default
  grub_1.99.bb: drop 'PRIORITY = "optional"' as it is the default
  icecc-create-env-native_0.1.bb: drop 'PRIORITY = "optional"' as it is
    the default

 meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |    1 -
 meta/recipes-bsp/grub/grub_1.99.bb                 |    1 -
 .../icecc-create-env-native_0.1.bb                 |    1 -
 3 files changed, 0 insertions(+), 3 deletions(-)

-- 
1.7.2.5



