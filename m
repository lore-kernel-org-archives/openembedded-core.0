Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 997846CBA5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 14:01:21 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id h10so2215407eak.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 06:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=bCst4pDuR/1EguCyuHL8OwBgdCn8JU46hn4lsP8Rw7A=;
	b=Si3pRAOCDPfky4yzbYhbOuCD/K4H8ratgnY8Aw6S3ed7Nnpjbo8ErqgBMxcw/Euc4S
	fgW+rBZFjrh83xImJPUbtTwwPUwShd95pEZP9LFIj1zCpaB2ECJ+NlLxNWfWfKgMrBy/
	Hx4rexvk0+6KePOGnuluQQd3608q9F8gGRwOO+S6lg1BxbgiDpHsZ3qe5zZwxzPLFvw4
	25+6wUN/gRV7Fo/wijPKPCm+Ex1/2w7EwRJHuI2pZyIaKtZyrtf/28z8mL5KVSxt5Cq5
	wRpiQGqic7LtZXdQ7ymvVEbM+A4JO4EuLx/ZLAIM54/L2z100kDHxK62DGmnH5/TmywS
	HpUQ==
X-Received: by 10.14.126.1 with SMTP id a1mr1860354eei.81.1390053682291;
	Sat, 18 Jan 2014 06:01:22 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	b41sm35488863eef.16.2014.01.18.06.01.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jan 2014 06:01:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2014 15:01:42 +0100
Message-Id: <cover.1390052658.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
Subject: [PATCH 0/2] allow to define additional packaging metadata
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
X-List-Received-Date: Sat, 18 Jan 2014 14:01:22 -0000

There is older patchset from Leonid which didn't get any response
on list, but is useful and still working.

It's good for extra packaging metadata like flag that device should
be restarted after package upgrade and it's packagemanager job to respect
them or not.

The following changes since commit 8163854adf87ac42a8f08ee25685d0ce1efb4724:

  oe-selftest: separated the SStateBase and SStateTests in different modules (2014-01-16 12:18:44 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/package-additional
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/package-additional

Leonid Borisenko (2):
  package.bbclass: add getter of additional metadata
  package_{ipk, deb, rpm}.bbclass: support additional user-defined
    metadata

 meta/classes/package.bbclass     | 11 +++++++++++
 meta/classes/package_deb.bbclass |  5 +++++
 meta/classes/package_ipk.bbclass |  5 +++++
 meta/classes/package_rpm.bbclass |  7 +++++++
 4 files changed, 28 insertions(+)

-- 
1.8.5.2


