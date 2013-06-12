Return-Path: <net147@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 674D76A98A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 01:07:04 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id jt11so9004548pbb.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 18:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=tJHsD+5bFSyuXKRcloHP62p6m6SCN+BB5c5TT5jSlK0=;
	b=suNvTPPAKghlSKuMDNuQIv55xojLa7i6xErHOiz4Z5YWyAaF5kDgbAJfQMujg6ZEeR
	9SC15Z6uCnYFrM3IMHOEpCj1LuBqfE4hVVovM3LbSilb5+BvIF0RLdjbB8glmhmpQq19
	J1VZ1NO4QuFkhFdCXYoTHLyqjP9Cd7ziq9+ct+42p6uJ3siMRvo6HJNuugKfNNc/wPrG
	59awVnrtMa0IqSxxreBy2KOvSWB+s95dVNOUbuowqHbQFLOFmcwf88sF8MCRhHf54Tab
	v1BJ6VJpiAcSsckuNCFS0SnU0WdHi6VCImMsJ1DjrcaceXpTgrXfBCjgES89L9Y9b0KZ
	APcw==
X-Received: by 10.68.226.39 with SMTP id rp7mr17165257pbc.97.1370999224977;
	Tue, 11 Jun 2013 18:07:04 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	pb5sm16756497pbc.29.2013.06.11.18.07.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 18:07:04 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 11:21:05 +1000
Message-Id: <1371000065-23866-3-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <1371000065-23866-1-git-send-email-net147@gmail.com>
References: <1371000065-23866-1-git-send-email-net147@gmail.com>
Subject: [PATCH 2/2] classes/qmake_base: allow parallel make
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
X-List-Received-Date: Wed, 12 Jun 2013 01:07:05 -0000

Remove MAKEFLAGS= from EXTRA_OEMAKE to allow parallel make.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/qmake_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/qmake_base.bbclass b/meta/classes/qmake_base.bbclass
index 79040cd..86bbede 100644
--- a/meta/classes/qmake_base.bbclass
+++ b/meta/classes/qmake_base.bbclass
@@ -4,7 +4,7 @@ OE_QMAKE_PLATFORM = "${TARGET_OS}-oe-g++"
 QMAKESPEC := "${QMAKE_MKSPEC_PATH}/${OE_QMAKE_PLATFORM}"
 
 # We override this completely to eliminate the -e normally passed in
-EXTRA_OEMAKE = ' MAKEFLAGS= '
+EXTRA_OEMAKE = ""
 
 export OE_QMAKE_CC="${CC}"
 export OE_QMAKE_CFLAGS="${CFLAGS}"
-- 
1.8.3


