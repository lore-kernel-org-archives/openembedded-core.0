Return-Path: <adi@adirat.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 53F267847B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 02:19:52 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id p104so11861952wrc.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 18:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=adirat-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=sVGdixCWHXMUTmQ4Sk/FO7MkNSGNN2hwVseSyoQ0QFo=;
	b=A8YTZX03S+3mahJwcjUEXs3y/yo5dmF4Kt4TWk8l3e2cUSoJFI6wnSoxLYz6wlQFGM
	W+riUKkXePQ0SLAY2JrIbp3LzABEdt6JzWtQ4cp7+USdpGbPj22+ibr7Ju5Db/L72SOf
	349ywuNbuotnkrQ73GNq3KK9H3Uh2BbfmCdvaBOnP1wTNUip6HPGsSQRNgcYIWzeNzgv
	ZPKbNfjhem76VM7aYXGNZqamjixaWYHi5ovVSZNd5zetzCU3ZTBr0FeOnWaEbUEBN2Nd
	utodZJg0yfF+p5j7TNgfW6YnNmVsKvrvx1rBJj6BYkJBX3ZdAPEPX7jI7Pi+7bjmilLF
	4Zpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sVGdixCWHXMUTmQ4Sk/FO7MkNSGNN2hwVseSyoQ0QFo=;
	b=DLYQwNcDVzTZjyPoSiaCXL0CduSBlpNYNzD8oC+BhOrO2WMG8AflVvnztlJksTpjrS
	ikJsb6E0d9CLAnBFTWRjkjlAVdjYKFY4wscJwZuaszB0l3177Z1C2qMrd3NrNKO7uRpd
	S3r/442szcWzueX4ViN7U6C5bWqUW+r701vR2RhTUB9iYzkpi1rwIMbeQZkXdcRLOgG9
	bXfuRmv9CiW1P1+biLFlIrEucZvyB12WXDWFt6z7EMj/l/mxMxzbxkOEV0+c9iIU1SaO
	e/wI9fgA3Q3g/NGzYvs3y2bM+n5AVh5fRMpBFsm58P3BrAvtBj5RScO4rzcUkLtbMN/F
	Gaqg==
X-Gm-Message-State: APf1xPCcsPFXNVr1VthzUQnf3F7nIb/FiFVOhffFeHdwFqqkbKeQJxgQ
	JsGGQ3u4HDJAsQgeQKqRUPeKR53b
X-Google-Smtp-Source: AG47ELucaZv4fNPpcnfCxXZ54F9jv8U9EhkXbWJOEQGvqnBijwREExOntB4whLkQlBmHdZA4m0fJMw==
X-Received: by 10.223.185.112 with SMTP id b45mr6495967wrg.159.1520043593584; 
	Fri, 02 Mar 2018 18:19:53 -0800 (PST)
Received: from adiPC.lan ([2a02:2f0e:190:12a9:eaa7:71e2:972d:878b])
	by smtp.gmail.com with ESMTPSA id
	b81sm2117999wmb.36.2018.03.02.18.19.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 18:19:52 -0800 (PST)
From: Ioan-Adrian Ratiu <adi@adirat.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Mar 2018 06:19:31 +0200
Message-Id: <20180303041931.16154-1-adi@adirat.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH] dtc: add rdepends_${PN}-misc = diffutils
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
X-List-Received-Date: Sat, 03 Mar 2018 02:19:53 -0000

Needed by dtdiff which calls `diff` to display its result.

Signed-off-by: Ioan-Adrian Ratiu <adi@adirat.com>
---
 meta/recipes-kernel/dtc/dtc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index d259c57e8d..9a90d44041 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -22,4 +22,4 @@ do_install () {
 PACKAGES =+ "${PN}-misc"
 FILES_${PN}-misc = "${bindir}/convert-dtsv0 ${bindir}/ftdump ${bindir}/dtdiff"
 
-RDEPENDS_${PN}-misc += "bash"
+RDEPENDS_${PN}-misc += "bash diffutils"
-- 
2.16.2


