Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rn6r7-0007Ia-6h
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 12:05:33 +0100
Received: by eekd17 with SMTP id d17so1792820eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 02:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=qVG0dsEQ66BCS3dCdrDogewrSz5BtfoTHuyFqR87Vt4=;
	b=DESMIw1fW38hGcLBOboHSMJmh7rKjbWu5A7wEXCnO/3z8Tjhz5CLKcckUICesnfGEq
	QooReT3j16Fgxvek99hXek3q3FQaDFGg/Zy55Tn+QGXQTeBfFzgfRLdJXAQJj6ey+Qz4
	hVsTc5SSHNfvG81IA/v2UwbEXGu1/gPRxiKWM=
Received: by 10.213.19.4 with SMTP id y4mr542408eba.57.1326797862758;
	Tue, 17 Jan 2012 02:57:42 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y12sm84531178eeb.11.2012.01.17.02.57.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jan 2012 02:57:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 11:57:34 +0100
Message-Id: <cover.1326797712.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
Subject: [PATCH 0/2] gnutls fixes
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
X-List-Received-Date: Tue, 17 Jan 2012 11:05:33 -0000

Hi,

nobody likes when it's trying to use host's libraries and even worse 
when it succeeds and pulls them to rest of OE builds through .la files.

The following changes since commit 91e17c0c0ac2330f826b95e762542cd0d0c82385:

  pango: Use gnomebase class, not gnome (2012-01-16 18:01:31 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/gnutls
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/gnutls

Martin Jansa (2):
  gnutls: add readline to DEPENDS and add --with-libreadline-prefix
  gnutls.inc: set libz prefix

 meta/recipes-support/gnutls/gnutls.inc |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

-- 
1.7.8.3



