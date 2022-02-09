Return-Path: <matthias@extraklein.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF522C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 07:42:38 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.97])
 by mx.groups.io with SMTP id smtpd.web08.23712.1644392555609831799
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 23:42:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@extraklein.de
 header.s=key2 header.b=Esau2ui0;
 spf=pass (domain: extraklein.de, ip: 188.68.63.97,
 mailfrom: matthias@extraklein.de)
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4JtsKh5qtJz4yPS
	for <openembedded-core@lists.openembedded.org>;
 Wed,  9 Feb 2022 08:42:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=extraklein.de;
	s=key2; t=1644392552;
	bh=0q2CILzQH4F2hm4DHmKVa1dWpQ5RqboiLm9v03IrF8s=;
	h=From:To:Cc:Subject:Date:From;
	b=Esau2ui0iTfvTak/4QSvplM5sm7CJYXM7dBFssxy6dxUQsdqjjLqjglntGmSlA4Tx
	 XVsgswm4NW8FQeMaEfKBAvsE/Kj3M8BDHocxrq2HXEvH41yQ1+EPK1XYmKpOyVarfM
	 M6ebW27jU2heAIFjv067tasby8ojV63/VqjUrC5Cq7lcK3SKcP4aTd1pcraRCoag/o
	 IO6xfthyQLtpNMFaIlGM2LK2YdR8Zp1PBml5zRG2Y2pk6agLR8WdIKlauhd5N1kyGv
	 Cps3quIO9qIAxc4xBlna6EuuwLaKSkngRJ6jhbtSsdnMt5zeSnzhKvxoZSI/Tm1xeR
	 w+x2n4FycXNgQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4JtsKh5QQ0z4yP2
	for <openembedded-core@lists.openembedded.org>;
 Wed,  9 Feb 2022 08:42:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
Received: from mx2fa3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4JtsKh1V68z8sgW
	for <openembedded-core@lists.openembedded.org>;
 Wed,  9 Feb 2022 08:42:31 +0100 (CET)
Received: from localhost (ip-062-143-218-156.um16.pools.vodafone-ip.de
 [62.143.218.156])
	by mx2fa3.netcup.net (Postfix) with ESMTPSA id 5737314011C;
	Wed,  9 Feb 2022 08:42:31 +0100 (CET)
Authentication-Results: mx2fa3;
        spf=pass (sender IP is 62.143.218.156)
 smtp.mailfrom=matthias@extraklein.de smtp.helo=localhost
Received-SPF: pass (mx2fa3: connection is authenticated)
From: Matthias Klein <matthias@extraklein.de>
To: openembedded-core@lists.openembedded.org
Cc: Matthias Klein <matthias@extraklein.de>
Subject: [OE-core][PATCH] boost: add json lib
Date: Wed,  9 Feb 2022 08:42:21 +0100
Message-Id: <20220209074221.1199-1-matthias@extraklein.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-PPP-Message-ID: <164439255160.30452.5983176229079826789@mx2fa3.netcup.net>
X-PPP-Vhost: extraklein.de
X-NC-CID: q/4iKEe8940mAhzLpz8jg/4/ScxKhfmKTM1gn3delXofnpKbiwA=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 07:42:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161537

Add the json lib which provides containers and algorithms
that implement JavaScript Object Notation, or simply "JSON",
a lightweight data-interchange format.

Signed-off-by: Matthias Klein <matthias@extraklein.de>
---
 meta/recipes-support/boost/boost.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/=
boost/boost.inc
index fa49ed3f8a..402f1592cf 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -28,6 +28,7 @@ BOOST_LIBS =3D "\
 	graph \
 	headers \
 	iostreams \
+	json \
 	log \
 	math \
 	program_options \
--=20
2.30.2


