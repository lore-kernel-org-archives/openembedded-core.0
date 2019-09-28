Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 062B37D667
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Sep 2019 22:41:56 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id j31so12041002qta.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Sep 2019 15:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=E3WLPiya8/wm/QNjoqrG4dWfzqxIRg9Rp2omsF7gDvY=;
	b=T5//z8BWxRN1tET0GFQP3ZZRBrDWvyNJ2lURukUVWCEhLu47052UwzgfDdNnB9zLgs
	fY8AdUoJHYt2vABm5jp3+x+NQiE5V1XdXHzS+4HdvWzsI4mYifk+Os54abCCTO3OEpFw
	RFlfhot2Yuq3OXtCOTwgCEUtE9oUtRBLqvoP0O7mqmI68Ivfjo1f170XYLretgwgFFli
	1WO+JTFonBEdJzsvfCudmF8Uwg7UB24pwsTCss7T9s91FbSKTMPOkDb8u+vaFeuv/RYY
	T7Z1LdTVIwIvndkzhb4QYH9JtWJa657/OkmGyU+eN48qqVf/b0yEvjE7c36xXsL/y2y9
	zcDg==
X-Gm-Message-State: APjAAAWmCKnoyozlYj6L19I3UcU7+lqyNLA+0zo+CJqoSEwT677JP31O
	9XgIW4G0IST/55l2jwQQFWHHc0xBbDs=
X-Google-Smtp-Source: APXvYqzR9ErK6+C8pY7V58xEch82CYSn9uyqTb0fdSDmBxSYTvV0s48XvQ9WHtg2FhkLyveLyu24tQ==
X-Received: by 2002:ac8:373c:: with SMTP id o57mr9192646qtb.70.1569710517238; 
	Sat, 28 Sep 2019 15:41:57 -0700 (PDT)
Received: from localhost ([181.220.83.67])
	by smtp.gmail.com with ESMTPSA id v5sm5708089qtk.66.2019.09.28.15.41.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 28 Sep 2019 15:41:55 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 28 Sep 2019 19:41:50 -0300
Message-Id: <20190928224151.4126357-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] mesa: Add freedreno PACKAGECONFIG option
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
X-List-Received-Date: Sat, 28 Sep 2019 22:41:57 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/mesa/mesa.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 54b7618f87..9e5808ee27 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -98,6 +98,7 @@ PACKAGECONFIG[gles] = "-Dgles1=true -Dgles2=true, -Dgles1=false -Dgles2=false"
 PACKAGECONFIG[egl] = "-Degl=true, -Degl=false"
 
 PACKAGECONFIG[etnaviv] = ""
+PACKAGECONFIG[freedreno] = ""
 PACKAGECONFIG[kmsro] = ""
 PACKAGECONFIG[vc4] = ""
 PACKAGECONFIG[v3d] = ""
@@ -107,6 +108,7 @@ GALLIUMDRIVERS = "swrast"
 GALLIUMDRIVERS_x86-x32 = ""
 
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
+GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
-- 
2.23.0


