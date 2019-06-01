Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 96CBF7E63B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 00:38:25 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id f25so4909632pgv.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 17:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=L6r4h8H12/G+51mYDMEUnXi5l6Vw3MrXtRcBz0W2KHs=;
	b=R2KC+IZMX+eMpOyvN4e9HbUo7vYkMOVyXviNH+tLhiFsfSshiSpDcTAdOkn8NyzOdI
	W1R1dsQ4D7JzThpC6THcAzTl2HuG4wtitVen4C2Wdpwy/ak3ePcTZHzvqgsYuTnuhfZA
	J/9oxraHNG8PyHl73ZUuQCbJ8We8M4aRpGSzUyv4mBjcxObD/ZZ2qJaVUzrEmR0UvwQg
	weyzol8EcW+b6Jq+DoK9WRuOCsjES0UA0cm9weIcmQDP9UEN8/Hrow3ApEZdm9+mJWSo
	aBRu86IgE3v1xtTrpkL9u7yrn32q8PpwbqiRKOIks3yRClM8qJW+lhTlLZIyqsm/uOQh
	utdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=L6r4h8H12/G+51mYDMEUnXi5l6Vw3MrXtRcBz0W2KHs=;
	b=YdcIV9o5RG3QE6oc1yKBvHCu49y0ZybBMClP0+UEGRTlSGiHz9uiXa1bpCNac08PQ/
	/AhisxJl2Hz65k+ZOHiSxMOngDc/S3B2bA004bZh6KrW7dDXvVdEnrXYzQ+mtcmSj5AD
	5Z3QPk2m+Nkm0y0zlSxRIV8ZjkJQNKNeby57uGWLBpUW1E9zT6/yF+5zmJ0tMwj5y5a/
	XUNLzpuzomfKZMBUM8uhvs3JrLx8AwUdDSyM11hioGUkbYqvzFPdAOeVCYNRV5f8gDwd
	eOqEFAaDL9AAf5UY8WITkSdb5CjbVMVvl1bNQCnavZrQ3vn6MYD0JxrK3EqwM9DsZIwr
	qVQg==
X-Gm-Message-State: APjAAAXRGhkgRhCA+51aqFoE9HObxbU6Qii+pweQk+1yAbb7x5Ztek0j
	AcbimODd1cJWi7Lpcya9nGzQSjkV
X-Google-Smtp-Source: APXvYqyIcW5L4uOzTS01+qVqH3S4HOWNquIbfla8O5eOhL1jGh1cf3X2yWekYveFTg7tsV/I3hr33w==
X-Received: by 2002:a63:5b5d:: with SMTP id l29mr12711421pgm.444.1559349506448;
	Fri, 31 May 2019 17:38:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d8eb:da43:9914:3fc9])
	by smtp.gmail.com with ESMTPSA id
	e124sm9171561pfa.135.2019.05.31.17.38.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 May 2019 17:38:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 17:38:22 -0700
Message-Id: <1559349502-9721-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559349502-9721-1-git-send-email-akuster808@gmail.com>
References: <1559349502-9721-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [thud][PATCH 2/2] wpa-supplicant: update to 2.8
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
X-List-Received-Date: Sat, 01 Jun 2019 00:38:25 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Source: OpenEmbedded.org
MR: 97302, 97307, 97312, 97317, 97327, 97322
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/openembedded-core/commit/meta/recipes-connectivity/wpa-supplicant?id=d6df8c1a7766e5df6351bb56f905664394cbdcc0
ChangeID: 90cdfc7008381f91dd18f6310c8c862a1f13c818
Description:

License checksums were changed due to modified copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Bug fix update only
Includes
CVE-2019-9494
CVE-2019-9495
CVE-2019-9496
CVE-2019-9497
CVE-2019-9498
]

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../{wpa-supplicant_2.7.bb => wpa-supplicant_2.8.bb}           | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.7.bb => wpa-supplicant_2.8.bb} (91%)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.8.bb
similarity index 91%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.8.bb
index 6fc5cf5..073a300 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.8.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "http://w1.fi/wpa_supplicant/"
 BUGTRACKER = "http://w1.fi/security/"
 SECTION = "network"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a3791c270ad6bb026707d17bf750e5ef \
-                    file://README;beginline=1;endline=56;md5=495cbce6008253de4b4d8f4cdfae9f4f \
-                    file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=a5687903a31b8679e6a06b3afa5c819e"
+LIC_FILES_CHKSUM = "file://COPYING;md5=279b4f5abb9c153c285221855ddb78cc \
+                    file://README;beginline=1;endline=56;md5=e7d3dbb01f75f0b9799e192731d1e1ff \
+                    file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=0a8b56d3543498b742b9c0e94cc2d18b"
 DEPENDS = "dbus libnl"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
@@ -26,8 +26,8 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://99_wpa_supplicant \
            file://0001-replace-systemd-install-Alias-with-WantedBy.patch \
           "
-SRC_URI[md5sum] = "a68538fb62766f40f890125026c42c10"
-SRC_URI[sha256sum] = "76ea6b06b7a2ea8e6d9eb1a9166166f1656e6d48c7508914f592100c95c73074"
+SRC_URI[md5sum] = "0af5998c5d924e985cab16b9a1c77904"
+SRC_URI[sha256sum] = "a689336a12a99151b9de5e25bfccadb88438f4f4438eb8db331cd94346fd3d96"
 
 CVE_PRODUCT = "wpa_supplicant"
 
-- 
2.7.4


