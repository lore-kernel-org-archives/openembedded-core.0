Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QRrnA-0007QP-AR
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 22:13:24 +0200
Received: by gxk3 with SMTP id 3so78819gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 13:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=qWj7B5XXoiDIUjoiWZCVNuMjXm5ZDs140M83C1HCH3Q=;
	b=pQwTLlb31JqnD6YjJqd0XWQM9/qf9xmHpzLJXwM4pTlOAeLXhQ59A4+F+xmXwF2F0V
	Kxq0RHUAs+9Nv4vAA8NuUqeit+soLr5+/r6wPuuOhOpGf3do+rNKQ97H1gI8gqISXsZY
	pnUGWhIebdc7Ixe3c+2az8yOA65MUV/6XqaHg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=vY5BRB/KsxkB8KmRi6UgolwpX4LKX0E3lIk+Xl1mOHlOK+nywzLHQCrSPWg4wAPBKn
	0OMoYHEvv6RDOMoErGA1SHlmyl6H0fhZwxaZ/4ymKliZx190CPv8wA7Mg3KhHk0tqtmf
	w2Ccfqn+0wfi8VgCK5y74xJyXNWtBkbJjAgzQ=
Received: by 10.101.8.31 with SMTP id l31mr4856447ani.134.1306959007409;
	Wed, 01 Jun 2011 13:10:07 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id b25sm906310anb.46.2011.06.01.13.10.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 13:10:06 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2011 20:09:52 +0000
Message-Id: <cover.1306958862.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/3] Patches pending on O.S. Systems tree
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
X-List-Received-Date: Wed, 01 Jun 2011 20:13:24 -0000

The following changes since commit 0a496df0209c93fd00ea929b5f27faa1a6e600c0:

  clutter-1.6: Add patch to update gettext macro version (2011-06-01 18:32:30 +0100)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/master

Otavio Salvador (3):
  busybox: enable mdev by default
  qmake_base.bbclass: fix lrelease/lupdate binary names
  gnutls: link against 'dl' library

 meta/classes/qmake_base.bbclass                    |    5 +++++
 meta/recipes-core/busybox/busybox-1.18.4/defconfig |    2 +-
 meta/recipes-core/busybox/busybox.inc              |    1 -
 meta/recipes-core/busybox/busybox_1.18.4.bb        |    2 +-
 meta/recipes-support/gnutls/gnutls.inc             |    4 +++-
 meta/recipes-support/gnutls/gnutls_2.12.5.bb       |    2 +-
 6 files changed, 11 insertions(+), 5 deletions(-)

-- 
1.7.2.5



