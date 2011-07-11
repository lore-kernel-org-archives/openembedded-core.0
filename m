Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QgPhn-0005Xj-2D
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 01:15:59 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 11 Jul 2011 16:12:00 -0700
Received: by wye20 with SMTP id 20so2992934wye.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 16:11:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.187.65 with SMTP id x43mr4649791wem.62.1310425918980; Mon,
	11 Jul 2011 16:11:58 -0700 (PDT)
Received: by 10.216.155.16 with HTTP; Mon, 11 Jul 2011 16:11:58 -0700 (PDT)
Date: Mon, 11 Jul 2011 16:11:58 -0700
Message-ID: <CAPhnLPCXP0mPU6=WxG8n-zLJJOozwyqZo9pMqkrmO4gdOJrDOg@mail.gmail.com>
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
X-List-Received-Date: Mon, 11 Jul 2011 23:15:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

Requested by a member of the community, this fixes a few issues with license
wrangling. Specifically,

- licenses are now wrangled into:
  ${DEPLOY_DIR}/licenses/${IMAGE_NAME}/datetimestamp
  This keeps multiple runs of a build from polluting the licenses of a
previous build
- remove all wrangling of -native and -cross licenses:
  if it's not on the image, then having the license isn't useful and
in fact, is harmful
- create a manifest
  on BuildCompleted we take all the wrangled licenses and give a
manifest with all the
  *known* common licenses. If license.bbclass doesn't know the common, we don't
  include it.
- Since we have + licenses, we can now deal with them correctly.

The following changes since commit 2c79c9eb7ef8ef0aef8c3096c3c4387e28e56ea2:

  pulseaudio: add 0.9.23 (2011-07-07 13:45:32 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib eflanagan/license_pn
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=eflanagan/license_pn

Beth Flanagan (1):
  license.bbclass: License Manifests and more.

 meta/classes/license.bbclass |  179 ++++++++++++++++++++++++++++--------------
 1 files changed, 120 insertions(+), 59 deletions(-)


