Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 826C776599
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 01:54:31 +0000 (UTC)
Received: by iodd187 with SMTP id d187so99019694iod.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 18:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=EQ+aIOvb3KCIXnEoU77pe9YvyGKUo3olca6yMwpETs4=;
	b=GeKaLpHOqYWpGwB0pz96W6uvopiPPOiWZ3GTXv8vN/yw5wsh4Vcw6yX3pp9C6oznzA
	CEyniuXYl0j68W/A2171uGIqZ4ou+IP7JFtmShIzXo+IFJWTCR0PPZ2HQSavwBApwotv
	gd6o4lpKlcMqzUrb6WNSrp5LWG5osnga3A1r+c77DnNlegVVZOh3ygr3StBvyFazuM+K
	zKvZy5FMNup91cX3LZq6jtDn2r9bHsr94JvAIV9T4DQk2oGBJX1EQu6QXOU+TkN1ofNr
	L1MW3nj9HYfcai+aIK9ZeUKEgAHmI2PeVul48LpfPNqcMdLv9IK9f2IejpznoGqcnIEx
	sgEQ==
X-Received: by 10.107.34.75 with SMTP id i72mr6355066ioi.56.1438912471582;
	Thu, 06 Aug 2015 18:54:31 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id j3sm2740140ige.0.2015.08.06.18.54.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Aug 2015 18:54:30 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Aug 2015 18:54:15 -0700
Message-Id: <1438912459-7242-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2 0/4] fix uclibc build with security_flags.inc
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
X-List-Received-Date: Fri, 07 Aug 2015 01:54:33 -0000

v2 adds a new patch to fixup CFLAGS with _remove instead of
oe_filter_out, which fixes CFLAGS circular reference build
failures introduced in v1 when building for ARM.

Andre McCurdy (4):
  uclibc.inc: remove unused UCLIBC_EXTRA_LDFLAGS
  uclibc.inc: fixup CFLAGS with _remove instead of oe_filter_out
  uclibc.inc: avoid immediate expansion for UCLIBC_EXTRA_CFLAGS
  security_flags.inc: clear SECURITY_CFLAGS for uclibc

 meta/conf/distro/include/security_flags.inc | 2 ++
 meta/recipes-core/uclibc/uclibc.inc         | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
1.9.1


