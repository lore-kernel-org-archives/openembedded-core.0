Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id C4C9D7895A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 04:51:37 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id z197so10565322qkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 20:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E+0uG99PPjKb+p58VGmk4feeQ379xAG3aqocfSgjhTo=;
	b=L4BsMZrcVll5dI1D2i/r/0mNMj8aO8LRCcFTu1RX1aTK3iR1o1pZwQECx+vWxHIbkm
	b+giDlnPK/nMEsKxPXJPf53mI/eKE2cHX5PtC26gnoc2AqRYMUE+HXut4EFc6rsHj6SA
	Fs0wRIHVaLJ0c3XZo5oquDAVn2oUUp/5No2DdPJZN8OKekr6OrFlP7Q8Ih1qK3S45rmS
	QYmbGOZpGiE47bGp73PAAPX/lOQFPkrVImzVqfT3fCk8fJZldGz//HnpIuCcnG+hLzwM
	2Ppn4U8rfJYH4za86Z4IEqpwYjmEOH+M5RXKb7bhg4JlH9uIYG4xo89HA1QfBLsbKezo
	BSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E+0uG99PPjKb+p58VGmk4feeQ379xAG3aqocfSgjhTo=;
	b=mqcIT2z+ZfKkJFpjxreJyGXsp1w18nKQU0VVtjIrMaDDcR2oy1q+C+CL6NJN6E0pYO
	qKANfBg75b0MmdOAkA450JLieuUBpSw0A7hFY5uaG45/nfohIDLqMjgX9K9uX6mFtw3t
	LkEdtxddlU6XsHa2ApDCYtjRpC7sdX+d1XWshNemJ54qqwAWpBQ8q0Is+Bn3q7RvroiB
	liuBcG/VNLo/dC7H4UMMw6sBhRgkShXRO+4xpGQLFCHEdgXW5N3Yds3VqlXntwFhmgAv
	tE9NiWdk1WlGUA+j4YZG97RyPW3aF++/tboQhpMMU5mB4v35UdMWKVyNz1VKNDeK5E91
	jgDQ==
X-Gm-Message-State: AElRT7FehDsjW8LOS2kADza1iY2Jnk/4E9+dULlurSaZvU24YP8uzqM+
	UFSxEB437CqVxTHUM/7foEBMG5Jh
X-Google-Smtp-Source: AG47ELvwnj8h8VAdGRJJYl5zumglEDN6UC+THDA6rr+dJDg3++tdgl0DsRsI2n0kHqDHMzLebslmMA==
X-Received: by 10.55.162.73 with SMTP id l70mr6723909qke.124.1519966298655;
	Thu, 01 Mar 2018 20:51:38 -0800 (PST)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236])
	by smtp.gmail.com with ESMTPSA id j7sm3866477qtn.58.2018.03.01.20.51.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 20:51:38 -0800 (PST)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 23:51:18 -0500
Message-Id: <20180302045118.3708-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Subject: [meta-oe][PATCH v2] python-matplotlib: Change download name
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
X-List-Received-Date: Fri, 02 Mar 2018 04:51:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Just having "v2.0.2.tar.gz" was causing problems with other
similarly misconfigured packages.

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb b/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
index 5b1c3f05b..b7a3fcfc1 100644
--- a/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74"
 DEPENDS += "python-numpy freetype libpng python-dateutil python-pytz"
 RDEPENDS_${PN} = "python-core python-distutils python-numpy freetype libpng python-dateutil python-pytz"
 
-SRC_URI = "https://github.com/matplotlib/matplotlib/archive/v${PV}.tar.gz \
+SRC_URI = "https://github.com/matplotlib/matplotlib/archive/v${PV}.tar.gz;downloadfilename=${BP}-${PN}.tar.gz \
            file://fix_setupext.patch \
 "
 SRC_URI[md5sum] = "89717c1ef3c6fdcd6fb1f3b597a4858c"
-- 
2.11.0


