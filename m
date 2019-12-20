Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9218D7FD0B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:23:58 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id g17so9987017wro.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 08:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6cLKrBERoo9oLFG3jSUY2Aw1Ag58h5KS7Ajcgk4Z8Rg=;
	b=HDpTB4fRC55j7BkoAkIGvlz/H/E/46wTgmv/s9v8s2pd9m+IoyBxbk3NDjmZ5njsQG
	v7sf9pJ6xEvbOAAYCMT9Coxjv0RPyQZxI2M73WVf+rWPozRQX7BO2cMvRg7z9OXAGR9/
	B3CKAn/TAtJ9ioa2MjOCU0lQ/f1bi/5N7HBHn4ERJ5HVVTgeuDQy+ilhWapv9C7wQ8AA
	7s9XuBtO0J8Kc0GZNMCPPLDRuKOEcPJ9UqXERzt7SBkA5d7xi5dFpnCqpQBu0szehKjy
	0ZkYY37XaMZlZAX7UjuuxqW3KAZEdNATC+fUomvE0Gvu5R8RFJ5uKGxN9Ig+Ab9sCnwl
	t5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6cLKrBERoo9oLFG3jSUY2Aw1Ag58h5KS7Ajcgk4Z8Rg=;
	b=iV8YeWYjr3rTXIsNDu26i/y5HNkKT73kf8LAWj+ExsSzLoUZrFXYVPjC05dcnLt0AI
	QAk7bOTLjt1JhqJRwC2L4ZiwVv72x/uD1eQRADqqpCz/0IMLxK5sca+yEFoh0RCPD/3T
	g1R4C8B6BN7IW7Z3zmLYwWU+X/xyuA4mwW93dwzN0YHBTU1jk+vArcfeGdZuvngWP7ID
	DPwzsIdB0L32PrSdaTT5WDU7uTzOPTe83r1FMiOD38iBt9fvSt3P4ivRIVxZhHtqnXEc
	PrsFLoGzOjseRDCE87Ie+K29P7gGMa0LWdKAuROVYPw/wNJtNXtBTzqYOeanE/JNqVu0
	S7+Q==
X-Gm-Message-State: APjAAAXYrk90hiEYDoYJ0urERbdQyaLYrNVNUeiphM8LM9AyI+1pEPy9
	vXj4CnLURtnuVx1JQ1FuGiPFeRZ+n5o=
X-Google-Smtp-Source: APXvYqxTfmHoLQq8GToZnmxns/kBkL5MqQGKBIQ/S5h4txtpuLWyps+AOoYBh6R3wscjYW0Y1ytz9Q==
X-Received: by 2002:adf:f20b:: with SMTP id p11mr15606625wro.195.1576859039128;
	Fri, 20 Dec 2019 08:23:59 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	w17sm10436356wrt.89.2019.12.20.08.23.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 08:23:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2019 17:23:44 +0100
Message-Id: <20191220162351.94498-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191220162351.94498-1-alex.kanavin@gmail.com>
References: <20191220162351.94498-1-alex.kanavin@gmail.com>
Subject: [PATCH 04/11] core-image-testmaster: use Python 3
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
X-List-Received-Date: Fri, 20 Dec 2019 16:23:59 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/images/core-image-testmaster.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/images/core-image-testmaster.bb b/meta/recipes-extended/images/core-image-testmaster.bb
index 78295c5f0a3..0faf18f5a4e 100644
--- a/meta/recipes-extended/images/core-image-testmaster.bb
+++ b/meta/recipes-extended/images/core-image-testmaster.bb
@@ -8,7 +8,7 @@ inherit core-image
 # normal linux utilities not busybox ones
 IMAGE_INSTALL += "\
     bash coreutils util-linux tar gzip bzip2 kmod \
-    python-modules python-misc \
+    python3-modules python3-misc \
     e2fsprogs e2fsprogs-mke2fs parted \
     "
 # we need a particular initramfs for live images
-- 
2.17.1


