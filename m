Return-Path: <blloyd@familyhonor.net>
Received: from mho-02-ewr.mailhop.org (mho-02-ewr.mailhop.org [204.13.248.72])
	by mail.openembedded.org (Postfix) with ESMTP id E803E6D4ED
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 06:24:24 +0000 (UTC)
Received: from [98.142.64.238] (helo=lloydserv.home.familyhonor.net)
	by mho-02-ewr.mailhop.org with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.72) (envelope-from <blloyd@familyhonor.net>)
	id 1Vc89i-000ApM-Qk for openembedded-core@lists.openembedded.org;
	Fri, 01 Nov 2013 06:24:26 +0000
Received: from omclinuxballt.home.familyhonor.net ([192.168.0.83])
	(authenticated bits=0)
	by lloydserv.home.familyhonor.net (8.14.7/8.14.6) with ESMTP id
	rA16OFsY015287
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Nov 2013 01:24:24 -0500
X-Mail-Handler: Dyn Standard SMTP by Dyn
X-Originating-IP: 98.142.64.238
X-Report-Abuse-To: abuse@dyndns.com (see
	http://www.dyndns.com/services/sendlabs/outbound_abuse.html for
	abuse reporting information)
X-MHO-User: U2FsdGVkX1/4NjUgg8ZJLiPjAvpRSw/8lB8fIqQ5TZs=
From: blloyd <blloyd@familyhonor.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Nov 2013 01:24:11 -0500
Message-Id: <cover.1383278419.git.blloyd@familyhonor.net>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH v2 0/1] GDB Enhancements for device threaded core support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Nov 2013 06:24:26 -0000

core file generation can create a broken core file when threading is used in the application.  
This change provides updates to the gdb package so multi-threaded applications debugging from failures works properly from end devices that include gdb.

The following changes since commit 523f2a9ea970713fb775bc48f84b67420b1106a0:

  cross-canadian: Improve comment (2013-10-30 18:01:34 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib blloyd/gdb_assist_v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=blloyd/gdb_assist_v2

blloyd (1):
  Enhancements to let multi-threaded debugging function correctly on
    devices

 meta/recipes-devtools/gdb/gdb-common.inc | 12 +++++++-----
 meta/recipes-devtools/gdb/gdb.inc        |  9 ++++++++-
 2 files changed, 15 insertions(+), 6 deletions(-)

-- 
1.8.1.4


