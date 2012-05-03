Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SQ285-0000iM-O5
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 21:55:58 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 May 2012 12:46:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96099608"
Received: from unknown (HELO [10.255.12.171]) ([10.255.12.171])
	by AZSMGA002.ch.intel.com with ESMTP; 03 May 2012 12:46:08 -0700
Message-ID: <4FA2E07F.9030202@linux.intel.com>
Date: Thu, 03 May 2012 12:46:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335888041.git.kergoth@gmail.com>
In-Reply-To: <cover.1335888041.git.kergoth@gmail.com>
Subject: Re: [PATCH 0/6] A few misc. commits I had pending
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
X-List-Received-Date: Thu, 03 May 2012 19:55:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/01/2012 09:02 AM, Christopher Larson wrote:
> Most of these are pretty simple and obvious fixes, but this also changes
> base.bbclass to use isinstance instead of bb.event.getName(), and also shifts
> the information used to display the build config summary at the start of the
> build into bitbake.conf as variables, so it's possible to easily add to the
> list of variables and content to be emitted there. As one example, I have
> a change to csl-versions.inc which adds the external toolchain version string
> to the summary.
>
> The following changes since commit 26d822ad059dd4839cc6fee2a65714e73cc146e1:
>
>    nfs-utils: don't try to unload nfsd module (2012-05-01 14:28:47 +0100)
>
> are available in the git repository at:
>    git://github.com/kergoth/oe-core misc-fixes
>
> Christopher Larson (6):
>        mesa: add missing flex-native/bison-native deps
>        distcc: use PACKAGECONFIG for x11 distro feature
>        libpcap: use PACKAGECONFIG for bluetooth distro feature
>        libsndfile1: use PACKAGECONFIG for alsa distro feature
>        bitbake.conf: shift build config summary control to here
>        base.bbclass: use isinstance for base_eventhandler
>
>   meta/classes/base.bbclass                          |   56 ++++++++++++-------
>   meta/conf/bitbake.conf                             |    7 +++
>   meta/recipes-connectivity/libpcap/libpcap.inc      |    5 ++-
>   meta/recipes-devtools/distcc/distcc_2.18.3.bb      |   14 +++--
>   meta/recipes-graphics/mesa/mesa-common.inc         |    2 +-
>   .../libsndfile/libsndfile1_1.0.25.bb               |    5 ++-
>   6 files changed, 59 insertions(+), 30 deletions(-)
>
> Christopher Larson (6):
>    mesa: add missing flex-native/bison-native deps
>    distcc: use PACKAGECONFIG for x11 distro feature
>    libpcap: use PACKAGECONFIG for bluetooth distro feature
>    libsndfile1: use PACKAGECONFIG for alsa distro feature
>    bitbake.conf: shift build config summary control to here
>    base.bbclass: use isinstance for base_eventhandler
>
>   meta/classes/base.bbclass                          |   56 ++++++++++++-------
>   meta/conf/bitbake.conf                             |    7 +++
>   meta/recipes-connectivity/libpcap/libpcap.inc      |    5 ++-
>   meta/recipes-devtools/distcc/distcc_2.18.3.bb      |   14 +++--
>   meta/recipes-graphics/mesa/mesa-common.inc         |    2 +-
>   .../libsndfile/libsndfile1_1.0.25.bb               |    5 ++-
>   6 files changed, 59 insertions(+), 30 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


