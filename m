Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QW0Pw-0005UG-E4
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 08:14:32 +0200
Received: by pwj9 with SMTP id 9so2072308pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2011 23:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=zC3a0b8aoR24eGQEDgiFfe1n9ePWZ+zUKtWCFD0rYUs=;
	b=rRqpjqR2fErjPt2NzVk+H95jjXxGsIAV3HIUxUI9JsTXuHHV28wsG5TlFrJ309kkWE
	C51/KExlDYTSjNvjX9BbD0Fik2sXJ53njXfz/eflY6sChtM6rwHbuC7gwn8JnNat+i1H
	xmUfMrMTTztwm19LbthND7TWFcnl7PKj3oMZE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=DzOBUWM2reCo8YnszTNd0GUTOXTeKlB0p8jywHq4yjONWBiOtNceTNbgGrWgdoKj2h
	5gdpEGjyU8gUBdIsvjvBTqgs1oORs91vlGWLgk0r0nlT5c57P86eYnBW5H1LpKGemL1s
	AGOo2dQ6o5ydPeCjb8xUkz3WsESv81E1C/omE=
Received: by 10.68.14.74 with SMTP id n10mr2007182pbc.489.1307945467241;
	Sun, 12 Jun 2011 23:11:07 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p5sm4384596pbk.52.2011.06.12.23.11.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 12 Jun 2011 23:11:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2011 23:10:42 -0700
Message-Id: <cover.1307945310.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] Bump up eglibc SRCREVs
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
X-List-Received-Date: Mon, 13 Jun 2011 06:14:32 -0000

We need patch to fix the build error we are seeing when disabling
OPTION_EGLIBC_RTLD_DEBUG. This patch updates SRCREVs for eglibc and
brings in the required patch.

The following changes since commit 045ee314994c747481f56b015c5ab5c138d74d03:

  eglibc 2.12/2.13: Upgrade SRCREV (2011-06-12 23:05:16 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/eglibc-update
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/eglibc-update

Khem Raj (1):
  eglibc 2.12/2.13: Upgrade SRCREV

 meta/recipes-core/eglibc/eglibc_2.12.bb |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.4.1



