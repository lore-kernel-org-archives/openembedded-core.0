Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id AA9277F266
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 21:20:15 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id s15so36536736wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 14:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IbRzYqPZicNPEyXgsXJ/1iMrhdJfaskPmJ2p22/bQNM=;
	b=eOHorXtmMFIOHO5ORjQSabeYg5zySh0mnRn9kA8etXMnJjl5Gh0A8loqEgRVHwwdmJ
	7oq9pXf6cWlGJ5t0oyGIoyttee7k1ZEfJWmLDcJBUluhM+7N82QgGreWo5sl10xdJY2U
	tDg8WjTO/rP+a0dpROK0yZRZq7dbVnkpcJFSth1mCI2IkQaKR+pmMq+Rw91RQVoDaF14
	6myYbmgfu8si0xwUuqPyRKA+TX97j+nrur8HnHqmXSPCJxY+w34RO9KYiSPvBq0YAxUu
	6YgGqTQ/KDP5yLUn4wnFVA5l295zgpbnLlvFwNh7gvNsnoqWgdeVIS2FhHRSijq5tcQ1
	u5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IbRzYqPZicNPEyXgsXJ/1iMrhdJfaskPmJ2p22/bQNM=;
	b=jkb3Jb56g14QrzIVG1qGjKSes3BSCtvrdvhmBwH/ItVkUhztutOEnAvTfJbHL1n22t
	QTGpLAfIx25uiVugn2AIPiiTUXZntG545zKEBqv58KJmomhzTnHeAU19krG3YxULBjmW
	hrUPcf1cbywZ+S6NDrCPPPRe8KQrCLooyy75hybprqmspmUXTECAppSbQww25i8D3535
	d256ugHEPWe0M1iuEugenp54HFTMcTnjTpHXl55apm6Gs3TZ5U52ffXAaPhhR1uQGzRU
	tNZo6HhpXn/LHu5mCPFptQ+Jo09TX64YTdXE0t3WT2rMBYy8PU9jwhkX7y3IS6P7sF/I
	eS0g==
X-Gm-Message-State: APjAAAXbsh81t8VRJDTjrlWluLPYu0vz8kErHHgZGJY3YKrJOZh6zDt4
	6zyXlkvzg7vBjVYc/537Mn4hLUBYXWo=
X-Google-Smtp-Source: APXvYqxOfHSXuQgVHcR58pMAOtet8n48/JhGZldJC2MZQplx3q2xsypthJwfn33keBjzuOXOo2vDzg==
X-Received: by 2002:a1c:c78d:: with SMTP id x135mr99473587wmf.82.1564521615960;
	Tue, 30 Jul 2019 14:20:15 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y16sm66737943wrw.33.2019.07.30.14.20.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 30 Jul 2019 14:20:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2019 22:20:11 +0100
Message-Id: <20190730212012.24115-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] perl: fix whitespace
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
X-List-Received-Date: Tue, 30 Jul 2019 21:20:16 -0000
Content-Transfer-Encoding: 8bit

There was some tabs embedded in spaces, fix those.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/perl/perl_5.30.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.30.0.bb b/meta/recipes-devtools/perl/perl_5.30.0.bb
index e3664290e30..ce280cb1cbd 100644
--- a/meta/recipes-devtools/perl/perl_5.30.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.0.bb
@@ -179,7 +179,7 @@ perl_package_preprocess () {
             ${PKGD}${libdir}/perl5/${PV}/Config.pm \
             ${PKGD}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/Config.pm \
             ${PKGD}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/Config.pod \
-	    ${PKGD}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/Config_git.pl \
+            ${PKGD}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/Config_git.pl \
             ${PKGD}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/Config_heavy.pl \
             ${PKGD}${libdir}/perl5/${PV}/ExtUtils/Liblist/Kid.pm \
             ${PKGD}${libdir}/perl5/${PV}/FileCache.pm \
@@ -192,7 +192,7 @@ require perl-ptest.inc
 FILES_${PN} = "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} ${libdir}/libperl.so* \
                ${libdir}/perl5/site_perl \
                ${libdir}/perl5/${PV}/Config.pm \
-	       ${libdir}/perl5/${PV}/*/Config_git.pl \
+               ${libdir}/perl5/${PV}/*/Config_git.pl \
                ${libdir}/perl5/${PV}/*/Config_heavy-target.pl \
                ${libdir}/perl5/config.sh \
                ${libdir}/perl5/${PV}/strict.pm \
-- 
2.20.1


