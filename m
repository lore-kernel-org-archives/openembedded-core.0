Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f41.google.com (mail-pl0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE3B78A74
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 22:57:42 +0000 (UTC)
Received: by mail-pl0-f41.google.com with SMTP id u11-v6so6249276plq.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 15:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DBmC8ou89+m0ZJlQ7MZ9eNMkVgtSUXtmApSSrrcSVuY=;
	b=gZ1XlNbU1JhjbZLftcmBcsNVSfDyraHv1GoNMeUhjviMX/MTj40Gkx3LCVrARMkK3T
	iLUihyXguhA6966DumSQ8wgyflop5mwUbnIhqV7YZH26G5lForndU6preu+Gv+3sSkcw
	JlPecFzFYoxw0vxISBWWPPY+sUVi6iWZnAdR+iCrsxOrt7BD/G+NEnb0OYCYsESYbXaI
	GxR07lISyFZ51E1RB3lSJqR9udMd8J1hVAHliByJMk2mNUAMrsd/Yo6jvlS/E0LhMc61
	ASp3fZ8NB0z+97pD7Q30dHVuejdsWR81j7fumO43AB/7xOOuI0MEQfSXoqkep9MBnwJg
	+S/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DBmC8ou89+m0ZJlQ7MZ9eNMkVgtSUXtmApSSrrcSVuY=;
	b=GOLp+a8/5eSCyn7gkPDIuwnwLqW/9+e5Xj3TmAhrvjQOjoiFgIMsj5AaJTOoy17LcJ
	X0TXtuksEc2UJUBCI8VZWmaCofHz6ncwbzzd9hnqWBd9d9FdT1BGuCFcb0914n6+0QBX
	cl8oIBEH0NmtQ2YWPAplwPmmOF45zUYugCbIhlU/aocaC+8cRNaO+Ao8YKL0Us9Sm8JQ
	q1Acg7Exd2hqFLG2a+FMY64dW6emodDk9bvXCyjuLv/hjhhktUyoVSaXzl/LcTHSUKBi
	c/vPudgPvB6Bmhrn7QuqZjxlPPQphFmA5OGSdKd+bDbGT9GskpL3JAIaHrFupZcomOuA
	tHjQ==
X-Gm-Message-State: AOUpUlEiU325Yg3M4BX0hXp/1M3rgC+mWzldmANaD+ROdGU3c/+oERBP
	Zy24JVZJxdniTjTptY0AMsqF1N/7
X-Google-Smtp-Source: AAOMgpdfrAuzgVG3FtLScFd4Ti3TsCXryFI3i9cWkGMiFiw9qXTnalWbo4hiHb6kcaW5A8NLI3RZ1g==
X-Received: by 2002:a17:902:7e06:: with SMTP id
	b6-v6mr15442598plm.230.1533596263242; 
	Mon, 06 Aug 2018 15:57:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm11993137pgr.59.2018.08.06.15.57.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Aug 2018 15:57:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 15:57:12 -0700
Message-Id: <b5d8d871e55aae5798bdabe105157c607116b02d.1533595822.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533595822.git.raj.khem@gmail.com>
References: <cover.1533595822.git.raj.khem@gmail.com>
Subject: [PATCH 15/18] libxcrypt: Upgrade to 4.1.1
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
X-List-Received-Date: Mon, 06 Aug 2018 22:57:42 -0000

license update: Remove CDDL code with Public Domain pieces

https://github.com/besser82/libxcrypt/commit/c76847e3be40c4ac0d78bc8518502418c6207144#diff-fdcb2380ff1eeea2e5795ec115ba1c0d

inherit pkgconfig as it uses pkg-config during build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libxcrypt/{libxcrypt_4.0.1.bb => libxcrypt_4.1.1.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.0.1.bb => libxcrypt_4.1.1.bb} (81%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.0.1.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb
similarity index 81%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.0.1.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb
index f21029cdad..61ea22e4ea 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.0.1.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb
@@ -3,13 +3,13 @@ DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
 HOMEPAGE = "https://github.com/besser82/libxcrypt"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM ?= "file://LICENSING;md5=d1cc18f512ded3bd6000f3729f31be08 \
+LIC_FILES_CHKSUM ?= "file://LICENSING;md5=cb3ca4cabd2447a37bf186fad6f79852 \
       file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 "
 
-inherit autotools
+inherit autotools pkgconfig
 
-SRCREV ?= "089479bb24acd168613757a6f12d63caa95416b4"
+SRCREV ?= "21b455b68baad279e6a3936faced16c5e5634376"
 SRCBRANCH ?= "master"
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH} \
-- 
2.18.0


