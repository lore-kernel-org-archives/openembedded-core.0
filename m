Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 40B947F8AD
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:20:50 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id r67so1665340pjb.0
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DswTZMG0O3HD0qfYq8CkAickAUsQj7AnioaNq+mgASo=;
	b=OQWCSOSPUVyh/Pl2FPZaH0CLd4eD2jZQE4OLEd7UHc5XvCuvcsaebOCVaUgOqwMjxZ
	dpqfjOme6zjg+M/QzW7dgSP+6ycTbdM01cWz2Rqed11NO8BL0yopf19kk7QrcAFw+BLp
	0myf0sugXDeV4tGDJlUVRmu3gWOFKDm7cj6uFgVEBKqXs/Mg9J7se/F+djjOMx29hQZw
	KhGPUkjGZTpR7XaTIXvyl7lYK5s4Sb+v/FgUqYWexxUjbTZ+zSA/ysBE0RXE4c7Xa7Lq
	02iZ9PcF5GJyqGKpHlncsvoFysg8XvPeOBXzev8/EWiEbnX0cC0NYBoY2e+EMNgiTxCT
	saZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DswTZMG0O3HD0qfYq8CkAickAUsQj7AnioaNq+mgASo=;
	b=HkXxPxbMKpBqT3xVLgETpQhWIhwjQKrZjWMVbft8k6E07Hcihus1jn6IR0B9q8q/t/
	l4tRcoovnF/6uxTWP7DyAnfoZsDD2vlewEwLbjsqRFEy5LQxneAg3+Vy3yBi0XRB0cFh
	gSBWdTqMxpK0jklfHKr0wH7X5Wv22q0omyVdXNS8ocEzmA8PgDXZ1UeBQTB8JN1hyPN5
	+i8M6z/ooK0OgS9HUKg2Qlg3vmyxfll40S0FYgMQ2sjS5+DyMQJkEuu9Iv6rWto5TS3b
	EA4SzdZ/bPd0zV0NORYzjVijfffEgeEgYTEyMm36RcLJ4tzdz4+gJhR+68pzrzB2jhJi
	NTzw==
X-Gm-Message-State: APjAAAWPrXmssWZ3A8YSjc7pk1TjzeWGY6NzXezToJe2MIheD2lJQFWT
	eFSrKLyFEMCuRgNDovnRE9HvQpAS
X-Google-Smtp-Source: APXvYqzSpF+speLNJ6cldUms9xH3emeSvhy6Bxr2nEhpD0v/W57r9MaxwB6P/97QRG1LjEqzwoE82Q==
X-Received: by 2002:a17:902:9882:: with SMTP id
	s2mr38910826plp.156.1579188051187; 
	Thu, 16 Jan 2020 07:20:51 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.20.50
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:20:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:15 -0800
Message-Id: <e128bd76ae9f4b30948e6b8fc68f4374e03c7bec.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 06/32] flex: set CVE_PRODUCT to include vendor
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
X-List-Received-Date: Thu, 16 Jan 2020 15:20:50 -0000

From: Ross Burton <ross.burton@intel.com>

There are many projects called Flex and they have CVEs, so also set the vendor
to remove these false positives.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/flex/flex_2.6.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.0.bb
index b477cd8c7f..12ce0cb461 100644
--- a/meta/recipes-devtools/flex/flex_2.6.0.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.0.bb
@@ -68,3 +68,6 @@ do_install_ptest() {
 	    -e 's/^builddir = \(.*\)/builddir = ./' -e 's/^top_builddir = \(.*\)/top_builddir = ./' \
 	    -i ${D}${PTEST_PATH}/Makefile
 }
+
+# Not Apache Flex, or Adobe Flex, or IBM Flex.
+CVE_PRODUCT = "flex_project:flex"
-- 
2.17.1


