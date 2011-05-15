Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QLVJ9-00007C-AC
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 09:00:08 +0200
Received: by pxi6 with SMTP id 6so2799975pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 May 2011 23:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=zNKyBawiYOuNDGvdKKLkVTvkgSyQumHlQZ+C/OUuld0=;
	b=cnpoN8uh9O5aIf3oBYlWKiY4xDUvuOKuxy8nzH/N1bVmajZ/3VkfcHag2AY75EWEmf
	P60ZFCaf5dCfEdIXRCWkLkvLxur8xfnxJ1MimvbXoNGj51i7T9Zsm49Y9IlOHn5bNKSg
	8LlOEZ5opQwIwH6h2DeQqGVHop3YdHJZoWNqs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=XxdqYMcdSodsqRINj0FkBHePlKpf1TzeothqDlIUaeX4eTaELyzyk1vs7rZ1jW/yqj
	w7LLrEo0wkQahmREtnLp4TL3u+YExfJy66uTQmoQkDJ4337Id8dXFgjkMTpR6Rxevg1V
	lPbw3z9BA26HISoP2qchvXQbiZlzMNgL3yVDI=
Received: by 10.68.36.73 with SMTP id o9mr5138622pbj.67.1305442634304;
	Sat, 14 May 2011 23:57:14 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id h7sm2480480pbg.74.2011.05.14.23.57.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 14 May 2011 23:57:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 14 May 2011 23:57:05 -0700
Message-Id: <cover.1305442428.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] Upgrade opkg
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
X-List-Received-Date: Sun, 15 May 2011 07:00:09 -0000

These patches help in removing extra size that was being added to
slugos-image when using oe-core. With these patches both from OE
the root file system is 100k less than the classic OE. Currently
the root file size is about 1M bigger due to opkg pulling in curl
and then bunch of other libraries

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/slugos-support
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/slugos-support

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (2):
  opkg: Bump SRCREV to 609
  e2fsprogs_1.41.14.bb: Package libraries into separate packages

 .../e2fsprogs/e2fsprogs_1.41.14.bb                 |    6 ++++++
 meta/recipes-devtools/opkg/opkg.inc                |    8 ++++++--
 meta/recipes-devtools/opkg/opkg_svn.bb             |    3 ++-
 3 files changed, 14 insertions(+), 3 deletions(-)

-- 
1.7.4.1



