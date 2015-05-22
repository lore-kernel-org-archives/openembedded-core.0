Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 709D965D19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 00:11:17 +0000 (UTC)
Received: by iebgx4 with SMTP id gx4so20475917ieb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 17:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vwVs3E0kiQL8Sox8VtP9mR7DlD6TqL6IrnS4bAbCXHo=;
	b=D5F/eIteSKn7/4qSY3qv2mEpPxziG87KKIrWYjKsyZq6AjHq+1zh3DwwmQUNXOfR1Q
	5hhsVWiWvik+G0xgAPZwixYexkJ68htcpW1k+xeVqPUUZanewzeNVy5GtIf2jw7zVve0
	aJPCQtrOw91m/oFJ1oX4Sq/qdIo+ccPTHhqn55M2rbMEV1MUWynzwBVONBpe6To/dUK5
	iuW946k0k6L3XXvvfj/uADRSwcDF36h1pOz4USXOST7SMqBNukeE6TCkseoppLFfC7zE
	8/PgfoycKhGkImhuQHZFPsHGICqD7B85WjvbL+/pYo9Z2NfM8BVnJGoxYDI2fUpMahJp
	gShw==
X-Received: by 10.43.60.14 with SMTP id wq14mr6381128icb.60.1432253479257;
	Thu, 21 May 2015 17:11:19 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id b2sm2427309igf.10.2015.05.21.17.11.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 May 2015 17:11:18 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 17:11:06 -0700
Message-Id: <1432253466-9933-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gnutls: remove --with-libz-prefix configure option
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
X-List-Received-Date: Fri, 22 May 2015 00:11:19 -0000

The default search path in sysroot is sufficient to find zlib, so the
--with-libz-prefix configure option seems to be unnecessary.

For target builds, relying on sysroot also prevents an absolute path
from being hardcoded in the gnutls.pc pkg-config file.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 45fb529..87f275a 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -23,7 +23,6 @@ EXTRA_OECONF="--disable-rpath \
               --with-included-libtasn1 \
               --enable-local-libopts \
               --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
-              --with-libz-prefix=${STAGING_DIR_HOST}${prefix} \
               --disable-guile \
               --disable-crywrap \
               --without-p11-kit \
-- 
1.9.1


