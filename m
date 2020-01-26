Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8018D7FF48
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 19:27:52 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id r67so2112147pjb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 11:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RNo4Z/56tNTqBXitADxzgKOT2TgETY54S844LlM+HjM=;
	b=PA+qV0VDgpJMtOp/i5iOBPz6d/BhJnlSCAxH6RKj//ib849X9JNHMoeQfI/mJ4tEhj
	KhxZzQGXGy2yivDgEu8/vw6+/SeOpJ81vqOVshw8J2YjFq3plI5gBYSBSEf8MJ6qCUh+
	slhFJogbpQKVREG9MIRfE47dWJDLFwSUhfsKP0sp3+oEXSJC98nMqKUgEG5So7ihqfSq
	Wd0XVS075Vn3UdHzRcXgT0NOMsh/eyGc+0yPmo09b7RNYJtPR+AGKtz1pl4g4YfyH7yd
	BpT2KX0Tc1we4LdVBKnXSKxzU3W4+zJPCs0HwwIDaPuz0J/yS/tN3LUAd6fC2ZGjMMX0
	e0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RNo4Z/56tNTqBXitADxzgKOT2TgETY54S844LlM+HjM=;
	b=rkwEYF0il/H2jJoix4pHej6uJuF7Tn/V6uXLkcMH/vp5EWO9CNovc5i0zzlxPuAUQR
	iDGvXd5f5rc01u5XfGqWJnc/5giEjSlI5800O/lhAQ0zyG+fNYokIqMNxHhLl098Wpu/
	VtrrX/rhRPPrvLg/kTFK3d/ak4mLu95idnamcKRZ72vFnpPBjVPwxDbzL4eTWzqIWsD4
	/Nd2anMm1XnFQ7cOd0rcQrZLtRL2MIQjvKHd6Yt8pg6C4O3h68p2viAVDylQghBnZ7iH
	7qmkh07tO2rnZw4vfYQG4+2/r62sdIB3PVrMZsNdKx5VAvDP1i8jJjElPnN/m083N+3a
	tmHQ==
X-Gm-Message-State: APjAAAV8SfxaFg0hf3MOUkV8vlkxBzMTMSOj/Nqt7aXtvcKbPn284X9E
	untesurVQBDIKwR+tlhKEjZcrYp7UwY=
X-Google-Smtp-Source: APXvYqwhkMhyGn+rNWobNb625YOZePCAqPEffpW2LuOFY60chhodk5oeg25vQ7/4CXJ7kKaK3Pmj9Q==
X-Received: by 2002:a17:90a:cb87:: with SMTP id
	a7mr10653723pju.135.1580066873141; 
	Sun, 26 Jan 2020 11:27:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	u20sm12987091pgf.29.2020.01.26.11.27.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 11:27:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Jan 2020 11:27:42 -0800
Message-Id: <42ce0bb42625933060bc90ae82d399e38a334a0f.1580066507.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580066507.git.raj.khem@gmail.com>
References: <cover.1580066507.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/13] Musl: Update to latest master
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
X-List-Received-Date: Sun, 26 Jan 2020 19:27:52 -0000
Content-Transfer-Encoding: 8bit

Detailed changelog [1]

https://git.musl-libc.org/cgit/musl/log/?qt=range&q=70d80609558153a996833392999c69cdb74e1119..91e662d1d941215eb024787db5e910dbfb5b169f

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 92149b5632..1676e2844c 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "70d80609558153a996833392999c69cdb74e1119"
+SRCREV = "91e662d1d941215eb024787db5e910dbfb5b169f"
 
 BASEVER = "1.1.24"
 
-- 
2.25.0


