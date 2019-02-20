Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id EA5D47C99A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 11:31:42 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id e74so5675939wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 03:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zn8N9mGYNmd7YMcJUQKd8fu6025tZN81u+RPTGwSsFk=;
	b=ZQXiU857my/2N196oTJfhA8YvWkuVA6jNvU2zN88JVt34PxHxGkOkubFFKH09qu3Pp
	2KgfbMC0IlfUcLTrABMlp48+MaDNQHqotSzOTgA0nrW9SRw3zls/p1s18SD0r3yvgpQn
	29HEiU6tkrJ90NWgWmpaVoNfqOe54IaZCPIwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zn8N9mGYNmd7YMcJUQKd8fu6025tZN81u+RPTGwSsFk=;
	b=F1gGW/alsHw3L5dG30awyDth1WYRb/MFov9JG3QjKw9ThXKm/2FeUEvZUKS3JBzqoz
	5IY8ShW2/0LCIXKwA29DdxW7JIhwr44iE5NTyO8MqhS7/14msxwZDBxOi0wLiQDkrFhB
	NlIf74v6x1M4Fk1I3VEcIh+Ncww7y/igy/VvEF2wYID/JzRavUbQ4YyVfLKVrSGlG46n
	AbkZZsUUHp+jAHugqIwLG0RzxRV4zAziaIB/EPuVhZT1dQ4bgl9pTfovlTv8gZQYTtsI
	ucaa+hwiKuJD0lEeNYZt7ADDE941pj95arNWlzkmLAdg7qNV2BYFSYC39LNdkIoOfRc+
	6Wtw==
X-Gm-Message-State: AHQUAuZsMxj/x4l31TOcJxkozYPs+ooRC6EWLaqucaWFRvG0qnf9e1dW
	6ud8EyirJnISHSnSDf/jowCpfHrthrk=
X-Google-Smtp-Source: AHgI3Iauzae2qhBP4ke0CbV9QpXFSjE9lx0mt0UXRnJdLf+IVroosnR8eIk6QFm1ELktpUzGkW29lg==
X-Received: by 2002:a1c:4006:: with SMTP id n6mr6591767wma.137.1550662303404; 
	Wed, 20 Feb 2019 03:31:43 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l125sm10377824wml.18.2019.02.20.03.31.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 03:31:42 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2019 11:31:36 +0000
Message-Id: <20190220113136.25171-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190220113136.25171-1-richard.purdie@linuxfoundation.org>
References: <20190220113136.25171-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 5/5] python3-six: upgrade 1.11.0 -> 1.12.0
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
X-List-Received-Date: Wed, 20 Feb 2019 11:31:43 -0000
Content-Transfer-Encoding: 8bit

The license checksum changed due to a change in copyright years only.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python-six.inc                 | 6 +++---
 .../python/{python3-six_1.11.0.bb => python3-six_1.12.0.bb} | 0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-six_1.11.0.bb => python3-six_1.12.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-six.inc b/meta/recipes-devtools/python/python-six.inc
index c77498457d5..c706dcaf25d 100644
--- a/meta/recipes-devtools/python/python-six.inc
+++ b/meta/recipes-devtools/python/python-six.inc
@@ -2,10 +2,10 @@ SUMMARY = "Python 2 and 3 compatibility library"
 HOMEPAGE = "https://pypi.python.org/pypi/six/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=35cec5bf04dd0820d0a18533ea7c774a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=83e0f622bd5ac7d575dbd83d094d69b5"
 
-SRC_URI[md5sum] = "d12789f9baf7e9fb2524c0c64f1773f8"
-SRC_URI[sha256sum] = "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"
+SRC_URI[md5sum] = "9ae5d1feed8c0215f4ae4adcd9207fcb"
+SRC_URI[sha256sum] = "d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73"
 
 inherit pypi
 
diff --git a/meta/recipes-devtools/python/python3-six_1.11.0.bb b/meta/recipes-devtools/python/python3-six_1.12.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-six_1.11.0.bb
rename to meta/recipes-devtools/python/python3-six_1.12.0.bb
-- 
2.20.1


