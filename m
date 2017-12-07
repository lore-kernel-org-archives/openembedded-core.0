Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6640471957
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 18:13:19 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id z6so16878492iti.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Dec 2017 10:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CUMtYCr3RWWEdJcFTUvOR0k3Sdwg5JQKIgIiQvkih6Y=;
	b=BZXN1p7ZHbs/QszLqVxUgdOGzS9S06Er6TNVfM4QIEW1mM1GZns/tco0rOEmWeyPQs
	DBfiSXIqWSDGjgy0YDYKHTPiWpcb2HCpNyHlleyHOWI8BjnX7r4h8XPFvi2L9YMlWN+W
	Wplz38lXbbmAyt5UxIN5c/UlJv7L0J9vqo7hxSnlTBMI96DuIcdzOApCUL4ye2CC0mkG
	Brw9IcJUxRnSo1Emnm6uszqkJAlH4WDpM/0Lehvfc2HH4B+xNEbPcF9IKwamTnIyOPod
	/wC+V+7BTrlnKMPFSRSMWYrV16f1Bk/p9USPhcFOLJvxnC/qAUyya3K9ZdG2O9w6zY5L
	Hz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CUMtYCr3RWWEdJcFTUvOR0k3Sdwg5JQKIgIiQvkih6Y=;
	b=PjP20FYU8wXctzyHL78VN7gghRlNFOLql2nhhDzjYeJ3VxJEngslVMHQuLbCb6eqrA
	qhmdq0oyIQiDLWdO6KsuKtnzd4iHv7v7VADT9JiAy31r6oH4DAIu4vr97x+HPP/e6am4
	povJeCh4JGkcGZD1JGptRF976+DitXxL6nmQOcqQtT2td1unI/ym5qL8uF5cgITQ/lLy
	ohyDGb3wV7u+3FkAoPNNeA4mC+W9Ml/SSzDSAONOh3MaY7qWCoszyuBJwvBDvc6ZJApE
	UXw8jCkVoVp/XUzv2FS0/LmUfbbXNK9Qr8J0KrMskntxVagB62+i2qwQGjYrJwwM5Ut5
	k7ow==
X-Gm-Message-State: AKGB3mItDYw8u8d388PBAroRtKamhFds6Dm6coWih3EeK/4+5s65Qwqj
	ruptYq1oOxjzB7a3LQLwXqq/DU2Y
X-Google-Smtp-Source: AGs4zMbIGScFgFEz9i/F/n1HJN+66PALcPgkSadEk0r4vTCk2CvxIeR8r/4ZXng+b/NGAHEeY8oZ4A==
X-Received: by 10.107.88.9 with SMTP id m9mr7646423iob.68.1512670399954;
	Thu, 07 Dec 2017 10:13:19 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	i133sm373097itf.1.2017.12.07.10.13.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Dec 2017 10:13:19 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Dec 2017 12:13:09 -0600
Message-Id: <20171207181309.8895-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171206194628.1901-1-JPEWhacker@gmail.com>
References: <20171206194628.1901-1-JPEWhacker@gmail.com>
Subject: [morty][PATCH v2] cross-localedef-native: Include locale_t.h
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
X-List-Received-Date: Thu, 07 Dec 2017 18:13:20 -0000

Newer versions of glibc (2.26) moved the struct locale definition from
xlocale.h to bits/types/locale_t.h. For compatibility with build hosts
using this version of glibc, include this header.

See f0be25b6336db7492e47d2e8e72eb8af53b5506d in glibc

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../glibc/cross-localedef-native_2.24.bb           |  1 +
 ...1-Include-locale_t.h-compatibility-header.patch | 28 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-Include-locale_t.h-compatibility-header.patch

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.24.bb b/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
index d4cccedb43a..4a77eee2c9b 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
@@ -36,6 +36,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-eglibc-Install-PIC-archives.patch \
            file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
+           file://0001-Include-locale_t.h-compatibility-header.patch \
 "
 # Makes for a rather long rev (22 characters), but...
 #
diff --git a/meta/recipes-core/glibc/glibc/0001-Include-locale_t.h-compatibility-header.patch b/meta/recipes-core/glibc/glibc/0001-Include-locale_t.h-compatibility-header.patch
new file mode 100644
index 00000000000..af8a5d61608
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-Include-locale_t.h-compatibility-header.patch
@@ -0,0 +1,28 @@
+From abfeb0cf4e3261a66a7a23abc9aed33c034c850d Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Wed, 6 Dec 2017 13:26:19 -0600
+Subject: [PATCH] Include locale_t.h compatibility header
+
+Newer versions of glibc (since 2.26) moved the locale typedefs from
+xlocale.h to bits/types/locale_t.h. Create a compatibility header for
+these newer versions of glibc
+
+See f0be25b6336db7492e47d2e8e72eb8af53b5506d in glibc
+
+Upstream-Status: Inappropriate compatibility with newer host glibc
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ locale/bits/types/locale_t.h | 1 +
+ 1 file changed, 1 insertion(+)
+ create mode 100644 locale/bits/types/locale_t.h
+
+diff --git a/locale/bits/types/locale_t.h b/locale/bits/types/locale_t.h
+new file mode 100644
+index 0000000000..b519a6c5f8
+--- /dev/null
++++ b/locale/bits/types/locale_t.h
+@@ -0,0 +1 @@
++#include <xlocale.h>
+-- 
+2.14.3
+
-- 
2.14.3


