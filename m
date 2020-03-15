Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9526461B97
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 18:12:05 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id np9so228966pjb.4
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 11:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ovlyb9CDi+nYt4GmwWpuzTYxOTtGJoFC3Ztn+KjTZUM=;
	b=On91OnN0DVv2Ne86gK0nVJ9y9XsrzAulbkR1Tb2lt5mzjp9k+0EkCNJ+Uzy53lN2fc
	n422zvEckXxDysWWF643M2HpU02bz9n84tfmozC0IUXavEjIbGEdO8ALIMOO9dksvVGC
	tHslO5+o8xFty6VowYANrbtTnkvVt46AvQfgFhbadIOVD5+WHwnmEsh2zPry6/qmfN1Y
	hhXY2V9e6+12nUv8Yy36w1hib2EefFjVipM2KFwXY2TWAF2VCna474TWJqWvvjc0ROMX
	U92lMK2fe2cI4jpQPAQJGVUx4oI4TB+id7wmyV2ygRZEewynuf7ruEIPVRhtwAwMWVwr
	pXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ovlyb9CDi+nYt4GmwWpuzTYxOTtGJoFC3Ztn+KjTZUM=;
	b=qO0wUXV+E9BTIkJUbSuo/mbUzDYI7YdbwsX4Og5+yFv5gzuSqcCpHXjNuzLinPky+0
	HJjT67M/dEbk/ozrUcdjF8BZYQOSvstgdL0ld3Ni476YVXWMrcQM8xqePHNvg0N7rR8q
	TIC1lZ1irhf4ZeGmNs+wurybYBA6RdiQjGXnIEUAm/0KEoQjka9Ukib96GvPpnRwkvgX
	Wmt1s2g3jj/e3wWbNo+mcyRbW0+TV1xBFjS6OPPIxmqlmQkNW3q3dDcoBHTooHfUgm7c
	J6be+pJzeurjoF3EstTlneEQRBY/oKUJitHpkWD0i5XwWHGQvUA3FFmlAN65MLEkt+De
	YnRg==
X-Gm-Message-State: ANhLgQ3W4KUaPgcScufT8MhhtOpw1xZ4509aY+/u1Ak7FLnbgC2H5CJv
	A27ckaoLchZmFPe0Pxkgwj+2R/Qy
X-Google-Smtp-Source: ADFU+vsyDJwHWxKHqY59cp5RMwLCt/d11W1eQ30Q3O442oa5ToWCsWWK1j5jVkEAE4wUtE6Vl5RRlw==
X-Received: by 2002:a17:90a:c301:: with SMTP id
	g1mr21138576pjt.173.1584295926358; 
	Sun, 15 Mar 2020 11:12:06 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f])
	by smtp.gmail.com with ESMTPSA id
	n5sm12223816pfq.35.2020.03.15.11.12.05
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 11:12:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 15 Mar 2020 11:11:47 -0700
Message-Id: <29a1d9bed5bf7ed024870a0323f9afdf88346e4d.1584295805.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1584295805.git.akuster808@gmail.com>
References: <cover.1584295805.git.akuster808@gmail.com>
Subject: [zeus 05/16] wic/engine: lets display an error not a traceback
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
X-List-Received-Date: Sun, 15 Mar 2020 18:12:05 -0000

If the requested partition does not exist in this request "wic ls {path}:pnum"
display a nice message not a trackback

Also fix displaying the pnum and not "%s"

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 15d1722950a22649905cf8a5789d3cfe48a2a892)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/wic/engine.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 18776fa8a0..4ccca482e7 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -290,7 +290,7 @@ class Disk:
 
     def _get_part_image(self, pnum):
         if pnum not in self.partitions:
-            raise WicError("Partition %s is not in the image")
+            raise WicError("Partition %s is not in the image" % pnum)
         part = self.partitions[pnum]
         # check if fstype is supported
         for fstype in self.fstypes:
@@ -313,6 +313,9 @@ class Disk:
                     seek=self.partitions[pnum].start)
 
     def dir(self, pnum, path):
+        if pnum not in self.partitions:
+            raise WicError("Partition %s is not in the image" % pnum)
+
         if self.partitions[pnum].fstype.startswith('ext'):
             return exec_cmd("{} {} -R 'ls -l {}'".format(self.debugfs,
                                                          self._get_part_image(pnum),
-- 
2.17.1


