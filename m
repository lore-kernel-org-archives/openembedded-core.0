Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id CBDC075CD0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 01:45:53 +0000 (UTC)
Received: by igrv9 with SMTP id v9so68856278igr.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jul 2015 18:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rK6ZPQ3eoaHYkOWll+aXFQPy6wGpDsEcO1G2rUAFoXY=;
	b=ocFcphGA7smL0M6a0JTazzV71Xnx3RoPJY06Evz+QbATk/wjo0KaeH2phhotZaZqfF
	goPqPUgGd+67DgJVF09IInM9cwNYaTcl6qIMKdCVNj8X3csjApeT1LD2egpjZaoVfGbw
	RLdohZv4pbhqdA7l3fKIcj7odd4wiHDyU8PIP7Mgyssq4h6amk//7EjSWrMCyUSjaRRa
	Lwp/9aRVarTPfLH3nKm6W+aXi7d3SK6N8w4dFR2eCeRqDAhI7yNmfnG9hqp1e3bsdg4I
	Q9tlYZTL7dNTUwhWPgxpo5GzW/ycJh/C179AUdtyk3RxKhlIAYCAH+6nqHQpbjFT23Ra
	gyZw==
X-Received: by 10.50.79.129 with SMTP id j1mr45706998igx.12.1435887953609;
	Thu, 02 Jul 2015 18:45:53 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id x4sm5233578iod.26.2015.07.02.18.45.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Jul 2015 18:45:52 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jul 2015 18:45:38 -0700
Message-Id: <1435887942-20254-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/4] refresh busybox defconfig
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Jul 2015 01:45:54 -0000

The oe-core busybox defconfig file is based on busybox v1.20.2,
therefore any new configure options introduced in busybox v1.21.x,
v1.22.x and v1.23.x take on default values when the oe-core defconfig
is run through busybox v1.23.2 'make oldconfig'.

This patch series just refreshes the oe-core defconfig file, it does
not try to 'fix' any options for which the upstream default may not be
ideal for oe-core (if such cases exist, they should be addressed in a
separate commit).

Andre McCurdy (4):
  busybox: merge login-utilities.cfg into defconfig
  busybox: re-order defconfig to align with busybox 1.23.2
  busybox: remove CONFIG_FEATURE_VI_OPTIMIZE_CURSOR from defconfig
  busybox: refresh defconfig for busybox v1.23.2

 meta/recipes-core/busybox/busybox/defconfig        | 158 +++++++++++++--------
 .../busybox/busybox/login-utilities.cfg            |  13 --
 meta/recipes-core/busybox/busybox_1.23.2.bb        |   1 -
 meta/recipes-core/busybox/busybox_git.bb           |   1 -
 4 files changed, 98 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/login-utilities.cfg

-- 
1.9.1


