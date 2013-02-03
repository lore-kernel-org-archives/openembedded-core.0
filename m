Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1U1wsn-0008ES-1f
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Feb 2013 11:33:10 +0100
Received: by mail-la0-f47.google.com with SMTP id fj20so3758462lab.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Feb 2013 02:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=m54dwcvC1NZ0tUyPyR5qu2dzmqu/PuttTu3cYMxCZ6k=;
	b=rxcFFRr+BkUYcNt+frSTbmwjxCQPPWFAAos1PLEdPSZGn3OO2KTxe7X4c+Gco23YnB
	LMyBAf6Nk0mfY13v+GD9UnMfXtypbXDN0q3KIB+D1b87jSi0Aa26dPpahOZqP75hm+X/
	euX6D+3dIQn1AJ078gog3kS050ef8UDApGz2lA8MRkrm7l7G+Gdfo1mkw1vFnEIhLCIc
	GLRHg0Zcv+DWFavfEtfyJcarMtepjvGHArDF7BzUwJsrulk+xXtyTcXQE5wiRyyCGTCT
	kK7mWZVp4KABJx9zxzvVIPng+mMw/8xreyMk5osJo/LC5t6EVo+Pm3MUXmxl2a5A0n9d
	T/iw==
X-Received: by 10.112.28.105 with SMTP id a9mr6726796lbh.66.1359886642014;
	Sun, 03 Feb 2013 02:17:22 -0800 (PST)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPS id t7sm4269403lbf.12.2013.02.03.02.17.19
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 03 Feb 2013 02:17:20 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1U1wdT-0006W5-23; Sun, 03 Feb 2013 12:17:19 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 12:17:17 +0200
Message-Id: <cover.1359886551.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/4] Automake-1.13 fixes (batch 4)
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
X-List-Received-Date: Sun, 03 Feb 2013 10:33:11 -0000

The following changes since commit 82602d2c55f5d233bd8351e95a84a65b792786e5:

  qt4: Add space for _appends (2013-02-01 22:49:27 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/am13
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/am13

Marko Lindqvist (4):
  opkg: replace obsolete automake macros with working ones
  libmatchbox: replace obsolete automake macros with working ones
  matchbox-wm: update to git master head
  rpcbind: replace obsolete automake macros with working ones

 .../opkg/opkg/obsolete_automake_macros.patch            |   15 +++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb                  |    1 +
 .../rpcbind/rpcbind/obsolete_automake_macros.patch      |   14 ++++++++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb          |    3 ++-
 .../libmatchbox-1.10/obsolete_automake_macros.patch     |   14 ++++++++++++++
 meta/recipes-graphics/libmatchbox/libmatchbox_1.10.bb   |    4 +++-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb    |    4 ++--
 7 files changed, 51 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-graphics/libmatchbox/libmatchbox-1.10/obsolete_automake_macros.patch

-- 
1.7.10.4



