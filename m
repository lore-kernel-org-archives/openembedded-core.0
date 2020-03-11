Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 95F5360B31
	for <openembedded-core@openembedded.org>;
	Wed, 11 Mar 2020 02:26:24 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id a23so339600plm.1
	for <openembedded-core@openembedded.org>;
	Tue, 10 Mar 2020 19:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ovlyb9CDi+nYt4GmwWpuzTYxOTtGJoFC3Ztn+KjTZUM=;
	b=XUQGYczpMuFkIW0b2tUyJwQvnlfg+vW1dSXVDj0flXvQGSCTZ0Ud9vHShn7ch+q4xI
	MZSB2cLgxwBv/vx9cxPoTOaxtuMs6Lchig2ifSpw3bffjFUZVptEB83nvv+3BIJ1O4/B
	+/7c+/d5QPiGRGgsRA0kZdxz069/UDP5tJSbHRggQAPF2HncBIuvXnMJ+R+ymKiDce/k
	pxi2oj1fvd7PaQ/DqbbBqf52LKESIpJGW0Ucvsjtxgg945gaOkNGgBftwwKq9ZSTfnXR
	6UQb/ezWRJvduf9baTXiJxnUTaDA2/Y6jGwFvy/RNuo3KDmmzjr5nzI5bJc6r3bNbINO
	3uSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ovlyb9CDi+nYt4GmwWpuzTYxOTtGJoFC3Ztn+KjTZUM=;
	b=XcsReo34xrpz1sxApjcfdN6vBNJG0EI6HQTCrh7N3OfoXPefB7qEwAZjUtrl5KC7f2
	rh3dEc/6jfmVa1DUDcdcLdB24owK1yMRm7cIXYBje5nv8HWBn77h8X1ZW+62tFYgQBt9
	Ua56yzMprQHLoOgOD26pNd1irb18LFwbVj17vZU5nxah/Spox70c8ROMoEhXrZgaubaE
	yJK6Dl/KZJZw7tSGm2PESUs+uSWrT10CmLQtEeZWabrI2PghEnIiQsGj0EHHmgmz/rK9
	aT1xvGE6ujU+Aq8PgC+KsgMWTn8rzQWGWwe2HeLuonqcXqiNSZQTIiFph0mN2y1Udg/t
	Ko7w==
X-Gm-Message-State: ANhLgQ1JGwSijj5IjnG4bDjG+755yptPwCM5FDx/HPXIhLdNuclTwR0O
	4W+zn3V3+K9TX14AxgXyZgyfli8n
X-Google-Smtp-Source: ADFU+vtI6TNTAUs0Tes6Q719i2L5sIRjGvoUq2yUUUsuDdKTNll+aVYCfJnorTxuUfxJH8MAfpLB7Q==
X-Received: by 2002:a17:902:a711:: with SMTP id
	w17mr943647plq.152.1583893585651; 
	Tue, 10 Mar 2020 19:26:25 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:a4a4:c739:7769:e9ed])
	by smtp.gmail.com with ESMTPSA id
	o11sm1461661pjb.18.2020.03.10.19.26.24
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 19:26:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 10 Mar 2020 19:26:06 -0700
Message-Id: <29a1d9bed5bf7ed024870a0323f9afdf88346e4d.1583893499.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583893499.git.akuster808@gmail.com>
References: <cover.1583893499.git.akuster808@gmail.com>
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
X-List-Received-Date: Wed, 11 Mar 2020 02:26:24 -0000

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


