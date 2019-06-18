Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id A4F1B7D697
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 10:20:23 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v14so13324255wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 03:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=V/CQ4XKNVeNAoQgbitTh72VZt2BAi2uibTnQL4CCiQo=;
	b=cImbaces5S8uKT9sl2oOgD5shx9CwZpUnUkHNmcdOeetqrqyZ7/XOT/t5js7epeJqc
	eAf0YZYt5qe4GD+Netduul2kqBDZPOOs8Kb+CulvvLUeYF+Fh0rBXrnUZoBG1A9t28++
	sMltxC7QjZHzDQUNN0YcTfkh+L8WCSPzEsPtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=V/CQ4XKNVeNAoQgbitTh72VZt2BAi2uibTnQL4CCiQo=;
	b=XRE12aZ7hcXgazMfa+E/i+PmCs0Y5RAHn/qlBgmpEpN4jucKJlVWLyfpnJGfGt6Ef9
	kvYYo8fAH22i/u9rnXq8hyDbz7Q+alzz3bcVCZ0sSdMSCaQESXBYacSB5BBSEuvX88At
	4VM8unNipxyMCCto9bj+RjNABRHc5DutuUdrMUVoQilVY3Eo3QyePxmWZIbN411s8dbX
	+X2CZtmCXTC0UlvK/E/Cp7xoqk16PUdP8y3gCy6CZwUk4Sv3LiIfJDWConJiNy/VRcgH
	MA0KkHRI6swvgDJTjTqD+GRpAjMcU3rqFrtFQXcIZwm8X4PoeD2EzwERnXW4pAvfWSbC
	1rTg==
X-Gm-Message-State: APjAAAWiRNPLGQv19+nINDFCSt+Vr4vASOVetf2Z7oyXs3uyW3CjXMnP
	r+0urWpOMz1Qg6s52e/ddqjcu/UQlgM=
X-Google-Smtp-Source: APXvYqxRvDCHRIMSNu5xal6g0c5VtjhIkvlzq9DrGtz6jAgaWdCZeKKirQlScEw0atcfVXYERa11pA==
X-Received: by 2002:adf:c506:: with SMTP id q6mr65926461wrf.219.1560853223964; 
	Tue, 18 Jun 2019 03:20:23 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q21sm1699905wmq.13.2019.06.18.03.20.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 18 Jun 2019 03:20:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 11:20:22 +0100
Message-Id: <20190618102022.25830-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] perl: Move perl-sanity -> perl
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
X-List-Received-Date: Tue, 18 Jun 2019 10:20:24 -0000
Content-Transfer-Encoding: 8bit

This was moved during the perl cleanup, it can/should be moved back now as
its confusing too many people.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch | 0
 ...001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch | 0
 ...001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch | 0
 ...001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch | 0
 .../files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch  | 0
 meta/recipes-devtools/{perl-sanity => perl}/files/errno_ver.diff  | 0
 .../{perl-sanity => perl}/files/fix-setgroup.patch                | 0
 .../{perl-sanity => perl}/files/native-perlinc.patch              | 0
 .../{perl-sanity => perl}/files/perl-configpm-switch.patch        | 0
 .../{perl-sanity => perl}/files/perl-dynloader.patch              | 0
 .../{perl-sanity => perl}/files/perl-rdepends.txt                 | 0
 meta/recipes-devtools/{perl-sanity => perl}/files/run-ptest       | 0
 meta/recipes-devtools/{perl-sanity => perl}/perl-ptest.inc        | 0
 meta/recipes-devtools/{perl-sanity => perl}/perl_5.30.0.bb        | 0
 14 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-devtools/{perl-sanity => perl}/files/0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch (100%)
 rename meta/recipes-devtools/{perl-sanity => perl}/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch (100%)
 rename meta/recipes-devtools/{perl-sanity => perl}/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch (100%)
 rename meta/recipes-devtools/{perl-sanity => perl}/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch (100%)
 rename meta/recipes-devtools/{perl-sanity => perl}/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch (100%)
 rename meta/recipes-devtools/{perl-sanity => perl}/files/errno_ver.diff (100%)
 rename meta/recipes-devtools/{perl-sanity => perl}/files/fix-setgroup.patch (100%)
 rename meta/recipes-devtools/{perl-sanity => perl}/files/native-perlinc.patch (100%)
 rename meta/recipes-devtools/{perl-sanity => perl}/files/perl-configpm-switch.patch (100%)
 rename meta/recipes-devtools/{perl-sanity => perl}/files/perl-dynloader.patch (100%)
 rename meta/recipes-devtools/{perl-sanity => perl}/files/perl-rdepends.txt (100%)
 rename meta/recipes-devtools/{perl-sanity => perl}/files/run-ptest (100%)
 rename meta/recipes-devtools/{perl-sanity => perl}/perl-ptest.inc (100%)
 rename meta/recipes-devtools/{perl-sanity => perl}/perl_5.30.0.bb (100%)

