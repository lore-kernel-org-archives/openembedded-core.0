Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 26F227C617
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 21:10:07 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l5so6982737wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 13:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pSkdVhMtyppoPrPu080oTZ/ohU2oMzJ/jRYDlTN8ljQ=;
	b=iamUlKPZ0Z0YQVRvsC9nyg5rJU8uqBevh0t7G9moGtan+c8v44Dr8fysZCKlqX6IbX
	zRMfby1fwvy+0/NvoyTNiorjhrrHTstdVVprEU82acEWDYXWDiC4NtuCO7DuCy1TUzSV
	dr6U3rWeQ1yavSFv8rtv9aaMw9c2GG1InPD/9OWCk2FhP5SQmLUyHV/i1Pur2sPDilWo
	BXpvZ3XvaOOdrqI/O6ev+XE+h4L9VbJqJVkEHJUu6ymPI2vcX3PLo4Ren8FgvOZirRuk
	VkusS2Aogdjovt5AUF6Tz5T4Ql3a/brj/mpX1KxAQW6EUB7NRaMT35f7bDyUTtrhnBYV
	LyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pSkdVhMtyppoPrPu080oTZ/ohU2oMzJ/jRYDlTN8ljQ=;
	b=dWQ+Mh7cjrm76nWmc+iLfe6IjjBvnDj2FZI/ZxCBdQS6DO23HHt5QFqqFtU/9U3f9v
	g94uMuhgF/MUS7TVxlC5Y37wOafXkMNv1Hsjz2k8g2BTHnPiKxNzV8BI+fFGqNRnwdCC
	ym3H0Jmvw1eU433x6yBtx4KJD8ClqQbupWMw/AsWTXHDlahREFORPj8uK1oRe00xXHy4
	n/BnGiGesBBpM2b/j8kgOO/bfZyg5J03JO/B0K6twXVT7NSOMYjZGazcskUUHHVPJRNy
	nH/sKfdlAA4zGoooh3Q8EuoV8SIMvrb1pEdivGyMyisaAAcavgHOEsP4szY0NiVqOyFz
	ogdg==
X-Gm-Message-State: AHQUAubm2RFRbCptZe0m7tpYFJj2lMJCj/+taIdKG71VFibPzLEnHXX/
	EZbkop2P36FPdza0GFMilQePYpiFE9K0Dw==
X-Google-Smtp-Source: AHgI3IbxN86PyFd1keDUG+nNw3Crj2bcF4EtncbtSo7onr++ZYDt7Tpl9bwqlCjdrOaf93ZPr2ybQA==
X-Received: by 2002:adf:c54d:: with SMTP id s13mr4125576wrf.169.1550178607509; 
	Thu, 14 Feb 2019 13:10:07 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	m21sm5341306wmi.43.2019.02.14.13.10.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Feb 2019 13:10:06 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2019 21:09:49 +0000
Message-Id: <1550178589-15839-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] bmap-tools: update from 3.4 to 3.5
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
X-List-Received-Date: Thu, 14 Feb 2019 21:10:07 -0000

bmap-tools 3.5 was released August 2018 but has no release tarball, so
switch to using the git fetcher. Also pull in the fix for StopIteration
being transformed into RuntimeError for Python 3.7.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../bmap-tools/{bmap-tools_3.4.bb => bmap-tools_3.5.bb}          | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-support/bmap-tools/{bmap-tools_3.4.bb => bmap-tools_3.5.bb} (74%)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
similarity index 74%
rename from meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
rename to meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
index 2aae9a3fe0d8..25d66df623a0 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
@@ -9,12 +9,13 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "https://github.com/intel/${BPN}/releases/download/v${PV}/${BP}.tgz"
+SRC_URI = "git://github.com/intel/${BPN}"
 
-SRC_URI[md5sum] = "883420183611aa137cbaf68a91ef0d7e"
-SRC_URI[sha256sum] = "0064891270c180c190f41925b0f6fb9cecac3056f1168d2592dbe90e5f226c0a"
+SRCREV = "db7087b883bf52cbff063ad17a41cc1cbb85104d"
+S = "${WORKDIR}/git"
+PV .= "+git${SRCPV}"
 
-UPSTREAM_CHECK_URI = "https://github.com/intel/${BPN}/releases"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools python3-fcntl"
 
-- 
2.7.4


