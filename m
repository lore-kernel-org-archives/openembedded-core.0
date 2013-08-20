Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id D46756065F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 08:44:47 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id ev20so94070lab.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 01:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sjLDa3D2b4WwEtbiSJsU2ZJKOiTjn62O7In4mECv8K0=;
	b=jAFo/c8rXfKpfG/JQg2utII6QUJORr9Ld27NTArby3sO3XXqKTEtJNTIK0uY8lXZJo
	UmmGF41lA1a5yad4iKwJDbhir4ldn3F+VdZuFre/FXzb68gp7dHsXrW8z91qtiVQyXMe
	/KNPYorp3KCbBuVHKq7rf/ytA27sGWWP4A0lGoEWq04nJewrndstZehC/Nd5fffiqEsr
	HYJarNNAs0Gk9FuymDCllClsc7dk8mAeKeMjQLYyn0TIxEIh+1g1rvTgz+1zbcx1qBEe
	HkFmzCBX2KuvGaNLiXFYESOHATCZGQMuC5wUuuAhNmXwd60LE8d05M/XaY9cQ5k0oDyQ
	XUNw==
X-Received: by 10.112.14.102 with SMTP id o6mr1784586lbc.28.1376988287629;
	Tue, 20 Aug 2013 01:44:47 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id b3sm275109laf.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 20 Aug 2013 01:44:46 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VBhYS-0005Ro-Rc; Tue, 20 Aug 2013 11:44:44 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2013 11:44:43 +0300
Message-Id: <cover.1376988152.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/2] Automake-1.13 fixes
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
X-List-Received-Date: Tue, 20 Aug 2013 08:44:49 -0000


The following changes since commit fd9e591f266e1a6c183e77f24e50d31e0d52bdd5:

  cronie: fix out of tree build (2013-08-19 11:24:51 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/am13
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/am13

Marko Lindqvist (2):
  texinfo: correct dont-depend-on-help2man.patch
  gtk-engines: fix build with automake-1.13

 .../texinfo-5.1/dont-depend-on-help2man.patch      |   43 +++++++++++++++++---
 .../gtk-engines-2.20.2/substitute-tests.patch      |   37 +++++++++++++++++
 .../gtk-engines/gtk-engines_2.20.2.bb              |    5 +--
 3 files changed, 77 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/substitute-tests.patch

-- 
1.7.10.4


