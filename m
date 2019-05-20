Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id F19017DECF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:43 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id x64so13458787wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tokA5tjB6GMsI3SDTwZjT4GBZEOA7iVB67BbBd1XGmQ=;
	b=lue0uA/7FzvNMS9Cn/t/B/xVT+IBTO5PIiuqTMNqzzqWkMxHDLLSE4/IQv5x8FaIgA
	kSB8VGvnEWabzRBZKeFKK2ru8K/OhQOEaYlJXzPqQA8cafKTuA+x87xlmNYzjrysme9q
	vNVs+DrMMnvH1iKcr+EKN1Srj5tsDk+Dnauhqav/9qH8eJoBQlGHinSwy/XSLvlzkrev
	vk6znWeFDqkPACQs+yfKBz+oHtHZmETcebCv2+wOS+//Db/QQLj7Nj1GpyjJdqpup694
	pRuuIjnk+mhZQ55AgJDWEtd9oFKuuoWHsqw//PupiIHE5Ihn2PdUjc3sRIwW+XvrRFWt
	sx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tokA5tjB6GMsI3SDTwZjT4GBZEOA7iVB67BbBd1XGmQ=;
	b=QNICFcI+jojkk/DERpauLTbuuo5DLhN3Q4hjak97xcTswZMzc7kkJfQNjNRaWYDd4Y
	9ROz4Kyp1fvi5ouz3OvAH5sZq7Qhwq1Hd4JGB46eEvtW7E8V/3XqxIoa3NBIPNzrB8HB
	1SOK70jrirJsgBPNpmioMLVBYcQhK5Z53oJwfalFSgZ7bl3iv4ju+NEp/NKi5tbwYvhj
	HMYl19dIGvh1cBbF3MO92FuEEhkJTmpdW947+oDqHnuxbW935X18kOqaoQf7L+dYGaed
	U2Fs6uqhfVIxSoIfZ6vGPmMXMI6JIy+ahAeUeuvOQ+DT6YyOIh8TQpVVSoRtFuqWDknX
	erqw==
X-Gm-Message-State: APjAAAXIQsUaLOPfEabw4+PQkeZxYgxbnJV7bOt86YWkPRECrCHUWHp9
	mxJtmWnT25TC7i6ufNVNzg41GEdy
X-Google-Smtp-Source: APXvYqzYzEFAv2HvFN6bGb5eJEXmJYV50EOCPlqE3lpM1rpdTxyw3s9yY7IXa4NXoEXIOMd2TMhcfQ==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr34554823wmk.78.1558361504572; 
	Mon, 20 May 2019 07:11:44 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:10:55 +0200
Message-Id: <20190520141125.10805-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 12/42] go: update 1.12.1->1.12.5
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
X-List-Received-Date: Mon, 20 May 2019 14:11:44 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/go/go-1.12.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
index 0cf0a63ff65..7c4cac1fc25 100644
--- a/meta/recipes-devtools/go/go-1.12.inc
+++ b/meta/recipes-devtools/go/go-1.12.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.12"
-GO_MINOR = ".1"
+GO_MINOR = ".5"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -19,5 +19,5 @@ SRC_URI += "\
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
-SRC_URI[main.md5sum] = "09fe592343465560b4b8431d870b3df3"
-SRC_URI[main.sha256sum] = "0be127684df4b842a64e58093154f9d15422f1405f1fcff4b2c36ffc6a15818a"
+SRC_URI[main.md5sum] = "cb6f594d22dd79af4fff9779607b1b47"
+SRC_URI[main.sha256sum] = "2aa5f088cbb332e73fc3def546800616b38d3bfe6b8713b8a6404060f22503e8"
-- 
2.17.1


