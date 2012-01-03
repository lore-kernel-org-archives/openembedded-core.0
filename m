Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiBks-0005Il-R4
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 22:18:48 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Jan 2012 13:11:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="94092013"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by orsmga002.jf.intel.com with ESMTP; 03 Jan 2012 13:11:24 -0800
Message-ID: <4F036EFC.6050406@linux.intel.com>
Date: Tue, 03 Jan 2012 13:11:24 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1324555824.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1324555824.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 0/4] self-hosted-image: Add mini X
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
X-List-Received-Date: Tue, 03 Jan 2012 21:18:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2011 04:16 AM, edwin.zhai@intel.com wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> This is the new version modified according to Paul and Saul's comments:
> Use mini-x-session, change script name, and more accurate license.
>
> The following changes since commit 4648aadfe161d2e0ec51408f35fdf8996727bd22:
>
>    ui/crumbs/hobprefs: trigger a reparse after changing IMAGE_FSTYPES (2011-12-20 13:15:54 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib gzhai/build-appliance2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/build-appliance2
>
> Zhai Edwin (4):
>    mini-x-session: Add this recipe as the session file for mini X
>    Add mini X core tasks
>    Add "builder" user for specific purpose.
>    self-hosted-image: Add builder user and mini X
>
Merged to OE-Core

Thanks
	Sau!


>   meta/classes/core-image.bbclass                    |    2 +
>   meta/recipes-core/images/self-hosted-image.bb      |    4 +-
>   meta/recipes-core/tasks/task-self-hosted.bb        |    3 +-
>   meta/recipes-graphics/builder/builder_0.1.bb       |   27 ++++++++++++
>   .../builder/files/builder_hob_start.sh             |   11 +++++
>   .../mini-x-session/files/mini-x-session            |   32 ++++++++++++++
>   .../mini-x-session/mini-x-session_0.1.bb           |   24 ++++++++++
>   meta/recipes-sato/tasks/task-core-x11-mini.bb      |   45 ++++++++++++++++++++
>   8 files changed, 146 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-graphics/builder/builder_0.1.bb
>   create mode 100644 meta/recipes-graphics/builder/files/builder_hob_start.sh
>   create mode 100644 meta/recipes-graphics/mini-x-session/files/mini-x-session
>   create mode 100644 meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
>   create mode 100644 meta/recipes-sato/tasks/task-core-x11-mini.bb
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


