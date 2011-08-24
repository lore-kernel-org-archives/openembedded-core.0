Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QwN6J-0007qk-I0
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 01:43:15 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 Aug 2011 16:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,278,1312182000"; d="scan'208";a="44782864"
Received: from unknown (HELO [10.255.14.203]) ([10.255.14.203])
	by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2011 16:38:27 -0700
Message-ID: <4E558B73.2090602@linux.intel.com>
Date: Wed, 24 Aug 2011 16:38:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1314027196.git.jiajun.xu@intel.com>
In-Reply-To: <cover.1314027196.git.jiajun.xu@intel.com>
Subject: Re: [PATCH 0/2] libsdl: add libsdl into sato and fix build error with libsdl
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
X-List-Received-Date: Wed, 24 Aug 2011 23:43:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2011 08:36 AM, Jiajun Xu wrote:
> There is no need for libsdl to inherit nativesdk since we enable the target version
> with BBCLASSEXTEND now.
> We add libsdl into sato image since some 3D graphics testing need it.
>
>
> The following changes since commit 9134800548a03bfe3a7e351a15f2129bcb3cc680:
>
>    xcb/libpthreads: Add BBCLASSEXTEND to resolve missing providers in world builds (2011-08-19 16:27:29 -0700)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib jxu49/oe-contrib
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jxu49/oe-contrib
>
> Jiajun Xu (2):
>    libsdl: do not inherit nativesdk
>    task-core-x11-sato: add libsdl into sato image
>
>   meta/recipes-graphics/libsdl/libsdl_1.2.11.bb |    4 ++--
>   meta/recipes-sato/tasks/task-core-x11-sato.bb |    3 ++-
>   2 files changed, 4 insertions(+), 3 deletions(-)
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



