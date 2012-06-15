Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren@apps.dvhart.com>) id 1SffLw-00088k-KZ
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jun 2012 00:50:52 +0200
Received: by dalh21 with SMTP id h21so4459998dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 15:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=THwMbzggWEUgCxyr+zKcVz0IKRKobqQ4sIi8Jzms3kk=;
	b=irQeU0BwMik+9jcdk1ikzcXPWJCBEdjh6XkEPZKb0yLLj/atz27xMhrXKBRCjbPivb
	FjJzcOVC+Vkis5S7+LCfOozZNvNPf82AVzTmL+i6jM3enycY7um9chbI7CaqpUbaHDGy
	zMKXDGRwacB4SF0I7h3orSzkjpsgm5CyBAjD8Wf2ZeSJV5N08pOScDYw1I4jruhHiZF4
	Tc/rfRyWLYJmC8XKMO2jTW/zcPG2yBCNSkYSwQ/qVqbAS+RmdY7fC8AWKETlJsXO4Tyy
	9E6ykU/N2fJkuEkwAC0b0H//5HgF4wEc9h5ERRZ/ILbxcdmLC3vLQ+auJcoIyHdtgUYm
	ic6Q==
Received: by 10.68.242.162 with SMTP id wr2mr24946954pbc.125.1339800012822;
	Fri, 15 Jun 2012 15:40:12 -0700 (PDT)
Received: from localhost (static-50-53-99-101.bvtn.or.frontiernet.net.
	[50.53.99.101])
	by mx.google.com with ESMTPS id ip5sm14646017pbc.3.2012.06.15.15.40.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jun 2012 15:40:12 -0700 (PDT)
Sender: Darren Hart <darren@apps.dvhart.com>
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	philb@gnu.org
Date: Fri, 15 Jun 2012 15:39:59 -0700
Message-Id: <cover.1339799869.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQl+/a/SGTrotrltQT7wvQLnjSIhkuYCEMt7SQypxdMYO52cLJrE85d/j06A1puBe2zbphcd
Subject: [PATCH 0/1] busybox: Include setsid and cttyhack in defconfig
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
X-List-Received-Date: Fri, 15 Jun 2012 22:50:52 -0000

The following changes since commit 63d1ae1c2828cda03828b4c3fdde037d7a23f1e4:

  directfb: added missing Upstream-status (2012-06-15 15:41:11 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core dvhart/tiny
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=dvhart/tiny

Darren Hart (1):
  busybox: Include setsid and cttyhack in defconfig

 meta/recipes-core/busybox/busybox-1.19.4/defconfig |    4 ++--
 meta/recipes-core/busybox/busybox_1.19.4.bb        |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.5.4



