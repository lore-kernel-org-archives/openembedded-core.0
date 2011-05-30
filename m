Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR3m7-0007Z4-Fi
	for openembedded-core@lists.openembedded.org;
	Mon, 30 May 2011 16:48:59 +0200
Received: by gxk3 with SMTP id 3so350167gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2011 07:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=l24nP+5icdVVNe7xV9dnolxgkUm4r9ksvzwpdVrZkcw=;
	b=hUBvJDwqIeAk76mNqdwT8qjypYxN9brxBfk0XqF7Mvt7N61I6j6eQ6a2UcmOiaAcWK
	48+niIW7oNPA3lyQOkboKY73x96cpLPtKzXyAjx8DoQo1r3yO5zm0685BRYm7zUKXecx
	jEcEhgs174msEy6SYBAyazYCILLlhwrquL9C8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=gpgfDhd/eWNIb4zHKSXBl+aL8fweC4w2m4IitjaKd8ygJ4fiVVLpCU2OF5Cww5Quqq
	mJ+NxIRUqJhp64PxlyV3qKwYxC5nd2JAUfdCJC4Cm9Pgc7qu1dKhSg+s8PDGh4M0gmPr
	BqdfjcMYupve5HQz/UYXr6WNEB71o7feqnats=
Received: by 10.101.213.31 with SMTP id p31mr3175414anq.139.1306766750433;
	Mon, 30 May 2011 07:45:50 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id x37sm3343391ana.26.2011.05.30.07.45.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:45:49 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 May 2011 14:45:37 +0000
Message-Id: <cover.1306766682.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/2] Misc fixes from O.S. Systems tree
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
X-List-Received-Date: Mon, 30 May 2011 14:49:00 -0000

The following changes since commit 83ce96f44516c8a4a44c8c0140949256f8422014:

  bitbake.conf: make OVERRIDES match what people expect (2011-05-30 08:31:53 +0100)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/master

Otavio Salvador (2):
  busybox: enable mdev by default
  qmake_base.bbclass: fix lrelease/lupdate binary names

 meta/classes/qmake_base.bbclass                    |    5 +++++
 meta/recipes-core/busybox/busybox-1.18.4/defconfig |    2 +-
 meta/recipes-core/busybox/busybox.inc              |    1 -
 meta/recipes-core/busybox/busybox_1.18.4.bb        |    2 +-
 4 files changed, 7 insertions(+), 3 deletions(-)

-- 
1.7.2.5



