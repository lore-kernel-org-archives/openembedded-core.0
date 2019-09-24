Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 38B227F273
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:13:37 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id x10so394280pgi.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 20:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=j2MXK2OEWreOhSZIpWfqVPeE3XkIfeTZgcCBEjwOBVk=;
	b=oP8zlwy9iUVauKoQNYd0kOJcx7ET+A4sBKJVOcKWysCfl7JIXGqlzYb3/jj3xre7ED
	HELPXRP/L7ljuSBxXmDpyw+ry8pw4i3BMIodLgWglKCz0W5w5tRI4A0Y2FZEMSaodPUo
	WxpJPjZD6AGOzVmcP4M2Q9Sn8lg5IWZ/TKEvtCBVxeQI2xcvjOc+upI9/YOhof3cViKG
	SPWR4SKKutncs9Dq+OvGTqfYCeDYmlylvUgk9Qjrlq1iuSS6bBSPVkaLu9g6UU/vECkE
	I5Gmjhgr0Ubo6mqNXwCXpttUBJz20wHsoNZWzbSGNmBMPFtSGPSSdL1oaWvuPxeHnmu/
	PwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=j2MXK2OEWreOhSZIpWfqVPeE3XkIfeTZgcCBEjwOBVk=;
	b=Rggl0EYsJt0IapxfZLQjaSa5GoGCfGBbK4yiTam3tjcVRqSjyNsNCb7YcOMfhSO3Fu
	Pu06lNUorpH+WaZWC/umWfjzeGIhCm61VwgoxvOEmB6EG/ORPKMLmsw5RzJSSFU0AEIB
	5eQy4/hYOIDl4Gy24S+DKWdMoHoqDU/fJJBuEjrrYcCoWHLEh7CIulk+bj1iLnB4Z9Kt
	w8rkA3OzrwT+6NCkgxEetAWyyecTFJO+xnNlDY6JDpaPZ7csPyiciNG309T3oJ9tc3rN
	iPGOwOn63ktRKsy41uWs/V+TpAjjCjk8BnqAJnLhcfX/AzJY7ZlUs9upxu3P/qisE8Eb
	KLWQ==
X-Gm-Message-State: APjAAAVplWf6CbcAOxjB8SSl2bXpYsFkmm88uoIIxtJtc7V2P0L6V+BX
	83cbUcTdPv2FlB3NFlV5dnOZMm2UoL0=
X-Google-Smtp-Source: APXvYqxTRVd8GVC8YCI83Zhi54bgT7obpoCcUxojo7nqhy03W2kGjyUw9S6N/8iYYt0fDuv15dfvWA==
X-Received: by 2002:a63:2b01:: with SMTP id r1mr819374pgr.19.1569294818168;
	Mon, 23 Sep 2019 20:13:38 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id z23sm252602pgi.78.2019.09.23.20.13.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 20:13:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 20:13:10 -0700
Message-Id: <6018e9755dce3eaa22a1fe691dc18546c43c9cbe.1569294712.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569294712.git.akuster808@gmail.com>
References: <cover.1569294712.git.akuster808@gmail.com>
Subject: [Thud][ 14/24] go: update to 1.11.13, minor updates
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
X-List-Received-Date: Tue, 24 Sep 2019 03:13:37 -0000

From: Armin Kuster <akuster@mvista.com>

Source: golang.org
MR: 99376
Type: Security Fix
Disposition: Backport from golang.org
ChangeID: 41576ab4a0abdebbc44f1a35a83bf04e5f2fde06
Description:

https://golang.org/doc/devel/release.html

go1.11.11 (released 2019/06/11) includes a fix to the crypto/x509 package. See the Go 1.11.11 milestone on our issue tracker for details.

go1.11.12 (released 2019/07/08) includes fixes to the compiler and the linker. See the Go 1.11.12 milestone on our issue tracker for details.

go1.11.13 (released 2019/08/13) includes security fixes to the net/http and net/url packages. See the Go 1.11.13 milestone on our issue tracker for details.

Includes CVE: CVE-2019-14809

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/go/go-1.11.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.11.inc b/meta/recipes-devtools/go/go-1.11.inc
index 401e71f..90d4037 100644
--- a/meta/recipes-devtools/go/go-1.11.inc
+++ b/meta/recipes-devtools/go/go-1.11.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.11"
-GO_MINOR = ".10"
+GO_MINOR = ".13"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -19,5 +19,5 @@ SRC_URI += "\
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
-SRC_URI[main.md5sum] = "f2d2e44b9954b827daa8ad4d936a7a82"
-SRC_URI[main.sha256sum] = "df27e96a9d1d362c46ecd975f1faa56b8c300f5c529074e9ea79bdd885493c1b"
+SRC_URI[main.md5sum] = "32e71746981695517387a2149eb541ef"
+SRC_URI[main.sha256sum] = "5032095fd3f641cafcce164f551e5ae873785ce7b07ca7c143aecd18f7ba4076"
-- 
2.7.4


