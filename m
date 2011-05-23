Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QOU4O-0007sw-Kn
	for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 14:17:12 +0200
Received: by yia13 with SMTP id 13so2170550yia.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2011 05:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=6mAvTBy3AQ4yczOLlaK/Kca+CWUJbCiNwXk/kVig1A8=;
	b=csyH3nfM9I0EvyO2lQdTQJNuIOYl/DEYCv1ZVmcZr0sYnVEFVd3E9319cR9EwhVLbS
	ztiVAIEpGcOX0POuY+ceDT1FDxadEFCMxOXbrXCPyJMhzLyiR/WlV2qpswAJ55LPXKwR
	VLo1A38pzC6lTXa3udfVtQyNrI/gRmGe9/fPY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=nEQX7H7/NjcWATFylZLUK2yA3JJESZWmClY/laeHFdLdM3QpS5xhU51WWH6zJpwt5y
	Yt+0XfuGo7Q/Jo0/nQZd9Id2rNt5NZSHmDyyJOq4w3puHP8DPmGwq0MZT0uK7t6uZZs7
	JkcAfVg/bfQ8kfugDPmrz23ZO8N/m9hcatSwM=
Received: by 10.100.29.37 with SMTP id c37mr4178429anc.98.1306152850224;
	Mon, 23 May 2011 05:14:10 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q8sm4737950ann.19.2011.05.23.05.14.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 May 2011 05:14:08 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2011 12:13:52 +0000
Message-Id: <cover.1306152724.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/3] Pull request with misc fixes from O.S. Systems tree
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
X-List-Received-Date: Mon, 23 May 2011 12:17:12 -0000

The following changes since commit 54ecf8e3992b8a01c2e5bd16720e1819b71b68bd:

  packagedata: don't choke on empty PACKAGES (2011-05-20 17:41:34 +0100)

are available in the git repository at:
  git://github.com/OSSystems/oe-core.git master
  https://github.com/OSSystems/oe-core/tree/master

Otavio Salvador (3):
  send-pull-request: drop sendemail checks
  busybox: enable mdev by default
  syslinux: rdepends on mtools

 meta/recipes-core/busybox/busybox-1.18.4/defconfig |    2 +-
 meta/recipes-core/busybox/busybox.inc              |    1 -
 meta/recipes-core/busybox/busybox_1.18.4.bb        |    2 +-
 meta/recipes-devtools/syslinux/syslinux_4.03.bb    |    4 +++-
 scripts/send-pull-request                          |   16 ----------------
 5 files changed, 5 insertions(+), 20 deletions(-)

-- 
1.7.2.5



