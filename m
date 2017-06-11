Return-Path: <net147@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id CA54871BEE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 16:57:50 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id w12so4051273pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 09:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AurDQ4fRjgrb/W+LAwIGpfHmqmg4Jt3SEbchY+crRZc=;
	b=GH/nhw/hH7nYNO6Xn6F9AxCT3OTkTTwMKbrfJmzHsY4M+QUZhxnW8MnOZFALCEy0Tp
	oMqMtn3hR9v8cTG3HqFyAjej2sgmiDhPAbOXg6C7NFqrWxfGvp/AHD2zO46cIKklW1Af
	4hUE4qSj/t70GFGBBuFSWWz5pFVwo5tBF4s9vQbUO8ENYVEF0gkFNupyg3gymrIFJRun
	C+GLKNwxA8HnuPtPcdVve8AIRNmo3ujgqJwrGz4kSMrNJGcCvVGO9zyUDR5OkHMQmn8e
	Ehu/IVNDSggKqbhdP7lKpRcYjjilwqOByWf9Lp350adKGxSEh7LaSsFv4A2juQ9NtEPW
	3XyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AurDQ4fRjgrb/W+LAwIGpfHmqmg4Jt3SEbchY+crRZc=;
	b=Fe4l8RaBEFAMbKIacN3+7nn/KIVMLIANLAB/gb003Gu+ambKAVYwVsuYcPQrNdmCwf
	1gzKVvcmp8Rd3I/jp2SbwrGesLSRecAEG/6dGFQZZEZCON52HjzDAJWU7Ov1xBeTiqH1
	+Zcu9EiXCVv9Fj2ChQ8PxpR2pfovumXgNQM/ldj9Lu2U/rsuj4ROp0cgbxD1bu+b9pYi
	1WWkD7UAqpbiI6Oc8d6DM3YHc56eSs02GK+mOZXLJHPOV1e3KmxI+Os2VrhPCuXh6atb
	49QeZUrxpxi136oAnHHYpSuH0W5QhbZ7qDMeTcZ+dPauirmiu1+4zBnptrSgpVrA6xud
	lieA==
X-Gm-Message-State: AODbwcDdrNBsuySLUYerdRDGObQ6N0gZnoofdXRLuXt16aiAH+3kLjPc
	AssdCGnqAVUjEw==
X-Received: by 10.84.211.7 with SMTP id b7mr22397102pli.124.1497200271633;
	Sun, 11 Jun 2017 09:57:51 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	g13sm14041512pgu.54.2017.06.11.09.57.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 11 Jun 2017 09:57:50 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 02:58:39 +1000
Message-Id: <20170611165839.26175-1-net147@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [master][pyro][PATCH] bitbake.conf: Add whoami to HOSTTOOLS
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
X-List-Received-Date: Sun, 11 Jun 2017 16:57:51 -0000

The whoami command is used when building the Linux kernel in
scripts/mkcompile_h to embed the build user that is visible
in /proc/version.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3ad905c917..4f20aa3d1c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -465,7 +465,7 @@ HOSTTOOLS += " \
     mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python python2 \
     python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sha256sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
-    uniq wc wget which xargs \
+    uniq wc wget which whoami xargs \
 "
 
 # Tools needed to run testimage runtime image testing
-- 
2.12.2


