Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5577C7477C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 12:09:06 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id p12-v6so15362079wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 05:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=srePs4y3h+wM+CjzDVAy95uJfCmrtczaE9KZ+Kt1kXg=;
	b=WC6nSTJOjlX6UUgDuqp0I7zJcSgtyUg1iflbMZAJivL0HFoUYx8klbGNhmLVeF5uNK
	68JpLcB7j5QGl0AfroecVFI2IrHlSJIbqiz9ZCwf5XSrfkfwBkpR+rkifKfZtNqukZvu
	E3Ss8sIj+MfPyl83bM5nHy55n0Rjkh/jNpaLPN3N5oUSUSPOryoY1m5h+ZEd1CEK+I50
	IdzaHqKay8WMde7g+43NKTgQk6sDsWjDXCA+BL55zmCw5vTS3zgxmRR1qhmdezHmI1od
	+utnmB8MkggYZBZNWrzHHTMNqHLgfHemg1GSEiF67EJqn01YYYtcYckfFT58HXqUruDu
	TnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=srePs4y3h+wM+CjzDVAy95uJfCmrtczaE9KZ+Kt1kXg=;
	b=NffkI/8LrBty9TPZBlWVS8wZaTTvQCnq6lBQp8/uacEOXA3XJbLHxS3liJgCbt95NS
	uQspNLCNnxbZaDI8AvGxKDu7JJkRwEcsn4WFcwyjIcoE/EmoB1pm9cemH9IWBH+M8Ra6
	D7bBegiGGryxylhaBZ2d+e3KmW+kfWvorLaqN5NXrqDvzFYJbVB8q6/KdrtSom+L8ji2
	C0020guT8PI/LocyKKxqUICmuoXBv9o5uH8MJyGdAsd3x+EP3lGEn6STVIGD102BDuoW
	RhMMdKocp/km5SYaY4IfIgLIHJKu4nGpKz251lRW9C7+KRAqrc7HNx9AmQH8yOQvl8LE
	BhZg==
X-Gm-Message-State: APt69E2nB5QxhV229Uwt3ZeZ5zy6oHzz97zvVloW0A4KdNXhwjYc6BjT
	jieXuphrwXMn1PdUZbNqjdA3gp46
X-Google-Smtp-Source: AAOMgpfnALYrz7YT/pSbumByu87kewYQBhZBPQmbQi9M4tJ9CFgkNqxjtQ2QMFqkmokU4qnyeirYqg==
X-Received: by 2002:adf:fa07:: with SMTP id
	m7-v6mr1331856wrr.228.1530014946885; 
	Tue, 26 Jun 2018 05:09:06 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	139-v6sm2017233wmu.47.2018.06.26.05.09.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jun 2018 05:09:06 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jun 2018 12:08:56 +0000
Message-Id: <1530014936-10858-2-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530014936-10858-1-git-send-email-alex.kiernan@gmail.com>
References: <1530014936-10858-1-git-send-email-alex.kiernan@gmail.com>
Subject: [PATCH 2/2] kernel: Set SOURCE_DATE_EPOCH to kernel git timestamp if not set
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
X-List-Received-Date: Tue, 26 Jun 2018 12:09:06 -0000

If SOURCE_DATE_EPOCH is unset (in addition to the existing "0" behaviour)
parse out the top most commit timestamp from the kernel tree to use as the
timestamp.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 972ac52..3213b93 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -288,7 +288,7 @@ kernel_do_compile() {
 	if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
 		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
 		# be set....
-		if [ "$SOURCE_DATE_EPOCH" = "0" ]; then
+		if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
 			olddir=`pwd`
 			cd ${S}
 			SOURCE_DATE_EPOCH=`git log  -1 --pretty=%ct`
-- 
2.7.4


