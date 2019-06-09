Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id EEC107D40F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:05 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id n2so3645738pgp.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gbyao6hJL2A1gPZB3KqPAgr0T+XOf+6fnLiyCN1EcfU=;
	b=nHHrPGVZIY11LGFjiLzU7KnHBYeCwwg815NysWeuc5kIr574emaYNjIcAXrPrWVC1m
	jjLv1aStiE+Vm6PZpc9URIG1pNNcnr1uGolnR4oKJNHV0M1GjIXGwR5QxafMWz8UOvGX
	XmyPZ69gLQDcRMm/OwfNZMYvoGVaNSJn5ECA3jydcIuoPLkZzdWaJPlVHwrdEnIl/4bl
	3m3PuB3mM5BAltSbVlcfEk05JNiZ5snonLZCIaaD9qMz2yINXHDDlkdG4utBsRXhYZHM
	X2Jqko3XJxu7aPi9ceZzSCDWzP9xcCXa7J7DME0jLxAhudVy2qJxhI7X5gWlWqkrJUSZ
	V7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gbyao6hJL2A1gPZB3KqPAgr0T+XOf+6fnLiyCN1EcfU=;
	b=UXCs8ISGVLTkqL0nelkSpNbRgsINBBpDQ1IuhZmFfOJ7eFYFUF1EDCfd7GPKj+rQeW
	qisU0P7O6NR5hL/Jz2tVjHNIrsag2seR4EqBwV4kTptAhi7TdKTIOM0euy1kK+xs4teU
	Ktg2/04a7IBqpI1lTKK6G2EUm5ovWfW23FONZxsUqmHEpAeS+ZWCeKXJzxy7oNkItRPM
	HEguCX4gkFmV1EKh+T4XM/cSuY6t67qd8LhvVowMM/O7RbKDmEO50YMM7bBh0GFgKzf9
	clEr0ImzmlNNY3OYyOJCUQBBBLqPeIvBYyw6C7K8cos9AKolebBttiHxal2XIH9q9pR4
	vqbw==
X-Gm-Message-State: APjAAAXV2JOr1PMyJTonCGrzS2yRXv3WVrSr0edltJ8Lm02nOSJU4bau
	8av/txQWZ2eFGwvcDnvGUhScgF9c
X-Google-Smtp-Source: APXvYqx3TdFlzWFbB0hWkA0dJnh6P5vybg+cWSD4Dl1bNvk+iUWZiuXUl0BDP1M9gWOJ9YQUyDNEYw==
X-Received: by 2002:a63:cc4b:: with SMTP id q11mr11858524pgi.43.1560092046820; 
	Sun, 09 Jun 2019 07:54:06 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:36 -0700
Message-Id: <a0163116a34eaf20ade2ba4d1559a0ed1580b3b9.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 01/27] yocto-uninative: Update to 2.5 release
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:06 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This includes libstdc++ changes from gcc 9.X.

It also switches uninative from bz2 to xz compression.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 59ccd69..0bb8f7a 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.29"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.4/"
-UNINATIVE_CHECKSUM[aarch64] ?= "af2e2faf6cf00ff45cc1bcd5e3fb00cee7f79b3ec7c3be15917ad4ff8c154cfe"
-UNINATIVE_CHECKSUM[i686] ?= "fafacfc537a6ce2bd122bd16c146881ab5ac69bd575abf6cb68a0dd33fa70ea2"
-UNINATIVE_CHECKSUM[x86_64] ?= "06f91685b782f2ccfedf3070b3ba0fe4a5ba2f0766dad5c9d1642dccf95accd0"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.5/"
+UNINATIVE_CHECKSUM[aarch64] ?= "ca977ff95c77f983570141908d451ff7d78add2864471605af404302bb36a1fa"
+UNINATIVE_CHECKSUM[i686] ?= "7b5822891c293795faf8a4a80586b36f8cde405387524916a24f9055ea82f7ca"
+UNINATIVE_CHECKSUM[x86_64] ?= "ed0ac07c710b711925cb976685dd855fb1d442dd840d00194751c18bf480c4ed"
-- 
2.7.4


