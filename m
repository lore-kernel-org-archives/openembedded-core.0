Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjEyj-0007fN-3h
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 20:25:11 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Jul 2011 11:20:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,229,1309762800"; d="scan'208";a="27702538"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by orsmga002.jf.intel.com with ESMTP; 19 Jul 2011 11:20:39 -0700
Message-ID: <4E25CAF7.7060808@linux.intel.com>
Date: Tue, 19 Jul 2011 11:20:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1310797743.git.raj.khem@gmail.com>
In-Reply-To: <cover.1310797743.git.raj.khem@gmail.com>
Subject: Re: [PATCH v2 0/5] Make oecore default images buildable with	uclibc
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
X-List-Received-Date: Tue, 19 Jul 2011 18:25:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/15/2011 11:33 PM, Khem Raj wrote:
> Changes On top of v1
>
> Fixed gettext class to not disable nls for non target recipes
>
> Build core-image-minimal for qemuarm qemumips qemuppc and booted on qemu
> successfully
>
> Build for TCLIBC=uclibc from scratch succeeds
>
> The following changes since commit 3d2c1ca9096790e4c6922b65b83ea1dffb90c362:
>
>    util-linux: Replace sigsetmask with posix compliant functions (2011-07-15 18:52:49 -0700)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-oecore
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-oecore
>
> Khem Raj (5):
>    bitbake.conf: Change TERM default fallback to XTERM instead of
>      GNOME_TERM
>    oe-buildenv-internal: Replace POKYMODE POKYLIBC with TCMODE and
>      TCLIBC
Merged these 2, others were pulled at submitter's request.

Thanks
	Sau!

>    default-distrovars: Add largefile to DISTRO_FEATURES
>    acl,attr: Fix build failures when NLS is disabled on uclibc
>    classes/gettext: Do not disable nls for non target recipes
>
>   meta/classes/gettext.bbclass                    |    2 +-
>   meta/conf/bitbake.conf                          |    4 ++--
>   meta/conf/distro/include/default-distrovars.inc |    3 +--
>   meta/recipes-support/attr/acl_2.2.51.bb         |    2 +-
>   meta/recipes-support/attr/attr.inc              |    4 ----
>   meta/recipes-support/attr/attr_2.4.46.bb        |    2 +-
>   meta/recipes-support/attr/ea-acl.inc            |    3 +++
>   scripts/oe-buildenv-internal                    |    2 +-
>   8 files changed, 10 insertions(+), 12 deletions(-)
>


