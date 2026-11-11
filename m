Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5603.1794387811797484176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=avdg2aEk;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2006381f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387810; x=1794992610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zh/1PiEA4O8qvUq31Ynz3dL5zmoZA1lU4wr+AaZd/P4=;
        b=avdg2aEk9uw0W1tRanJDkz6u2hs8tobP8ASVjk6Y2udRg8Ut3CUkmhQB9atXUKCCle
         LwRfHoK+0nAAHaPKq4RiyJOfyPXAo6xkgtTdPyAzPbSkm+jkCLvcj4HDnlkyBTSI9TGJ
         mC96V8FjbJg1PdUHBsjxeYpAjpqISJ8dTbYEm0SYk1vUVZQz0v3WhHIP9FwBC15ThYHe
         lxcaCgHbyRcKOFsF8k/8E1VjFryTQnDI7QPE+5kLflwjpVJnoGuxtGU5wX0AHcI7GAg9
         i1CjHxzy10/hYlqNrSHiOnG0ex+3V5HiyS8pQBrGudl4n8n0x85i+azgny1+RmjGCYFD
         QteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387810; x=1794992610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zh/1PiEA4O8qvUq31Ynz3dL5zmoZA1lU4wr+AaZd/P4=;
        b=AfgCqcQZomgbAP0qYQHKAi6TXAR+JcDj88dquBqzszz35yclsl7E5tk/tIfgMALgd8
         JvEvrrtAyQhJgihleA2e118S/zQqFrPpej8t+/eQHTuhQkGjhr+ztfa8C1tHvxu2ZvuO
         SMpR/ff2H/Mk9PiH1GFPNkzj99ryO1Z5ZquSV8lk3WN5l3+FOYre6f+/LYbhH80r2bfV
         DKhNUCLS7KXUnFvVoI/nFrfJN+IeF6mU/JjMLTlrgQbPZ6Wf+9LdpzrF9AvM1Jcr/1uR
         BB2xzbGIBv/t5GMD2MHJfnXZCN6htI9wDKFLuh77pVGW+ue313W0Xmg6/udvdx7U8FXo
         Dicg==
X-Gm-Message-State: APuU4Z9+y9nNTp7FfttHz1kWII8zahEaC8JWdtEnVYqoEYvk2wBlsc7g
	xZbGrLYbfsrAhv0XmwR/Zqy4mBRmax1d//EXw2rCy0lWyK58Rf5XmNQ2lIRBOTx06WpQPkGbl8K
	zYXmPO+A=
X-Gm-Gg: AYBFou16UvvvuRtXWws1D/tUSTy8qzuFoVR7zpID+b3Uc3jqC5EZWfamCUXYRLFozx6
	5ZHHhTt0hd6gJX0B0GVYLVIwPxyyGB0Cgk0YC/5iDfBfgem0plZQyPpwASTIYNtTFAGfhpHTAz6
	4XKBSauhTpbMCfy1PbOzWeiETrh/XqqLwvuGU5UPUwdPCK5hTNi39Q4FyMRN0cUxxSxUPmWzht1
	cVH/AopDxwTXWCd2M/BJEpNvfjJSXmzrpSVSU3Hp8y7GeKi1woXBTUfViQMBX9/T0K8+4I8PpXj
	72fq9uJB5fMUb5jkl+yo3VCb5xlXD9XUeNWGZoQmbyi+EjtaMb8guIZRFOoSp6yNNGZ7bdRL3Gx
	4hIXZGmDTJBn+MkqoTDTikPoLRjOfsaSaAgl+4bbsJDeXS/B1RQEQxBe5AV/LTFhtZZus70N83F
	vdIrHENkEX7eR3EXftpXSjvqfvwC1oWXEaNoGypE6pCDXSeb2Vu2I5rPA8lFUBs+XyvXcgedllp
	Izln3m/rkEvbt4xnUo8IfmE6n1SkU3SFa+bNDmTeM30dTulKgBbOjNQx4/qEk3lqCPLqjSfguQT
	PDiFHEYEB6SMVCooNUQgCCayn1aHamw5uJxTKZbFA17yBs5EE65LRnc/YHvBLPkuXC6wJuf4DSd
	eocQr1ytX4n2T4riGkCuK6geuo65S
X-Received: by 2002:a05:600c:810c:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4ba09364b9emr26022055e9.6.1794387809930;
        Wed, 11 Nov 2026 01:03:29 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:29 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 14/35] go: upgrade 1.26.9 -> 1.26.10
