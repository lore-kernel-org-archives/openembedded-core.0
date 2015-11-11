Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9E5217716E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 17:41:51 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so36647472pac.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 09:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=HFu1kT2OaWeKjmCCNMzZlWjXmA38uFmfdARv8KlE3vQ=;
	b=SA/bdW2bcriAz1/hkLhfwVZYhfw7G69lcYilIlioAMyu7L03WSKgtyZW0J1heMAN7c
	swX9Jqc/ACpD3Y2ZbejVgh0OI8IO/STESWrxmwz3mVWCN0BjuEP8PKNbXpdAJ6Vu5Ugk
	ydx5FaGY2UGff+eVSq5f1Z3paZ7ztKYqxXDVfzgGOmTx/QlIx2H8/SDkdrzi67HX6tnW
	zEeKtb6qvu7e51lJszz43aeTC+woD9i3KoLcw6gj+VDWgVij2Ie4wbHLcXat9p/LVVlx
	PNU6tdNJKqusb3YjftRawpYAAFhEuDPnv7Ethji6LnO32U8MKeSgo5QZRL7jfTjgZJak
	8xeg==
X-Received: by 10.68.216.100 with SMTP id op4mr16116592pbc.47.1447263711621;
	Wed, 11 Nov 2015 09:41:51 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	v17sm10395426pbs.69.2015.11.11.09.41.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Nov 2015 09:41:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 09:41:45 -0800
Message-Id: <1447263707-27696-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/2] Add ldconfig alt lib search paths
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
X-List-Received-Date: Wed, 11 Nov 2015 17:41:52 -0000

I have a customer who wanted to define alt ldconfig search paths on a per recipe 
basis and adding hardcoded search paths in ldconfig-native does not scale well.

Here is a prototype scheme to allow extending
the search path for ldconfig-native without hardcoding.

Alt search paths can be defined in a recipe or via
local.conf.

This works in this form but I suspect there are cleaner or better schemes.

enjoy.

Armin Kuster (2):
  ldconfig: add method to extend ldconfig search dirs
  ldsoconf: allow extension via local.conf

 meta/classes/image-ldconfig.bbclass | 32 ++++++++++++++++++++++++++++++++
 meta/classes/ldconfig.bbclass       | 27 +++++++++++++++++++++++++++
 meta/conf/bitbake.conf              |  8 ++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 meta/classes/image-ldconfig.bbclass
 create mode 100644 meta/classes/ldconfig.bbclass

-- 
2.3.5


