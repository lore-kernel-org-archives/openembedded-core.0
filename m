Return-Path: <gizero@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 211B971D4E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 21:10:00 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r126so45380396wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 13:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LO97L9wT6iqR/qH4ZETGHmBmvKJzGZv2wNlvZmvGuNk=;
	b=s14jpg8tRzWyOsKxtaPZBgDRnniRaSuLh8XCohjkzfew47bzN7K6au7PtaqDxyTVjY
	UnID4lkI/jjSgl6+YHB6//JaSmK9xwwo1PogJT4haacfRr2fCK4p83dbBWHp6FZLcZmD
	/dYoyGPewNuMg4AvGf1pbEDDD2M1z1y/o5FUXUJaPEV51o/5rIG5CNdGNx5XbD9IH7y5
	tNR7qRtKxJkirxcJbdhwAp+PItSlJCmykq173/bytwQl+EmGfW9+izsbbZ8R8yV8k2MP
	F7nEYKuQzFi2a1gbvgYhl3j+wwr7Ff5u3q7AuByd/vNdH27Ij58xJg2obK5CNAUNArFq
	w1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LO97L9wT6iqR/qH4ZETGHmBmvKJzGZv2wNlvZmvGuNk=;
	b=ekQwkGwNU8hKWWuGSU4EXGYpCUEsRAGhL5z1Avuj9hLYvrIR1ntqZAxcNk7TnPAFEr
	g/v8LCCKliNuMM9SnWYA2dE4sC10zMlGkVfLIhl2dJKfsMQz7qWsmVcifzlXLAlrrWkK
	WTndG0H/fIFZdBUuFsdVhOhQoL0G7zzm7NT2pOBff5pU2fL6yELiGHIpM3lb7XOeX7+c
	C2vioVBxv3J3P73FANorgNKLmYQzObZqv3IdPko036CA1sMER0/1vuomx4m3LFJ+Rzdh
	DnV9C2DiHd5n0fu60LJc1BFzNh4wrB5R+xeroJISFB9EMv2fpChP2dxWm2wMXyZEIq8V
	WMKw==
X-Gm-Message-State: AIkVDXLt4CkjQRLDrkmLXrfNNmQVOyp04/vF6L2ZoYanwqVk9bggd8Socbi12kx0Cac3sQ==
X-Received: by 10.28.147.72 with SMTP id v69mr25266957wmd.51.1485378600568;
	Wed, 25 Jan 2017 13:10:00 -0800 (PST)
Received: from gizero-desktop.tw.it
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by smtp.gmail.com with ESMTPSA id
	y30sm26858342wrc.23.2017.01.25.13.09.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jan 2017 13:09:59 -0800 (PST)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 22:09:14 +0100
Message-Id: <1485378554-20011-1-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] oe-publish-sdk: add pyshtables.py to .gitignore
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
X-List-Received-Date: Wed, 25 Jan 2017 21:10:01 -0000

poky/bitbake/lib/bb/pysh/pyshtables.py should be ignored by git as it is
generated. If kept in the repo, causes subsequent runs of sdk-update to fail.

[ YOCTO #10963 ]

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 scripts/oe-publish-sdk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index 4fe8974..8979405 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -114,9 +114,9 @@ def publish(args):
 
     # Setting up the git repo
     if not is_remote:
-        cmd = 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; echo "*.pyc\n*.pyo" > .gitignore; fi; git add -A .; git config user.email "oe@oe.oe" && git config user.name "OE" && git commit -q -m "init repo" || true; git update-server-info' % (destination, destination)
+        cmd = 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; echo "*.pyc\n*.pyo\npoky/bitbake/lib/bb/pysh/pyshtables.py" > .gitignore; fi; git add -A .; git config user.email "oe@oe.oe" && git config user.name "OE" && git commit -q -m "init repo" || true; git update-server-info' % (destination, destination)
     else:
-        cmd = "ssh %s 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; echo '*.pyc\n*.pyo' > .gitignore; fi; git add -A .; git config user.email 'oe@oe.oe' && git config user.name 'OE' && git commit -q -m \"init repo\" || true; git update-server-info'" % (host, destdir, destdir)
+        cmd = "ssh %s 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; echo '*.pyc\n*.pyo\npoky/bitbake/lib/bb/pysh/pyshtables.py' > .gitignore; fi; git add -A .; git config user.email 'oe@oe.oe' && git config user.name 'OE' && git commit -q -m \"init repo\" || true; git update-server-info'" % (host, destdir, destdir)
     ret = subprocess.call(cmd, shell=True)
     if ret == 0:
         logger.info('SDK published successfully')
-- 
2.7.4


