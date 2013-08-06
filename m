Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id B5AAF6B52C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2013 11:18:16 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id en1so262395wid.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2013 04:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=bMvJi+ipbOczZ+J3LOqIUg5LGIkkVzTrr3zeZjBGAzg=;
	b=d41NPs8UiowWJ1j1UPWm+AtOuY95uWWhrH+bxf9Ce3SsBjEnS/D3vmjOk4w9tO25ox
	VSW7ysZJsWQ1zB1e4CCY2vzS5yyHvv3At9zXwsS6gCpgKwNmOi4PE4VhoHkL1qq4TkVd
	gK4dsfeWhRvlGcA4IVfIsPHnYzhpXl06aTeul5gI3Ud2Z1c4Cu9RMCxQ8bMYb5Y7lM0M
	aLN0p2pFAN8ap/N+dsbkpuzogyxvJvPUXxcPU3lepJiTk3uH35txMvMzIctkkgK9sMav
	ySyzK2CoGiiDa8qL8yeFrAqs18PRZnaWx1pv4Ue7cjbdrPsHrL6yMxh/tqMY9gNnPnZu
	xjPg==
X-Gm-Message-State: ALoCoQldD90Rkxp/zET5MluGTXQrcQwGml1FGcS1IWd1lBPszlFW5PyMnMMAaXpw64Nu/VVej2qM
X-Received: by 10.194.123.69 with SMTP id ly5mr692813wjb.29.1375787896923;
	Tue, 06 Aug 2013 04:18:16 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id hb2sm4966164wib.0.2013.08.06.04.18.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 06 Aug 2013 04:18:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2013 12:18:07 +0100
Message-Id: <653b8f2da86101031731b208b84a4ca4f91b5074.1375787843.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1375787843.git.ross.burton@intel.com>
References: <cover.1375787843.git.ross.burton@intel.com>
In-Reply-To: <cover.1375787843.git.ross.burton@intel.com>
References: <cover.1375787843.git.ross.burton@intel.com>
Subject: [PATCH 2/2] seperatebuilddir: mesa now builds out of tree
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
X-List-Received-Date: Tue, 06 Aug 2013 11:18:17 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/seperatebuilddir.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
index 979f44b..eb19e0f 100644
--- a/meta/conf/distro/include/seperatebuilddir.inc
+++ b/meta/conf/distro/include/seperatebuilddir.inc
@@ -440,7 +440,7 @@ B_pn-mc = "${SEPB}"
 B_pn-menu-cache = "${SEPB}"
 B_pn-mesa-demos = "${SEPB}"
 # src/mapi/mapi/stub.c:51:39: error: 'MAPI_TABLE_NUM_DYNAMIC' undeclared here (not in a function)
-#B_pn-mesa-dri = "${SEPB}"
+B_pn-mesa = "${SEPB}"
 B_pn-minicom = "${SEPB}"
 # Not automake, no external tree support
 #B_pn-mkelfimage = "${SEPB}"
-- 
1.7.10.4


