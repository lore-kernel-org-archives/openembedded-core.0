Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id D0B0F6007A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 22:48:00 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id h23so1048044iob.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 14:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=T2zE1YjBSB64uH+UHjyfuk7j0iijQ7uxVKErLtkIahc=;
	b=J/xLh8C/ydGmCgHn86zF0dkxK1rBNOA9ynd7pUR8liPhHQDFFJAbJQVSd+CbKWJnb9
	N6z4KyroZ4gGMmtAMBU9Z2tBJwYapH9p+eOFXWzd4vykJFXGp0IGF0OuyX8SEUX6uft4
	5b2MMuf29B4kWaqJ/5ubY9xbBjK+/Fh8Mgq7pgj27eZx1/D8IWaP8/II3opXrfLrQ4RF
	jpzDym2Q/x05sZ15nIHbYoeSHVEkQ4xF1ejx4JKuGtkpvn7HWoHQgJj7dq5xC9pTXvaw
	3o280IZKI0wuzraqDy1vzBfQQlwEwqUDOcbe1J/2vLaozSbjDrRoLm9L0+gjIlDCvuIF
	RekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=T2zE1YjBSB64uH+UHjyfuk7j0iijQ7uxVKErLtkIahc=;
	b=ZGRpSP+t5LPUrU58qLJ4r8KomtggcBzJceF1hOp6IV4kyneTNa3caH994Es4UV3gs8
	kXimUvzl7dJ/pS1pbvuWVBuAHk777pu3flQNDAiQdLtg+zy+UTvIfiQhUGzSCUj76NE4
	+C7LNlmdRmf0f0dpeaHKlN9nzRzFbG6UURjx3qhaz9gE6We5mMTd3/YGBjX7B7dgSEvH
	1w44sbwAV7Qo2dkqCFYfgO65vfcmgBxgu8IXi1UE13H77lwInV5j6uWJ+vXw27qJuzjJ
	NE5eG1KOSY8tyFn7RQ0vWUhzxI2zUmmPI+E4nOMj3/aJOppkCRG+sTJdVHNI/H0G/yiz
	Q8Jg==
X-Gm-Message-State: APf1xPAPR5wtxedmYUxCb0boJgAhZFKmpouhM8V3XjULoTRxCChmWVJ5
	y4WaIdNYyPIxVcd/coUhjemPAUKi
X-Google-Smtp-Source: AG47ELtKGwxdJiM9aGzqxqDKTk4zQCkPa4LpMRe+b7RYdsNaJ8bYRr0fH/cjPrfOGsytdE3ArBx9QQ==
X-Received: by 10.107.183.207 with SMTP id h198mr17499417iof.293.1519771682075;
	Tue, 27 Feb 2018 14:48:02 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	r137sm373612ita.23.2018.02.27.14.48.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 27 Feb 2018 14:48:01 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 16:47:53 -0600
Message-Id: <20180227224753.30881-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180227224753.30881-1-JPEWhacker@gmail.com>
References: <20180227224753.30881-1-JPEWhacker@gmail.com>
Subject: [RFC 3/3] sstatesig: Move hardcoded native tools
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
X-List-Received-Date: Tue, 27 Feb 2018 22:48:01 -0000

Now that SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS supports the wildcard syntax,
these exclusions no longer need to be hardcoded

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/layer.conf     | 5 +++++
 meta/lib/oe/sstatesig.py | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 67820588d37..df67716a2f1 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -44,6 +44,11 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
 "
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
+  *->quilt-native \
+  *->subversion-native \
+  *->git-native \
+  *->ccache-native \
+  *->icecc-create-env-native \
   gcc-cross-${TARGET_ARCH}->virtual/${TARGET_PREFIX}libc-for-gcc \
   gcc-cross-${TARGET_ARCH}->linux-libc-headers \
   ppp-dialin->ppp \
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 418c1ca3cc7..e1871b347cc 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -28,11 +28,6 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
             return False
         return True
 
-    # Quilt (patch application) changing isn't likely to affect anything
-    excludelist = ['quilt-native', 'subversion-native', 'git-native', 'ccache-native', 'icecc-create-env-native']
-    if depname in excludelist and recipename != depname:
-        return False
-
     # Exclude well defined recipe->dependency
     if "%s->%s" % (recipename, depname) in siggen.saferecipedeps:
         return False
-- 
2.14.3


