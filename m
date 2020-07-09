Received: from MTA-05-3.privateemail.com (MTA-05-3.privateemail.com [68.65.122.15])
 by mx.groups.io with SMTP id smtpd.web12.3056.1594322536447755856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 12:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: whitetree.xyz, ip: 68.65.122.15, mailfrom: charles.davies@whitetree.xyz)
Received: from MTA-05.privateemail.com (localhost [127.0.0.1])
	by MTA-05.privateemail.com (Postfix) with ESMTP id 3AF696004A;
	Thu,  9 Jul 2020 15:22:15 -0400 (EDT)
Received: from localhost.localdomain (unknown [10.20.151.229])
	by MTA-05.privateemail.com (Postfix) with ESMTPA id 5D28B60049;
	Thu,  9 Jul 2020 19:22:14 +0000 (UTC)
From: charles.davies@whitetree.xyz
To: openembedded-core@lists.openembedded.org
Cc: Charlie Davies <charles.davies@whitetree.xyz>
Subject: [PATCH][dunfell] u-boot: fix bug to allow use of *.cfg
Date: Thu,  9 Jul 2020 20:22:07 +0100
Message-Id: <20200709192208.137165-1-charles.davies@whitetree.xyz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable

Fixed a bug in u-boot.inc where logic to apply *.cfg
files never runs.

U-boot should allow *.cfg files to be specified in recipe's
SRC_URI.

Charlie Davies (1):
  u-boot: fix condition to allow use of *.cfg

 meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--=20
2.27.0

