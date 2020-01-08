Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 906657FED5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 13:28:27 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q9so2459672wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 05:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CM1UAg6zXdZH4ABxT/ozAgfCo0lq8rmb1BQozpeIX6M=;
	b=g/UlSKjAKnalW6KuM1AwpZyKqTh00YduxGAIFGCI/0fS8LM6nGOMD9/B28y6oFW/hF
	ol1NNpZSTvDAuPJt2MdzUtyPUWYSRNJkv+1SU+s1OACOp7gxAdqKEwat2HYR7Ux2zDpB
	3RVrebiIpgrGqJgMg6rompj3nRssfV3jumXWncWq0WkDwEJ2ps/JsAmFfl+UxPKIk7sD
	QvPNoydaVEnxT8SnRa1KoKDEwzx3F+xxguX4XItKAqAEQnd6aFiNuhTTu8aVNg4I/8YX
	GesKYPtgBlslh0++bAXQPCTj3vww+2+aus8wEhiothd3Ceeg6Xl/ByY7j5xUIcQ82nwg
	2ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CM1UAg6zXdZH4ABxT/ozAgfCo0lq8rmb1BQozpeIX6M=;
	b=fBEqfhkEWYzb2A1zlqzBTmIXNgst3Ycoibz9Edgk8kWkjJ0opWkN3mUH5nI7QCo6XU
	bMTPRitRr6cCcmpnKJroLVy/liI6NHh7fIH6wB7JPVziwHA1/QVe6VvgQRpq58/4miFy
	Ll01PJ3tQEfcbFc/G/dDqlaaxRwFjIcVlqt3nA8OjLVXNrw+Rn36Gyq3LMgqXY9cFhXT
	7GJuY4AMsxS1qkHKGgHct0VuyKZMmFDHhmA3rn2Qw+ifsoSqw1HnRBq6A+q2NMAWLuk8
	YJ6PWzXotec9Js6u1FsRnh1UEh6tJhEBv+X/wWDUPhqoo3JqDntsbYgAAVhuDAF38PJc
	SkYw==
X-Gm-Message-State: APjAAAWrxhYmQEc6I//uIqn8WDho9dTof5spg112nyg5XDsNWIL+NAi2
	i/wkIP7XCzNUiNa4rkviiLQQwpnvg3c=
X-Google-Smtp-Source: APXvYqyZyN13JTSGvNkx5SbBmOZTgY4L+rCPbJrNzfosif6N7kDQAkr8HbYx1GUnsasZmwa7sOv6VQ==
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr3835100wmc.36.1578490108274; 
	Wed, 08 Jan 2020 05:28:28 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	x10sm4607028wrp.58.2020.01.08.05.28.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 05:28:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 14:27:52 +0100
Message-Id: <20200108132759.95603-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108132759.95603-1-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
Subject: [PATCH 21/28] ptest-packagelists.inc: add a couple of missed ptests
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
X-List-Received-Date: Wed, 08 Jan 2020 13:28:27 -0000

Also remove mdadm-ptest as it is already included in the slow list.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 26b8db5b607..bc4aaf6a4ca 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -53,8 +53,9 @@ PTESTS_FAST = "\
 #PTESTS_PROBLEMS = "\
 #    qemu-ptest \ # Doesn't run any tests?
 #    ruby-ptest \ # Timeout
-#    mdadm-ptest \ # Timeout
 #    clutter-1.0-ptest \ # Doesn't build due to depends on cogl-1.0
+#    lz4-ptest \ # Needs a rewrite
+#    rt-tests-ptest \ # Needs to be checked whether it runs at all
 #"
 
 PTESTS_SLOW = "\
-- 
2.17.1


