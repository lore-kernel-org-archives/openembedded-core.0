Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RSsQk-0004U0-PI
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 16:38:43 +0100
Received: by ghy10 with SMTP id 10so287846ghy.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 07:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=tXDUX9faOl7vN7bMqjUgw5vUkjzdz08O5vhTiO+HwwU=;
	b=x/BsKEIC23keKxTZpQPJAaqIB2vIweZKOc7LN4dQ6d9PX6lnkXnNsWvgSUiAwkOf7L
	TyoQ9S2FNc3PKLwl3+FNo/tSqb0a4+hJWSbNJ6tN/nGy8yQbJAp87i8VMhl0KG8VmO/l
	NFHILDTw7EqBViSRPag/Tbac6y2Vfq/KpDu0k=
Received: by 10.236.173.131 with SMTP id v3mr27016133yhl.112.1321969665823;
	Tue, 22 Nov 2011 05:47:45 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n5sm19621150yhk.1.2011.11.22.05.47.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Nov 2011 05:47:44 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 13:47:35 +0000
Message-Id: <cover.1321969615.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/1] xserver-xorg support to VESA driver
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
X-List-Received-Date: Tue, 22 Nov 2011 15:38:43 -0000

The following changes since commit 5f1dc1991f97037692193572298eb7f7a5640760:

  staging.bbclass: Add BB_SETSCENE_VERIFY_FUNCTION function (2011-11-22 13:04:31 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (1):
  xserver-xorg: do not disable-dga as VESA driver requires it

 .../xorg-xserver/xserver-xorg-1.11.1.inc           |    2 +-
 .../xorg-xserver/xserver-xorg-common.inc           |    1 -
 2 files changed, 1 insertions(+), 2 deletions(-)

-- 
1.7.2.5



