Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 64F8E77028
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 13:13:13 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id o11so90859280qge.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 05:13:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zbSfSs27V8iuZbjj6ASLSiuuSi+a+EBU5Kcqi2sMKGs=;
	b=Q50WaYugtqdCIkkPBDMwTEGOfOa0CxY5l4iWshevslQ0IEU7Qlvb2gedABLkAnJyV7
	+NHXBubtw6AaRycyGgG70vvodpG6N9SbKGv50oBlBUCnYL5QDXPDtfc7UPJC0V38aLRM
	8FsJjz7le7rCeBIzQ6GOsb2Br+hOLzzyJCNEbIY7lbuAYOp9DQ+LSMcG5evGkbM/+wNK
	bdkvguE+S+WbzqA4vK/S8lfG1FDSekCREFp0Gc+6d0eBAwcie4yhSyULfiXParPQmDP+
	UZKgzzjiU8oRDUVbJ8NX7tWZRwqwseY+mnJ0w8FSa45Vm1enK/FVOuPQ//Sv8r2fU9GC
	N2cQ==
X-Gm-Message-State: AG10YOQMIH/0u6cPu2gECmKBMmSslNp/jjgnzNwn4/IYPE7aMpvoRUmIWgEu341vgUkdrw==
X-Received: by 10.140.128.8 with SMTP id 8mr15688090qha.54.1453641194598;
	Sun, 24 Jan 2016 05:13:14 -0800 (PST)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	x79sm6835516qka.37.2016.01.24.05.13.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Jan 2016 05:13:14 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jan 2016 08:13:04 -0500
Message-Id: <1453641184-1655-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCH] bind: update to 9.10.3-P3
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
X-List-Received-Date: Sun, 24 Jan 2016 13:13:15 -0000

Addresses CVE-2015-8704 and CVE-2015-8705

CVE-2015-8704
Allows remote authenticated users to cause a denial of service via a malformed Address Prefix List record

CVE-2015-8705:
When debug loggin is enabled, allows remote attackers to cause a denial of service or have possibly unspecified impact via OPT data or ECS option

[YOCTO 8966]

References:
https://kb.isc.org/article/AA-01346/0/BIND-9.10.3-P3-Release-Notes.html
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-8704
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-8705
---
 .../bind/{bind_9.10.3-P2.bb => bind_9.10.3-P3.bb}                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.10.3-P2.bb => bind_9.10.3-P3.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.3-P2.bb b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.10.3-P2.bb
rename to meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
index 875a0c8..da414c0 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.3-P2.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
@@ -23,8 +23,8 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-lib-dns-gen.c-fix-too-long-error.patch \
            "
 
-SRC_URI[md5sum] = "672dd3c2796b12ac8440f55bcaecfa82"
-SRC_URI[sha256sum] = "4a6c1911ac0d4b6be635b63de3429b6c168ea244043f12bbc8a4eb3368fd6ecd"
+SRC_URI[md5sum] = "bcf7e772b616f7259420a3edc5df350a"
+SRC_URI[sha256sum] = "690810d1fbb72afa629e74638d19cd44e28d2b2e5eb63f55c705ad85d1a4cb83"
 
 ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
 EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
-- 
1.9.1


