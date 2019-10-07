Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 575377E6EF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:11:20 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q5so8818384pfg.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 08:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=j2MXK2OEWreOhSZIpWfqVPeE3XkIfeTZgcCBEjwOBVk=;
	b=VUml952ZVu38E5yzgX2Hvfi2jmXcnq172hGvixNtLoJ7c7hjDE1jEnOu2n+rrRUC9e
	QWi21F8bZ/mERyxLD9QZPMprCIIkTZAblgLO29zGAEiOastKiBKjofo6Fego4/jXqM9r
	Y12ul/YJGQ1FWYOgbPtgopMPtkLr2DD6wNV4WwrBtJTF1mjF33KRxe8aK5gl4Tfp61Mw
	paFiITOgewkmxMFE27de3dybreRgkGhU9+CfX7krkxC9q8k9sxedt0t9CnMb+DmDHrom
	vv94EE/H+9cJe/gjKW4Ugcs7W9WhsZMUOAKi2j7yV8qYvvoAyvSFlQCTItf0cNdPnj/8
	FYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=j2MXK2OEWreOhSZIpWfqVPeE3XkIfeTZgcCBEjwOBVk=;
	b=F6jiOFDSRBV8gIenikZnGE54fSPdE6UWZiPfaK2MUFR/TgGdaUBcXr87LKnBw9RgdV
	V5G636wlgt+mGtzGwdeXMnqrSzK50kmVKpkozHg3QDmjIhdcDcN0o5nLlV6V/QBZuCRC
	PDsou8SYJisMMkT7M1b34BlO8cUvEguV5JBrATrNecJUNcjxQ3Y5A4DNfDzRD5ySaqL1
	2A8vq5u5OPCqmiTwPmHLmsth8bFkGhna3f2OSVmEaMk7uXXGySeT0UFZbLRmpPFRMJJX
	cVvnQYMMF9KnXuGoUmIhcdX4xgINt7ACtxutuVes4VBlrpy91ZmZZdM2lQ5KDL5M0AvO
	x1SA==
X-Gm-Message-State: APjAAAW3XLrZX6THSqhtu4SU2ZoQ/ROYlz235d8yRZHuivRvE5rmT7Ib
	XPre3na2H3kX2xi/yF1RMTsJLo/Rx6I=
X-Google-Smtp-Source: APXvYqwBAXw0QhKJ0crnGjJchEYHcMAjSs+dXHND1C2VICVV8YffuejAb+/FwDik6XRyJtKtgO6YQg==
X-Received: by 2002:a62:583:: with SMTP id 125mr34417961pff.69.1570461081180; 
	Mon, 07 Oct 2019 08:11:21 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	m102sm12786928pje.5.2019.10.07.08.11.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Oct 2019 08:11:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 08:10:51 -0700
Message-Id: <6018e9755dce3eaa22a1fe691dc18546c43c9cbe.1570460789.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570460789.git.akuster808@gmail.com>
References: <cover.1570460789.git.akuster808@gmail.com>
Subject: [thud 14/26] go: update to 1.11.13, minor updates
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
X-List-Received-Date: Mon, 07 Oct 2019 15:11:20 -0000

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


