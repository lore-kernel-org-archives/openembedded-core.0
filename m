Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNDDa-0002uI-DO
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 02:05:26 +0200
Received: by pxi6 with SMTP id 6so2395402pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 17:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=mg1nG+sE7czRaE5v3ZvjnWtUZkHONuTKybXg7okQ5Oo=;
	b=o53OmU0mtUjERat9qm2vd5e1BJeG0Z38lwVi3vb8lIl+yoQU2SvhnCdGMqQBLJO0yO
	VnYctkO3BhoayiUBRd/p9pdvFgjcyIcOCUmbZ96Fh79qff+oJmdtiVaFQl75qDHh6ovg
	vyaKdi7/ReZiq3VItktMzC1pNBvrv8+DCr4rc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=xhNm+27GFuLxWZTdhB66uUQWK+50p5DO4tPCIyURdY50jbKGWlYhISRnRAFXovD9W7
	VYG19byegA7QUaRBFSQlQiGZwoKJ0+VNf0Rubt0P4depaPSd8LYxL/10rCu2hrODJpiY
	yqr1lKWnt0gs4kQMUEkXUkxdcxaahWMyfTw6g=
Received: by 10.142.152.23 with SMTP id z23mr2298482wfd.180.1305849749464;
	Thu, 19 May 2011 17:02:29 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x12sm2732125wfd.6.2011.05.19.17.02.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 May 2011 17:02:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 May 2011 17:02:16 -0700
Message-Id: <cover.1305849572.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCHv2 0/3] Fix recipes to build with uclibc
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
X-List-Received-Date: Fri, 20 May 2011 00:05:26 -0000

This series addresses review from RP

The following changes since commit bcf6445c5e77ab3563dc2dfa56d17ae811eb813d:

  opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS} (2011-05-19 16:56:45 -0700)

are available in the git repository at:
  git@git.openembedded.org:openembedded-core-contrib.git kraj/uclibc
  http://cgit.openembedded.org/cgit.cgi//log/?h=kraj/uclibc

Khem Raj (3):
  uclibc/site_config/funcs: getloadavg is unimplemented
  distcc_2.18.3.bb: Fix compilation on uclibc
  nfs-utils_1.2.3.bb: Fix compile failure on uclibc

 .../nfs-utils/nfs-utils-1.0.6-uclibc.patch         |   16 +++++++-----
 .../nfs-utils/nfs-utils-1.2.3-uclibc-libio.h.patch |   26 ++++++++++++++++++++
 .../nfs-utils/nfs-utils_1.2.3.bb                   |    1 +
 meta/recipes-core/uclibc/site_config/funcs         |    1 -
 meta/recipes-devtools/distcc/distcc_2.18.3.bb      |   15 +++++++----
 5 files changed, 46 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-uclibc-libio.h.patch

-- 
1.7.4.1



