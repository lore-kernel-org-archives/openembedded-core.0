Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 591DB6161F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 04:17:39 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id bg4so1353786pad.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 21:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Res8SdPDwmZYrI/YDybKeJu/jGY9Q7iYma8Gawgkhsg=;
	b=TtB1EgUsYpvn9i7jqW5EX0hrQgPYgoPjQX/T2SUiXoHYLOEDYLgzqA3CzFsljkLfy3
	qRfAlcusWUQaRaWWhSnhFCnrYx42QiL8ypvgoUxdhzxib5GEMfTyR6uBnsfNQz7d91aw
	EpjJhbMrJ2LxEs4G6i5mDQSbEUxZaSN9mEi9HTypZRtD/p02E//AY39EeqsU8FbyNHj9
	r8w2IQ+9vGCK5jVKtpD9hyrwWCx1gppdaACYbc9q1T93n7flGXFLLCgJOQRVSTJcrYns
	33Pp/GvWoN/usceYROBalqjCV9UwjnaKMShFaAZ36r0o9qTyiuKLbx5sJGCkw39Erq8A
	FF2Q==
X-Received: by 10.66.146.42 with SMTP id sz10mr3090102pab.100.1378354661528;
	Wed, 04 Sep 2013 21:17:41 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	tr10sm32571783pbc.22.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 21:17:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Sep 2013 21:16:08 -0700
Message-Id: <552083d7d1a9e045fbb47ee7668e167bddd3dd19.1378354382.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <01b4612b2453648a4b5f203acd8326b73ef293f3.1378354382.git.raj.khem@gmail.com>
References: <01b4612b2453648a4b5f203acd8326b73ef293f3.1378354382.git.raj.khem@gmail.com>
In-Reply-To: <cover.1378354381.git.raj.khem@gmail.com>
References: <cover.1378354381.git.raj.khem@gmail.com>
Subject: [PATCH 03/13] python3native.bbclass: Add python3 abstraction class
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
X-List-Received-Date: Thu, 05 Sep 2013 04:17:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/python3native.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta/classes/python3native.bbclass

diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
new file mode 100644
index 0000000..f86374f
--- /dev/null
+++ b/meta/classes/python3native.bbclass
@@ -0,0 +1,7 @@
+PYTHON_BASEVERSION = "3.3"
+
+inherit python-dir
+
+PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
+EXTRANATIVEPATH += "${PYTHON_PN}-native"
+DEPENDS += " ${PYTHON_PN}-native "
-- 
1.8.4


