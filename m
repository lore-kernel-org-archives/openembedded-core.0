Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5D3B17E054
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:26 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id j187so7598140wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Tw3sf6KuN6HaicGc1aFjJdGpfB8uLk6JdPq6+5UNGBM=;
	b=FI7oJSumPF8F9WQUujCNx9WR6VlSVBLHciEfPmuQKQOFzaPteH4vrurvR9zW0GwFd5
	8Qza27XdTzI64Qy/2D0TYxeZMEf6ii9kE1z45DW7bOwNiknpnvCBK3Z02JxAxLfVIEpa
	SzzUelEHqoBjeddSjFyg6dJSTOCBJZ9Zvdde5dclmpCAY+dgiPjteLMrBZh5HTZ+XzNI
	rAAVkOzMjYUGgcvqtl/cnEFxJLPyY0WD7XNiKrZPKNH1sqfz63Ak14IYD1oxIFxm0Ee2
	f77patlB3LyLeWYsMBVdw7HIZdTNC28c3r7b/odW0NuRMfiH9lCdsH8dfpfupXjjQYYv
	6Mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Tw3sf6KuN6HaicGc1aFjJdGpfB8uLk6JdPq6+5UNGBM=;
	b=kt5KGr3n97aPM6srnDy8O3JUTWRFumuXo+lBcj8xK/2LFl6nReA1XHsUdzsvrWmdp2
	NzaeohtDnHQul1VyWnkVHpZiQdOPAU1dm1weBOOAf4labM8r1jI/vAgsKqNxsivG1kfq
	AMeJOwJ62uI1MmTEZuTe8z/udprFOGqbrXoz9AT434R/sdKEKNoh7WctXlZ6jz6nlppX
	E963abtHOhp/ZtbhENlUyhwQ0BW+GywEMcW60a/1CylhTFQPvRjTjOx5vR+dqTeCYO8x
	3qVM8DTGfO5jkyJRvHkuwJWUk93LN6YNqyfq1TzALycdvODJAXhMKlw0zmiDnpEN7wAA
	FtjQ==
X-Gm-Message-State: APjAAAVOCFoEM/1Ml2Llih6PRgQ1ihtERlAnPHlVYHF7xbWIDOzUKTXz
	LAvL8tk9fQuT1LuCQTdqY2osOwnk
X-Google-Smtp-Source: APXvYqxXFLvyIMHh6G4tTEKOvu7RMaHaizD3uVsjPxzGsEqpZ2Wu8g5gWgeZanwfJYsCYxdqdVrZAA==
X-Received: by 2002:a1c:700f:: with SMTP id l15mr3282511wmc.150.1558116746756; 
	Fri, 17 May 2019 11:12:26 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:47 +0200
Message-Id: <20190517181151.44001-33-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 33/37] gst-examples: upgrade to latest revision
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
X-List-Received-Date: Fri, 17 May 2019 18:12:26 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-examples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_git.bb b/meta/recipes-multimedia/gstreamer/gst-examples_git.bb
index 75ac9b75c13..e572ec8db8d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_git.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=http
            file://0001-Make-player-examples-installable.patch \
            file://gst-player.desktop"
 
-SRCREV = "2b3fc175c252cd5a537e4b2864b572a8372473d6"
+SRCREV = "3f51023aca06d28ccfb1d5383d99ca7fbfb287c8"
 PV = "0.0.1+git${SRCPV}"
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.17.1


