Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6EA7D960
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 12:47:28 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	x3EClSpB032421
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 14:47:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1555246049;
	bh=jc0SWVAsw2swyV2sH+X0ffO9XxUKYLNeV1re+aIp8So=; l=1152;
	h=From:To:Cc:Subject:Date;
	b=gKOnOjVBd2Fp9G/BcTe7v821T3dMahojiYVYFgvT2Df6hqCbTmaeph7oF+SznJt3e
	YwTcCoEiGKS23k05fecsP/vOUrGfuIz969WWI1h0YaK6bIC+ZUQdX8ao8oL1+g2uKK
	jDF41Aw0yvXsGnu1f990lLoO3ur7ywWg/527f7Dc=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	x3EClLqQ020639 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Sun, 14 Apr 2019 14:47:21 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 7A40CAB5078;
	Sun, 14 Apr 2019 14:47:19 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	x3EClGGN020633
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sun, 14 Apr 2019 14:47:19 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.92) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1hFeXU-00EoWh-EI; Sun, 14 Apr 2019 14:47:16 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Apr 2019 14:47:01 +0200
Message-Id: <20190414124701.3530308-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] dhcp: fix isc_boolean_t patch
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
X-List-Received-Date: Sun, 14 Apr 2019 12:47:29 -0000
Content-Transfer-Encoding: 8bit

There is a copy & paste error in 5775e9ef2fce1d0b9860602f1065bb1e09bc1b61
which breaks dhcpd.

Cc: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 ...1-dhcpd-fix-Replace-custom-isc_boolean_t-with-C-standa.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-dhcpd-fix-Replace-custom-isc_boolean_t-with-C-standa.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-dhcpd-fix-Replace-custom-isc_boolean_t-with-C-standa.patch
index d2e57714cd..fa3d9c4e1f 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/0001-dhcpd-fix-Replace-custom-isc_boolean_t-with-C-standa.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0001-dhcpd-fix-Replace-custom-isc_boolean_t-with-C-standa.patch
@@ -1816,7 +1816,7 @@ Index: dhcp-4.4.1/common/options.c
  {
  	if (universe->save_func)
 -		(*universe->save_func)(universe, options, oc, ISC_FALSE);
-+		(*universe->save_func)(universe, options, oc, true);
++		(*universe->save_func)(universe, options, oc, false);
  	else
  		log_error("can't store options in %s space.", universe->name);
  }
-- 
2.20.1


