Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id CA5FB7BDAD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:55:44 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id k15-v6so5626688ljc.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rJPBvbfidKpuK0rPyIcSlz+FjwS0CF6+zJ2prvzRciw=;
	b=p/2PFVVgsPdsHutbKzN/DKIgvOSNF1/QHZr3XsKj2c8sQ65bvcxim9lkX0xWQaxtXF
	vhDV+njbnGPcS26op+XCC9eqUUy4sii0f3zL+xf5SNQkf24S64B9Wg8YRcm3t7jgJhZH
	M7A9CJdb9qa6hAPiS5xe3gYP8My0ZR+hOOCxoQz3N9yhot6PVWc8EhLqsl2Oij/Dl6qz
	ZQgEAP0M+JFvgvDmBM8FlefmoHpqmaRJhS7RmNTt1+eplK6Jwpj1Sf3uXTya3VBwOyOk
	yrTefFFdRfGzye3rzbAC8kmUw1nzdzS2A25LIBDy/9IsJWcvd9n/wIgYOhluxSK9wrhi
	YlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rJPBvbfidKpuK0rPyIcSlz+FjwS0CF6+zJ2prvzRciw=;
	b=l0iw4aUZ0V9aNN+tDhahyaYzJX/OJRi3GkW0P4DkyqwFpl2ww19ZvvSVJYwi6Hs3es
	PrvR5FILRzN7uZJErktpRpvUv2AUbREoNGfryzF0N06Xwf3BiflF1/0hW++HNZ8XLJU2
	6cYzbw3J53XfZz9uMNiRPLfP9D0z4CzGSp/KpLrhaElhRTdg6UqnM4OE++xo7QPyf3Vd
	ulTNXzjL5jyLI3akuR2I83YlXwAptSXYCZpItuyGquZ2PwG24B2gHidnUD81WNGmnlDs
	xh11MvU73FhAMxk5NPdMAv851lZfFpiz0Wr7a5PncfGWNO/D13taBiyYpOMJ+QK1+NUX
	desg==
X-Gm-Message-State: AA+aEWYkJLXDPJPHFjfIGnQ7ytW/eY6w0C+AV8gbnqmJhr06uIZbA+8X
	YQ6/2o21TbvC9FYQT6RqNfiHZjvI
X-Google-Smtp-Source: AFSGD/VAZWn6Bffc4to+q05WnvEcQs5rZLKrAxv3pWHXY2KYJkkIbzqy6iPz7AVHzPxiLrNjJsIG1A==
X-Received: by 2002:a2e:95c6:: with SMTP id y6-v6mr2388323ljh.59.1544810145096;
	Fri, 14 Dec 2018 09:55:45 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	r27-v6sm991033lja.65.2018.12.14.09.55.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Dec 2018 09:55:44 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 19:54:31 +0200
Message-Id: <1544810082-22164-3-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
Subject: [PATCH 02/13] tune-power[5-7].inc: Fix DEFAULTTUNE values
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
X-List-Received-Date: Fri, 14 Dec 2018 17:55:45 -0000

It is ppcpX, not ppcprX, where X is 6 or 7. While there select 32bit
tune for P5 machine to bring it inline with P6 and P7.

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 meta/conf/machine/include/tune-power5.inc | 2 +-
 meta/conf/machine/include/tune-power6.inc | 2 +-
 meta/conf/machine/include/tune-power7.inc | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/tune-power5.inc b/meta/conf/machine/include/tune-power5.inc
index a346c30..ab7aa6f 100644
--- a/meta/conf/machine/include/tune-power5.inc
+++ b/meta/conf/machine/include/tune-power5.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "ppc64p5"
+DEFAULTTUNE ?= "ppcp5"
 
 require conf/machine/include/powerpc/arch-powerpc64.inc
 
diff --git a/meta/conf/machine/include/tune-power6.inc b/meta/conf/machine/include/tune-power6.inc
index ee200f9..7075157 100644
--- a/meta/conf/machine/include/tune-power6.inc
+++ b/meta/conf/machine/include/tune-power6.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "ppcpr6"
+DEFAULTTUNE ?= "ppcp6"
 
 require conf/machine/include/powerpc/arch-powerpc64.inc
 
diff --git a/meta/conf/machine/include/tune-power7.inc b/meta/conf/machine/include/tune-power7.inc
index 3a27719..8189317 100644
--- a/meta/conf/machine/include/tune-power7.inc
+++ b/meta/conf/machine/include/tune-power7.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "ppcpr7"
+DEFAULTTUNE ?= "ppcp7"
 
 require conf/machine/include/powerpc/arch-powerpc64.inc
 
-- 
2.7.4