diff --git a/meta/recipes-devtools/perl-sanity/files/0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch b/meta/recipes-devtools/perl/files/0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch
similarity index 100%
rename from meta/recipes-devtools/perl-sanity/files/0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch
rename to meta/recipes-devtools/perl/files/0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch
diff --git a/meta/recipes-devtools/perl-sanity/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
similarity index 100%
rename from meta/recipes-devtools/perl-sanity/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
rename to meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
diff --git a/meta/recipes-devtools/perl-sanity/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch b/meta/recipes-devtools/perl/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
similarity index 100%
rename from meta/recipes-devtools/perl-sanity/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
rename to meta/recipes-devtools/perl/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
diff --git a/meta/recipes-devtools/perl-sanity/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch b/meta/recipes-devtools/perl/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
similarity index 100%
rename from meta/recipes-devtools/perl-sanity/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
rename to meta/recipes-devtools/perl/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
diff --git a/meta/recipes-devtools/perl-sanity/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch b/meta/recipes-devtools/perl/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
similarity index 100%
rename from meta/recipes-devtools/perl-sanity/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
rename to meta/recipes-devtools/perl/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
diff --git a/meta/recipes-devtools/perl-sanity/files/errno_ver.diff b/meta/recipes-devtools/perl/files/errno_ver.diff
similarity index 100%
rename from meta/recipes-devtools/perl-sanity/files/errno_ver.diff
rename to meta/recipes-devtools/perl/files/errno_ver.diff
diff --git a/meta/recipes-devtools/perl-sanity/files/fix-setgroup.patch b/meta/recipes-devtools/perl/files/fix-setgroup.patch
similarity index 100%
rename from meta/recipes-devtools/perl-sanity/files/fix-setgroup.patch
rename to meta/recipes-devtools/perl/files/fix-setgroup.patch
diff --git a/meta/recipes-devtools/perl-sanity/files/native-perlinc.patch b/meta/recipes-devtools/perl/files/native-perlinc.patch
similarity index 100%
rename from meta/recipes-devtools/perl-sanity/files/native-perlinc.patch
rename to meta/recipes-devtools/perl/files/native-perlinc.patch
diff --git a/meta/recipes-devtools/perl-sanity/files/perl-configpm-switch.patch b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
similarity index 100%
rename from meta/recipes-devtools/perl-sanity/files/perl-configpm-switch.patch
rename to meta/recipes-devtools/perl/files/perl-configpm-switch.patch
diff --git a/meta/recipes-devtools/perl-sanity/files/perl-dynloader.patch b/meta/recipes-devtools/perl/files/perl-dynloader.patch
similarity index 100%
rename from meta/recipes-devtools/perl-sanity/files/perl-dynloader.patch
rename to meta/recipes-devtools/perl/files/perl-dynloader.patch
diff --git a/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt b/meta/recipes-devtools/perl/files/perl-rdepends.txt
similarity index 100%
rename from meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
rename to meta/recipes-devtools/perl/files/perl-rdepends.txt
diff --git a/meta/recipes-devtools/perl-sanity/files/run-ptest b/meta/recipes-devtools/perl/files/run-ptest
similarity index 100%
rename from meta/recipes-devtools/perl-sanity/files/run-ptest
rename to meta/recipes-devtools/perl/files/run-ptest
diff --git a/meta/recipes-devtools/perl-sanity/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
similarity index 100%
rename from meta/recipes-devtools/perl-sanity/perl-ptest.inc
rename to meta/recipes-devtools/perl/perl-ptest.inc
diff --git a/meta/recipes-devtools/perl-sanity/perl_5.30.0.bb b/meta/recipes-devtools/perl/perl_5.30.0.bb
similarity index 100%
rename from meta/recipes-devtools/perl-sanity/perl_5.30.0.bb
rename to meta/recipes-devtools/perl/perl_5.30.0.bb
-- 
2.20.1


