Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RKztB-0000LC-VZ
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 22:59:30 +0100
Received: from localhost (c-98-246-160-155.hsd1.or.comcast.net
	[98.246.160.155])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id A078D30435
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 17:53:19 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2011 14:53:15 -0700
Message-Id: <cover.1320097891.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: A078D30435.F3A77
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] distro tracking date format fix
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
X-List-Received-Date: Mon, 31 Oct 2011 21:59:30 -0000

Hi Saul,

This converts all of the dates used in distro_tracking_fields.inc to
use the format you've been requesting. 

Scott

The following changes since commit ff13e06892f102d915855cde50896349b07b3717:

  clutter-gtk: add LIC_FILES_CHKSUM to include file (2011-10-31 10:46:59 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/date-fmt-fix-final
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/date-fmt-fix-final

Scott Garman (1):
  distro_tracking_fields.inc: standardize date format

 .../conf/distro/include/distro_tracking_fields.inc |  594 ++++++++++----------
 1 files changed, 297 insertions(+), 297 deletions(-)

-- 
1.7.5.4



