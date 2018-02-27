Return-Path: <matt@madison.systems>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6A97878C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 12:36:56 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id s13so11268820plq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 04:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NjPzR8c+npW2TtRpiuKh98gAqgDuDQNBQCD+hBFLyHU=;
	b=oPjkcf3N4tmVgjqYR0QoAEc49Ybcn3TpxaT4eaoqdm9X+n0jRhsTuJB3h8+XXAsGt8
	Aiuq7yKXqJrnCEA1cf5Ua1MkXg3zKYvOMCTX0I/qXAXb/afgk3mC0ihys2rpkttXUxHu
	CIAHN2Od13tsiS3G4f0Uflx6EoNHHm9mrQVb7WTvM+ADHl99EG7RCz+B3GZAafc/4r1s
	x/Xe4Dfm5EZiTP30BkcPvnLXFFaQQ7rfehuVuxIg8ICrI1CTQWuobagBD6TlRM3RaToK
	NdFjVVOBSUX/JmW8i+7hxEFzP6H/KC5bwDSB5rKQte63EsGa1G+Y27j8fRsuc0j3/LYl
	g5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NjPzR8c+npW2TtRpiuKh98gAqgDuDQNBQCD+hBFLyHU=;
	b=sdamAkd35KLfWPtSbnS9KI7REWELplZXn6JhdFdqWkwkLPUNLOuTezS35yiCgjs7ly
	Aa3LeIlKLOnuyY83WSBlvbuheMNBa71ktB7Qfeo+J7WSmicgJITfWj1oPju4EXYy8rHv
	u6eMkfIEjM/nEwW1M0hAVhoeL8YJPZTZGvh/8pFDpL5FfHobroCJCawZy8oY/l3Oz5B7
	yvho9M3juYZF1SOKKNKVmRzjBM7W32i2GXY01pzADwe/wfd+lO6Ov9HK54y70wFTxftT
	ytSCdzzh/4/kTd6UB7lz9irbCrVTFYklC0hVoHzlNS1JuqORD+I9OwblB5Z+Te64acLC
	gdnw==
X-Gm-Message-State: APf1xPBxQYBJSv/o8bs/H8wfOUM1bhn5TObzFvrqyL01vPD6td92DVMy
	aakCiKLzAYUUJfg16MGtrXz5VG01
X-Google-Smtp-Source: AG47ELuX1wu7Q76DTSwDSBBd2bAS8ce1D2Oj7qZ6OfgCPV554l2H+21nHqEear3T9CmDowDREWU4ng==
X-Received: by 2002:a17:902:b416:: with SMTP id
	x22-v6mr1916109plr.279.1519735017758; 
	Tue, 27 Feb 2018 04:36:57 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	o82sm1596760pfj.163.2018.02.27.04.36.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 04:36:56 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 04:36:29 -0800
Message-Id: <20180227123634.2812-4-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180227123634.2812-1-matt@madison.systems>
References: <20180227123634.2812-1-matt@madison.systems>
Subject: [PATCH v2 3/8] go.bbclass: rename GO_TMPDIR -> GOTMPDIR
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
X-List-Received-Date: Tue, 27 Feb 2018 12:36:57 -0000

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


