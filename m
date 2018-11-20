Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 6EC836C46D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 11:18:03 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id wAKBI3ap010117
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 20 Nov 2018 12:18:04 +0100
Received: from dev.vm6.ccp.siemens.com ([163.242.57.0])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id wAKBI3Nb021728;
	Tue, 20 Nov 2018 12:18:03 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 07D5F9504C8;
	Tue, 20 Nov 2018 12:18:02 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 12:17:24 +0100
Message-Id: <20181120111725.4337-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <5cd14d41-41d1-11ea-afcd-6988f9a17cca@siemens.com>
References: <5cd14d41-41d1-11ea-afcd-6988f9a17cca@siemens.com>
Subject: [PATCH 0/1] nativesdk/sdk: Fix sdk dummy providers for opkg
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
X-List-Received-Date: Tue, 20 Nov 2018 11:18:04 -0000

I can't verify functionality of another package types like deb.
But condtional could be changed to "not rpm", which covers the rest.

Andrej Valek (1):
  nativesdk/sdk: Fix sdk dummy providers for opkg

 meta/recipes-core/meta/dummy-sdk-package.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.11.0


