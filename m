Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id AB91879C85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 07:54:51 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 22-v6so284116pfz.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 00:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cYlq4ypuotDe7TeZIAnIcCFyR6yOBQZyAtgxBv9XNbE=;
	b=Ffut/Y55nByMkCnYMtwVjNCO4H0IcHFFBY4SKCztKuxnIVGAyEcSrBDAckAttxos+H
	hoo4ex+bicplw+TGHzfoVkIX4Hmu2ms2Oj7kBNZRrqe6OPb1EcLWa7Nc9s6+gnsq5n69
	5wdh5LrAKIpnFXIBscjd8lKSUlNBDhtnvfKA5eCod0hvUaVSzog44ciIRNblBNd3gnOT
	X1JQL8UMRnT3DDTG2Y7sTQyEejzHxjZOOM/l1R08KtMbV66yNy3R0fWSlj4l3x/CGH9K
	zfjJDEzzbDVbbbw462KmxO9tZEcjoch4PdDZDr1u7D4Igrw+h8ZPbqKXNBmP988UK89n
	kLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cYlq4ypuotDe7TeZIAnIcCFyR6yOBQZyAtgxBv9XNbE=;
	b=dK4gsUafsYYCtTQju7GOK7tsAmcqwDSmoBcBWKIu9NDN3SxxSrHYgW/l9g8b2p92ec
	ethgXfKo/vAq6Umb9dz7qZgM0DPH6+wpl/0KRiJghHJpRER8tZ3RhvkJlzdEVzwDJgrs
	pK9xD+KhkfUuo+CRdM4fVSvCcmzUOJpATpDeY6RUeAzepMbl1ZTRWjtW19LKjIxL9fCM
	0sGiFCspDd700Sdk0YgLyBR71UBusrz9gd8Oku7/O4YXjY4j1BgwyFRRQr6HdOGUrDgB
	lDSobvu3J0LlGoBGGju9jmlBIOkEvYKKEehx/gbscli4vVcSYtyA6LSVJe39O432ttwv
	SOzg==
X-Gm-Message-State: ABuFfoiJYA8e6VfZ+ws+IBu5Hvvsmyafd995VourQRvMPUnpXwgFBdAd
	P7EZsdr3tILvJ4y+ohdwu+MQ77KrRNk=
X-Google-Smtp-Source: ACcGV614CU0k7Yy3TjIu68tf6kyKCxmAUn4ffFS8gmlc1cRbKB/QccopPCPtz4GWcautcOC6cjBfjA==
X-Received: by 2002:a63:cc:: with SMTP id 195-v6mr44986744pga.44.1540281292352;
	Tue, 23 Oct 2018 00:54:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([109.144.222.79])
	by smtp.gmail.com with ESMTPSA id
	e193-v6sm866368pfg.127.2018.10.23.00.54.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Oct 2018 00:54:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Oct 2018 08:54:46 +0100
Message-Id: <1540281286-26784-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540281286-26784-1-git-send-email-akuster808@gmail.com>
References: <1540281286-26784-1-git-send-email-akuster808@gmail.com>
Subject: [v2][PATCH 2/2] libpcre2: update to 10.32
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
X-List-Received-Date: Tue, 23 Oct 2018 07:54:51 -0000

License-Update: changed do to typo fixes and tidies for 10.32

see: https://www.pcre.org/changelog.txt

Signed-off-by: Armin Kuster <akuster808@gmail.com>

--
[v2]
add missing License-Update
---
 .../libpcre/{libpcre2_10.31.bb => libpcre2_10.32.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.31.bb => libpcre2_10.32.bb} (90%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.31.bb b/meta/recipes-support/libpcre/libpcre2_10.32.bb
similarity index 90%
rename from meta/recipes-support/libpcre/libpcre2_10.31.bb
rename to meta/recipes-support/libpcre/libpcre2_10.32.bb
index a10c312..3a0aa53 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.31.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.32.bb
@@ -8,14 +8,14 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=f5e4bde9fd0493d0967b4dba9899590f"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=cf66d307bf03bae65d413eb7a8e603a0"
 
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
            file://pcre-cross.patch \
 "
 
-SRC_URI[md5sum] = "e0b91c891a3c49050f7fd15de33d0ba4"
-SRC_URI[sha256sum] = "e07d538704aa65e477b6a392b32ff9fc5edf75ab9a40ddfc876186c4ff4d68ac"
+SRC_URI[md5sum] = "8a096287153fb994970df3570e90fcb5"
+SRC_URI[sha256sum] = "f29e89cc5de813f45786580101aaee3984a65818631d4ddbda7b32f699b87c2e"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.7.4


