Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0E3F974E27
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 15:27:09 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id p124-v6so34380208iod.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2018 08:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=tJStKciEiWWStXcZl6nVQ/SG+wOEPq/DFgGUBcEenFM=;
	b=IjEuGYCmENWD3BHiL8/8H2wl6RaGLH4VjYr5HaYfWGgLqtrDKzittcVGenq3r3E0Ty
	7Vlb1djVOf2E2xXoP+KQ5N2epuq/gsdxyd2MV2tsuBJBmBzAp/+J/mnPvSq9UlulYM11
	in39Y4YTMNjKgqa50tEfESAAlRbUQ/VFJVm4fhIKDExFPGx8OuP+HsB2Ekinlvz7VvUz
	CscokmnQkqNoyY5MjXtGwyfVm/9/wVjoiNOm6eLDa+xQd6RX0hDQxpteHRIRtscjk4Rj
	Hq40c8TyaaY3bS6NBmc+3I9sS5evLDx89XftLalHlS2PWsUBU1L8BIQnf5ygab9Mo9Ai
	qbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=tJStKciEiWWStXcZl6nVQ/SG+wOEPq/DFgGUBcEenFM=;
	b=mokvJdLfzZAosYaQm/iJYUyqDB1tDFPf/7W8UMSWiUhA5+K+jeoqG8hAtf6j7XWdxv
	Dk1VKXocJDjLOkD/2rZeQB0KFlCDztzwNAnQnjDzpDXHhMpjOQU5oXaub5u2XtmsbRdP
	Uy7XyJr3Gn847GaWEnrVK4udrRVkta7JseiDe8UvEA+Y8DbzWIVUoJ4OhmZf8oFz1eM0
	wkgQ960S7uqhBkyDS1MzCcJVvmMYYnOaEFydQ23sXBbxF/MRmLcmP71X5tTpzifg1SAD
	uNRxSVCjJSNf/pgNBSEgGSrrNlMh5QkNdvPhJoSjLaZ3EvMqwnuEt1ocLNZirs2Oj/lm
	6gOQ==
X-Gm-Message-State: ALQs6tC8yzTwVwaX1qPEeGWnkuJGZKmcaU4BGKEPWSlieNrNTr7JvDHL
	JDQCEqk+8IltQ7SFkyicC3xluXv4
X-Google-Smtp-Source: AB8JxZqz/SN8AYTQN2Euplof3rVSskjNumUxPEXO6G34dbUgIb/+bkhm1tvPt4qGWT9bNjYX1QFFYg==
X-Received: by 2002:a6b:b252:: with SMTP id
	b79-v6mr40860084iof.186.1525706830345; 
	Mon, 07 May 2018 08:27:10 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	199-v6sm4409208itl.26.2018.05.07.08.27.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 May 2018 08:27:09 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 May 2018 11:27:01 -0400
Message-Id: <20180507152701.12046-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
Subject: [PATCH] babeltrace: switch source URI
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
X-List-Received-Date: Mon, 07 May 2018 15:27:10 -0000

It looks like http://www.efficios.com/files/babeltrace is down, therefore
switch to https://github.com/efficios/babeltrace/archive.

The md5sum/sha256sum updates are (I'm guessing) a result of switching from
.tar.bz2 to .tar.gz.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-kernel/lttng/babeltrace_1.5.5.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
index 92d86b92e8..2098264c67 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
@@ -10,10 +10,9 @@ DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
 inherit autotools pkgconfig
 
-SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${PV}.tar.bz2 \
-"
+SRC_URI = "https://github.com/efficios/babeltrace/archive/v${PV}.tar.gz"
 
 EXTRA_OECONF = "--disable-debug-info"
 
-SRC_URI[md5sum] = "7decafd46093e4e47c14e7307d498986"
-SRC_URI[sha256sum] = "409146789b4a6b81f6a275fcad932a030743d444f6de5bd4a34aaf17aa72e8ac"
+SRC_URI[md5sum] = "aa70da8947b2104b976302d8f65ddee5"
+SRC_URI[sha256sum] = "ce11a5725e7f4838b4a1cc20966eca77bf77a80c43a072062708d7eac7ebf272"
-- 
2.17.0.rc2.3.gc2a499e6c


