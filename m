Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SaHK1-00034k-Ly
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 04:10:37 +0200
Received: by dalh21 with SMTP id h21so2151336dal.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 19:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=pFtfUvCkrNpsPisS9tfT5fP9uB7zHFfKloxIZFFAEgk=;
	b=C1Ja1qAq7vOmtGV92fiJr4abNIPjVGrXRa0UwHikts/Z2cp08QkQATasBFoX1CbAMc
	+QnuCASuAnC1sg51OWi6sJ8R8RP9pbRC9pP2lu+UIXsxxOM61hqPV+idddksbWAgbn3J
	uzHSvYBlhYh/aOPdOhVGDUkTFvS+uw5kHuw6LVGTungeRiCBWAT7dHs736VJiyfTHynl
	WX2SpcLsRhUTZnMNW6RlRmkjUbcFjhXeCxk4Pb+BtXMtxxrerEP82C+aLCOLa4/OyoDw
	WGtcjrRKDQ725/lZCjoawJoqqiwav9WhHPyu+RvOqG28DMUgMwrV9yUItpIzJQZrDtGu
	PtlA==
Received: by 10.68.225.9 with SMTP id rg9mr4780104pbc.137.1338516016532;
	Thu, 31 May 2012 19:00:16 -0700 (PDT)
Received: from localhost.localdomain (ip68-110-79-242.ph.ph.cox.net.
	[68.110.79.242])
	by mx.google.com with ESMTPS id tk1sm994850pbc.8.2012.05.31.19.00.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 19:00:15 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 May 2012 19:00:03 -0700
Message-Id: <cover.1338515870.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.10.3
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/3] More external toolchain fixes/improvements
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
X-List-Received-Date: Fri, 01 Jun 2012 02:10:37 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit e3113827810e98eb1b012f0b280fb917199704c1:

  webkit-gtk: Use glib as unicode backend to avoid browser crash (2012-05-30 17:37:58 +0100)

are available in the git repository at:
  github:kergoth/oe-core toolchain

Christopher Larson (3):
  external-sourcery: extract src and dest sysroot paths from gcc
  tcmode-external-sourcery: pass -msgxx-glibc for x86
  external-sourcery-toolchain: forcibly create usr/lib

 .../distro/include/tcmode-external-sourcery.inc    |   48 ++++++++++++-------
 .../meta/external-sourcery-toolchain.bb            |   25 +++++------
 2 files changed, 41 insertions(+), 32 deletions(-)

-- 
1.7.4.1