Date: Wed, 11 Nov 2026 10:02:40 +0100
Message-ID: <424a3c4187c0e04f65e6f6bc52ad75fba6427d70.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249986
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.26.x release [1]:

$ git --no-pager log --oneline go1.26.9..go1.26.10
4e8c85f531 (tag: go1.26.10) [release-branch.go1.26] go1.26.10
aa64342a9e [release-branch.go1.26] crypto/x509: distrust a handful of intermediates
51e7ce32a8 [release-branch.go1.26] cmd/internal/moddeps: restore tests

Fixes CVE-2026-111943

Release information: [2]

[1] https://github.com/golang/go/compare/go1.26.9...go1.26.10
[2] https://groups.google.com/g/golang-announce/c/66pojueaQek

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed a typo in git log command]
---
 meta/recipes-devtools/go/{go-1.26.9.inc => go-1.26.10.inc}  | 2 +-
 ...-binary-native_1.26.9.bb => go-binary-native_1.26.10.bb} | 6 +++---
 ...ross-canadian_1.26.9.bb => go-cross-canadian_1.26.10.bb} | 0
 .../go/{go-cross_1.26.9.bb => go-cross_1.26.10.bb}          | 0
 .../go/{go-crosssdk_1.26.9.bb => go-crosssdk_1.26.10.bb}    | 0
 .../go/{go-runtime_1.26.9.bb => go-runtime_1.26.10.bb}      | 0
 meta/recipes-devtools/go/{go_1.26.9.bb => go_1.26.10.bb}    | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.26.9.inc => go-1.26.10.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.9.bb => go-binary-native_1.26.10.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.9.bb => go-cross-canadian_1.26.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.9.bb => go-cross_1.26.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.9.bb => go-crosssdk_1.26.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.9.bb => go-runtime_1.26.10.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.9.bb => go_1.26.10.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.26.9.inc b/meta/recipes-devtools/go/go-1.26.10.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.26.9.inc
rename to meta/recipes-devtools/go/go-1.26.10.inc
index e2657cf8ad8..035da371f22 100644
--- a/meta/recipes-devtools/go/go-1.26.9.inc
+++ b/meta/recipes-devtools/go/go-1.26.10.inc
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
 "
-SRC_URI[main.sha256sum] = "9735d7dcdb65b35d3fa577f04064737c03b89cf1a2b71e6e69fe2f3c6f9fd4ca"
+SRC_URI[main.sha256sum] = "fd63e883ba2f2bfca93c1646b31ebef63e2b1e4d2b317c9789d976a68d81f36f"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.26.9.bb b/meta/recipes-devtools/go/go-binary-native_1.26.10.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.26.9.bb
rename to meta/recipes-devtools/go/go-binary-native_1.26.10.bb
index a42ce443604..67201c8b748 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.26.9.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.26.10.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "42d158b4d8f7b61ac0a830567c940a86098fb7aac52e467a5ebec03ef5cc2f8d"
-SRC_URI[go_linux_arm64.sha256sum] = "4a97373d49fcacdcf3694fea368a500b00ee3e963974f3e7514132717632f052"
-SRC_URI[go_linux_ppc64le.sha256sum] = "a21a65001146ca0c6c022c690d5418f8298c5513a81fb5eed42f6cdb29f40063"
+SRC_URI[go_linux_amd64.sha256sum] = "ccfe7ae822d2c2f41f4fe7c956199967a4dac22d0ee0d2b2bfdb440aab3b20c5"
+SRC_URI[go_linux_arm64.sha256sum] = "3f4227ce7b206a513e794f1393adb473a07b46e94d18bd15d1c684bbb7319797"
+SRC_URI[go_linux_ppc64le.sha256sum] = "4492031a19657de3bd7e4c48dce9d9e5aa7b668300f7c2c98e620b9ac0ee84ee"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.26.9.bb b/meta/recipes-devtools/go/go-cross-canadian_1.26.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.26.9.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.26.10.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.26.9.bb b/meta/recipes-devtools/go/go-cross_1.26.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.26.9.bb
rename to meta/recipes-devtools/go/go-cross_1.26.10.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.26.9.bb b/meta/recipes-devtools/go/go-crosssdk_1.26.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.26.9.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.26.10.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.26.9.bb b/meta/recipes-devtools/go/go-runtime_1.26.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.26.9.bb
rename to meta/recipes-devtools/go/go-runtime_1.26.10.bb
diff --git a/meta/recipes-devtools/go/go_1.26.9.bb b/meta/recipes-devtools/go/go_1.26.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.26.9.bb
rename to meta/recipes-devtools/go/go_1.26.10.bb
