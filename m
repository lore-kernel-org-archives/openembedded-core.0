Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC067F332
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 15:54:45 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id a15so57664556wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 08:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fl0Ih5pM+rGmoJHPbBOuyrGS/vSnYgS/E4KQNPHYgrA=;
	b=RljlI5fLQQfPTXPoPo2UWsaPDNSOBLaq3Nu++3t7NycleLxXUmMss4fRzWYPrT0oeh
	U1YmrOaTuE75pCT2Zr08SMK3CBTGeZf5tzoZOh2CachJyx97ZQwzqdvl9bXJcmwTJiTd
	xYpt9ysvK+mHPCYKfFCALcJ7e/FlxoRvSKOMcSZkAjX0SeW/9U7ibpH2briqymZhFCGH
	zASuJTBNKPNToB6UZmJNwtwGC6ygzREjyKTdKteKW5/nqGFpPQuFElC5S4irSxPU46MO
	Z+eemurSltqvTNPYqCGIwnvIoRjhbpt1gXHEuRo9XAvtKa9p4WqkW+AqZo2nP9S3MuVB
	riOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fl0Ih5pM+rGmoJHPbBOuyrGS/vSnYgS/E4KQNPHYgrA=;
	b=UMvflUDl3ERYpL+bC9Rb1LbL89UVPjOQTe8WyrEHfpioO58Hm/84Lhqck1ozmgjdjx
	X6KJ607hRwUuKpEYYk/8CfD5lNj8FI7CdMNjayowbS0Vq98U0X4X9+otudIx1UYbGtU0
	9kcBLl7xzEIxKVzzc9r1TGpT6swvFBlcCdY0Z5ppSJpkNELSdNXXJV7hdWGk5gpTriFZ
	yFlkn50V1Ec+jMqob0r4f59+j2/2JEGidB3cXwSLIQRx/54YlJmNuFK3dQSBqLFZCg5+
	x5med4IHnvK1jf6BCN90E6H9O4bPVmvJX/Qvj0KN2YDnWLckemD8gDlIXw0vSXIC5FpE
	ct+g==
X-Gm-Message-State: APjAAAU0/GVAWfS0aZ8raoBr08EL6EWXJhsa9fCaN1T7v2gmnpQoRYXb
	jgLg6dbqvQ7F2JROnbqdqCp+YHzQqpk=
X-Google-Smtp-Source: APXvYqxKDci++6BVnC11y7pAbqmiq96BedCy/4TQGb84rkJkUZqK8q9L9S8dyTdxOyhKwwkcMQxEjw==
X-Received: by 2002:a7b:c04f:: with SMTP id u15mr17009343wmc.106.1564502086538;
	Tue, 30 Jul 2019 08:54:46 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c3sm70781403wrx.19.2019.07.30.08.54.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jul 2019 08:54:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2019 17:54:32 +0200
Message-Id: <20190730155432.96611-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190730155432.96611-1-alex.kanavin@gmail.com>
References: <20190730155432.96611-1-alex.kanavin@gmail.com>
Subject: [PATCH 8/8] bzip2: fix upstream version check
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
X-List-Received-Date: Tue, 30 Jul 2019 15:54:46 -0000

As it is now working, we do not need an exception from the check anymore.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 73d933a0025..6f86b451ae0 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -16,7 +16,6 @@ SRC_URI[md5sum] = "67e051268d0c475ea773822f7500d0e5"
 SRC_URI[sha256sum] = "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"
 
 UPSTREAM_CHECK_URI = "https://www.sourceware.org/pub/bzip2/"
-UPSTREAM_VERSION_UNKNOWN = "1"
 
 PACKAGES =+ "libbz2"
 
-- 
2.17.1


