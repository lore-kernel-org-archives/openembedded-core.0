Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 931E260273
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2019 21:42:21 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id s35so4949806pjb.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Dec 2019 13:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M2YUY7OeyH5q92tql1if986ioJy6mnKXZJrV7d123ew=;
	b=VWsfDGPymo8rE/9IXKxPAm44d78CzklL50sc9v1hIXThcckAFVv+fbsad18keJ5O9r
	zsUR3mOvSvw+DKtO8TMgw8/42UadPkjbz/sx2myVAKVVLUaIQ0o+PXF+GjxVywDKXUZy
	OX3o4eI+WDWkENqPJa/9iDAfyXNxbmkyayrJs/SwXvCvv0x78zkAz6R+HQ69Gcl09j6s
	vLzo+TgL81BT9mfcrGkw7rp/VkxyTxlKJMkbgu30pkBeM+b9l7WxaNolFDZw68mcSS16
	XR78crOHACsV3suz3idWV3Tzt4WkMuAU4XRlNQl4OLX5gUpPV8h6joH4VfYZweYEzuY3
	Wm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M2YUY7OeyH5q92tql1if986ioJy6mnKXZJrV7d123ew=;
	b=bxC5bJCM/LwYnaYwfMm1YbQqk40rDVivWteou7UaK22MJYiBtpfvPDUBRQU4wkdHgE
	6ToimEskB1KxZ7YIFTjxA5mfDWHVfBEnuhAQDiyD6dnCei86MYyZpzf8eKGEtY2jWyJv
	7RxudrW9CYqqe+QyweRiFR1k5VleSmY+g387laq7JspUPjryPIBKG87kGjA5hplD/HwZ
	8/RBzXG+tQ8U77aQDAXdoH5PlnMSvjxr2Yf8Jw33tUgH1gE5Vcrp8xMPKfD9ktVOXi1G
	+Iux0lvWF+5TfODyZhKjvJdlHKI/m9qiM3MCOPHjVeR0JqsuecVicfdeBnYqxlB0tEMA
	JI6g==
X-Gm-Message-State: APjAAAX8FHmcrC9y9EvbTbWm3nUBrpXDgnObt6m0H8SMGf6bpoENBda5
	TitZleRi6zrxP9WifM6rDckX4VLWd0E=
X-Google-Smtp-Source: APXvYqwB8p+Qkwl0lfSzYcF2WKSi/8A+jvwewOaWGZI5VuVVOcU13eb5xT3VOSZElP18RU5Z4Ff/Kw==
X-Received: by 2002:a17:90a:8c1:: with SMTP id 1mr29613094pjn.12.1575841342350;
	Sun, 08 Dec 2019 13:42:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::afb7])
	by smtp.gmail.com with ESMTPSA id
	j38sm14552410pgj.27.2019.12.08.13.42.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 13:42:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Dec 2019 13:42:11 -0800
Message-Id: <20191208214211.3286056-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] buildstats: Replace 'is' with '==' in python condition check expression
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
X-List-Received-Date: Sun, 08 Dec 2019 21:42:22 -0000
Content-Transfer-Encoding: 8bit

python 3.8 has started to throw this as a warning but usage is wrong see
[1], it seems to be working by accident and not design.

Fixes
SyntaxWarning: "is" with a literal. Did you mean "=="?

[1]: https://bugs.python.org/issue34850

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/buildstats.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 960653c704..2590c60c63 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -100,7 +100,7 @@ def write_task_data(status, logfile, e, d):
                 f.write("rusage %s: %s\n" % (i, getattr(resources, i)))
             for i in rusages:
                 f.write("Child rusage %s: %s\n" % (i, getattr(childres, i)))
-        if status is "passed":
+        if status == "passed":
             f.write("Status: PASSED \n")
         else:
             f.write("Status: FAILED \n")
-- 
2.24.0


