Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id A41197DFD8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:23 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id i3so7764967wml.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZD5N6PK9QgX9K5sGZqsv4mHrrMjoABHFaw5N/yjqSiE=;
	b=Wp3KX/jDCBHfPoZv9Vo+jRJdyhnmYVvo+KpYgNbuFdWTldmU6ZPBJS/gKOwxoJ2rpS
	kwEMLwrlMQ5Rg97I0xvjh0+XM9RXpUIwbUILqOe+JB57OlMVYw9juZPChaDnmJGg5uWG
	9jDEL588DEETV76w0vLC7OQnGfdvDwJ/Z8FKorLKBTSnAmBddXERfV3PEmb7wQM2ZMi7
	mde8cX9pifQ0PL+4MtGDGxDt1e4yHluK0ed65gKmx06ijmXtMzxaiz7Vwm/Ucq7RCt6w
	NZY9ejAhQDaHi95nUjYAe8at5T1DPxo9GNnL751Rd3GuZWrvA7I2Dig63FnolkTLJ6ho
	Gc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZD5N6PK9QgX9K5sGZqsv4mHrrMjoABHFaw5N/yjqSiE=;
	b=a1k/Cvxsi2L21dcKcKeM8x0zknU21gA+KcaFZEKpbfRMFdLfujh/5XkIpqjp8goF0e
	j54RanS528IFDbQHP09VDGjNgC9HdxdApW7xu0thtloRLeKduALdXyRoxmqLNkB4eztW
	Ld7ihHk+lpE+NIkM6kgypXsgcsFc2xr9k0+EqoJEQoRRVnwxhfOKATPxlmRafui7lqce
	O1zOBqPWk4vptWD7oNfw5QqGnNsh0cHTtUiWyl7X6A+z+ypyktTEv9YlPYlM3EAgklsS
	0DhYdtjItAjxahQalH2AYOF7oBD0am/2XIpOwsEZAMTQYHNeSTjvcge2tAJ/hEVIMpo9
	PIGw==
X-Gm-Message-State: APjAAAX0AkuWVQNqu0mNHhEnedMyOXphmWsVHXv53QwLX3viKWmjq8fz
	51uzj1OWGxl7mDXG0bsRbnYvs7s9
X-Google-Smtp-Source: APXvYqxSvwNn3WqlJX0mBm/XsANH1DE1/W9BKjWA1iFudxM4XpTPCEcLsJwkoifvg8fBq2TjQB0a6w==
X-Received: by 2002:a05:600c:21d7:: with SMTP id
	x23mr3352255wmj.87.1558116744382; 
	Fri, 17 May 2019 11:12:24 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:44 +0200
Message-Id: <20190517181151.44001-30-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 30/37] python3-pbr: upgrade 5.1.3 -> 5.2.0
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
X-List-Received-Date: Fri, 17 May 2019 18:12:24 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python3-pbr_5.1.3.bb | 5 -----
 meta/recipes-devtools/python/python3-pbr_5.2.0.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pbr_5.1.3.bb
 create mode 100644 meta/recipes-devtools/python/python3-pbr_5.2.0.bb

diff --git a/meta/recipes-devtools/python/python3-pbr_5.1.3.bb b/meta/recipes-devtools/python/python3-pbr_5.1.3.bb
deleted file mode 100644
index d9b6ce74a34..00000000000
--- a/meta/recipes-devtools/python/python3-pbr_5.1.3.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-SRC_URI[md5sum] = "08972dca5fd2a959f27842090973edd6"
-SRC_URI[sha256sum] = "8c361cc353d988e4f5b998555c88098b9d5964c2e11acf7b0d21925a66bb5824"
-
diff --git a/meta/recipes-devtools/python/python3-pbr_5.2.0.bb b/meta/recipes-devtools/python/python3-pbr_5.2.0.bb
new file mode 100644
index 00000000000..ed6832e4afe
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pbr_5.2.0.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-pbr.inc
+SRC_URI[md5sum] = "2bca008fd08d035a2f78c606d876a6db"
+SRC_URI[sha256sum] = "d950c64aeea5456bbd147468382a5bb77fe692c13c9f00f0219814ce5b642755"
+
-- 
2.17.1


