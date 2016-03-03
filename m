Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id D4EA477139
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 20:41:42 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id p65so51614607wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 12:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=qDDXouVkOAJV4JC32m1LDY+4o8rBp4gP/wObnR0oYqM=;
	b=d2vpUEzMT7RZ80jz/gl13ZQSW5zSWcFFk/WH2QftAVdBTs85zAdttHpFICbiPY9zp2
	5MbIF5RPbdr+ylgyiwbpQRmcqwW9kGUajhU/eypJWL0f9WKC7QVYOgYCCvk1oNIADXEz
	rZyuncerahuJrLXzySZaw5jzX/AhnwQ0B+rywJ7kKZ9ruKV1wS67KqAYJoBBGAqgxcv4
	mFuHsnDeL4GU+QC4++4cuprWX3XioPyGAUozr7HeOLQtd/1MSgqYQ9dW31XbYV784/ua
	aHnekrhZY9kEqw96qQx3GD6mdDACJiWANdTv3FzjDngJ0t1DpLW1ZeGA7dMd4YE0Rr+U
	KNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qDDXouVkOAJV4JC32m1LDY+4o8rBp4gP/wObnR0oYqM=;
	b=mKQYNO7Xc7ceZOOx0+VXVgBMod0QbEpLpuGnzrrfMkkXvtYqr4ZA5uJ+6exBfWE3K8
	fmc7cP6vbGj4kzpz5dx/NvSFdBvhFWcaW70naJRt3RaeJ2AYU8GDXrs4j3wDoSl6FCbW
	YD6HIyB6uUFzfc8wxQ5qauHzzS/ykbGtVXe8QXfApqZJ7BKenKykACr25f4i/QpeAYJZ
	4TJMdiDHkeLvmcpeAL5VriyKXVHu50lqwduHKN9nps4CQqSJyKFUSEW7f+WrVgl6YWe6
	YawC2y+BGB8dFTcUPA27E84WTA+RP3QNpF5AzZYqOvuuezy3eCYTD89GEW9544tWRJJh
	vTEA==
X-Gm-Message-State: AD7BkJLY8UU9hX5W7j9d5B2JFTbgZFXr8xO1KBVj+kJ68eibeiRJNN5gWl1ZY/05KhWPgg==
X-Received: by 10.194.2.202 with SMTP id 10mr5701289wjw.94.1457037703442;
	Thu, 03 Mar 2016 12:41:43 -0800 (PST)
Received: from lenovobook.localdomain
	(ipbcc1bda1.dynamic.kabel-deutschland.de. [188.193.189.161])
	by smtp.googlemail.com with ESMTPSA id
	s66sm192467wmb.6.2016.03.03.12.41.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2016 12:41:42 -0800 (PST)
From: Johannes Pointner <h4nn35.work@gmail.com>
X-Google-Original-From: Johannes Pointner <johannes.pointner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Mar 2016 21:41:37 +0100
Message-Id: <1457037699-13788-1-git-send-email-johannes.pointner@gmail.com>
X-Mailer: git-send-email 2.7.2
Subject: [Patch v2 0/2] xcursor-transparent-theme: Convert recipe to git
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
X-List-Received-Date: Thu, 03 Mar 2016 20:41:46 -0000

v2: Fixed subject

This patchset converts xcursor-transparent-theme recipe to git

Johannes Pointner (2):
  xcursor-transparent-theme: Add new recipe for git repo
  xcursor-transparent-theme: Remove old recipe and related patches

 .../fix_watch_cursor.patch                         | 17 ---------------
 .../use-relative-symlinks.patch                    | 25 ----------------------
 ...e_0.1.1.bb => xcursor-transparent-theme_git.bb} | 15 +++++++------
 3 files changed, 8 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/fix_watch_cursor.patch
 delete mode 100644 meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/use-relative-symlinks.patch
 rename meta/recipes-graphics/xcursor-transparent-theme/{xcursor-transparent-theme_0.1.1.bb => xcursor-transparent-theme_git.bb} (51%)

-- 
2.7.2


