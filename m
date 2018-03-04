Return-Path: <matt@madison.systems>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id E0B7478A8F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 21:09:45 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id i14so6033361pgv.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 13:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zFEGdWlH5c/+38OMVtC/s0ueB7J6cs5bVDhAZFSLBT8=;
	b=DE1JPiYVmR5lDleEOKDzcgA74vCo822c+dV7sJOh0ffGEMTxbUyqYkfjR/6l7CVdP3
	k4WCOkBCNpl9XrzVGMcuVdIf+CQlsw4ekO0ihFMF1oVzqfqYtftyz+28DaXSVNLD0GJ/
	I/gT3Jxo1ZcbVPdSZT8PpvH9TymHF6WW/2hgNo5tQBjnWj0ayZPU74YhCFXrulKvlSO2
	Wk/NeMJTGal5XpCyM9ZmEBd5SsPf9eM4HeYzf/IkbsaZovUjZPjhYyAh3BMKDSOv4k77
	XdxSjDcP9YyuGXu5t/cH9wH55ajigKoRKi6zJEeZIsjtzQ5o2kzHm93aEKghCPxuFEgB
	iPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zFEGdWlH5c/+38OMVtC/s0ueB7J6cs5bVDhAZFSLBT8=;
	b=kC3+Uit3FTuPhrMEk3Z6Q9nW2mcCz/R3MZYm0NLiaUF487FJjveaCUU+lEDGDuMqSz
	AUnZ3xnBXKcegjE75uieLVS1GqUbTl2hyWcaTmC1lzz0zQ60G5Ft2YDB5qZOG0Qu+Tp1
	ePX6DEwyfQECavTjC5u04TzbQox8cThAaz1dBgquwlPoFMASHy7v/bpCe1qNl6Z3u4DQ
	70zNgpJGokcFX2jxcz7mxGl+ZuYoZagBw4hRJZmFaeLvMVWJgnoaLjAM/WFkE97mj9Tg
	bi6SyxcHnXyK7is6cyPWQdmk3+9Qa32iPvqgJW7EnNRfAOV79O5hDvMVCFwQEBcheRjR
	ZiSQ==
X-Gm-Message-State: APf1xPAWnp6cVXQ88BCfGOJFzjZGAcgr7CgjZVK3OOh4rlMfk3/WTsOr
	2JkhGFvQ2HeN9MPnnUYXRMPYeKO3
X-Google-Smtp-Source: AG47ELt6DcYaXqqGrwRJL7QdIJDi4982Gisof//yAF1oEf2hBeoRCNDuhAE4oHQLNCLezJl+VCyBIw==
X-Received: by 10.99.126.22 with SMTP id z22mr9300550pgc.131.1520197786588;
	Sun, 04 Mar 2018 13:09:46 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	x123sm18594829pgb.5.2018.03.04.13.09.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 13:09:45 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 13:09:27 -0800
Message-Id: <20180304210937.29727-4-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180304210937.29727-1-matt@madison.systems>
References: <20180304210937.29727-1-matt@madison.systems>
Subject: [PATCH v5 03/13] go.bbclass: rename GO_TMPDIR -> GOTMPDIR
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
X-List-Received-Date: Sun, 04 Mar 2018 21:09:46 -0000

and export it. Go 1.10 now supports using this
separate variable locating its temporary files.

TMPDIR is still set, for compatibility with go1.9;
that can be dropped once 1.9 is retired.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/go.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index a01b28bccd..96302a187c 100644
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
@@ -85,9 +85,10 @@ go_list_package_tests() {
 go_do_configure() {
 	ln -snf ${S}/src ${B}/
 }
+do_configure[dirs] =+ "${GOTMPDIR}"
 
 go_do_compile() {
-	export TMPDIR="${GO_TMPDIR}"
+	export TMPDIR="${GOTMPDIR}"
 	${GO} env
 	if [ -n "${GO_INSTALL}" ]; then
 		if [ -n "${GO_LINKSHARED}" ]; then
@@ -97,11 +98,11 @@ go_do_compile() {
 		${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} `go_list_packages`
 	fi
 }
-do_compile[dirs] =+ "${GO_TMPDIR}"
+do_compile[dirs] =+ "${GOTMPDIR}"
 do_compile[cleandirs] = "${B}/bin ${B}/pkg"
 
 do_compile_ptest() {
-    export TMPDIR="${GO_TMPDIR}"
+	export TMPDIR="${GOTMPDIR}"
     rm -f ${B}/.go_compiled_tests.list
 	go_list_package_tests | while read pkg; do
 		cd ${B}/src/$pkg
@@ -110,7 +111,7 @@ do_compile_ptest() {
 			sed -e's,/\./,/,'>> ${B}/.go_compiled_tests.list
 	done
 }
-do_compile_ptest_base[dirs] =+ "${GO_TMPDIR}"
+do_compile_ptest_base[dirs] =+ "${GOTMPDIR}"
 
 go_do_install() {
 	install -d ${D}${libdir}/go/src/${GO_IMPORT}
-- 
2.14.1


