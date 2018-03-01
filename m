Return-Path: <matt@madison.systems>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 22552788CD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:17:05 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id e9so2961778pgs.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NjPzR8c+npW2TtRpiuKh98gAqgDuDQNBQCD+hBFLyHU=;
	b=GKcqht22Ivc/1lGDvyiFITqKbjuCwLEOooidHg8/v20sI8yH3ZgC10u2Wh1lETpleg
	JijqINJVdXP0K9OtVsDtxDHOOlWKAaJCUHaaCo69plv+H34ZzvsWpUzCsutv8E3uX2AP
	rOX/jNSZMrrGsuHRoRQ8CSBG8Y01bSNEU7JI2gHzeeoSgHVcPtCtiQYrOcgk4zBIxpN6
	sN55p+kOGV/PW+QOKNcwWpmF4zIV/FxAu0HwiBnlA+JePhSNdfVbX9v6Cfy5kxs8GqQf
	xqWc49DhdlVNSobAz6ufAiZx2OZOg3ywWvZIFKcOBoRtxK7xF9GqgF5pg6ibLb64gOYg
	fmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NjPzR8c+npW2TtRpiuKh98gAqgDuDQNBQCD+hBFLyHU=;
	b=BVnXNHdLJdoSOao9/zcb1Rbh7hb4gARZaY4T4uJLo5WU8QOVVjCokK+VKi/BnIR6SJ
	/0IsI5RM6RREJIEexjLyRul6EeF+cVuEQnEhQ4J56Er1841XT/rPMQbj7IIzHHC+Fasn
	HYAjxMlqK+QZWQN1BHBckw/35zwlXAIJEd3G4jQJnXdluEuvhlohR02Mxl17M56UAgbW
	7Zs6d04m6hfHnqs9QCRVIFAT465HD8fuK9agCNWF/n8yGQ7UMwW2ZaRw55zc32jKpaSz
	ZYAkDyfLQovk28j1LFovL4aQfhlmXWaaOejQFUKdau4NJD92T9g0IuVvF35bvMx+YjCG
	S7Rw==
X-Gm-Message-State: APf1xPACAuZZJ+TcNa8Cs5/Kjw6d4J9ZL5UYhBpd1NoLwieLm2Uk3QD0
	AoV0XhbKDCMqEXC4HavNjZotRrZI
X-Google-Smtp-Source: AG47ELudAtWq8t2oL8dKa8q0Jk/f6qYsI6A85hkvM8r4rWkULqzW0VDVWVN1z2HYMVg9RY+8/Ng8dA==
X-Received: by 10.101.68.82 with SMTP id e18mr2867165pgq.329.1519946226765;
	Thu, 01 Mar 2018 15:17:06 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	p128sm7853503pga.45.2018.03.01.15.17.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 15:17:05 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 15:16:44 -0800
Message-Id: <20180301231654.24018-4-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180301231654.24018-1-matt@madison.systems>
References: <20180301231654.24018-1-matt@madison.systems>
Subject: [PATCH v3 03/13] go.bbclass: rename GO_TMPDIR -> GOTMPDIR
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
X-List-Received-Date: Thu, 01 Mar 2018 23:17:06 -0000

and export it. Go 1.10 now supports using this
separate variable locating its temporary files,
so TMPDIR doesn't have to be modified.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/go.bbclass | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 43a262d599..a126d531b8 100644
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
@@ -85,19 +85,18 @@ go_list_package_tests() {
 go_do_configure() {
 	ln -snf ${S}/src ${B}/
 }
+do_configure[dirs] =+ "${GOTMPDIR}"
 
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
@@ -106,7 +105,7 @@ do_compile_ptest() {
 			sed -e's,/\./,/,'>> ${B}/.go_compiled_tests.list
 	done
 }
-do_compile_ptest_base[dirs] =+ "${GO_TMPDIR}"
+do_compile_ptest_base[dirs] =+ "${GOTMPDIR}"
 
 go_do_install() {
 	install -d ${D}${libdir}/go/src/${GO_IMPORT}
-- 
2.14.1


