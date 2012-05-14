Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1STyXA-00045O-6Y
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 18:54:08 +0200
Received: by obhx4 with SMTP id x4so8446149obh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 09:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=vfiU01T8EQjSjl9h+2Ps5qlTwqbH/SaopXutq0xXAE8=;
	b=b7JJhJrDLO/AT0TIMiNFYsBx9dftuaPfObgDQNi5PoiAq5/2x2/ouaDGUenIB3Dz0m
	Jy9yTR60fP2QOrNpRwAbxO9SQZd9iQ3TbfrDIni0Rme0eE0yGrqFkkNV+Zd0I00XhvgJ
	ySRgNVPXsG1jy/m3t1qoIohhvdELf+g2ihiFYx22rac4v19tsVP51ur0PaPNKVHCxRhD
	/97MxkIyitMlN9E2h/NplsVmm6u0bzJOVFvKA9FOgGaxfTPb9nRKuHhYM7tgyY+pSUfZ
	kp+iXY3ZAvPfaXFRezzPnX05VMnxA9xbFDLmPbN9krf3WMbtabxZ61kaaw2Rf/meoqvk
	gvjA==
Received: by 10.182.152.72 with SMTP id uw8mr12681045obb.73.1337013848460;
	Mon, 14 May 2012 09:44:08 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id vs8sm8863380obb.14.2012.05.14.09.44.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 May 2012 09:44:07 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 May 2012 11:45:01 -0500
Message-Id: <cover.1337013858.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.7
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/3] Minor tcmode-external-csl fixes
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
X-List-Received-Date: Mon, 14 May 2012 16:54:08 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit 36d1717e2ad4ca1620ee9f01b524b5ff2f499b26:

  classes/rootfs_*: fix splitting package dependency strings (2012-05-13 20:07:24 +0100)

are available in the git repository at:
  https://github.com/kergoth/oe-core external-csl-minor-fixes

Christopher Larson (3):
      tcmode-external-csl: drop unnecessary cppflags/ldflags
      tcmode-external-csl: avoid hardcoding a list of ia32 archs
      tcmode-external-csl: handle TUNE_PKGARCH=core2

 meta/conf/distro/include/tcmode-external-csl.inc |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.7.7



