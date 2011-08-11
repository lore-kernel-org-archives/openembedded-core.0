Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qrdxp-0004le-A6
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 00:42:57 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 Aug 2011 15:38:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,359,1309762800"; 
   d="scan'208";a="6322809"
Received: from unknown (HELO [10.255.14.248]) ([10.255.14.248])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Aug 2011 15:38:23 -0700
Message-ID: <4E4459DE.1000007@linux.intel.com>
Date: Thu, 11 Aug 2011 15:38:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1312195779.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1312195779.git.lianhao.lu@intel.com>
Subject: Re: [PATCH BUG #1236 0/3] Unify ldd/ldconfig for all multilib eglibcs
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
X-List-Received-Date: Thu, 11 Aug 2011 22:42:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2011 04:01 AM, Lianhao Lu wrote:
> This series of patch allow all the eglibc(s) in the current multilib
> configuration have the same ldd/ldconfig settings.
>
> We put the dynamic loaders'(ld.so) names in the dictionary of "ld_info_all"
> defined in the file eglibc-ld.inc. This dictionary is indexed by the
> TUNENAME. To support a new ABI, new entry should be added into this
> dictionary along with the new ABI's TUNENAME.
>
> The information in ld_info_all can be used for both ldd script and ldconfig
> binary.
>
> The following changes since commit f94b781695cd8fa387daff16ecbf3987a0883018:
>    Bruce Ashfield (1):
>          poky.conf: explicitly referenced preferred linux-yocto version
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib llu/bug1236
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=llu/bug1236
>
> Lianhao Lu (3):
>    utils.bbclass/multilib.conf: Added misc supporting functions.
>    eglibc: Modify ldd script according to multilib config.
>    eglibc: Setting KNOWN_INTERPRETER_NAMES for ldconfig.
>
>   meta/classes/utils.bbclass                         |   31 ++++++++++++
>   meta/conf/bitbake.conf                             |    1 +
>   meta/conf/multilib.conf                            |    6 ++-
>   .../eglibc/eglibc-2.13/multilib_readlib.patch      |   20 ++++++++
>   meta/recipes-core/eglibc/eglibc-ld.inc             |   49 ++++++++++++++++++++
>   meta/recipes-core/eglibc/eglibc.inc                |    1 +
>   meta/recipes-core/eglibc/eglibc_2.13.bb            |   12 ++++-
>   7 files changed, 118 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/multilib_readlib.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-ld.inc
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Can you please rebase and test this and resend.

Thanks
	Sau!


