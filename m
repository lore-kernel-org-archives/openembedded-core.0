Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@mail.chez-thomas.org>) id 1S3A8r-0000mO-PS
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 18:50:13 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 996)
	id 93AD4F812EE; Thu,  1 Mar 2012 10:41:44 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2012 10:41:36 -0700
Message-Id: <1330623698-25148-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH v2 0/2] Fix /etc/timestamp handling
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
X-List-Received-Date: Thu, 01 Mar 2012 17:50:14 -0000

Recent changes have attempted to make consistant use of /etc/timestamp
In particular
  5aab665 initscripts: Make /etc/timestamp consistent again.
  173a48f image.bbclass: Ensure timestamp matches format used in initscripts after recent changes
  e32e236 busybox: Enable 64 bit shell tests, and disable non-standard date format interpretation.

However, this format of the timestamp is not directly compatible with
the 'date' command line, so it must be reformatted for use.  Also,
the busybox CONFIG_FEATURE_DATE_COMPAT needs to be enabled so that all 
versions of 'date', whether from busybox or coreutils, agree on the format 
when setting the date from the command line.

Gary Thomas (2):
  initscripts: Properly format date when set from timestamp
  busybox: Restore 'date' compatability

 meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
 meta/recipes-core/busybox/busybox_1.19.3.bb        |    2 +-
 .../initscripts/initscripts-1.0/bootmisc.sh        |    2 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.7.6



