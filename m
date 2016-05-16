Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9F23373257
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 16:17:34 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id l68so14877385qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 09:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7al6rsfjT0MX/Il/MYyFtSShZKLpu/s1Cr0CCnmyyQA=;
	b=kWEMUnnQx80P96VIRlPw5QcKyPTGrIHAeriMfcZbr0TTU2b+upsRmYZ3i4l8lyLqMZ
	BWaGuh27fP9p4EQtKMeUKlwYjiQrV4KDysZjt7kaBh8lgx9rgAjFI/qq8/sj1bbpYubZ
	PBCcRTP7Jys2Bq0LecrM2rL2yEAEjA90OP3HkkEhq5iQ81JiwLhFqM2VZBvfRwxkU0xJ
	nc/lM0rI5KKn2Z9CG6dZ+YhbcPxIc9q9fxUqdCxLTlXHI794thYDXyrvm9rGWi/XQXlN
	xxaBNgO6kwlsQQhLqqPVPgy2V0FnyVeliRYZCVpaVlm4AO7cEXI7jURlRMeFTD8bsS4j
	ExSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7al6rsfjT0MX/Il/MYyFtSShZKLpu/s1Cr0CCnmyyQA=;
	b=bQy6giQSAWJCUz8wKBEeK1T4AjP950TAdmI09PZsBST0Ln9uumeP1ZNTV6PuXG3amt
	qw1XAJpvGX6s2VG8Yg0BYC+6eWMhI3pXXcDNvg448pJZLpGJXgpLecVutS2KlHx29U7L
	vWanHIv3F8f3AixpMftNHj9d0td40Vg0beD1KFlxwJhn4bujyN6avygckO5scppKPhV2
	VeQKqCnfDEVSTq/TR570lUxz+mQAxDiz3SGnWXxN6u1OUgg/gYtCW9cGHZOF1u6N20ct
	JG3tswqlUy61ApTxmA7ceLnVoL3+pR/m398rxZGCrjZhdCZWEoIHVci2ZAejFfIbVitR
	ITLg==
X-Gm-Message-State: AOPr4FUa/kE4l5bMpe1TxbWFv7G41H2ijP7zxLgtBQX4/57N+vfoxTQ3uGHLOPYMAV1rxQ==
X-Received: by 10.55.148.130 with SMTP id w124mr32415919qkd.203.1463415454857; 
	Mon, 16 May 2016 09:17:34 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id d93sm653567qga.39.2016.05.16.09.17.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 May 2016 09:17:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2016 09:17:31 -0700
Message-Id: <1463415451-21779-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [master][krogoth][PATCH] python-numpy: fix build failure with python-matplotlib
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
X-List-Received-Date: Mon, 16 May 2016 16:17:36 -0000

From: Armin Kuster <akuster@mvista.com>

numpy/core/include/numpy/npy_common.h:149:10: error:
|          #error Unsupported size for type off_t

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h b/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
index 191e5a1..109deb0 100644
--- a/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
+++ b/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
@@ -11,6 +11,7 @@
 #define NPY_SIZEOF_PY_INTPTR_T 8
 #define NPY_SIZEOF_PY_LONG_LONG 8
 #define NPY_SIZEOF_LONGLONG 8
+#define NPY_SIZEOF_OFF_T 8
 #define NPY_NO_SMP 0
 #define NPY_HAVE_DECL_ISNAN
 #define NPY_HAVE_DECL_ISINF
-- 
2.3.5


