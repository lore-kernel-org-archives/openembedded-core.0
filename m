Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T88Io-0005P9-G2
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Sep 2012 13:25:18 +0200
Received: by weyr6 with SMTP id r6so2557607wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Sep 2012 04:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=UuG//sx+QUC9m2hOtugEBT1MopaPd4pRUQrUQowLu8o=;
	b=I7qFj7k+iMqneD/kQZLCKGS+BebIJcfQPdwE52190bseYf8VX2OXQd/cBEvh87ss4E
	R26fvIYcFAldh4pz3vLuyDOV/QSg72z8fn30Zg6MjY90WGADcOs/3FNp7YK2SEd2+7e5
	+1i/xCwT6R4d4zWrM6n9ircjePM/xeLVMrXVu2zNlggZ5BFQ0M7eKFvQ5XUY3yRER0Kv
	0AX6H7StUKQl0bMQpPG2sAGx85rqwOli/t/4NemKJaxToiZqVxdxuyP/ELTs/PCKJqol
	Ll7sxlAjB7+Q6yvLW0b6yJzZIyeKLKC+l/2V9+f/XHKWHTn8cU4JV05qWI2F8D61XSvL
	cZew==
Received: by 10.216.194.102 with SMTP id l80mr8389764wen.19.1346584379499;
	Sun, 02 Sep 2012 04:12:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k2sm18566291wiz.7.2012.09.02.04.12.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 02 Sep 2012 04:12:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Sep 2012 13:13:17 +0200
Message-Id: <cover.1346584261.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [PATCH 0/4] sstate-cache-management.sh fixes [YOCTO #2897]
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
X-List-Received-Date: Sun, 02 Sep 2012 11:25:18 -0000

Fixes some issues reported in YOCTO #2897

The following changes since commit c2109b765b24a7ffe4781257ad3fe4641a3b2a49:

  sstate: Ensure master.list exists if it doesn't already (2012-08-30 22:44:52 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Martin Jansa (4):
  sstate-cache-management.sh: fix regexp in checksum grep
  sstate-cache-management.sh: fix regexp in AVAILTUNES grep
  sstate-cache-management.sh: look in meta* above oe-core dir when
    looking for available tunes
  sstate-cache-management.sh: don't hardcode available machines only to
    qemu*

 scripts/sstate-cache-management.sh | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

-- 
1.7.12



