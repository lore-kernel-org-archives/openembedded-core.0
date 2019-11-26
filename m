Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 121547FBE4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 08:56:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47Md722YXxz4J
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 09:56:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574758590;
	bh=/pK8kOB8SaQGEi/3mKmcJYM0i4MTuUmlLDLpU7MyKNw=;
	h=From:To:Subject:Date:From;
	b=stBw8I/yx/gEMWzWHY8KW7HRDWVwawctYDYC/m2Nu3ImfuyGqbj8DcjCwZRS2uDFS
	TWj2cIVjBVDT8wXgaEnw0p4cL+MP6s032MrHGGt9nct0sTr40KwSDL0W65ER2iRPG9
	weHKXOR7g5pMrjLlG04JdJfOG3Evl3KlOu+XdHji6xoOa69g4hjVxzZoGlNDeqSHwx
	KH6Vomr78jdsyE7KTeaXHPzVc5D+2jIHvzXGLb3/LE1wSnTDC0WwvJoHN60XSNRjvk
	El/48yY32QfuM/7XL9D4n0/HOWh07vtbrEiZEMuODLyNhADi9GSQChEY0bVNI49DNF
	zijks8ctb1C1nGlCqlK2gVAhEa/pvMfMOTlXUYwcGXfn8XfI74saHRX+XzqeZUFIKD
	eggotTtHZE7LP6S0+OMVUGsak/QQKK+8d8DpEW9x/Nj4kM3ICP8LwNjKPo4oHSFKNN
	dRyYHznC2TCS6Dompb8DdyH332eA4jiuYGTwQ5Kmj4FEdfNdH/DtC/f4xN16Aq7wda
	5dCyXIfUDANyOgMbJMWRJy6PHybgenuhpvI7MS5eUZEEL51WsftFRTH1xnQ/y6Nb/+
	8CgXj3ZOCYfcW5eB5IJydCBfBrACRVhy1WN/lJGR8hpJIXQejSw7IA6pYWTJluvZaG
	ncnSAwlNjZrn1FcJJMBw6wPM=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2019 10:56:29 +0200
Message-Id: <20191126085629.15841-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [zeus][PATCH] bind: Whitelist CVE-2019-6470
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
X-List-Received-Date: Tue, 26 Nov 2019 08:56:32 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/bind/bind_9.11.5-P4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
index 92fd628e7d..b0bb64b7c7 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
@@ -37,6 +37,10 @@ UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
 UPSTREAM_CHECK_REGEX = "(?P<pver>9.(11|16|20|24|28)(\.\d+)+(-P\d+)*)/"
 
+# BIND >= 9.11.2 need dhcpd >= 4.4.0,
+# don't report it here since dhcpd is already recent enough.
+CVE_CHECK_WHITELIST += "CVE-2019-6470"
+
 inherit autotools update-rc.d systemd useradd pkgconfig multilib_script
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/bind9-config ${PN}:${bindir}/isc-config.sh"
-- 
2.17.1


