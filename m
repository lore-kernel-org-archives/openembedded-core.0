Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4F7AD7D732
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 15:38:02 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id y10so5657244itc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2019 08:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3g7kqIe+nDlsru0uBd96+gYkpzcF6cSw+MDJiUhO2NQ=;
	b=aCA4Wnx3C9hEYFqLHkQ6SzF8cG6GM/MvuLPzOQlXTorGn1N6dMEB1gCBS3nCvYJ/AE
	54OnAF9X/fXVzXfMqKZA7nnYX1fyxxa/Yea2I4eLpc1q5wZ+yI4pL5AlvVEeEW0pVSQG
	QR8XIlF8QnsLvpoRRgJ7g7jCk07UdrkDcyUbRvLHP+yPl7vutnF7qk9d5JEZBomTJ2mZ
	82VqJUAhG/CNJk/SoIk45zhVhkZAHY2q4HW/9x3o2SFeSAXOuXRnV7nqd6cN/5VJc+2/
	ALSNGwo5cvJNur1UTJg0/r3swCGvR4IspKjRhy/FnhfEm7XKiaSozQjaF1CQdPyWkcfS
	PyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3g7kqIe+nDlsru0uBd96+gYkpzcF6cSw+MDJiUhO2NQ=;
	b=cQBwYUj89p+iYylWdjpvllLKlUjWW8zbbIb1ShZiWRDEj6yrcwIWmqIK1dxZrnNQjh
	GXeEhkQZybjFeRT4RybJixNd1j+0fC3LI+rQtzysIzNbiotj0Qyanojvo53bJGCWWnlm
	Sfh/D9sZUT/NmrT/3AsBbCKuBQlq87uGGptfFPbWKSoDpymArzB9aIyKFFytPsz6y2hV
	fzR5E1mCOixLzKmroRC1pQn8ZiVo+O4YQyC7Y1G9bVXd9JdDjFAdiSl3icxWkDR3aVCx
	rmVyBZu2CnHLzjQ2x94bCVsvltsrh5sM95/hJG8qtt1z4e36yHG83mQKX2M7Ni5/UdAW
	wI5w==
X-Gm-Message-State: APjAAAU+F1R48VGgBw4QEWFOmtvxIy5HPcDCiXKYSV0XeI9CagNMqR1t
	xMHhDeNpvGI1VxEzi8FaBpo=
X-Google-Smtp-Source: APXvYqzJnLzkDpXdWHaBiRKrs4zttIYVn3cKed2XWSY1xlPKwwq4Fd/HW2+9INzumIpo3Cn6PGw/dg==
X-Received: by 2002:a24:7ce:: with SMTP id f197mr13467192itf.41.1554824283363; 
	Tue, 09 Apr 2019 08:38:03 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	y24sm12376510iol.8.2019.04.09.08.38.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Apr 2019 08:38:02 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Tue,  9 Apr 2019 11:37:53 -0400
Message-Id: <0bad6098fd71df502d1f7a3d29ac3e0f5b925a8d.1554824014.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1554824014.git.bruce.ashfield@gmail.com>
References: <cover.1554824014.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] linux-yocto-tiny/4.18: point KBRANCH to 4.18
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
X-List-Received-Date: Tue, 09 Apr 2019 15:38:02 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The other kernel versions had the -tiny KBRANCH typo of 4.15
fixed, but 4.18 was missed. So we update the kbranch to the right
version for 4.18 as well.

[YOCTO #13247]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index 0be7f0889a..f4bb49a60d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -1,5 +1,5 @@
 KBRANCH ?= "v4.18/standard/tiny/base"
-KBRANCH_qemuarm  ?= "v4.15/standard/tiny/arm-versatile-926ejs"
+KBRANCH_qemuarm  ?= "v4.18/standard/tiny/arm-versatile-926ejs"
 
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
-- 
2.19.1


