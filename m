Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6F2727FB21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:47:52 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id n7so1789228wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=iMlV9+mAODmlQfsrFvmf9t7LW8Lmm4X6z1rT+5AWV80=;
	b=D8b0q86r3Eie/iHA4eBUgLeQdUy/QUiMlsAZhzktOPtEytks3ZpBCBAJuZ8qtOoJXW
	tyd0df1WrbiOHvhdEUBQbdz1lEH2qLcaogtm4O5vMllLtWzBetvLCL1NcqqgzJoaBy3p
	/0fPppSFl72oYtipnpH2uqzFTUsHkPtvwKjtMsQDc4kiXK4EvfNn5vJNr4r11n1rVt4v
	siXYS7w2MNx/NPryhCl9PZwaZEqhOxHbIGHqgNdnJtDWhH77+24Qy5Zz9KkB4Y+Cf0qZ
	to1oVkr/ecgMg9rcpvntiv8qUA37+SyKl89XPebDmo5eQ33JV0U9wP2lGMNw0dSx/whx
	WKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=iMlV9+mAODmlQfsrFvmf9t7LW8Lmm4X6z1rT+5AWV80=;
	b=hIsLbqauAMVZtTxiNSDJDyHF/QL4x/rn4bpfdvuCyAfxb25z1VCcZvpVgbjW3IkMqn
	ZiZyUPbFGFojXY9b4KmaF/8vXtkKkCJpNVw/VJ3tXcbsTHT1NpHJNMbP+moacrfxjaNN
	3I+mGm5qUdw6cev00FKTwKokXoZa0DCXyckK43ddgBXCej/COoX/cUEBMvjIZ4rW3pZ0
	pchFYtdllG7dZX3xF4oSt2ksrjQ2hLM58oiZmCbtiFukb1nBvq1rY/yhstJ2+QDW2VJ2
	cG9WeoIfocdhW9nHkyq2v6L0Ta5jnO2vutgbOSaiB0ScztuqhWEgCRaVbXvoZL5b+OHv
	GfTQ==
X-Gm-Message-State: APjAAAWB1gy1hhoOBUMODbzBFYj8BbD/jwhZ0EOgA+mz/7jBdUzNHOWm
	BN+Gg6NFDBzAm9yoKreSH1p+mooiOBA=
X-Google-Smtp-Source: APXvYqwGyUWG2dMAEZRLJmJWFXJ5uHW0AAluZU9OL90+D2fzaGPQ9itGECev3ZeCkRpTv0Gwqb0G/A==
X-Received: by 2002:a1c:5f82:: with SMTP id t124mr3335258wmb.114.1572342472876;
	Tue, 29 Oct 2019 02:47:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	36sm29150537wrj.42.2019.10.29.02.47.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Oct 2019 02:47:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 10:47:25 +0100
Message-Id: <c3c909bffc78087958fc061cc30d854f87cc46dd.1572341125.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572341125.git.akuster808@gmail.com>
References: <cover.1572341125.git.akuster808@gmail.com>
Subject: [warrior 12/19] python: add tk-lib as runtime dependency for python-tkinter
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
X-List-Received-Date: Tue, 29 Oct 2019 09:47:53 -0000

From: Yi Zhao <yi.zhao@windriver.com>

Fixes:
ERROR: python-2.7.16-r0 do_package_qa: QA Issue:
/usr/lib/python2.7/lib-dynload/_tkinter.so contained in package
python-tkinter requires libtk8.6.so, but no providers found in
RDEPENDS_python-tkinter? [file-rdeps]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit f78248a2380bbbbf271b5bb02c762f5bc7a3a92e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/python/python3_3.7.4.bb | 2 +-
 meta/recipes-devtools/python/python_2.7.16.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
index dd16351..af3c325 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.4.bb
@@ -294,6 +294,6 @@ FILES_${PN}-man = "${datadir}/man"
 
 RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
-RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk', '', d)}"
+RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
 RDEPENDS_${PN}-dev = ""
 
diff --git a/meta/recipes-devtools/python/python_2.7.16.bb b/meta/recipes-devtools/python/python_2.7.16.bb
index a02a628..ec724c3 100644
--- a/meta/recipes-devtools/python/python_2.7.16.bb
+++ b/meta/recipes-devtools/python/python_2.7.16.bb
@@ -173,7 +173,7 @@ RDEPENDS_${PN}-modules += "${PN}-misc"
 
 # ptest
 RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip tzdata-europe coreutils sed"
-RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk', '', d)}"
+RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
 # catch manpage
 PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
-- 
2.7.4


