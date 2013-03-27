Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <anders.roxell@gmail.com>) id 1UKqwq-000135-V3
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 15:03:42 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 27 Mar 2013 14:46:27 +0100
Received: by sestofb10.enea.se (Postfix, from userid 3976)	id 13F88288AF7;
	Wed, 27 Mar 2013 14:46:27 +0100 (CET)
From: <anders.roxell@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Mar 2013 14:46:21 +0100
Message-ID: <1364391983-9919-1-git-send-email-anders.roxell@gmail.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Received-SPF: Neutral (SESTOEX03.enea.se: 172.21.3.145 is neither permitted
	nor denied by domain of anders.roxell@gmail.com)
Cc: Anders Roxell <anders.roxell@enea.com>
Subject: [RFC][PATCH 0/2] Add support for customizing help text when running oe-init-build-env.
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
X-List-Received-Date: Wed, 27 Mar 2013 14:03:46 -0000
Content-Type: text/plain

From: Anders Roxell <anders.roxell@enea.com>

This patch set makes it possible to customize the help text
that gets presented to the user when running the oe-init-build-env
(using the $TEMPLATECONF variable).

Patch 2:
conf-notes.txt: add the cusomized text file.
needs to be applied to meta-yocto/conf directory in poky.

Anders Roxell (2):
  oe-setup-builddir: Possibility to customize text.
  conf-notes.txt: add the customized text file.

 meta/conf/conf-notes.txt  |    9 +++++++++
 scripts/oe-setup-builddir |   16 ++++++----------
 2 files changed, 15 insertions(+), 10 deletions(-)
 create mode 100644 meta/conf/conf-notes.txt

-- 
1.7.5.4



