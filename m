Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QUkE8-0006A0-Cv
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 20:45:08 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jun 2011 11:41:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,342,1304319600"; d="scan'208";a="16293390"
Received: from unknown (HELO [10.255.12.216]) ([10.255.12.216])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2011 11:41:35 -0700
Message-ID: <4DF113DF.4000900@linux.intel.com>
Date: Thu, 09 Jun 2011 11:41:35 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1307558785.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1307558785.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/2] pseudo: Update pseudo to 1.1.1 version V3
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
X-List-Received-Date: Thu, 09 Jun 2011 18:45:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2011 11:48 AM, Mark Hatle wrote:
> Hopefully third and final version.  The patch that is part of this has been
> contribed to and reviewed upstream.  (Not yet accepted upstream)
>
> V3 fixes an issue with building on a 32-bit host.
>
> The following changes since commit 30101d4153aa8e116892063933b868d325bdd79c:
>
>    distro tracking: Manual Updates (2011-06-06 23:51:26 -0700)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/pseudo
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/pseudo
>
> Mark Hatle (2):
>    pseudo: Update pseudo to 1.1.1 version
>    distro_tracking_fields.inc: add pseudo
>
>   .../conf/distro/include/distro_tracking_fields.inc |    6 ++
>   meta/recipes-devtools/pseudo/pseudo.inc            |   20 +++++--
>   .../recipes-devtools/pseudo/pseudo/oe-config.patch |   58 ++++++++++++++++++++
>   meta/recipes-devtools/pseudo/pseudo_1.0.bb         |    9 ---
>   meta/recipes-devtools/pseudo/pseudo_1.1.1.bb       |   10 ++++
>   meta/recipes-devtools/pseudo/pseudo_git.bb         |    7 ++-
>   6 files changed, 92 insertions(+), 18 deletions(-)
>   create mode 100644 meta/recipes-devtools/pseudo/pseudo/oe-config.patch
>   delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.0.bb
>   create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
>


Merged into OE-Core

Thanks
	Sau!


