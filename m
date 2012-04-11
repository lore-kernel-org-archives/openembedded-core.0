Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SHoFD-0004pi-IL
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 05:29:19 +0200
Received: by yenm3 with SMTP id m3so291427yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 20:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=XNU0jaygFysC989OVOVAiYKL5Hm2ErQF3NkoR69+gj8=;
	b=uOKsRVFK5R1aO78peOY4zR+cbbw228HcPt9s8UG10G5ZvQi4AOomBTui0qBjOQ3fxG
	kOKgC19Nagjdz7Pmbv0ag6+uNAw+WvjK2eJEtiW4A6iV1StNN9PVWWD9pPAkdxDk52dD
	I3lF+B/HtyG92XBI/xUJzaB9wlPI7rOy7GrAmri4DN3OD4MWJFBb1X0PUAnb8H9QJgZT
	wtg2qaXpAVIjMb2L+I9jZGZkr9OIBR5YFcHRG1AGYfBL9X+cYjcW8oySW8t/qi4YdwPW
	CKIJbt0xkaVn0gqQdgp4qFuKTMfgCttLBMTVJYvzST+3hvvML5CsAA2YM3IQYX47oL+N
	YI3w==
Received: by 10.236.9.35 with SMTP id 23mr11735002yhs.41.1334114400617;
	Tue, 10 Apr 2012 20:20:00 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id r62sm5091146yhb.14.2012.04.10.20.19.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 20:20:00 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 03:19:49 +0000
Message-Id: <cover.1334114318.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/3] Important fixes for rc3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2012 03:29:19 -0000

The patches in this set are all important IMO and I do think they
ought to be included.

The following changes since commit bde1744018afd4616e114b20ffdc21b9abddcedc:

  hello-mod: Move hello-mod from meta to meta-skeleton (2012-04-10 13:16:00 +0100)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (3):
  connman: backport test script fixes
  distrodata.bbclass: fix comment typo
  flex: backport Debian patches to fix generated code warnings

 meta/classes/distrodata.bbclass                    |    2 +-
 .../connman/test-set-ipv4-method-api-fix.patch     |   50 +++++++++++++++++
 .../connman/test-set-ipv6-method-api-fix.patch     |   55 ++++++++++++++++++
 meta/recipes-connectivity/connman/connman_0.79.bb  |    4 +
 .../flex/flex/avoid-FORTIFY-warnings.patch         |   59 ++++++++++++++++++++
 .../flex/int-is-not-the-same-size-as-size_t.patch  |   42 ++++++++++++++
 meta/recipes-devtools/flex/flex_2.5.35.bb          |    5 +-
 7 files changed, 215 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
 create mode 100644 meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch
 create mode 100644 meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.patch

-- 
1.7.2.5



