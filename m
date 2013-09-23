Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-bk0-f43.google.com (mail-bk0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA4B6C9CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 16:34:16 +0000 (UTC)
Received: by mail-bk0-f43.google.com with SMTP id mz13so812394bkb.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 09:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=FClHnnsyOhijcEo9PcAo8Uh7m8cvwN+DVqjW1jkUAi0=;
	b=lWNWF+DRkyiV+mqzM+e+ulIEljvpVOtdUmbtVB9PDIIgYVlR29rx1+W/+vzxeOu6Lg
	S3pG3GUztjvYEabXYGcGhF8ZaSvQVqe9Jg4L+An9H/ytHcV8TQ8z+Dfj7X3nKFuvx+4B
	ulG+tUAJxyrRs+3vWZutLWhMDAd0SaSMiJOK6Fo7+cIKOJpcUNDdncPgiPfnYDroJwyv
	4PbeVw0qJTvIibYAgFqxi5lEbVWVZqGF/9huq+SqNeeMPAM6IbAYO9FS0OXtmrd6Mcc5
	zrhb5JHdqcjPgv6hvgVcbUtXTI3V7Eh4Fjik8ZnSg8uWlbAUdXN5teQY7MmDWvZxr/Sv
	uceg==
X-Received: by 10.205.65.78 with SMTP id xl14mr18442933bkb.1.1379954057692;
	Mon, 23 Sep 2013 09:34:17 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id w9sm9051438bkn.12.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 23 Sep 2013 09:34:15 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 7CF28400339; Mon, 23 Sep 2013 18:34:05 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2013 18:33:59 +0200
Message-Id: <1379954041-5575-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCHv3] makedevs: add nativesdk to BBCLASSEXTENDS
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
X-List-Received-Date: Mon, 23 Sep 2013 16:34:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a first in a series of patches to add items
to the nativesdk toolchain tarball.
Many of which are Yocto specific and needed to create a  
rootfs with pre and post install hooks successfully run, 
using only the toolchain tarball.

End goal is to create a sandbox where _users_ of a Yocto 
based distribution can customize a rootfs from a package feed
with their package manager of choice.

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-devtools/makedevs/makedevs_1.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb b/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
index 2b9fd37..e6860f0 100644
--- a/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
+++ b/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
@@ -19,4 +19,4 @@ do_install() {
 	install -m 0755 ${S}/makedevs ${D}${base_sbindir}/makedevs
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.2


