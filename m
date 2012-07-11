Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SozW5-0008B1-GE
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 18:11:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q6BG0e67018178
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 09:00:40 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 11 Jul 2012 09:00:39 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 11:00:38 -0500
Message-ID: <cover.1342022120.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] package.bbclass: Allow overriding of debugedit starting path
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
X-List-Received-Date: Wed, 11 Jul 2012 16:11:53 -0000
Content-Type: text/plain

We use a prebuilt toolchain which has all debug symbols start out
looking like

/opt/windriver/wrlinux/ia32/i686-wrs-linux-gnu/src/...

and we'd rather not start populating /opt on targets when we have all
this lovely logic for debug sources.  This patch provides a generic
hook for overriding the starting path that debugedit will replace with
the canonical debugsrc path.  This strikes me as a pretty low-impact
alternative to, say, encouraging such recipes to call debugedit
directly.

I am open to the idea of allowing a replacement to be specified,
too, but I didn't need that and don't immediately see why it'd matter.

And since I switch between scripting languages really often, and
this is a source of confusion:  Yes, in Python, ("" or x) yields x.

The following changes since commit 20405bdab18b7a2b101f818e72863d289d5945e4:
  Bruce Ashfield (1):
        linux-yocto/3.0: perf scripting support

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/debugsrc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/debugsrc

Peter Seebach (1):
  package.bbclass: Allow overriding of debugedit starting path

 meta/classes/package.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)



