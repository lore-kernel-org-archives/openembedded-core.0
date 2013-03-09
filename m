Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UETr5-000476-5P
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Mar 2013 01:11:11 +0100
Received: by mail-pb0-f54.google.com with SMTP id rr4so2461926pbb.27
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Mar 2013 15:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=sQWGPjZH6lo0bZ7ie1oLUr5vEP7ShnWVSDjG+gx7GG0=;
	b=1HNqOEytqoINh/L4y3l368qMisQT2M//NCBzXpOl+OSfPlNsQsiyn4uyplBNR4I2UE
	ynDqPCQiTtzjXmcERPwCLQXNFnOoXrSYwi8a9m9ZyaXQPY/RwSaHAZdwYIINcJ4Xaap9
	NFSk4/odzoJVQdmVeZKS4iSUFZWhAbxeUnuj4GBtAtzdSvRyhINTa00XZU9pjyI0YckK
	2IvGGnU6L8FVgGLrUG96aO7C92dz9SUxTXbbaW/6sdsQTLumjf4MKr31YrkE/BO+vFOC
	0mfOR8oEQBCL7NwzXl7D5g/YYn1ehtngYWdOyOUHFP50wa0IyGZSBMVivjqj8yxOMdDd
	Tv9A==
X-Received: by 10.68.239.231 with SMTP id vv7mr15062986pbc.171.1362873274631; 
	Sat, 09 Mar 2013 15:54:34 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qd8sm12412684pbc.29.2013.03.09.15.54.33
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 Mar 2013 15:54:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Mar 2013 15:54:05 -0800
Message-Id: <cover.1362873102.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/3] systemd upgrade to 198
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
X-List-Received-Date: Sun, 10 Mar 2013 00:11:13 -0000

This patchset upgrades systemd to 198
works quite well on ppc and x86_64 build tested on uclibc and other
architectures.
Additionally it created more packages for new files

The following changes since commit 05182ee354a9f773c8ab2f4cd7f1fdf552e7fcda:

  core-image.bbclass: support read-only rootfs (2013-03-07 11:19:59 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/systemd-198
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/systemd-198

Khem Raj (3):
  systemd: Upgrade to 198
  systemd: spin libnss_myhostname to package of its own
  systemd: Package hwdb data

 .../0001-systemd-analyze-rewrite-in-C.patch        | 1087 --------------------
 .../systemd/systemd/systemd-pam-fix-msformat.patch |  140 +--
 .../systemd/{systemd_197.bb => systemd_198.bb}     |   18 +-
 3 files changed, 81 insertions(+), 1164 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-systemd-analyze-rewrite-in-C.patch
 rename meta/recipes-core/systemd/{systemd_197.bb => systemd_198.bb} (94%)

-- 
1.7.9.5



