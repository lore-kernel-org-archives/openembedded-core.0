Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3E57677811
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 18:48:21 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id p9-v6so5887294pls.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 11:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=1yxlkeaDJxrQvu+q43g69m+3l4+U46HtaAXo8NSacos=;
	b=gXhr2G4ywPqmyrMRROZYGtPIVuMkohOqlm47jpERnlb8cH29UI814Ap0b9yGUsKucD
	kMSVxDbwQQjYfw2OzvNLyfvPl2ikIBwuP3ZKQNqbeFq8Qn2BT63STC+pXbS6iYQEzPDI
	NTWHkCaEGqJEvdhdJp1RSKZvIhY+nL6tppbuQZORuv8fAl/xlhoIlYM84OCAKaRSgkwb
	5zdR9a3EXyM/IW2IxYJ+F+BT766f7tHDb2f6JlUferyuvEt2mxNzx/jmCtIPY0YxupOY
	vnEaPG1EO1HkruJ8ZwpfgR1i+iqrbj2K2DNg3QkYKeA6zy9KGiUMaysBpUmqeCl2WhiM
	VamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1yxlkeaDJxrQvu+q43g69m+3l4+U46HtaAXo8NSacos=;
	b=WQhoNlL1SOBhXrdy0OuAlFOBTSSeDIrMScnKJyi02lagtMrbc+TNkTpjPXBMe+C7Th
	7jKKQ7e9+x5iz56mWvXw+l0fzxR9mD2jAYfGbL6r25HaVw+OXPTBHY5XxJ1tXYtbb9Hz
	oNg6naBYpUryUKEO6iKvMrkW4zvadeGZPrhBH3M3Nl6CJH1Xsf5MHsT2UDr2rTifnEuX
	HX9w+lG2fIjCDd/oIqwZ+H2NbCQ4qoT+6xoDfMvLIlISG8AiiPnqcVuju3kkH9FLr6TK
	yTGV9iUzsbOs6PCs+ernb4P3WlrR0X3gKstUXK0e+ANwjVG2Uf3QpA8JTwEWq8Ls+9ml
	js0g==
X-Gm-Message-State: AElRT7G+rFxJc4jzyT504J+i5MdTUBWRezOFLQttscyoWT3g3uSGFLe3
	B3XNbYPYa0QtdvUc9AFxulc=
X-Google-Smtp-Source: AG47ELtNyGtAJAuynFxzL/p9RJzrJplbgppRYz9a9vlo8I81gp87hBhwUo2H0HxEmNiffYcvi08Jkg==
X-Received: by 2002:a17:902:3041:: with SMTP id
	u59-v6mr4941245plb.208.1521744503342; 
	Thu, 22 Mar 2018 11:48:23 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:d51a:28df:7b7:12f5])
	by smtp.gmail.com with ESMTPSA id
	u10sm12470355pgr.83.2018.03.22.11.48.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Mar 2018 11:48:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2018 11:48:16 -0700
Message-Id: <1521744496-20316-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko][PATCH] distcc: fix SRC_URI issue
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
X-List-Received-Date: Thu, 22 Mar 2018 18:48:22 -0000

From: Armin Kuster <akuster@mvista.com>

ERROR: distcc-3.2-r0 do_fetch: Fetcher failure: Unable to find revision d8b18df3e9dcbe4f092bed565835d3975e99432c in branch 3.2 even from upstream
ERROR: distcc-3.2-r0 do_fetch: Fetcher failure for URL: 'git://github.com/distcc/distcc.git;branch=3.2'. Unable to fetch URL from any source.
ERROR: distcc-3.2-r0 do_fetch: Function failed: base_do_fetch

bump git hash ( Feb 26, 2018) to tip which includes one bug fix.
<http://code.google.com/p/distcc/issues/detail?id=83>:
fix bug in handling of several consecutive -Wp,... options.

[Yocto #12620]

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/distcc/distcc_3.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/distcc/distcc_3.2.bb b/meta/recipes-devtools/distcc/distcc_3.2.bb
index b6da65a..13beb9a 100644
--- a/meta/recipes-devtools/distcc/distcc_3.2.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.2.bb
@@ -14,14 +14,14 @@ PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
 
 RRECOMMENDS_${PN} = "avahi-daemon"
 
-SRC_URI = "git://github.com/distcc/distcc.git;branch=${PV} \
+SRC_URI = "git://github.com/distcc/distcc.git;branch=3.2-maint \
            file://separatebuilddir.patch \
            file://0001-zeroconf-Include-fcntl.h.patch \
            file://default \
            file://distccmon-gnome.desktop \
            file://distcc \
            file://distcc.service"
-SRCREV = "d8b18df3e9dcbe4f092bed565835d3975e99432c"
+SRCREV = "8b42c688fdd176c6091a63be36ed7b4d9a72d2be"
 S = "${WORKDIR}/git"
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.7.4


