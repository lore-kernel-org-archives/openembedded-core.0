Return-Path: <matt@madison.systems>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id BD2FC789E9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 20:33:34 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id y8so4226318pgr.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 12:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uE3ozi6GaI1Mc53EAhQlxqLHPlEnHfSaJlkAUC4hmhU=;
	b=e1kam5YzCFO8BK8LMOpsC+sqGtJs4+bnfSb2RU6WH5sqdePulFloC86zZdLFfqzvvi
	5gZ/IEkakZ11QUuEmeMyjK4jKPr6GHKCU2YmxxVKL5RG+HVim6SO36r2L5iF3g0WSqoK
	zI1Ky5RU5FRzqrniBUSaGtacIr3yGowM/aDtLrc5OAaVLySrQIABEL8w5NJVMPHNvYJD
	IgO8HPCAk4SeHaboAM3aGAQ19eO6/abzo2Ro6H5bUQKt7mwJHdiWdG3WmXiq9G2sPvQl
	nSrJgeXcL4Az50yZHdK9PWLsPObJC/F5GX9dYtaRiv4Q6hnD0RcvkgUGQSF6LmLMRIbi
	E+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uE3ozi6GaI1Mc53EAhQlxqLHPlEnHfSaJlkAUC4hmhU=;
	b=o4rfOIEDcSvyJVTlmsyhR4E8hRu5RtlMRsS3QDgRvaCCUpu6fFlcpAm9MAVgozSbGj
	bUvlwJqULDbnBDXi+tTQYHXzwZtjgMqkGBq3PRmsJEzmAUJHKzaQKvOsZx+mfa8bVQ0w
	sS3UzUIwDxZLbxOBwisjug8px7ZoBTSRDgwipL8MK1jZBQl/WMpXC/mJQiZMGXAIaqxt
	dgdhXJcHvBgX4EnLulCYIugIBlkrBzuERW3DriAAKcGoCtmgetdRRaPT1G1in5Zte/8f
	Edm/cMwoEyPWMUonfFTPGpKMRNE/C3ndiU2APmRs3gZnvBZCAFrAkA+1Nk8fq7cH94ke
	1eQQ==
X-Gm-Message-State: APf1xPCGLMbWJOojbt/tzRHFo0DHW0Z+8CLSyPkk59iCR6mD+Tn4wAUx
	VRwmu4KYmzITvPVMYCxZHRflw2a9
X-Google-Smtp-Source: AG47ELsmgFmU3tOOULTtvh1UX2wrHkEdD0+Jb4LHtS4FbM2MRMOu1p1zAgEk1YnE1fb+DXFYnlsK9w==
X-Received: by 10.99.153.1 with SMTP id d1mr5441612pge.338.1520022815421;
	Fri, 02 Mar 2018 12:33:35 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	m12sm11193338pgr.35.2018.03.02.12.33.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 12:33:34 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 12:33:04 -0800
Message-Id: <20180302203314.32737-4-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180302203314.32737-1-matt@madison.systems>
References: <20180302203314.32737-1-matt@madison.systems>
Subject: [PATCH v4 03/13] go.bbclass: rename GO_TMPDIR -> GOTMPDIR
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
X-List-Received-Date: Fri, 02 Mar 2018 20:33:35 -0000

and export it. Go 1.10 now supports using this
separate variable locating its temporary files,
so TMPDIR doesn't have to be modified.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/go.bbclass | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index a01b28bccd..805d92e101 100644
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
@@ -85,9 +85,9 @@ go_list_package_tests() {
 go_do_configure() {
 	ln -snf ${S}/src ${B}/
 }
+do_configure[dirs] =+ "${GOTMPDIR}"
 
 go_do_compile() {
-	export TMPDIR="${GO_TMPDIR}"
 	${GO} env
 	if [ -n "${GO_INSTALL}" ]; then
 		if [ -n "${GO_LINKSHARED}" ]; then
@@ -97,11 +97,10 @@ go_do_compile() {
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
@@ -110,7 +109,7 @@ do_compile_ptest() {
 			sed -e's,/\./,/,'>> ${B}/.go_compiled_tests.list
 	done
 }
-do_compile_ptest_base[dirs] =+ "${GO_TMPDIR}"
+do_compile_ptest_base[dirs] =+ "${GOTMPDIR}"
 
 go_do_install() {
 	install -d ${D}${libdir}/go/src/${GO_IMPORT}
-- 
2.14.1


