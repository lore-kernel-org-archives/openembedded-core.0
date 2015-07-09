Return-Path: <prvs=163270e187=steffen.pankratz@elektrobit.com>
Received: from smtpgwcipde.automotive.elektrobit.c
	(smtpgwcipde.automotive.elektrobit.com [213.95.163.141])
	by mail.openembedded.org (Postfix) with ESMTP id 43C4760557
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 14:12:12 +0000 (UTC)
Received: from denue6es002.localdomain ([213.95.163.135])
	by denue6es004.ebgroup.elektrobit.com with ESMTP id
	t69DfkA0032414-t69DfkA2032414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=CAFAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jul 2015 15:41:46 +0200
Received: from denue6es002. (localhost [127.0.0.1])
	by denue6es002.localdomain (Postfix) with SMTP id 305FE19283
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 15:41:46 +0200 (CEST)
Received: from deeres07.ebgroup.elektrobit.com
	(deeres07.ebgroup.elektrobit.com [10.0.10.10])
	by denue6es002.localdomain (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 15:41:45 +0200 (CEST)
Received: from vagrant-ubuntu-trusty-64.ebgroup.elektrobit.com (10.0.26.198)
	by deeres07.ebgroup.elektrobit.com (10.0.10.10) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 9 Jul 2015 15:41:45 +0200
From: Steffen Pankratz <steffen.pankratz@elektrobit.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Jul 2015 13:41:34 +0000
Message-ID: <1436449295-31251-1-git-send-email-steffen.pankratz@elektrobit.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <CAJTo0LbFvNiD5fbLkHF37SPCGJJ-5fGBxGdXKQ5yy5gD=Uh=sw@mail.gmail.com>
References: <CAJTo0LbFvNiD5fbLkHF37SPCGJJ-5fGBxGdXKQ5yy5gD=Uh=sw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.26.198]
Subject: Re: [PATCH] libdrm: Upgrade to 2.4.62
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
X-List-Received-Date: Thu, 09 Jul 2015 14:12:17 -0000
Content-Type: text/plain

Hi Ross

> Can you re-send this using git-send-email, something is mangling the patch and it won't apply.

Here we go.


Regards
-Steffen

Steffen Pankratz (1):
  libdrm: Upgrade to 2.4.62

 .../recipes-graphics/drm/libdrm/installtests.patch |  8 ++---
 meta/recipes-graphics/drm/libdrm_2.4.59.bb         | 41 ---------------------
 meta/recipes-graphics/drm/libdrm_2.4.62.bb         | 42 ++++++++++++++++++++++
 3 files changed, 46 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-graphics/drm/libdrm_2.4.59.bb
 create mode 100644 meta/recipes-graphics/drm/libdrm_2.4.62.bb

-- 
1.9.1


