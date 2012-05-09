Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SSDA0-0002vr-Ir
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 22:06:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q49Jv2jf028117
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 12:57:02 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 9 May 2012 12:57:02 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 May 2012 15:00:05 -0500
Message-ID: <cover.1336593352.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/2] v2 Import the blacklist functionality from meta-oe
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
X-List-Received-Date: Wed, 09 May 2012 20:06:57 -0000
Content-Type: text/plain

Refactor from v1.  Include the original functionality from meta-oe, it
has been changed based on comments both on the list and off.  And I believe
greatly simplified.

It is expected that distributions who need the old functionality may
continue to use the old blacklist.bbclass in their layers.

One additional note, I had people ask why I need this functionality.  The
issue is that we intend to use OE-Core release almost exactly as-is.  But
we have to sent reasonable support boundries for our customers.  This will
allow us to declare certain items as unsupported, and if the end user
wishes to clear the blacklist they can.

The following changes since commit 043871d7e5d2d19c2ff43e54d2ff180c09e8903e:

  kern-tools: integrate minor fixes (2012-05-08 16:06:15 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/blacklist
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/blacklist

Mark Hatle (2):
  blacklist: fix typo in name
  blacklist.bbclass: Refactor, use PNBLACKLIST[pn]

 meta/classes/blacklist.bbclass |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/blacklist.bbclass

-- 
1.7.3.4



