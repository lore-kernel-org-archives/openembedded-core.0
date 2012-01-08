Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RjxCU-000708-0O
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jan 2012 19:10:34 +0100
Received: (qmail invoked by alias); 08 Jan 2012 18:03:07 -0000
Received: from p4FDF1573.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.21.115]
	by mail.gmx.net (mp034) with SMTP; 08 Jan 2012 19:03:07 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/FX79RNl7F46FocT8JJoznYTFZYIGkeOds+VU2Fr
	cXG8C9Ya+lIquy
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jan 2012 19:04:07 +0100
Message-Id: <1326045849-21938-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [PATCH 0/2] libusb1/libusb-compat keep *.la in base_libdir
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
X-List-Received-Date: Sun, 08 Jan 2012 18:10:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

libusb-compat did not yet cause a build error but it is motivated by the
experience with libusb1.

I will be out until 12. and can not respond on comments until then.

Andreas Müller (2):
  libusb1: keep *.la in base_libdir
  libusb-compat: keep *.la in base_libdir

 meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    3 +--
 meta/recipes-support/libusb/libusb1_1.0.8.bb       |    3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

-- 
1.7.4.4



