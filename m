Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4BD3061844
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 04:17:46 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id kx10so1356687pab.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 21:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=1XTT4UaTK2R544K1qbxiwZvPy0hfApJZ+T58nsKGH2M=;
	b=HTnxY3ZTmYyWUH9v/+F25Y8Ljy+8Z2UVi1ltnLw41kx3UfTyobQtWRHOExiGAAtpSR
	/a2cVHUe+1dxWmMKvRX5f89L7lleqyvautqn5fhWIhFpilq9KdaKch2YJcGWBwcLayuV
	Cn/ob+61wBTKMQjcd92Njy1PeLRtSUtGYwfRT0uyguvTv/AXsbdIY0Unpool/51rjFVG
	x/JrM9OIz3AHoKLeKUmNB1rmSOFBqzInwXlprmqN01zZXT94pGDmdpUfHgZyduUj/Ga+
	YMnfCFVFpJcAUtNs4O2lnLuRsnh9Z9n94LhoAfjZBquiieBmiCdzRVFN3RYe9XHEffqr
	802Q==
X-Received: by 10.66.25.232 with SMTP id f8mr7171001pag.25.1378354668273;
	Wed, 04 Sep 2013 21:17:48 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	tr10sm32571783pbc.22.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 21:17:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Sep 2013 21:16:15 -0700
Message-Id: <45121ccedbdc96f465bb3777bc1d4b3de90dd68c.1378354382.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <01b4612b2453648a4b5f203acd8326b73ef293f3.1378354382.git.raj.khem@gmail.com>
References: <01b4612b2453648a4b5f203acd8326b73ef293f3.1378354382.git.raj.khem@gmail.com>
In-Reply-To: <cover.1378354381.git.raj.khem@gmail.com>
References: <cover.1378354381.git.raj.khem@gmail.com>
Subject: [PATCH 10/13] python_2.7.3.bb: Inherit python-dir
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
X-List-Received-Date: Thu, 05 Sep 2013 04:17:46 -0000

So it can get the correct python direcotries for python2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python_2.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index f6a4609..1caa1e7 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -36,7 +36,7 @@ SRC_URI += "\
 
 S = "${WORKDIR}/Python-${PV}"
 
-inherit autotools multilib_header pythonnative
+inherit autotools multilib_header python-dir pythonnative
 
 # The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
 #Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
-- 
1.8.4


