Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QRRFI-0001gM-AZ
	for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 17:52:40 +0200
Received: by fxm19 with SMTP id 19so3662569fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 08:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=dcYlXEC8wijV9WzLIx9bxBRMP1plTbtiLDzKwPJeqCQ=;
	b=JuDLLwx0RKVZmrVOy29jU8aeSSWDqWdKZ/K+Z9NQQsgvuTTWrDB36qs1J/HFZIfQ0M
	r+rCUIzOyWUjFnwhxwQi1a3eicyr/w2yO+22FyaQKETL1+S+T28ErGEEMkQuqfpJliTV
	Bvqhn0JfBMjFyYlFmi5B8LMuzlcwTggOS0chs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=kTM/xKjOfvkDsASzLjzukORA2BkzDLtMHYiQhOvzN2QiC7cJMLKQMRola40vj/OcxW
	NBNHsKDV7XdUnOxIORue6bBrExaybkHvzBDFXcU5kD1nPMySzZM521vYbDqT6b2bAeMG
	j3DhA9B8AIeepjGuj+cnhxen4Tt2ZYDXvXuDo=
Received: by 10.223.59.92 with SMTP id k28mr3369524fah.27.1306856909555;
	Tue, 31 May 2011 08:48:29 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id b25sm89878fab.4.2011.05.31.08.48.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 08:48:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 17:48:13 +0200
Message-Id: <cover.1306856806.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
Subject: [PATCH 0/1] Small create-pull-request fix
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
X-List-Received-Date: Tue, 31 May 2011 15:52:40 -0000

The following changes since commit 26e5e5feb695864b11e47e24017e254c28f14494:

  Improve handling of 'all' architecture recipes and their interaction with sstate (2011-05-31 12:56:38 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Martin Jansa (1):
  create-pull-request: allow '+' in git PROTO_RE, ie for 'git+ssh://'

 scripts/create-pull-request |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.5.3



