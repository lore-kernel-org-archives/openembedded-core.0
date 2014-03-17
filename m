Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id E76BC6EEEE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 09:30:44 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id mc6so3429245lab.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 02:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=LxWIZ9+n+Yvu/aihYJY+1p6IExsFty9BrHXwPo14hxs=;
	b=m4/An3nHsC95W2FlVWU5X0dxf2ozb13L0bqHMKuHNiNPjf3WZHhOj2Avm/kEip6wHJ
	YiS8YJAigFf5TO9LPkx/FnLD0V1SsW7QclEeslU5jHyGjdhEj81VsMkf0aQJpd+X23eD
	1jEbQsM16PngkxP14Th8k24ZVskrrTC1r/G8SRqKTjMsRGrXIpg47cCphuaALtJISeTl
	QVU+Wexp7v7liLMZb+dS1KIAH1I3pQa1O0UF0Ag8GYqvoalKyEk3IL/svW1IJnqCR0D1
	lO6pNsamOgkBhplA23pQ1v7QQXLcgI+N2t2o3emEX5UXgC3IElT5bVJ08ekknd4ynRMN
	Pgrw==
X-Received: by 10.112.138.10 with SMTP id qm10mr15256950lbb.19.1395048645420; 
	Mon, 17 Mar 2014 02:30:45 -0700 (PDT)
Received: from neopili.qtec.com (0x4dd4aed9.adsl.cybercity.dk.
	[77.212.174.217]) by mx.google.com with ESMTPSA id
	kz7sm13124728lab.16.2014.03.17.02.30.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Mar 2014 02:30:44 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, liezhi.yang@windriver.com
Date: Mon, 17 Mar 2014 10:30:36 +0100
Message-Id: <1395048637-22413-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 1/2 v2] apt-native: Install apt-ftparchive
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
X-List-Received-Date: Mon, 17 Mar 2014 09:30:47 -0000

apt-ftparchive is needed to create a Release file compatible with
SecureApt.

It is also a more efficient replacement of dpkg-scanpackages.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-devtools/apt/apt-native.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
index 294ca94..36035b0 100644
--- a/meta/recipes-devtools/apt/apt-native.inc
+++ b/meta/recipes-devtools/apt/apt-native.inc
@@ -39,6 +39,7 @@ do_install_base () {
 	install -m 0755 bin/apt-cache ${D}${bindir}/
 	install -m 0755 bin/apt-sortpkgs ${D}${bindir}/
 	install -m 0755 bin/apt-extracttemplates ${D}${bindir}/
+	install -m 0755 bin/apt-ftparchive ${D}${bindir}/
 
 	eval `cat environment.mak | grep ^GLIBC_VER | sed -e's, = ,=,'`
 	eval `cat environment.mak | grep ^LIBSTDCPP_VER | sed -e's, = ,=,'`
-- 
1.9.0


