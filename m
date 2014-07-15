Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id B8F9470579
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 16:18:42 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id q58so897467wes.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=kdmT2fiGNOP4UvD8a8gi0m+IzgPyS+SPzDWCQpa6ihg=;
	b=Jj5kyVdKJzi7dzXDFBopN1vd0OcPPec4iOSSMwTJviF9EKDnz4wl6Hg0CQeRjk8OjJ
	qRQK9vawHdxxiU1dFa0SGu/37ZYjEbmqekYw+ESAQWdy0naFQJ4yrDtoE7T06HzjFa1E
	9ZbmRClbG08FQdNqPe/zbpkSc9FxpVm/4oPx/Ab5zMqDjc2yn8WEP8mDgxm8AKkLM6go
	oeqKaGlEUn/dxbOpwPW8KE9tYssI4Ym8qJ4719E1aEcsTNraS1Yzr4mrGgu6oI79GBy4
	DFc2WNuLI8jFahxFja3d5wH4bP+SzAqur+T+aKJZreTyLlFgN6gCNB99llf6IC21s0tJ
	qzkQ==
X-Gm-Message-State: ALoCoQnSo+GUhs9eoftxbAmRuew6ED2sG8OD83n8UiwIiLc+zEYFHGU6huuyrk/mSxzDwTgHthfF
X-Received: by 10.194.158.226 with SMTP id wx2mr13445505wjb.107.1405441123502; 
	Tue, 15 Jul 2014 09:18:43 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	au7sm33554040wjc.41.2014.07.15.09.18.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 09:18:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 17:18:31 +0100
Message-Id: <6895f8c7b94923c2e0def4f141aa7b9c3c0722fd.1405440532.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/7] bzip2: use "foreign" automake strictness
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
X-List-Received-Date: Tue, 15 Jul 2014 16:18:44 -0000

bzip2 doesn't want GNU-levels of automake strictness so tell it to be "foreign".

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/bzip2/bzip2-1.0.6/configure.ac |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/configure.ac b/meta/recipes-extended/bzip2/bzip2-1.0.6/configure.ac
index 14b1d18..47ee576 100644
--- a/meta/recipes-extended/bzip2/bzip2-1.0.6/configure.ac
+++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/configure.ac
@@ -1,7 +1,7 @@
 AC_PREREQ([2.57])
 
 AC_INIT(bzip2, 2.0.5, , libXrender)
-AM_INIT_AUTOMAKE()
+AM_INIT_AUTOMAKE(foreign)
 AM_MAINTAINER_MODE
 
 #AM_CONFIG_HEADER(config.h)
-- 
1.7.10.4


