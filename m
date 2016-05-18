Return-Path: <herve.jourdain@neuf.fr>
X-Greylist: delayed 497 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 18 May 2016 09:54:07 UTC
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.1])
	by mail.openembedded.org (Postfix) with ESMTP id 58ED47700A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:54:07 +0000 (UTC)
Received: from localhost.localdomain (111-250-207-159.dynamic.hinet.net
	[111.250.207.159])
	by msfrf2610.sfr.fr (SMTP Server) with ESMTP id 4A9EA1C000C11;
	Wed, 18 May 2016 11:45:50 +0200 (CEST)
Received: from localhost.localdomain (111-250-207-159.dynamic.hinet.net
	[111.250.207.159])	(using TLSv1.2
	with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2610.sfr.fr (SMTP Server) with ESMTPSA;
	Wed, 18 May 2016 11:45:48 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2016 17:45:25 +0800
Message-Id: <1463564726-111166-1-git-send-email-herve.jourdain@neuf.fr>
X-Mailer: git-send-email 2.7.4
X-sfr-mailing: LEGIT
MIME-Version: 1.0
Subject: [mesa][PATCH 0/1] Fix mesa_populate_packages() when dri is disabled
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
X-List-Received-Date: Wed, 18 May 2016 09:54:10 -0000

When compiling mesa, if dri is disabled in PACKAGECONFIG, or if the list of DRI drivers is empty, it will cause populate_package to fail, because it can't find - rightfully - the directory for the DRI drivers.
This patch checks that the directory indeed exists before trying to get a list of the files in it

Herve Jourdain (1):
  Fix mesa_populate_packages() when dri is disabled

 meta/recipes-graphics/mesa/mesa.inc | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

-- 
2.7.4


