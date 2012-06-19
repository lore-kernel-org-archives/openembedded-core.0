Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <dany@sestofb10.enea.se>) id 1SjRAJ-0003vy-Lz
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2012 10:30:27 +0200
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.247.3;
	Tue, 26 Jun 2012 10:19:35 +0200
Received: by sestofb10.enea.se (Postfix, from userid 3958)	id CF73E283A3F;
	Tue, 19 Jun 2012 13:49:20 +0200 (CEST)
From: <david.nystrom@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jun 2012 13:48:48 +0200
Message-ID: <1340106529-47436-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: david.nystrom@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] eglibc backport of ARM ucontext
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
X-List-Received-Date: Tue, 26 Jun 2012 08:30:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: David Nystr=C3=B6m <david.nystrom@enea.com>

Last patch sent was corrupted due to sendmail issues,
lets hope for better luck this time :).

Allows for setcontext, getcontext swapcontext et.c. on ARM targets.

David Nystr=C3=B6m (1):
  Added backported ucontext support for ARM in eglibc

 meta/recipes-core/eglibc/eglibc_2.13.bb            |    1 +
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    1 +
 .../eglibc/files/0001-ucontext-for-arm.patch       |  434 ++++++++++++++++=
++++
 3 files changed, 436 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/files/0001-ucontext-for-arm.pa=
tch

--=20
1.7.5.4



