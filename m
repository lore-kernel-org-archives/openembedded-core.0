Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id AF32A6E64F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 21:09:27 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id j92so10311013ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2016 13:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=5T1kRgpSpewrpPLeGTPk5n+vqId7uDM5arT270D3MAY=;
	b=yWJPKTkbuBS2RCZVbvjD6dm9kh5bKt/sUEMr7EWHFq/Aeuv0XmjMmzIoKETlIw4BIW
	X/6JmGuO4IOpIuISgZu/YznFa2vq0FXKLogV/KBCcHQb5p1ieQxWD2Fp6z/PiqDYlhqI
	YAEU2WqrU51GCMGNCnwVKo6rDxTwca7TfCZVtCiushSANmDegs/yJW1PnM8f8d0tFWF4
	prdoy5ndglN8gfmFjAQ5Es2CaxtNhc6mOQnpgMQwJNsUX5OqWlYHFDYhZI4Gt7dTp+uy
	p1jStOfV4aKWZw0yCReV2MIADA+ifhL3OLgCifokmoS9pRVPbmlaV1ivgfBIKkmjMk6g
	84Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=5T1kRgpSpewrpPLeGTPk5n+vqId7uDM5arT270D3MAY=;
	b=Q8puo5XcLTgOnUUoj2vkvOu9ZeHqJsvDaFW4OJEGfk5PrVJxLCZRlaY0P09Ph+ymS7
	hN8fhQlNsufoL4RTDZpkzbAYvLHOjDuWSyWYKD7K7pREfTJuA1cne7qBGb5/Jtgx03uV
	I4ZXrH3sLjFTNmgai5YW56ihhmDCy+TRWl7BnroIejxpWeUmqsffWFN53IGzoXPDtbEw
	0Y3/U7vU7gFO+IPx67sIQag2NEVooN60/qkp5GjGpSrSqFZHs5uwrvv+AN+DKzOzBtRl
	DN/2Zuc/OoDaWOJWABrvtTuYcoRhYvjLJJGJ9XQQh/17UtOz55OLEG0f7YXRTyf6gW/Q
	H4Jw==
X-Gm-Message-State: AKaTC01MMph+iUTN83E/ATZmKNSkQc/jkz0XG9guyWeOEjrRsjKDwiBEXJknva5WoMc4hg==
X-Received: by 10.107.182.70 with SMTP id g67mr40699363iof.120.1480712968439; 
	Fri, 02 Dec 2016 13:09:28 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CMbcc810032faf.cpe.net.cable.rogers.com.
	[174.112.43.94]) by smtp.gmail.com with ESMTPSA id
	i62sm1696438itb.12.2016.12.02.13.09.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Dec 2016 13:09:27 -0800 (PST)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  2 Dec 2016 16:09:21 -0500
Message-Id: <cover.1480711764.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 02 Dec 2016 21:09:28 -0000

Hi all,

This pull request is mainly to fix a couple of bugs that were reported
on the mailing list recently, but it also includes some kernel version
updates that I *think* I sent previously.

  kern-tools: fix processing for no branch meta-data
  kernel-yocto: exit on non-zero return code

Those two changes complete the error handling in the tools to display
a (more) helpful message to the user, and also to fix an important
use case where meta-data is applied to a kernel without new branches
being created.

I test built this against the rpi, and all is well.

Cheers,

Bruce


The following changes since commit 9e63f81c78e284c9b325fe04a1b59e61c7ad8a1a:

  bitbake: ast: remove BBVERSIONS support (2016-11-30 15:48:10 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/4.8: update to v4.8.10
  linux-yocto-dev: update to 4.9-rcX
  kern-tools: fix processing for no branch meta-data
  kernel-yocto: exit on non-zero return code

 meta/classes/kernel-yocto.bbclass                    |  1 -
 .../kern-tools/kern-tools-native_git.bb              |  2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb         |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb      |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.8.bb         | 20 ++++++++++----------
 6 files changed, 18 insertions(+), 19 deletions(-)

-- 
2.5.0


