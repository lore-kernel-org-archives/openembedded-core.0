Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5611.1794387833967914782
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=M/LCXhCD;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so26477005e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387832; x=1794992632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OrpKjzWNNHibYrJp4JK3jf10yTcz2hwXDjHmZPJ/00g=;
        b=M/LCXhCDsUgaBDZeQ2vcWiWxewHdpvw4YxgwhqEFF23R8bBIGWfNquCpKFkZtFKY9M
         zUv15trt3GEd1GqmSaT83ovsS9jXZ7kgw0UYR3sM1PIku6/p4CGNsFne3YL5PQ8hS6DZ
         T742E7cs+RfmebcqjaZW31Xf+1gwHA/mtb9pODeAnTs1XCLJmXBwyGqiAJNssmdj3xcA
         CKEDojFfwq7Pc7UN4jfYgLmnGXdAOi2OB5dyu7UYdGa0JjTu672YcOa2uBi5PyWwlpZK
         X4PZ50wjY34u8PJoCxc9SmzuervDwfpjyHs7BpT7hP6Y/vFe1jiE4ckyzxzy4AXtvCMT
         m0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387832; x=1794992632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OrpKjzWNNHibYrJp4JK3jf10yTcz2hwXDjHmZPJ/00g=;
        b=13S0uou88yX24oFJkdhda/gXUaa+NTzDx/e4ceX2K0Whpy90sl1L3Eblk3tpTjIBLj
         bHmUg2pGjj889jMMWiztLJ9e2PXhyYm//sVVkVDwA4qQGM9Rg2Jktgc74Ht+FQiFzexQ
         c5d2YNqUBgzKqtkW95usGXWlcCHkpWrcZBqh0DpMXUJ5uXUH1IziNbOOmkjQaFEYHYdi
         rZPOlhTInQtV3hpUjD6d088HE2U+jB52Q43ZlCDr9wgjO6Pax+kC5POBVzcT01Sbjew9
         GKATUfqf7BJHBA9aGzuuuKTKkOcENtNPmC/xaVVo0LiPPNoD8wnhUZIkUfspRQgepdMe
         3e0g==
X-Gm-Message-State: APuU4Z/0QDj7gN/peC9NBGM7n2CCNRAVk6lHRQVmyfLGar+b8fcVvaWW
	95FKtb55cEyqO0WWRpayOBCtRYdwADM/JEVQS13KpEhPJSObWZTjmUbXMgwujcBK9HCcqCxxxvN
	ZiI1r/V4=
X-Gm-Gg: AYBFou1ElB+h2L5TpsBWh9+QhOYMb6MWiiYzLOFVYyw/sMRRyK0Co73y3hjF+dXUzmm
	sFHj/mmUkfGDtBC47uhQzmZGvetjhyQKN1PbIVcS9+oUrkg1rCxdnbOUqavgWJAC9T61zXSEBCZ
	kxhx9Ep90UlZjV1VRjQAyCZloBdsf32+pNXO6PoDLVWoytOynJjs9IW4YT6gsLUktztM3e/6dbU
	aigktSXicMTL7zWqM44o1eJQHQoGwPUkrjl0GEm4Uoz4x/+oziA0GZKxdpA/q8p/qG2H+1zY9c1
	gfS7tkHjjsn2f3DavrGzA2TW5e+oJa0BzvMCK7VQ1roOG43IPKG8GMZAfsQAGIejul0xA7oPhc3
	fZSxB/0//n5GJ7fa8+E6of/ehQghTrJD9SiIkW04tnwQjEcy0bqb3BfMPZclMp073Up17kNfDUd
	l7+Rp+tbUUZSF9zA006D8f+jbHBzY6e+k8ok3GrdiZxw4OgN+cPRz/5/A5U/YbOERTeV5Ysq6F5
	HDm6m8ydSyfToN5rzxBfSFjScI7XgjZxnZrJ5PTOSHfESLf774p3wdIr+06LJ++nMeoqWqrmAm6
	G8rkAl/ZuXWMLq7zjBOVsYIrKSk6/SINy6szJC0DBLXmMMFpD36YtYvynEkrb4KjBjDQBzMRyot
	wUoLP9oeOHOBGEvlpgCJv/+JRibToxBPqXy6iCmlI0ZVGk7J+ao4=
X-Received: by 2002:a05:600c:4f82:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4ba09376146mr29921955e9.13.1794387832087;
        Wed, 11 Nov 2026 01:03:52 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:51 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 25/35] dropbear: patch CVE-2026-35385
Date: Wed, 11 Nov 2026 10:02:51 +0100
Message-ID: <0edb50e9b5a2642cfc1a063599f877c71e4511a7.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249997
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2026.90 release.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../dropbear/dropbear/CVE-2026-35385.patch    | 42 +++++++++++++++++++
 .../recipes-core/dropbear/dropbear_2025.89.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2026-35385.patch

diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2026-35385.patch b/meta/recipes-core/dropbear/dropbear/CVE-2026-35385.patch
new file mode 100644
index 00000000000..6794acd57a0
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2026-35385.patch
@@ -0,0 +1,42 @@
+From 443ccc1fd1b9a4e3747f6b5cd644b7af49064308 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Sat, 2 May 2026 08:17:25 +0800
+Subject: [PATCH] scp: clear setuid/setgid bits on received files
+
+From openssh-portable 487e8ac146f7d6616f65c125d5edb210519b833a
+Tracked as CVE-2026-35385
+
+upstream: when downloading files as root in legacy (-O) mode and
+
+without the -p (preserve modes) flag set, clear setuid/setgid bits from
+downloaded files as one might expect.
+
+AFAIK this bug dates back to the original Berkeley rcp program.
+
+Reported by Christos Papakonstantinou of Cantina and Spearbit.
+
+OpenBSD-Commit-ID: 49e902fca8dd933a92a9b547ab31f63e86729fa1
+
+CVE: CVE-2026-35385
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/443ccc1fd1b9a4e3747f6b5cd644b7af49064308]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/scp.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/scp.c b/src/scp.c
+index 09297a5b..79b0a12d 100644
+--- a/src/scp.c
++++ b/src/scp.c
+@@ -1114,8 +1114,10 @@ sink(int argc, char **argv, const char *src)
+ 
+ 	setimes = targisdir = 0;
+ 	mask = umask(0);
+-	if (!pflag)
++	if (!pflag) {
++		mask |= 07000;
+ 		(void) umask(mask);
++	}
+ 	if (argc != 1) {
+ 		run_err("ambiguous target");
+ 		exit(1);
diff --git a/meta/recipes-core/dropbear/dropbear_2025.89.bb b/meta/recipes-core/dropbear/dropbear_2025.89.bb
index 6cb520f68d9..9f04327bd1a 100644
--- a/meta/recipes-core/dropbear/dropbear_2025.89.bb
+++ b/meta/recipes-core/dropbear/dropbear_2025.89.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://CVE-2019-6111-02.patch \
            file://CVE-2019-6111-03.patch \
            file://CVE-2019-6111-04.patch \
+           file://CVE-2026-35385.patch \
            "
 
 SRC_URI[sha256sum] = "0d1f7ca711cfc336dc8a85e672cab9cfd8223a02fe2da0a4a7aeb58c9e113634"
