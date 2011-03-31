Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q5FRV-0001xB-6x
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 12:49:33 +0200
Received: by bwz5 with SMTP id 5so1715385bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 03:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=AF5K136UFF32W+jC2pC1q0SoZQJBGvt7WsHAOTp2EMs=;
	b=SJapbJ+rM6LdR4BHQ+Q7TREm37X+iA+NwUN62afq1qskzCL3u6Ab/495KKVcFhJh3U
	jrVxaU0nRE1+tq3AQwYQz/LWAc7WjoL16XGWg8ZgBdJs7XqhU5+8Kd1Z8TlxncAeEkOm
	h3ae8cRbzmaFWM0BseNSCZDcXC/ly+Esc0rtg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=jlyFAV6zttShHA8k5yxKUBS0Id9aMYGL1N020xQ3gV7eenNR7uoN+7Tkouua6tuUDv
	qFvxt89TkFG5Ww1OpFuTFLE/zL4YC07E7lb9la01qIKj0LqLlLbT7BtsvquEs2XLM8qL
	mabgxBt9N70YA3xQIejZcSdEM0hA7C1NsGBdo=
Received: by 10.204.189.1 with SMTP id dc1mr794702bkb.34.1301568007972;
	Thu, 31 Mar 2011 03:40:07 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id w3sm651043bkt.5.2011.03.31.03.40.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 03:40:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2011 12:40:00 +0200
Message-Id: <cover.1301567822.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/3] SRCREVs and fixed building python modules
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
X-List-Received-Date: Thu, 31 Mar 2011 10:49:33 -0000

SCM recipes should be usefull without including poky-default-revisions.inc
Building python modules fails without distutils-common-base patch, 
when trying to link against libc from host's /usr/lib

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: jansa/pull
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Thanks,
    Martin Jansa <Martin.Jansa@gmail.com>
---


Martin Jansa (3):
  distutils-common-base.bbclass: Prepend STAGING_LIBDIR to linker
    library search path.
  gconf-dbus: add SRCREV to recipe
  xf86-video-omapfb: add SRCREV to recipe

 meta/classes/distutils-common-base.bbclass         |    2 ++
 meta/recipes-gnome/gnome/gconf-dbus_svn.bb         |    1 +
 .../xorg-driver/xf86-video-omapfb_git.bb           |    1 +
 3 files changed, 4 insertions(+), 0 deletions(-)

-- 
1.7.4.1



