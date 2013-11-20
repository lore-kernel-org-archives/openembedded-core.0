Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0429061957
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 16:41:32 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id q58so3732456wes.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 08:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=hd+Ii/3P7+RRIh9byUX37WsNUYpn/Q5AoNY31EjrqXM=;
	b=rEZQILkpMX9F17srCjMwv2qpGTzh6yWDBFdGeacsZ7kJaRUrvgj0/+qPDq+PjZXqEi
	2sQd1ctjdhwKWxnaazs6DrQuWsw0/IyvjWHE+mB0G5e7qhePJ8ZshcM19yBHWN5uScCU
	Sx7cMCBLcKGQF/nXIkJD40RRMMdwYElZqADOXqKeZNQhRyqMWNXsLPwjxbATBr+JC/wy
	lRBIwsbnCG5dSN+sEjskyPvBeNzGSujc7NgMkSvahJihiEGU8e16UVtPGzZRimhLU/+i
	b9pZAVmpUNZY/oecx3mr8U7t2czCJ4HoT6ynHvKctFJ5ubn/kqan/3fsxTM1fsYyRY+c
	IyZw==
X-Received: by 10.194.21.131 with SMTP id v3mr1546607wje.44.1384965694096;
	Wed, 20 Nov 2013 08:41:34 -0800 (PST)
Received: from turn.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id w20sm9706956wia.5.2013.11.20.08.41.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 08:41:33 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2013 16:41:07 +0000
Message-Id: <1384965670-23435-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.4.2
Subject: [PATCH RFC 0/3] opkg upgrade
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
X-List-Received-Date: Wed, 20 Nov 2013 16:41:33 -0000

These three patches upgrade opkg and improve the recipe. I've build tested the
new version but haven't had time to give it any testing on qemu or on real
hardware (opkg-0.2.0 has itself been tested, but not with this recipe in
openembedded).

Of the new PACKAGECONFIG options, curl and ssl-curl cause a dependency loop if
you enable them and pathfinder doesn't work as there isn't currently any recipe
to build pathfinder (may also be called libpathfinder-openssl). Is it best to
leave in these options with a note that you'll need to make some changes if you
want to use them, or to drop them?

Many thanks,

Paul Barker (3):
  opkg: Update to version 0.2.0
  opkg: Add PACKAGECONFIG options
  opkg: Don't use update-alternatives

 meta/recipes-devtools/opkg/opkg.inc      | 28 ++++++++++++++--------------
 meta/recipes-devtools/opkg/opkg_0.2.0.bb | 14 ++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb   | 14 --------------
 3 files changed, 28 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg_0.2.0.bb
 delete mode 100644 meta/recipes-devtools/opkg/opkg_svn.bb

-- 
1.8.4.2


