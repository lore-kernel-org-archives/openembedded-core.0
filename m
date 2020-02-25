Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9EB4E616C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:25:50 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id n7so74313pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=id8SU2ctGuZbxGeTwCF9Vwi9nnN4ATAi0JybadyEzwc=;
	b=moxX9VBwxjk90Ak5+/n5vryN9o23yguXjO+BdWDq2WTxODnsFe8sfGIZLWs7Ioens+
	n/zQEeVKgOv5Ayngimf354M5+Mdxik8a0eH917eyjaD8rPTQ8FsEYq03wSU3r+FVpCYr
	MXoxQ57JKRJNk1FMELKppvYDTHE1NXKvhp7Wl4aStI9O4OVDFrbOPEtMBypkQEnTVYKf
	exW1c35Y6fziH7yGTS3kJOcQ23QQfx5xuZ96YFafupBihXNaNpaydYNPc6hodgveOqR0
	Ej1r245n5S+m2sDnUwGFl94u20zjnWHHLFsN+Z2+WGZb/9qxYJ/wOVNP2VqxeIec5Ihr
	mHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=id8SU2ctGuZbxGeTwCF9Vwi9nnN4ATAi0JybadyEzwc=;
	b=C2Ck9sTadMEe7gCxaqJR08tFDGUsYwN+N67qJMnGy0Ygp6CKHdIy7FNmlFffEDgJi8
	1NhgyzdexSq9RmDGpRWho2X6ux4lVNrEuvfUIdk7+MxnCdv7Ra4OJIIUS8hgsVcDCQmO
	9Am06WF2Rdq6S2UBrxiVRfDqpRie1LyXKDgKbSpFP/cBFAo5gxdLjss5ROaEt/r0yUXH
	FNHKGDPTXI5kcSDdEdXXRGvEPDUfsEOX4gBwYAjPG36nwSupOQciVXkSKOibUh0+bpz4
	iv4ecUL3to3QXFYYFyBej35VB8hNbfVU+I8XjEpoEDWE1PU/xrSN1cd6m17+iaM75H8y
	IUNw==
X-Gm-Message-State: APjAAAWdXrkxq4wNLV4Al4jvlUtSr0d1LPy78+t8CP/dDYxTc9//P4/1
	lXKy4pxpsdiTT2yMFIPdtZIYUJ+HvfI=
X-Google-Smtp-Source: APXvYqxpHiwK/yGj9TQZ5SRG20eM97qioIhEaTurdHDomGEkCQh2JIsRljiuSJnbrlsRE2eFDvgWgw==
X-Received: by 2002:aa7:8815:: with SMTP id c21mr228241pfo.81.1582658751599;
	Tue, 25 Feb 2020 11:25:51 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	q4sm18658603pfl.175.2020.02.25.11.25.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 11:25:51 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 999B32A05A0; Tue, 25 Feb 2020 11:25:49 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 11:25:44 -0800
Message-Id: <20200225192544.7521-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH] libedit/readline: Correct package alternatives link for manpage
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
X-List-Received-Date: Tue, 25 Feb 2020 19:25:51 -0000

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-core/readline/readline.inc               | 2 +-
 meta/recipes-devtools/libedit/libedit_20191231-3.1.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index 4babcbd69a..052e2d5f3d 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -47,7 +47,7 @@ CONFFILES_${PN} += "${sysconfdir}/inputrc"
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE_${PN} = "history.3"
+ALTERNATIVE_${PN}-doc = "history.3"
 ALTERNATIVE_LINK_NAME[history.3] = "${mandir}/man3/history.3"
 
 # OpenSuse injects versions into libreadline leading to conficits between our native one and theirs
diff --git a/meta/recipes-devtools/libedit/libedit_20191231-3.1.bb b/meta/recipes-devtools/libedit/libedit_20191231-3.1.bb
index 267fdcc54a..8d2d57a930 100644
--- a/meta/recipes-devtools/libedit/libedit_20191231-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20191231-3.1.bb
@@ -21,5 +21,5 @@ BBCLASSEXTEND = "native nativesdk"
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "90"
-ALTERNATIVE_${PN} = "history.3"
+ALTERNATIVE_${PN}-doc = "history.3"
 ALTERNATIVE_LINK_NAME[history.3] = "${mandir}/man3/history.3"
-- 
2.13.3


