Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 58FA46C49D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 12:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Tp1l2v8GMCKvI0QfqHfigblTmOacsaR5Ik235jPjOHE=;
	b=x/8x78b6QSG94WHGuH8xPNyZfx
	wpViNukwpvr942MjChJfp9Hk3bsy7KVJ6HhpS4sUqM4XZ1rEyQZRvWjttC1MRbvrll6D1DGX4OACQ
	oriF+bprAmmKVgBXX09Y773QJohHrdb4Eo8+NAqAU5/PJEzJQF6I++SVg19722mjfyvrgG3HyMxeb
	LTs62Wz8KpBJx+2Yj/NSoee+3zyxqRbWhYZli4imzRfqPSgKSDz2wSyeu+bC113JLjVikn8BqPaz8
	Dw8EwzmaCSs1GEVbG0PgTMccXyohGeCbqgHJdMHxBn7hbCE6Qh0WNYzukqbbMOFyItZYPvjoeHo35
	y8xIPDzQ==;
Received: from lakka.kapsi.fi ([2001:67c:1be8::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1gSLKO-0004JL-HM; Thu, 29 Nov 2018 14:21:56 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1gSLKO-0005V2-Fq; Thu, 29 Nov 2018 14:21:56 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 14:21:32 +0200
Message-Id: <1543494097-19534-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 2001:67c:1be8::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Cc: Michael.Ho@bmw.de
Subject: [PATCH 0/5] various fixes
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
X-List-Received-Date: Thu, 29 Nov 2018 12:55:47 -0000

Hi,

Here are some patches we have to use on sumo. Developed and
tested heavily on sumo and only compile tested with core-image-minimal
on top of master branch.

Michael Ho (3):
  cmake.bbclass: append includedir to implicit include dirs
  sstate: add support for caching shared workdir tasks
  insane.bbclass: add package specific skips to sstate hash

Mikko Rapeli (1):
  RFC image_types.bbclass: add image size limit for tar image type

Ulf Magnusson (1):
  bitbake: fetch2/svn: Fix SVN repository concurrent update race

 bitbake/lib/bb/fetch2/svn.py     | 64 ++++++++++++++++++++++------------------
 meta/classes/cmake.bbclass       |  4 +++
 meta/classes/image.bbclass       |  2 +-
 meta/classes/image_types.bbclass | 11 ++++++-
 meta/classes/insane.bbclass      |  7 +++++
 meta/classes/sstate.bbclass      |  6 ++++
 6 files changed, 64 insertions(+), 30 deletions(-)

-- 
1.9.1


