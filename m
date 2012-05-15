Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren@apps.dvhart.com>) id 1SU5VC-0006wF-9f
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 02:20:34 +0200
Received: by pbbrq2 with SMTP id rq2so5997243pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 17:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=PG+kEQOH90oHspyid1CxuDBsIzqQsmHOxU67+LMfTG8=;
	b=emMJSx7jld8SW5GNWBcQQrMCw4MaoslnO7JJutC7LG+pvb0VsgI7JmSTFyT0N+Jnir
	/IvZ+WWLn5eAbwsIJ/99+K49biCJQTL7CMQ5h4QStn3LUuZh/TBRz+z1H3srSGjeUKW8
	h2x2+njM5/r6g5Jnt8icVM3Qrql9ODrFXRtNcAlcXnLpSJ4CqFn6NUcnu6II4yGSqpl4
	KPQYrHg9S8iXJG27w/wmCj5wKUGjNNkbLwTIi2n1vtUQcxDbVqb+38nBWYN6v6W2os/f
	drwThHjJmyUS5XMsPc8/yOI4jkGbfc0ogTE6/GXLJhHtOGa5dMvGYjDNROvvG/3wgfmC
	cilA==
Received: by 10.68.227.227 with SMTP id sd3mr27343224pbc.53.1337040633894;
	Mon, 14 May 2012 17:10:33 -0700 (PDT)
Received: from localhost (static-50-53-99-101.bvtn.or.frontiernet.net.
	[50.53.99.101])
	by mx.google.com with ESMTPS id rv5sm9056351pbc.56.2012.05.14.17.10.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 May 2012 17:10:33 -0700 (PDT)
Sender: Darren Hart <darren@apps.dvhart.com>
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 May 2012 17:10:25 -0700
Message-Id: <cover.1337040537.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQnxbnOfTMmzbdJp3wkSjj5EDzZ2Z0a0JHh1owreANZMGS8e0ftAvU8uzheobli+g79Z0rUf
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/1] ofono: Add python-pygobject to ofono-tests package DEPENDS
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
X-List-Received-Date: Tue, 15 May 2012 00:20:34 -0000

The following changes since commit 36d1717e2ad4ca1620ee9f01b524b5ff2f499b26:

  classes/rootfs_*: fix splitting package dependency strings (2012-05-13 20:07:24 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core dvhart/misc
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=dvhart/misc

Darren Hart (1):
  ofono: Add python-pygobject to ofono-tests package DEPENDS

 meta/recipes-connectivity/ofono/ofono.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.5.4



