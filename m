Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1UDB6d-0002QF-H8
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 10:58:03 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1; Wed, 6 Mar 2013
	10:41:20 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 705FD289654;
	Wed,  6 Mar 2013 10:41:20 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Mar 2013 10:41:07 +0100
Message-ID: <1362562871-16878-1-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 0/4] Move ptest checks from recipes to ptest.bbclass
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
X-List-Received-Date: Wed, 06 Mar 2013 09:58:07 -0000
X-List-Received-Date: Wed, 06 Mar 2013 09:58:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In response to feedback about the ptest checks added to recipes when
implementing ptest, I have changed it so those checks now only exist in
ptest.bbclass and recipes instead use dedicated _ptest functions to define
ptest-specific actions.

Bj=C3=B6rn Stenberg (4):
  ptest: Move ptest checks from recipes to ptest.bbclass
  dbus: Use new _ptest functions
  glib: Use new _ptest functions
  bash: Use new _ptest functions

 meta/classes/ptest.bbclass                    |   35 ++++++++++++++++++++-=
---
 meta/recipes-core/dbus/dbus-ptest_1.6.8.bb    |    4 ++-
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb |    2 -
 meta/recipes-extended/bash/bash.inc           |   15 ++++------
 4 files changed, 38 insertions(+), 18 deletions(-)

--=20
1.7.5.4



