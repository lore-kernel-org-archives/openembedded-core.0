Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PzRGS-0005Z3-Hm
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 11:14:08 +0100
Received: by bwz10 with SMTP id 10so363080bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 03:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=ymZfzk1EjihZJtBihYlpCt1hny4424AFCsF9IHCfu3o=;
	b=PFGCUSfAtTQDfhdDmkVX6hGThqTsayVNu14cYszMcZW2925f/JHUmT2yiuI51ItCeZ
	iZKPGw6ehEv9HuE1eI5z0s2mSMYPATfvKrTKWQ+Xnum9LAU6hlUYBC2Yz1/sJIWvJK2I
	2Fa1KnoV3QOgYd+3Cp19gyx612cl1JTxhhLIY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=fB4HMkerf2DY0XhQFboQwSwFngudqMhoGf1mJ7Pj/ddkkDcpsqocHiARvb2fyWP2Ke
	V9RHFXsa/9ik6VPKikl3Y5av+mSgMUqUYWZeiLAOpISNhrAHSPA/c4F7HtUX4tA3HGGD
	IIRM8LlNrMZtSiiVSJm/GdOgUCIe8FwY8avd4=
Received: by 10.204.75.88 with SMTP id x24mr5243636bkj.158.1300183946675;
	Tue, 15 Mar 2011 03:12:26 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id q18sm5838421bka.15.2011.03.15.03.12.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 03:12:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2011 11:12:19 +0100
Message-Id: <cover.1300183818.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PULL][PATCH 0/3] util-linux: Cleanup of unused files
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
X-List-Received-Date: Tue, 15 Mar 2011 10:14:08 -0000

Remove files not used in SRC_URI

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: jansa/util-linux
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/util-linux

Thanks,
    Martin Jansa <Martin.Jansa@gmail.com>
---


Martin Jansa (3):
  util-linux: remove unused files from files directory
  util-linux: remove unused files from util-linux-2.17.2 directory
  util-linux: move remaining files from files directory to
    util-linux-2.17.2 for faster lookup

 .../util-linux/files/debian-bug392236.patch        |  203 --------------------
 .../util-linux/files/fdiskbsdlabel_thumb.diff      |   12 --
 .../recipes-core/util-linux/files/fix-make-c.patch |   41 ----
 meta/recipes-core/util-linux/files/gcc34.patch     |   23 ---
 meta/recipes-core/util-linux/files/glibc-fix.patch |   22 --
 .../util-linux/files/optional-uuid.patch           |   55 ------
 meta/recipes-core/util-linux/files/umount.diff     |   19 --
 meta/recipes-core/util-linux/files/uuid.patch      |   22 --
 .../{files => util-linux-2.17.2}/MCONFIG           |    0
 .../{files => util-linux-2.17.2}/defines.h         |    0
 .../{files => util-linux-2.17.2}/make_include      |    0
 .../{files => util-linux-2.17.2}/swapargs.h        |    0
 .../util-linux/util-linux-2.17.2/tls.patch         |   70 -------
 13 files changed, 0 insertions(+), 467 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/files/debian-bug392236.patch
 delete mode 100644 meta/recipes-core/util-linux/files/fdiskbsdlabel_thumb.diff
 delete mode 100644 meta/recipes-core/util-linux/files/fix-make-c.patch
 delete mode 100644 meta/recipes-core/util-linux/files/gcc34.patch
 delete mode 100644 meta/recipes-core/util-linux/files/glibc-fix.patch
 delete mode 100644 meta/recipes-core/util-linux/files/optional-uuid.patch
 delete mode 100644 meta/recipes-core/util-linux/files/umount.diff
 delete mode 100644 meta/recipes-core/util-linux/files/uuid.patch
 rename meta/recipes-core/util-linux/{files => util-linux-2.17.2}/MCONFIG (100%)
 rename meta/recipes-core/util-linux/{files => util-linux-2.17.2}/defines.h (100%)
 rename meta/recipes-core/util-linux/{files => util-linux-2.17.2}/make_include (100%)
 rename meta/recipes-core/util-linux/{files => util-linux-2.17.2}/swapargs.h (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux-2.17.2/tls.patch

-- 
1.7.4.1



