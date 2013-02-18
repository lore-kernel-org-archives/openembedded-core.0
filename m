Received: from mail-wg0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U7UHB-0006JW-QI
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 18:13:14 +0100
Received: by mail-wg0-f47.google.com with SMTP id dr13so4656949wgb.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 08:57:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=tNXIVlSX+MMmX6vfuxrZYiyXYd7URtBjSFiMYET9tug=;
	b=aa+dwYxej77VaiNPWN7NkyU7njnEjERxwGrIE7uPb78HwEwaCgd6ytV3w2QGve2Cz+
	vTOJpUehVcKcMJeDct/xxWCH3m9GVEj3vw6BXyilraQo+npZ7gVW9S957NDG/Ungq94r
	aBz/EsUUV/jwsMiMq/C0EEugA55DiYhS5UlxkNdxkJnQtUPt1GVQryk7S9LxVAvaMoZk
	B95uRD8i09LrYbOC4q6s6A8V2Y9TB9CG4/MEsf25Owfv5yFgoPW6D/MjRbnwidKyXFlY
	iLpyRu9FMho4xlk6jDvoSz7tqSRH2tk3N1v8Cv6VhHm8OK5+Z914rylNlr85yTLET8+T
	3ocg==
X-Received: by 10.180.104.10 with SMTP id ga10mr19871318wib.23.1361206625373; 
	Mon, 18 Feb 2013 08:57:05 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id eo1sm20958966wib.8.2013.02.18.08.57.03
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Feb 2013 08:57:04 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2013 16:54:45 +0000
Message-Id: <cover.1361206387.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkP1OIIP0MP1A6kiDvwhkfjROoh4w+YIzRfSn8I1LD6bTVsqsj+ZKk6YxOBh3SGcuVoGINC
Subject: [PATCH 0/3] Matchbox Keyboard fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Feb 2013 17:13:15 -0000

Hi,

Some fixes to improve the usability of the virtual keyboard, mainly if the
formfactor says we don't have a keyboard then add the keyboard applet to the
panel so that it can be forced on and off.

Not ideal, but the keyboard/toolkit bridge is (currently) GTK+ 2 specific.

Ross

The following changes since commit c7b23ab68aafc04d9830ef318015912e5d4f0672:

  maintainers.inc: update ownership of recipes (2013-02-17 22:33:30 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/keyboard

for you to fetch changes up to 2ee6d593467cf4ab49bf8a51f35550be5bf0360e:

  matchbox-session-sato: start the keyboard applet if we have no keyboard (2013-02-18 11:04:49 +0000)

----------------------------------------------------------------
Ross Burton (3):
      matchbox-keyboard: general clean up
      matchbox-keyboard: add RRECOMMENDS to matchbox-keyboard-applet
      matchbox-session-sato: start the keyboard applet if we have no keyboard

 .../matchbox-keyboard/matchbox-keyboard_git.bb     |   21 +++++++++++---------
 .../matchbox-sato/matchbox-session-sato/session    |    9 ++++++++-
 2 files changed, 20 insertions(+), 10 deletions(-)

Ross Burton (3):
  matchbox-keyboard: general clean up
  matchbox-keyboard: add RRECOMMENDS to matchbox-keyboard-applet
  matchbox-session-sato: start the keyboard applet if we have no
    keyboard

 .../matchbox-keyboard/matchbox-keyboard_git.bb     |   21 +++++++++++---------
 .../matchbox-sato/matchbox-session-sato/session    |    9 ++++++++-
 2 files changed, 20 insertions(+), 10 deletions(-)

-- 
1.7.10.4



