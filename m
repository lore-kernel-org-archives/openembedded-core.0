Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 666C46AC43
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 12:27:58 +0000 (UTC)
Received: by wixw10 with SMTP id w10so29340796wix.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 05:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eK+YRERBbbfj6V1HGasgkkr8gboS6BPV+NkezhYxinw=;
	b=JrF0OQkmupvYCnGhBBNsA++4LNnSUcKGz/O5QLtD+s8KV6wkkTX7W5QeCD8/x7CCdP
	I4g/YqzdNrJlAMDKnZr5V6V/lEkXTWvdn5LIOdioIw4MM/F4Jdo+mZGcQFg2j43AkSX5
	OhTViJeoatDYk9KJgwOp7xptuwFsPXre/oxvakSuoiINvuK46s25OTfQPkUhJJsqXD+P
	qP7mZVYsKQBM2EkSW1n8/PVVXxjy4JcFt0mL+VsVYXvsQ0YHHW5Iub3ArWtzeSQ2wuU8
	ZhQ471L6EfRKUmt2iuiwvD0zEx1JooSr0gmIYZRsXwcGhMBtuNCzA1afdHz0e+BfHH0R
	Q+2Q==
X-Received: by 10.180.91.79 with SMTP id cc15mr150931271wib.37.1426508879340; 
	Mon, 16 Mar 2015 05:27:59 -0700 (PDT)
Received: from s42.loc (91-119-229-249.dynamic.xdsl-line.inode.at.
	[91.119.229.249])
	by mx.google.com with ESMTPSA id k6sm15169311wia.6.2015.03.16.05.27.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 16 Mar 2015 05:27:58 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.80)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1YXU7h-0007rh-IW; Mon, 16 Mar 2015 13:27:57 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 13:27:44 +0100
Message-Id: <cover.1426508573.git.rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <CAJTo0LYGf7o8G81Sufv44e1e-FwOvCVZzvTc=iCbLnEQO_GMxg@mail.gmail.com>
References: <CAJTo0LYGf7o8G81Sufv44e1e-FwOvCVZzvTc=iCbLnEQO_GMxg@mail.gmail.com>
Subject: [PATCH v2 0/3] misc uClibc-related tweaks
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
X-List-Received-Date: Mon, 16 Mar 2015 12:27:59 -0000

Changes from v2:
- drop PR bumps

The following changes since commit fb29441216435b9bae47ca9cd42db5a6b1fe77d8:

  oeqa/parselogs: Skip hda opcode errors (2015-03-12 12:49:22 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib aldot/fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=aldot/fixes

Bernhard Reutner-Fischer (3):
  libtirpc: respin patches
  rpcbind: respin patches
  packagegroup zeroconf: nss-mdns is libc dependant

 .../packagegroups/packagegroup-base.bb             |   4 +-
 ...0001-configure.ac-Allow-for-disabling-NIS.patch | 169 +++++++++++++++++
 ...configure.ac-Allow-for-disabling-auth-DES.patch | 203 +++++++++++++++++++++
 .../libtirpc/0003-debug.h-Include-stdarg.patch     |  20 ++
 .../libtirpc/libtirpc/remove-des-uclibc.patch      |  38 ----
 meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb   |   5 +-
 ...001-configure.ac-Check-for-rpcsvc-mount.h.patch |  64 +++++++
 .../rpcbind/rpcbind/0001-uclibc-nss.patch          |  30 ---
 .../rpcbind/0002-uclibc-rpcsvc-defines.patch       |  60 ------
 meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb     |   7 +-
 10 files changed, 464 insertions(+), 136 deletions(-)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-configure.ac-Allow-for-disabling-NIS.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0002-configure.ac-Allow-for-disabling-auth-DES.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0003-debug.h-Include-stdarg.patch
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/remove-des-uclibc.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-configure.ac-Check-for-rpcsvc-mount.h.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch

-- 
2.1.4


