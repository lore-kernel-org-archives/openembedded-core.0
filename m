Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QPHm5-000834-KQ
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 19:21:37 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 May 2011 10:18:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,268,1304319600"; 
   d="scan'208";a="1564113"
Received: from unknown (HELO [10.255.12.133]) ([10.255.12.133])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2011 10:18:33 -0700
Message-ID: <4DDD39E9.6000307@linux.intel.com>
Date: Wed, 25 May 2011 10:18:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1306198151.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1306198151.git.nitin.a.kamble@intel.com>
Subject: Re: [UPGRADES 0/5] upgrade of some of the toolchain recipes
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
X-List-Received-Date: Wed, 25 May 2011 17:21:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/23/2011 05:50 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> The following changes since commit 3504c3a9b1af5a3405e0a03a5ade50b82535b6dd:
>
>    documentation/yocto-project-qs/yocto-project-qs.xml: fixed build env script (2011-05-23 15:53:29 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib.git nitin/upgrades
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/upgrades
>
> Nitin A Kamble (5):
>    git: upgrade from 1.7.4.3 to 1.7.5.1
>    libpcre: upgrade from 8.10 to 8.12
>    byacc: upgrade from 20101127 to 20101229
>    python-pygpbject: upgrade from 2.27 to 2.27.91
>    distro-tracking: update toolchain recipe fields
>
>   .../conf/distro/include/distro_tracking_fields.inc |    3 +++
>   meta/recipes-devtools/git/files/autotools.patch    |   16 ----------------
>   meta/recipes-devtools/git/git.inc                  |    3 +--
>   .../git/{git_1.7.4.3.bb =>  git_1.7.5.1.bb}         |    6 +++---
>   ...bject_2.27.0.bb =>  python-pygobject_2.27.91.bb} |    6 +++---
>   meta/recipes-extended/byacc/byacc_20101127.bb      |    7 -------
>   meta/recipes-extended/byacc/byacc_20101229.bb      |    7 +++++++
>   .../libpcre/{libpcre_8.10.bb =>  libpcre_8.12.bb}   |    6 +++---
>   8 files changed, 20 insertions(+), 34 deletions(-)
>   delete mode 100644 meta/recipes-devtools/git/files/autotools.patch
>   rename meta/recipes-devtools/git/{git_1.7.4.3.bb =>  git_1.7.5.1.bb} (56%)
>   rename meta/recipes-devtools/python/{python-pygobject_2.27.0.bb =>  python-pygobject_2.27.91.bb} (87%)
>   delete mode 100644 meta/recipes-extended/byacc/byacc_20101127.bb
>   create mode 100644 meta/recipes-extended/byacc/byacc_20101229.bb
>   rename meta/recipes-support/libpcre/{libpcre_8.10.bb =>  libpcre_8.12.bb} (94%)
>
Merged into oe-core

Thanks
	Sau!



