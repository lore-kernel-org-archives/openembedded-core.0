Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id ADF6D75877
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 14:09:00 +0000 (UTC)
Received: by wgjx7 with SMTP id x7so296959521wgj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 07:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=pczq5/xGD73WIwhJwWfihv+gRpio3VR7HhpyinacMTI=;
	b=FqoeC1G0SoiMGZpCCER8ZDJP5zVRoYpj6nz9UYTitKYOUYHCP236B7pjtFkPy0a9Ua
	SwXescFfKHx0ZBfy9uMDaH5FQT1gqGkNTIhAch/cCfq8dMYQlQJdzjLPrBqbn40RhU/y
	OKMVKZLtixzmGRt3xgJMB9aearJ9Yao9VxIsOU8fcWF+X9/jFeqMQ4k0puNTKVyDo6Cw
	gr9dtv0uWyimGlriL4jrZ/nMdVECtrLyxaDQe87YOLs7409UJCjGht44uro8UeUZYxi7
	XZPB4W575g7zG0eCBIWeUpP6dsnJ9uMARYcJdTulXf+tmLB0qrsl2HN0AQybHsJG7SiA
	50hQ==
X-Gm-Message-State: ALoCoQmUKSVb7/E20LuYpVBiQL/DteXQ8ij0B3Z9mTds/S8Lurx9cbVvQ+Ox6oUPwNzXTqswdnjz
X-Received: by 10.180.23.97 with SMTP id l1mr23342374wif.94.1436796540100;
	Mon, 13 Jul 2015 07:09:00 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f3sm14841438wiz.13.2015.07.13.07.08.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Jul 2015 07:08:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jul 2015 15:03:01 +0100
Message-Id: <abd62d1cc54281d415a0a9b85ac41c1ce7782129.1436795781.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1436795781.git.ross.burton@intel.com>
References: <cover.1436795781.git.ross.burton@intel.com>
In-Reply-To: <cover.1436795781.git.ross.burton@intel.com>
References: <cover.1436795781.git.ross.burton@intel.com>
Subject: [PATCH 3/7] ptest: add dirs
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
X-List-Received-Date: Mon, 13 Jul 2015 14:09:01 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/ptest.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 101ab9d..2ac9143 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -46,6 +46,9 @@ do_install_ptest_base() {
     fi
 }
 
+do_configure_ptest_base[dirs] = "${B}"
+do_compile_ptest_base[dirs] = "${B}"
+do_install_ptest_base[dirs] = "${B}"
 do_install_ptest_base[cleandirs] = "${D}${PTEST_PATH}"
 
 addtask configure_ptest_base after do_configure before do_compile
-- 
2.1.4


