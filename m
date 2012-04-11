Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHzaT-0006Og-PA
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 17:36:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Apr 2012 08:26:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="131227540"
Received: from unknown (HELO [10.255.12.89]) ([10.255.12.89])
	by orsmga002.jf.intel.com with ESMTP; 11 Apr 2012 08:26:41 -0700
Message-ID: <4F85A2B1.9020805@linux.intel.com>
Date: Wed, 11 Apr 2012 08:26:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333679903.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1333679903.git.lianhao.lu@intel.com>
Subject: Re: [PATCH V2 0/1] multilib header support for python
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
X-List-Received-Date: Wed, 11 Apr 2012 15:36:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/05/2012 07:40 PM, Lianhao Lu wrote:
> Added multilib header support for python, so that lib32-python and python won't have
> conflicting file pyconfig.h.
>
> The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:
>    Saul Wold (1):
>          runqemu-internal: Add console=tty for qemuppc and NFS
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib llu/multilib2
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/multilib2
>
> Lianhao Lu (1):
>    python: multilib header support.
>
>   .../python/python-2.7-manifest.inc                 |    2 +-
>   meta/recipes-devtools/python/python.inc            |    2 +-
>   meta/recipes-devtools/python/python_2.7.2.bb       |    4 +++-
>   scripts/contrib/python/generate-manifest-2.7.py    |    2 +-
>   4 files changed, 6 insertions(+), 4 deletions(-)
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


