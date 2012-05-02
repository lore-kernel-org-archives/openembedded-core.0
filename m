Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SPaFN-0007YS-Tq
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 16:09:38 +0200
Received: by bkcjm2 with SMTP id jm2so504708bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 06:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=6dfikbjm9N0okhOHrBHmKc9TCj88UpStVIrTdYjvteM=;
	b=X9H5NlgSiFiO0TycVFbta4F2e3NBPzc4uSONZ26BsUI3NXiM0i/Ljx7K7eStpUg+6C
	T7/1wKHS2MP/6b5AtxuySbNZRLV1OJ/3GUcdNF1HRMvAJmEb3a4RjFycTgINlQizm4A0
	q/pxM35Ze0wQnDWlnxKXPdI5JpmW2T9g0wMVNb2h9gtXMVHbJAWSv7W1+pjGwZryaIM9
	00NQDFUcqe2A01T9Oe7TNoMVHH6mpWc699jtgO9Ab0azNOsW4HfPNaIsx0lgvbAtb7cY
	MYJU1xYRIt6teWsHt4VD5fdaIi0KHjIpHmYiWZlUGeG5ntamKis20bOuwX2sH7054Pkq
	Enug==
Received: by 10.204.152.6 with SMTP id e6mr6365874bkw.18.1335967193185;
	Wed, 02 May 2012 06:59:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z17sm4060335bkw.12.2012.05.02.06.59.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 06:59:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 15:59:44 +0200
Message-Id: <cover.1335967122.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH 0/2] glib-2.0 another upgrade
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
X-List-Received-Date: Wed, 02 May 2012 14:09:38 -0000

This depends on previous glib-2.0 upgrade patchset which is already in master-next

The following changes since commit 26d822ad059dd4839cc6fee2a65714e73cc146e1:

  nfs-utils: don't try to unload nfsd module (2012-05-01 14:28:47 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Martin Jansa (1):
  glib-2.0: upgrade to 2.32.2

Tomas Frydrych (1):
  site/arm-common: alignment values for guin32, guin64 and unsigned
    long

 .../{glib-2.0_2.32.1.bb => glib-2.0_2.32.2.bb}     |    5 ++---
 meta/site/arm-common                               |    3 +++
 2 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.32.1.bb => glib-2.0_2.32.2.bb} (92%)

-- 
1.7.8.6



