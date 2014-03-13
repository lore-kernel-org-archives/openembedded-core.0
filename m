Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 56BB96D8C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 13:27:08 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id s7so689104lbd.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 06:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=LxWIZ9+n+Yvu/aihYJY+1p6IExsFty9BrHXwPo14hxs=;
	b=lOPEaM+Pm4yWP9t8H2rmMnOuyS7FITpWD4uqi6Ynr2wcmK6TLBrtpfNYVF8wuz/Cfe
	xRDv3Ooe/jjixW2tapCOUjLQWWkaYER55BRpoxOGwtd2fctbTGMgp0BTb8pn7hFSEc89
	8GWGYnsHy/MPd5z7vc3YlSnnvqCSSBvH2bfx8tvBDd5nKgBXOCLDt4RO4Bzit4R+LNSO
	RikLLMQqkmXMUASNWpxL/zcco6lJ3dWBy+IiWsJPIYrk8b6bGRzYz6kfbJIvEpqZr64O
	1ThOGJmmDEA+JtJxV1XEMeUtpyEdpzyYmtvwkDW59AtL5/nYt+giBMTpO0fSPtMpL9p3
	KnNg==
X-Received: by 10.112.140.202 with SMTP id ri10mr1189919lbb.9.1394717229232;
	Thu, 13 Mar 2014 06:27:09 -0700 (PDT)
Received: from neopili.qtec.com (0x4dd4aed9.adsl.cybercity.dk.
	[77.212.174.217])
	by mx.google.com with ESMTPSA id f9sm2102734laa.8.2014.03.13.06.27.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Mar 2014 06:27:08 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Mar 2014 14:27:03 +0100
Message-Id: <1394717224-15283-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 1/2] apt-native: Install apt-ftparchive
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
X-List-Received-Date: Thu, 13 Mar 2014 13:27:12 -0000

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


