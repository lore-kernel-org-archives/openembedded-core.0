Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175B4C02196
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:53:38 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.116309.1738677216183465585
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 05:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=bQtEmSVa;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=I+1Owp1NEMmWZ51omGghjoBYw7+R53/KKJV1gRt3f78=; b=bQtEmSVabdogfds7aCQiBA96Gn
	2EInvHOyljS6p5wgYK7FwSLAV3Okq4fiZXOEw5Ya2hK9iaoN+42+JVetLqLfY6sbl0BTA3qmPMbYH
	0btOFAFlOOfjojfPq9z6IAqzZ9VfR6YXXzGWQRNpEkz2KExNDdZNs+PKkO8RRp0gBYYOIPpXB3564
	OgoZbrEa6MoXLgEXhsHUTJNvXaGZ5nuDIAUgDtVVQMjbljFK6APOywyNKMyAZ7Vg4qXe3KS0khhuN
	TtKC1vlmMIaha4Q61jKVuo24vgWWaDD0zGf3sA8KsE88ezgNDYX+stGVykVcVhpJN8bJD5qF3tI1u
	AaIt9HSQ==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <esben@geanix.com>)
	id 1tfJMs-000Cp8-1o;
	Tue, 04 Feb 2025 14:53:34 +0100
Received: from [87.49.147.231] (helo=localhost)
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tfJMs-0008mD-0l;
	Tue, 04 Feb 2025 14:53:34 +0100
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 04 Feb 2025 14:53:02 +0100
Subject: [PATCH scarthgap 1/2] files: Amend overlayfs unit descriptions
 with path information
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-scarthgap-overlayfs-create-dirs-v1-1-4a70d03db557@geanix.com>
References: <20250204-scarthgap-overlayfs-create-dirs-v1-0-4a70d03db557@geanix.com>
In-Reply-To: <20250204-scarthgap-overlayfs-create-dirs-v1-0-4a70d03db557@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Esben Haabendal <esben@geanix.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738677213; l=2139;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=7ktPZUai2ceG3HarZWym75F1K8zQaYGiX1Yx3BUgRYg=;
 b=Ld8xT/jzIExUTrF8Sk2n2kUHmr1USN14ikgbn4pih8WtrZ98P8voKBAiVdgZpzqm4Yswt08fV
 f4SY4cr9HSaCrB8kKDsCiaBU6XKmtX7I85TaV//ICdSYrmhSRKDzWVZ
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27539/Tue Feb  4 10:37:52 2025)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 13:53:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210796

Having something like

Starting Overlayfs directories setup /home...
Starting Overlayfs directories setup /root...
Finished Overlayfs directories setup /home.
Finished Overlayfs directories setup /root.
Mounting Overlayfs mount unit /home...
Mounting Overlayfs mount unit /root...
Mounted Overlayfs mount unit /root.
Mounted Overlayfs mount unit /home.

is much more informative than

Starting Overlayfs directories setup...
Starting Overlayfs directories setup...
Finished Overlayfs directories setup.
Finished Overlayfs directories setup.
Mounting Overlayfs mount unit...
Mounting Overlayfs mount unit...
Mounted Overlayfs mount unit.
Mounted Overlayfs mount unit.

Especially as the number of overlayfs mount units increase.

Signed-off-by: Esben Haabendal <esben@geanix.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7308b4fc6f51bdf2b8f3b7899ff3758c5968e418)
---
 meta/files/overlayfs-create-dirs.service.in | 2 +-
 meta/files/overlayfs-unit.mount.in          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/files/overlayfs-create-dirs.service.in b/meta/files/overlayfs-create-dirs.service.in
index c949a6dc7363332749f6ea7828fb93e005b2ef67..d8d916365a4562dbe522eca9f291a9a4c859f7d9 100644
--- a/meta/files/overlayfs-create-dirs.service.in
+++ b/meta/files/overlayfs-create-dirs.service.in
@@ -1,5 +1,5 @@
 [Unit]
-Description=Overlayfs directories setup
+Description=Overlayfs directories setup {LOWERDIR}
 Requires={DATA_MOUNT_UNIT}
 After={DATA_MOUNT_UNIT}
 DefaultDependencies=no
diff --git a/meta/files/overlayfs-unit.mount.in b/meta/files/overlayfs-unit.mount.in
index 1d33b7e39cc4323982e11222b416c0474a0a794e..9c117f2c5263c6d92ff177f466dacdc81990a0bd 100644
--- a/meta/files/overlayfs-unit.mount.in
+++ b/meta/files/overlayfs-unit.mount.in
@@ -1,5 +1,5 @@
 [Unit]
-Description=Overlayfs mount unit
+Description=Overlayfs mount unit {LOWERDIR}
 Requires={CREATE_DIRS_SERVICE}
 After={CREATE_DIRS_SERVICE}
 

-- 
2.48.1


