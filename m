Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SasOF-0006Wh-Mh
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Jun 2012 19:45:27 +0200
Received: by vcbfl15 with SMTP id fl15so2069512vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jun 2012 10:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=wHnpN6LyoA4KkcoTacJPL7Rvqz28xxj91Jv2EWZZ9Yc=;
	b=0bfhTQL6/Psr6lX0LAJeSJ5tWmYFKLTKNSD8mvIG85qj1WUREg2iDR+dVuYPoHtkvC
	UrWx83QH13qw6tdCWV2ZWqnqm1V2unxSzlXVhzQ6xX9U/HmAX8WwUEIcaRNZpSt736sD
	CpFWp0eJwpwXb5qTv+Uq6G6p0mdzwQN4B53so1C8syg0ROKOSYPHzaaCHkafUWAQBwwv
	keGouMN5ks2T16PagWW50/dBm/px4wA6P5fVVmQV0vO+uq5Ek82jDPOADUsqylGdVSZP
	5m3UTwR49rU7b46YGjvgbNK3FAm+u42iM78gR+Gzr7PX5G8KQuMzmQA/TAwmjp5m9Q10
	DB4g==
Received: by 10.220.151.80 with SMTP id b16mr7035548vcw.4.1338658504647;
	Sat, 02 Jun 2012 10:35:04 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id by2sm8811086vdb.22.2012.06.02.10.35.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 10:35:03 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Jun 2012 14:34:56 -0300
Message-Id: <cover.1338658338.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/1] Fix build failure of openjade using newer host
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
X-List-Received-Date: Sat, 02 Jun 2012 17:45:27 -0000

This has been catch when building denzil on a Debian sid host; the fix
and build failure are documented on the patch. Please evaluate this
patch for inclusion on denzil 1.2.1 release as this will be catch by
users later.

The following changes since commit e3113827810e98eb1b012f0b280fb917199704c1:

  webkit-gtk: Use glib as unicode backend to avoid browser crash (2012-05-30 17:37:58 +0100)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (1):
  openjade: autoreconf to fix building on newer host systems

 .../openjade/openjade-1.3.2/autoreconf.patch       |21657 ++++++++++++++++++++
 .../openjade/openjade-native_1.3.2.bb              |    3 +-
 2 files changed, 21659 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/autoreconf.patch

-- 
1.7.2.5



