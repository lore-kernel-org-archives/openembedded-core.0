Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 46E2E7F2D9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 15:19:16 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id q10so1982423pfl.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 08:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=j2MXK2OEWreOhSZIpWfqVPeE3XkIfeTZgcCBEjwOBVk=;
	b=e5FY12kUy82jnpyPxDAI+JCz3tLhlXDecCzCUrsd4oDkAs8WnUNPFhqeZrpb1/3Wek
	yghZf0WsBNNkOE6Nh6Iqg9IZUZCuOPUCcwYfjnrcX+k/W77SrP7oQXXwTBBVkX8iCx3Q
	8fa8EQ5fyMvN1+Rp0Tg6vsr8476pqlMKNmeeXCqlwPOcSjnNQcfugLY1qn/3BRrVEuap
	Z5XJc0U8lIO0CClAONN7DRJP3nRaSxa0TZSOu02zIyG7XsIaOyVXKAZ08xK+Gu2fO8Z0
	/Ks7KUzl0dkR98ZROS9qK3jDE9Qpv8sQIuONDtTpxaA3L+Z/dcoTI7kw4BBcVLaXm2uD
	V93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=j2MXK2OEWreOhSZIpWfqVPeE3XkIfeTZgcCBEjwOBVk=;
	b=RRJ/UHh+RWgu8VieacyMUEsXmQTJih8zW+dlWlFZYBfOgqxREAaZFvwtNnNfzv2XSA
	iy4EbSzfGjxnonHBsrIngMwyA8Uycn81rLPd0KFwRRcDX+C0kC8UL2obUf/Z13OHp9OL
	6nGweQKaDK8KAzIMhw/CyCOjHD1hi5seQef9VVJ3QJX4vOcqh6hnEgEsON4uQHSU6f/W
	O65+wafykVTZ+tGvIVURNjbSoYQG4sgRmsBcChV8OO0Xb/umR/kpf/QhuRLM9yOjxuaz
	Ac6Yqj9xVA0mJxuLdB42kXSuL3YJJikpZoTWU6KyXj9PGXzP20rkWhsCELrKFq44+Xu/
	o8Sw==
X-Gm-Message-State: APjAAAURwTKzy4V3Ji1Iol2FTlVmK4P06fjcAgRx1J/NoKywqyZFrcvj
	4ro6NqMF1T5tLuySN4oZ+Zdq4qvx
X-Google-Smtp-Source: APXvYqx4xByFH1BLl4VINJaNvPg0R3J9oUPneBHAArjL8o4gmXyIM9BhvPoXRE1/tOfZ8evkJXcAMw==
X-Received: by 2002:aa7:9f0e:: with SMTP id g14mr4631116pfr.100.1567696757404; 
	Thu, 05 Sep 2019 08:19:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:811a:fbd5:24bc:2160])
	by smtp.gmail.com with ESMTPSA id
	o129sm3125712pfg.1.2019.09.05.08.19.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Sep 2019 08:19:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2019 08:19:11 -0700
Message-Id: <1567696751-26950-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567696751-26950-1-git-send-email-akuster808@gmail.com>
References: <1567696751-26950-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH 3/3] go: update to 1.11.13, minor updates
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
X-List-Received-Date: Thu, 05 Sep 2019 15:19:16 -0000

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


