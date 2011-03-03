Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pv9ml-0002db-2O
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 15:45:47 +0100
Received: by bwz10 with SMTP id 10so1136892bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 06:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=1VHH4NzgQvcXmr78W7OwyYMoawq+wo9lShSAGon4cBQ=;
	b=rr6GfLkmiz0opBSYfhHXM+CB/pnAD3KV3mUc8aKuPNJLQU2oOUvoZoWjH6nqil/CvZ
	K+fcqDohbUOhGGAlMfRvqrZ6JnYcFF7y74Vkj+tb3NANfDXyreQj7VcciYLIAi13nUM1
	W8oYCtWwxmBQLmqQ0hSzcFP2FkV+0/YBlALT4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Yh442ang+Cg29aA670gmnCOl6nNxNnd31YtTaUW/2hRllhGmx0dIqBS24mTh4RoqmL
	EQ4d2uJyWZUPIFLdb62wGE0ZX86jrtcvJW7tJX122x8PreYkTPkh8hy6V5Yp2Tsa6l3N
	cJj9g9vmNN2mZoyLw8KKg8NcPnV1ptwXcH/KU=
Received: by 10.204.14.3 with SMTP id e3mr1519848bka.202.1299163457156;
	Thu, 03 Mar 2011 06:44:17 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b7sm798546bkb.18.2011.03.03.06.44.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2011 06:44:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Mar 2011 15:44:06 +0100
Message-Id: <1299163446-21791-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] bitbake.conf: replace unused/broken E_CVS/E_URI with E_MIRROR/E_SVN used in OE
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
X-List-Received-Date: Thu, 03 Mar 2011 14:45:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index cf99a81..5f5abb3 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -523,8 +523,8 @@ export palmqtdir = "${palmtopdir}"
 ADOBE_MIRROR = "http://fpdownload.macromedia.com/get/flashplayer/current/"
 APACHE_MIRROR = "http://www.apache.org/dist"
 DEBIAN_MIRROR = "ftp://ftp.debian.org/debian/pool"
-E_CVS = "cvs://anonymous@anoncvs.enlightenment.org/var/cvs/e" 
-E_URI = "http://enlightenment.freedesktop.org/files"
+E_MIRROR = "http://download.enlightenment.org/releases"
+E_SVN = "svn://svn.enlightenment.org/svn/e"
 FREEBSD_MIRROR = "ftp://ftp.freebsd.org/pub/FreeBSD/"
 FREEDESKTOP_CVS = "cvs://anoncvs:anoncvs@anoncvs.freedesktop.org/cvs"
 FREESMARTPHONE_GIT = "git://git.freesmartphone.org"
-- 
1.7.4.1



