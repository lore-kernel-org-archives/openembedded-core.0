Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 712116065B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 14:03:33 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id er20so5806566lab.33
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 07:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ehw/JxFz1F6Uv4KRKBFSGpToHWyd+tIXgiUBbZTxSnk=;
	b=qX18xjmRmFLblKgQGtuJMZf8Dhjm72I8sF2jL7XKNXMbR4hzjxriDcleECZ6chXKTT
	12iH9OHLvO+zWaySjQZaYsBqk5K9bYvwsXdV5SMNOftSgV7iddyXFJL4UeukNnCbT/Lk
	vqur0eNj2I+LS0wI96A78uq0sECGjBTurPoOPzzCRcZM/IXjx3QZ1VIpm+IZ/XfwsT/F
	yv5i9qprZ+hI6hFHQdW/MGVo7DIuga8wygkzpPnyU3uKvMwCG2FVMIgPNCUd6DD+8QOF
	YJYVActkIzqA+jA5LEHHboWDHUZi3pwGaj5UZtigSrqbximyGYBHQULMRGd3Z8JRTjD/
	i5OQ==
X-Received: by 10.112.149.8 with SMTP id tw8mr12312182lbb.117.1369577012459;
	Sun, 26 May 2013 07:03:32 -0700 (PDT)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPSA id f8sm9872330lbr.10.2013.05.26.07.03.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 26 May 2013 07:03:31 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1UgbXm-0000Iw-3D; Sun, 26 May 2013 17:03:30 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2013 17:03:28 +0300
Message-Id: <cover.1369576071.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/1] RFC: Add recipe of gtk3 version of vte alongside gtk2 one.
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
X-List-Received-Date: Sun, 26 May 2013 14:03:33 -0000

RFC only! Patch is only build-tested.

Last gtk2-compatible version of vte is 0.28.2 currently present on OE core.
Later versions depend on gtk3. Since gtk3 exist in OE core, it would make
sense to be able to build version of vte (and other similar packages)
that does not depend on gtk2. Otherwise we end with systems that must
contain both gtk2 (to be used by some programs) and gtk3 (to be used by
other programs).
This patch just adds new recipe for latest vte version, 0.34.5, alongside
with 0.28.2 version.
How should priorities be set? "1" for gtk2-version, so it gets selected despite gtk3-version being newer?


 - ML

The following changes since commit 8f5bc47729edb8cb051d81e9ff1680cb8d2eca25:

  dropbear: a fix for hang in dropbearkey, built for x32 (2013-05-24 14:14:30 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/rfc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/rfc

Marko Lindqvist (1):
  vte: add 0.34.5 recipe

 .../vte/vte-0.34.5/obsolete_automake_macros.patch        |   14 ++++++++++++++
 meta/recipes-support/vte/vte.inc                         |    4 +++-
 meta/recipes-support/vte/vte_0.28.2.bb                   |    6 ++++--
 meta/recipes-support/vte/vte_0.34.5.bb                   |   12 ++++++++++++
 4 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/vte/vte-0.34.5/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-support/vte/vte_0.34.5.bb

-- 
1.7.10.4


