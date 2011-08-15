Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qt0eE-0007av-AN
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 19:08:22 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Aug 2011 10:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,375,1309762800"; d="scan'208";a="39716564"
Received: from unknown (HELO [10.255.14.242]) ([10.255.14.242])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2011 10:03:44 -0700
Message-ID: <4E495170.1050106@linux.intel.com>
Date: Mon, 15 Aug 2011 10:03:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313146924.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1313146924.git.lianhao.lu@intel.com>
Subject: Re: [PATCH v2 BUG #1236 0/2] Unify ldd/ldconfig for all multilib eglibcs
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
X-List-Received-Date: Mon, 15 Aug 2011 17:08:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2011 04:08 AM, Lianhao Lu wrote:
> This is rebase of original patch for bug #1236 to the latest oe-core master.
>
> The original pull request is at:
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-August/007365.html
>
> The following changes since commit a92d56058b21913570bb17ae416c3b00afce055e:
>    Kumar Gala (1):
>          gnome-doc-utils: respect python-dir setting EXTRA_OECONF
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib llu/bug1236-oecore
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug1236-oecore
>
> Lianhao Lu (2):
>    utils.bbclass/multilib.class: Added misc supporting functions.
>    eglibc: Modify ldd script according to multilib config.
>
>   meta/classes/multilib.bbclass                      |    7 ++-
>   meta/classes/utils.bbclass                         |   29 +++++++++++
>   meta/conf/bitbake.conf                             |    1 +
>   meta/conf/multilib.conf                            |    3 +
>   .../eglibc/eglibc-2.13/multilib_readlib.patch      |   17 ++++++
>   meta/recipes-core/eglibc/eglibc-ld.inc             |   54 ++++++++++++++++++++
>   meta/recipes-core/eglibc/eglibc.inc                |    1 +
>   meta/recipes-core/eglibc/eglibc_2.13.bb            |   13 ++++-
>   8 files changed, 123 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/multilib_readlib.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-ld.inc
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Merged into OE-Core

Thanks
	Sau!


