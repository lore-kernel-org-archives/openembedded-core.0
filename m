Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 955BD7DF2E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:22 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id t87so8435078pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wYg/YcIdWu4WvXay6NU6IlmtLr18ydzO5Gh3KqV1s4k=;
	b=PujH22nnxI3xMO65IdKGkEQiSR8/KPJ429IAbyBm+Suwvb7zWrmgTOZe1oU8R5Be/J
	enCjTDF8a0/9ijTkDj9hSCvjSsJjLyyxq1kmNI511kK1ySEt07eAB5McnfUlD0fSworF
	IXQ5x5x3krTeDNFX+c1dsVLJ/Khx6DURV5TOwcrAsX0CwgjZ9e4Bv+2YDcYGIc/wozz1
	wJuPnp7WbEdANpYSENkP6Z55oW4znjixap/1wOyyXufD4gqWJpTI/toAHUEXRkvZcUqP
	UwgC9/D/MwQ76US9AzAL59l8YU7TLQ3+t+6VsP1JrmkiKe0ofaXCO4IyVUVVnd59rxUz
	8Y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wYg/YcIdWu4WvXay6NU6IlmtLr18ydzO5Gh3KqV1s4k=;
	b=QY5TVNJwMjribFIqYGyJzqiO1v0oCGExUHWsAuisbNGgVJ0xhoOL2YpazcZMtqmEm2
	F+fK56WKBhJRi9uqTdtB1AOEK9qddv7qDHtIhIdC02W+basGyBgLwc5f9fA+S14D5jv/
	DAnDrFZ1J6F4uy8C9pYvFZk4As9O75ZIRKrjCZaLVmew6AUGNANe/gcAN6zvwPY2UkOW
	cagVZrj+xOb3DustU6N/UHf+jmNl7dW2xP4CuFvbCjZ+f144tl681d1p73pJ9aHg5Yf1
	1k01cix8DSVfgGPPF9yAX4m7AaBSO5VdOMKqhwT6OOwZpmVaW2PFlm3GAnidkGrPjlcg
	4lmQ==
X-Gm-Message-State: APjAAAV409F+p7e8wIA3jFH83v9/7DPM4TgYZ1kFb5PtWaJk+4/nVzZD
	Tspe8eV4twzA6X0iM/B/lj1c85hr
X-Google-Smtp-Source: APXvYqwimiKLSDxuQa/rGLb+8M3guGvjRXa1tLoXHISDkLjxMygLnQFe45wImaF0LmxUtok0vYt1OA==
X-Received: by 2002:a63:cc4b:: with SMTP id q11mr36111560pgi.43.1557809663698; 
	Mon, 13 May 2019 21:54:23 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:53:59 -0700
Message-Id: <dd1a74f6defa6fcd9cf79ec48c057a5ac7298624.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 17/23] flac: also add flac to CVE_PRODUCT
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
X-List-Received-Date: Tue, 14 May 2019 04:54:22 -0000

From: Chen Qi <Qi.Chen@windriver.com>

flac uses both 'flac' and 'libflac' as cve product.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-multimedia/flac/flac_1.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/flac/flac_1.3.2.bb b/meta/recipes-multimedia/flac/flac_1.3.2.bb
index 92ef897..e8599f6 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.2.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.2.bb
@@ -21,7 +21,7 @@ SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
 SRC_URI[md5sum] = "454f1bfa3f93cc708098d7890d0499bd"
 SRC_URI[sha256sum] = "91cfc3ed61dc40f47f050a109b08610667d73477af6ef36dcad31c31a4a8d53f"
 
-CVE_PRODUCT = "libflac"
+CVE_PRODUCT = "libflac flac"
 
 inherit autotools gettext
 
-- 
2.7.4


