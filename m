Return-Path: <blloyd@familyhonor.net>
Received: from mho-01-ewr.mailhop.org (mho-03-ewr.mailhop.org [204.13.248.66])
	by mail.openembedded.org (Postfix) with ESMTP id 35E1A6D1C4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 06:54:26 +0000 (UTC)
Received: from [98.142.64.238] (helo=lloydserv.home.familyhonor.net)
	by mho-01-ewr.mailhop.org with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.72) (envelope-from <blloyd@familyhonor.net>)
	id 1Vbm9D-0009go-2D for openembedded-core@lists.openembedded.org;
	Thu, 31 Oct 2013 06:54:28 +0000
Received: from omclinuxballt.home.familyhonor.net ([192.168.0.83])
	(authenticated bits=0)
	by lloydserv.home.familyhonor.net (8.14.6/8.14.6) with ESMTP id
	r9V6s7dt005528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 01:54:15 -0500
X-Mail-Handler: Dyn Standard SMTP by Dyn
X-Originating-IP: 98.142.64.238
X-Report-Abuse-To: abuse@dyndns.com (see
	http://www.dyndns.com/services/sendlabs/outbound_abuse.html for
	abuse reporting information)
X-MHO-User: U2FsdGVkX1/IAZ+DJAj95yFAzAehaXq52wKjyHQqk+U=
From: blloyd <blloyd@familyhonor.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2013 01:54:03 -0500
Message-Id: <cover.1383197850.git.blloyd@familyhonor.net>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/1] GDB Enhancements for device threaded core support
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
X-List-Received-Date: Thu, 31 Oct 2013 06:54:26 -0000

core file generation can create a broken core file when threading is used in the application.  This change provides updates to the gdb package so multi-threaded applications debugging from failures works properly from end devices that include gdb.

The following changes since commit 523f2a9ea970713fb775bc48f84b67420b1106a0:

  cross-canadian: Improve comment (2013-10-30 18:01:34 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib blloyd/gdb_assist
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=blloyd/gdb_assist

blloyd (1):
  Enhancements to allow core file debugging to work properly from
    devices

 meta/recipes-devtools/gdb/gdb-common.inc | 12 +++++++-----
 meta/recipes-devtools/gdb/gdb.inc        |  9 ++++++++-
 2 files changed, 15 insertions(+), 6 deletions(-)

-- 
1.8.1.4


