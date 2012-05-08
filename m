Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SRagM-0007mv-0t
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 05:01:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q482pr7D023839
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 May 2012 19:51:53 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 7 May 2012 19:51:53 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 May 2012 10:50:07 +0800
Message-ID: <cover.1336445265.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] sanity.bbclass: check TMPDIR is not too long
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
X-List-Received-Date: Tue, 08 May 2012 03:01:46 -0000
Content-Type: text/plain

Here are the output message:
* When the length of TMPDIR is longer than 180:
  The path length of TMPDIR is too long, this would cause the "Argument list too long" error, please use a shorter path.

// Robert

The following changes since commit 2929e7d590862d9649458c90804e79a1dce40423:

  glib-2.0: Fix issues with libelf dependency creeping in (2012-05-07 10:53:24 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/tmpdir
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/tmpdir

Robert Yang (1):
  sanity.bbclass: check TMPDIR is not too long

 meta/classes/sanity.bbclass |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)



