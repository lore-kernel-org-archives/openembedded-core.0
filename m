Return-Path: <andhorsthemke@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id D700572F81
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 09:03:39 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id g10so758036wrg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 01:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=R3FWsRVcH2DmdGyZ1efC+P43F8QQoIYERnk1TakUAlQ=;
	b=iB1h8MLIme1QCHUDxebh/gP9PKLUCFoEhpTboo5yETMjJ+VHnoCM9E1Xk08Kw245tc
	wXTerHA1L2K9kQTkl0mSJlUBu+hjswp/Q+73xA8MrbK2Mp3dbpgxGwUAeEpUH6+QU/u+
	tsJmUGUkuN43a5iee1k3nP8hNNQfHIvV1ZnFVmlyo6Qh0mPTU4YERZwNGkxnoMyCAsew
	9C5g2QEWXs/vrOo8Yt/Q/L9M3xmON9mw44v6zq8BUGEMv6NvU4n4MTNjRA9uIpM9f0ua
	kcvq7sCL2Qoq6AqkiwfrkMwAtlstd6O3a66sZu8Yzs7QoK1ZGwkunyUVh3XolGybZTkA
	xiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=R3FWsRVcH2DmdGyZ1efC+P43F8QQoIYERnk1TakUAlQ=;
	b=dQ55o3nOI+bBfmFNYHpfrOWTXbOdN0e3QCVWd+95a4QTQlclhlbi7c/SQBfHggcqic
	aQbqaik8mkg6FoHAXeQyHmcuj8DhxsX4NWFPsladwPDD4AbSSMyBB2JaLroJ9Uh/3aST
	Dqxxi1Gs8w6ALukiKhe35j9KobwHZQLUzQk8piMVmCpuPQPdnGmSZNGAHqRrZ3ALJfh5
	AA9PHXyR1Twp6Kth9tcpi4G5C75uEdboSMjALeft7spwA2zcFeSAPYM4ieBjPZHJIqZp
	lbauHW7nWDyReEcMc8g9LaRDnUtNOePgWNHDJ75fecWMBjPA9Q1WnB4h/hu7a+X9B1nx
	/U+Q==
X-Gm-Message-State: AMke39lAmHV9ZTfX5pyKd9+DSmtc8wigbSJJ0G5WzkikOPsML7kOa6xOoR22hD07sJKPsQ==
X-Received: by 10.223.135.237 with SMTP id c42mr1152440wrc.139.1488272620190; 
	Tue, 28 Feb 2017 01:03:40 -0800 (PST)
Received: from workstation.Speedport_W_724V_Typ_A_05011603_00_011
	(p2003007A897429704D84F183E60A14C3.dip0.t-ipconnect.de.
	[2003:7a:8974:2970:4d84:f183:e60a:14c3])
	by smtp.gmail.com with ESMTPSA id
	k128sm1568917wmf.16.2017.02.28.01.03.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Feb 2017 01:03:39 -0800 (PST)
From: Andreas Horsthemke <andhorsthemke@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2017 10:03:15 +0100
Message-Id: <20170228090315.20376-1-andhorsthemke@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <CAJTo0LYmQj2y_HxBt02efd0906Ljs+FcJE06s=_svn1cCCLHzg () mail !
	gmail ! com>
References: <CAJTo0LYmQj2y_HxBt02efd0906Ljs+FcJE06s=_svn1cCCLHzg () mail !
	gmail ! com>
Subject: [PATCH v2] lz4: upgrade to v1.7.5
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
X-List-Received-Date: Tue, 28 Feb 2017 09:03:40 -0000

Upgrade from r131. The version numbering changed to a new style.
Split into a BSD licsensed library package and a GPLv2 licsensed
package for the CLI tools.

Signed-off-by: Andreas Horsthemke <andhorsthemke@gmail.com>
---
 meta/recipes-support/lz4/lz4.bb | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/lz4/lz4.bb b/meta/recipes-support/lz4/lz4.bb
index 18e56d04c6..3e43cb70bc 100644
--- a/meta/recipes-support/lz4/lz4.bb
+++ b/meta/recipes-support/lz4/lz4.bb
@@ -1,12 +1,19 @@
 SUMMARY = "Extremely Fast Compression algorithm"
 DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
 
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
+# The source includes GPLv2 and BSD licensed files.
+# The library in the `lib` directory is under BSD 2-Clause license.
+# The CLI tools are GPLv2 licensed.
+LICENSE = "GPLv2 & BSD"
+LICENSE_${PN} = "BSD"
+LICENSE_${PN}-cli = "GPLv2"
+LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc \
+                    file://programs/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "d86dc916771c126afb797637dda9f6421c0cb998"
+SRCREV = "7bb64ff2b69a9f8367de9ab483cdadf42b4c1b65"
 
-PV = "131+git${SRCPV}"
+PE = "1"
+PV = "1.7.5+git${SRCPV}"
 
 SRC_URI = "git://github.com/Cyan4973/lz4.git"
 
@@ -18,4 +25,8 @@ do_install() {
 	oe_runmake install
 }
 
+PACKAGES =+ "${PN}-cli"
+DESCRIPTION_${PN}-cli = "Command line interface tools for the LZ4 compression algorithm"
+FILES_${PN}-cli = "${bindir}/*"
+
 BBCLASSEXTEND += "native nativesdk"
-- 
2.11.0


