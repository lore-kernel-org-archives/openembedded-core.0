Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id F1A756B3F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 21:37:26 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id v20so2158434lbc.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 14:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cAAMwFZgz4wjQkvHMsuDjoHZaggWD+mR38UsN3lwbhQ=;
	b=FdGNcyWnThRjd37rjdvUU5ZGkTtgBeoUQDugFIDHm0oZ7vrkhTBSt8lOi91M5Xrjkf
	P21sF2ohf0CGPWj1aSd1zB1lnkkgvkwquhDf1JSMBCTr9KDHUjZxDoPzw37/Se4rTEkH
	3PasNrA4yMFFWG45bpQYVtNFtbDx381DU7TG/TNBtrneOYJ2o4IZ+Z6fGKri8xSki0uv
	4fEcY0Saea8MMkRu60XGHS0NA91MgCPimPMJgImAJ3wGXHwx5J5UKoVG/adtxc2ymdYe
	ZiW8MB9QdrEH3ZrviNKyirLejV/MkQXQ4+9Huxy5PS12n3j42LFKbkDBmYMFMv8/e7jr
	SBLA==
X-Received: by 10.152.19.1 with SMTP id a1mr12079873lae.8.1377207446800;
	Thu, 22 Aug 2013 14:37:26 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id q5sm5669375lbe.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 14:37:26 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VCcZI-0002LX-4X; Fri, 23 Aug 2013 00:37:24 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 00:37:22 +0300
Message-Id: <cover.1377207091.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/2] Automake-1.13
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
X-List-Received-Date: Thu, 22 Aug 2013 21:37:27 -0000

gtk-engines fix updated, and the automake update patch itself added to
the set. It's probably better to leave latter to beginning of new cycle (1.6)
than to push it in just before 1.5 freeze, as it might break number of
recipes in other layers.

The following changes since commit e473e60d5572f36829068f6d3db9ce9ba9633d71:

  mkfontscale: This no longer needs a full libx11, xproto suffices (2013-08-22 18:29:50 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/am13
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/am13

Marko Lindqvist (2):
  gtk-engines: fix build with automake-1.13
  automake: update to upstream version 1.13.4

 .../prefer-cpio-over-pax-for-ustar-archives.patch  |   37 ++++++++++----------
 .../{automake_1.12.6.bb => automake_1.13.4.bb}     |    6 ++--
 .../gtk-engines-2.20.2/substitute-tests.patch      |   37 ++++++++++++++++++++
 .../gtk-engines/gtk-engines_2.20.2.bb              |    3 +-
 4 files changed, 60 insertions(+), 23 deletions(-)
 rename meta/recipes-devtools/automake/{automake_1.12.6.bb => automake_1.13.4.bb} (90%)
 create mode 100644 meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/substitute-tests.patch

-- 
1.7.10.4


