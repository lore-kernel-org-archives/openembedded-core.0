Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QKs2t-0004jX-0V
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 15:04:43 +0200
Received: by fxm19 with SMTP id 19so1948686fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 06:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=L/5GcbNYz2FzCNi+Sg6oLSYscdBe9Ls7EnzVM9LwQ6I=;
	b=kvW2sGcJ1MA6dKLw64pWrZsZ4IVl1wR2QfqUGcLMBkw7KixyabxGwf4gBV97lffjMq
	x1ZsZPnPSR+PmkN7UOVVyzxqpS5DOjo85QblJsALsRoIFnC21uaYCZosRzuOjERCH5cX
	o8GbMNIE9oafamT34+7UkDvhiJ+bP8rwShRQU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=CtKRLw3oiCJaqDttYW4pMGkR0vjwdpD80TVbtEgydXq42mZw4C4cNWP70i0lhUGW+r
	5Gd/jtpJ8ebSPZs8GlPPNQOBlXjN710ulZk9IZSqaj14saDE5gb5quoppz4BwqCJPl/+
	8MuBlT7Dg+OGjnVdqLMS3vePzRtEvvVbCk6bA=
Received: by 10.223.48.139 with SMTP id r11mr878369faf.63.1305291272824;
	Fri, 13 May 2011 05:54:32 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id j18sm836267faa.18.2011.05.13.05.54.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2011 05:54:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2011 14:54:25 +0200
Message-Id: <cover.1305291184.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [PATCH 0/3] Misc fixes
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
X-List-Received-Date: Fri, 13 May 2011 13:04:43 -0000

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: jansa/pull
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Thanks,
    Martin Jansa <Martin.Jansa@gmail.com>
---


Martin Jansa (3):
  lib/oe/process.py: import from OE
  glib-2.0: use PN instead of glib-2.0 in PACKAGES and FILES
  bitbake.conf: move VENDOR variables from bitbake.conf to
    defaultsetup.conf

 meta/conf/bitbake.conf              |    4 --
 meta/conf/distro/defaultsetup.conf  |    5 ++-
 meta/lib/oe/process.py              |   74 +++++++++++++++++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc |    4 +-
 4 files changed, 80 insertions(+), 7 deletions(-)
 create mode 100644 meta/lib/oe/process.py

-- 
1.7.5.rc3



