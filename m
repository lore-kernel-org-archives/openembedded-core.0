Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QlUa5-0006kB-TH
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 01:29:02 +0200
Received: from mail-gw0-f52.google.com ([74.125.83.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 25 Jul 2011 16:24:47 -0700
Received: by gwj15 with SMTP id 15so4069077gwj.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 16:24:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.185.169 with SMTP id u29mr6682316yhm.108.1311636287150;
	Mon, 25 Jul 2011 16:24:47 -0700 (PDT)
Received: by 10.236.108.9 with HTTP; Mon, 25 Jul 2011 16:24:47 -0700 (PDT)
Date: Mon, 25 Jul 2011 16:24:47 -0700
Message-ID: <CAPhnLPC30D=CRQ5WQO9X_7Ub8bw1=ymLS_JMye10eVoD_b17aw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] Additional license wrangling functionality
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
X-List-Received-Date: Mon, 25 Jul 2011 23:29:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

Resubmitting this without manifest functionality. It's a longer discussion that
should be had. This has some basic functionality additions, bug fixes
and corrects
non-standard indentation.

The following changes since commit 819f18f8bc000f13b644edc194d2a12b4ea5fecf:

  Move architecture specific TARGET_OS mangling into tune files
(2011-07-25 14:36:30 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib eflanagan/lic_sans_manifest
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=eflanagan/license_sans_manifest

Beth Flanagan (1):
  license.bbclass: Splitting out licenses

 meta/classes/license.bbclass |  140 ++++++++++++++++++++++++------------------
 1 files changed, 81 insertions(+), 59 deletions(-)


