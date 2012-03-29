Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SD8ts-0008An-Ip
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 08:32:00 +0200
Received: by eekc1 with SMTP id c1so616683eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 23:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Pvb37c4ve/vvgFUb59D3BF44y/wLDb892xrPJLxu3uk=;
	b=ezKbgKBLpllyBNIZpbJVoLWtOV6f50dRPvR30ieDuO3a5WGUBXUiG/kR5B/+6dgReu
	HTZNXPL85CsIz0w9TmjXi/d3c14h7BKf/0B0UEhSpvTdqSeVW2fNfpEiJ7Kd6yCW/aWL
	Wm/w5dqlY/JBP6+ZPdbGTmNQbOV95cVqq+3gu20IwPPCygQsc7BW/nYPrEBW9wI4NJCN
	XAp93yMgRQqhYHX2LpQpUwYfjL/ieRE1PgJjblMkt6sTMJCYyna17tPonmU/YPA5dT+F
	Dt1KI2nUon/b8QaqUN5hdYgj4Byy4BYA7hvTBmu6IGjqIrTzqZOT5S27NUrjwxFgpHgq
	ZodQ==
Received: by 10.180.85.70 with SMTP id f6mr2453541wiz.5.1333002177544;
	Wed, 28 Mar 2012 23:22:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fz9sm64189427wib.3.2012.03.28.23.22.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 23:22:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2012 08:22:51 +0200
Message-Id: <cover.1333001415.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [PATCH 0/2] more kernel.bbclass updates
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
X-List-Received-Date: Thu, 29 Mar 2012 06:32:00 -0000

The following changes since commit 432e36300d7231c9b01cd2c6c4b39b84cf4fddca:

  rpm: Ensure we depend on file (2012-03-28 18:40:20 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/kernel2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/kernel2

Martin Jansa (2):
  kernel.bbclass: merge uboot_mkimage improvements from meta-oe
  kernel.bbclass: unify white spaces

 meta/classes/kernel.bbclass |   77 +++++++++++++++++++++++-------------------
 1 files changed, 42 insertions(+), 35 deletions(-)

-- 
1.7.8.5



