Return-Path: <matt@madison.systems>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1E67778744
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 19:34:02 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id m19so6575071pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 11:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wi/w+2KUkoznCi/edgytdQ+wRsySAl+PCu+U8zd0vNM=;
	b=Xu/wLenlIC/RtQoDmlKmXoKrhlGzyL5gcKub50Wrobpve9BwmTlZ/oIeuX98CZB+Dr
	xFSB24O7gp4iFnGSCLAXjkFF+FnFFUOCDZQH1LTAKTmjAtp0OVGeuY4rI2yKxOaXiLsr
	CKSmkvAJSlDeYxtJs+Dw7jFSNzc8RiLJbPMDZePrytgOjzicr/PA8UHCxp7dra27hyDp
	pEdbBXd4YHHfe1dD0ioTcT0vQ9jxrTVrknzIrBz9NJZ31T8ZZ3/AFMvL5OU6P8G0DVMu
	50ojaZ73d8zqzY7pmWUE3JFWflWWr9k2jjFDXuZLNsRNbUem808nofwdfxEBABIywwyf
	CDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wi/w+2KUkoznCi/edgytdQ+wRsySAl+PCu+U8zd0vNM=;
	b=q7SAHYHZ8f+ahzABsgUZP8LW7Yn/MiqUFrYkIqwg1iC42t77HlXQzY9Mwv79MnBt6w
	VYgmb5UW/er4GG8ZHhmfROBfyhDLxzXsFicvxUvzOCc2yddlkX/ZzKzWMaSGcfEfCnND
	Lx+HGIJplIjX5G6+FlK+TXx6GyFSf/fD8yhoxsofGOuwRCJavPlCx3TM2VKxaMvw3gQ6
	7LG/ikzQwFXvKIyybnC22ESfo69u6NT9nwxSl9bzhyqkQ6f82aMOScC6f3cSNg8qSH+A
	jATndPQmbz0QGOAXZ1g9d9qruemk+d55M+6v+yLpuscDysQ+sohpM+y2qcYRcbd0gL6S
	cHnw==
X-Gm-Message-State: APf1xPBVyo3euJ8qFAS8tiKC7ewbUYjmxvOGlf5z8vOYqR3Kh9vDkaaU
	agGllUvuyRnAMBNJ8X6cBxxYvU6I
X-Google-Smtp-Source: AH8x227sWVU/4ZZ2tw3gQa0JikynKQA2JefgOC0BnRmVEoXMLRbTQkuffaVlWMUOYmZF60Lb3ViBNw==
X-Received: by 10.101.97.139 with SMTP id c11mr9450358pgv.431.1519673644012;
	Mon, 26 Feb 2018 11:34:04 -0800 (PST)
Received: from ip-172-31-34-104.us-west-2.compute.internal
	(ec2-34-218-58-157.us-west-2.compute.amazonaws.com. [34.218.58.157])
	by smtp.gmail.com with ESMTPSA id 84sm8542736pge.23.2018.02.26.11.34.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Feb 2018 11:34:02 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 19:33:11 +0000
Message-Id: <1519673596-4750-4-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519673596-4750-1-git-send-email-matt@madison.systems>
References: <1519673596-4750-1-git-send-email-matt@madison.systems>
Subject: [PATCH 3/8] go.bbclass: rename GO_TMPDIR -> GOTMPDIR
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
X-List-Received-Date: Mon, 26 Feb 2018 19:34:03 -0000

and export it. Go 1.10 now supports using this
separate variable locating its temporary files,
so TMPDIR doesn't have to be modified.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/go.bbclass | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 43a262d..bd7760d 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -49,8 +49,8 @@ GO_INSTALL_FILTEROUT ?= "${GO_IMPORT}/vendor/"
 B = "${WORKDIR}/build"
 export GOPATH = "${B}"
 export GOCACHE = "off"
-GO_TMPDIR ?= "${WORKDIR}/go-tmp"
-GO_TMPDIR[vardepvalue] = ""
+export GOTMPDIR ?= "${WORKDIR}/go-tmp"
+GOTMPDIR[vardepvalue] = ""
 
 python go_do_unpack() {
     src_uri = (d.getVar('SRC_URI') or "").split()
@@ -87,17 +87,15 @@ go_do_configure() {
 }
 
 go_do_compile() {
-	export TMPDIR="${GO_TMPDIR}"
 	${GO} env
 	if [ -n "${GO_INSTALL}" ]; then
 		${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} `go_list_packages`
 	fi
 }
-do_compile[dirs] =+ "${GO_TMPDIR}"
+do_compile[dirs] =+ "${GOTMPDIR}"
 do_compile[cleandirs] = "${B}/bin ${B}/pkg"
 
 do_compile_ptest() {
-    export TMPDIR="${GO_TMPDIR}"
     rm -f ${B}/.go_compiled_tests.list
 	go_list_package_tests | while read pkg; do
 		cd ${B}/src/$pkg
@@ -106,7 +104,7 @@ do_compile_ptest() {
 			sed -e's,/\./,/,'>> ${B}/.go_compiled_tests.list
 	done
 }
-do_compile_ptest_base[dirs] =+ "${GO_TMPDIR}"
+do_compile_ptest_base[dirs] =+ "${GOTMPDIR}"
 
 go_do_install() {
 	install -d ${D}${libdir}/go/src/${GO_IMPORT}
-- 
2.7.4


