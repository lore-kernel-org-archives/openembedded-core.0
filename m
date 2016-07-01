Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1091F60124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 21:41:23 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id us13so10532821pab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 14:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cqLoo95SszZP5GgiGV1TFL+xqNWdm1xJp6+DFA9v+Yg=;
	b=dzVgEdMjhjgV5/7MvFIxW3MqbaDSzuYuv9dAfCL35xMQWTzeXoDltsd4WoJ/+sHWD0
	Q7qUmL9oaNcRNbaUidhEeMhiitPVyIr8rHmf0zqGIRgntqLZ6t2p5KK8yZ3UDhupJ6si
	8e8ZPbs4cQ+AgHFVfFUdzqsMtUXralINmOhbLYq+S7f/tSpLTpuPC040e1SoqjruTVG4
	6CG0sb81gUrM8zs2xvuABAp5Rp5iO+k4TFbVQFhnAXHE9rfIQ2fl/LBifCtVQSFOqjDQ
	fYGB/tBt8ZtHZH0f29nWGJwIvkNyKXiRiBeo1MYV9NLMnzoZF5vSyK0YQUVl/Y6+N4je
	VCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cqLoo95SszZP5GgiGV1TFL+xqNWdm1xJp6+DFA9v+Yg=;
	b=cFWxl9JGbUzaLZbwJy75SKPNIXUp4qpPfpBytqfN4iGCajXIkm2WQjTw6666+nrnt0
	5HeahEFDb742UIYJiQjWCX7ehpxyor9clUVoZ55DkIgNTpdaWt9Zlx9JgM6Ry1sRhJt8
	+Xe+Crln5pt+BX0Sx53l5JGkjoPQJi4F3sFBwDdnB9euAvzDc0KmmohyNn7G+CjkhQVO
	7Y3Mf0HAqV2LOAvQyTi14EFhcNZPab1FUudi8aAfAzjxCGeWIcWexMpoh5YSxkL6SAj3
	QQCzy4E/JJUdWSGSkqeCTYi+LOu5Jvc47vWo/CMVY9QOpYYoWW4qLxM1gWYgpG+W2Gsp
	GgLQ==
X-Gm-Message-State: ALyK8tLfkfUnea+Ndd0I4MAQW+ZSLTP2FgU8FkUXjzSlvUvQmzN63qOLJ8NbvfVEYDI87g==
X-Received: by 10.66.240.101 with SMTP id vz5mr731244pac.16.1467409284425;
	Fri, 01 Jul 2016 14:41:24 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id 6sm7589331pfv.26.2016.07.01.14.41.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Jul 2016 14:41:23 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 14:41:18 -0700
Message-Id: <1467409278-8109-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] libgcc: remove duplicate configure options
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
X-List-Received-Date: Fri, 01 Jul 2016 21:41:24 -0000

The original fix [1] was made redundant by the followup [2].

 [1] http://git.openembedded.org/openembedded-core/commit/?id=d774bb2d10f2c05900f87dcc53f073433ca02121
 [2] http://git.openembedded.org/openembedded-core/commit/?id=d7799a17d5e802db3f8d16bdc824aae81538e675

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gcc/libgcc-common.inc | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index cb1237c..4e4f0fd 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -4,13 +4,6 @@ require gcc-configure-common.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-EXTRA_OECONF += "\
-    ${@get_gcc_mips_plt_setting(bb, d)} \
-    ${@get_gcc_ppc_plt_settings(bb, d)} \
-    ${@get_long_double_setting(bb, d)} \
-    ${@get_gcc_multiarch_setting(bb, d)} \
-"
-
 do_configure () {
 	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	install -d ${D}${base_libdir} ${D}${libdir}
-- 
1.9.1


