Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiF3f-0003ch-8V
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:50:23 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Jan 2012 16:43:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="52990215"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Jan 2012 16:43:00 -0800
Message-ID: <4F03A094.3050803@linux.intel.com>
Date: Tue, 03 Jan 2012 16:43:00 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325557342.git.josh@linux.intel.com>
In-Reply-To: <cover.1325557342.git.josh@linux.intel.com>
Subject: Re: [RFC PATCH 0/2] Add alsa-state from OE Classic
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
X-List-Received-Date: Wed, 04 Jan 2012 00:50:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/02/2012 06:26 PM, Joshua Lock wrote:
> Please review the following changes for suitability for inclusion. If you have
> any objections or suggestions for improvement, please respond to the patches. If
> you agree with the changes, please provide your Acked-by.
>
> The small series following introduces the alsa-state recipe from oe-classic.
> The reason for doing so is to remove the requirement for recipes like the
> beagleboard-audio recipe in meta-yocto, which ensures the beagleboards sound
> device has the volume turned up.
>
> Long term I'd like to implement something more generic for handling device quirks,
> but alsa-state is a simple fix for an immediate need that should standardise how
> alsa configuration is handled in layers.
>
Will this address the similar issue that the n450-audio recipe does in 
the meta-intel layer?  The n450 seems to use amixer and not alsactl.

And if so, can you provide a patch for meta-intel?

Sau!

> Cheers.
> Joshua
>
> The following changes since commit 8f348ccad083d6c02c200652ff6295e701e88f0d:
>
>    coreutils: ensure --color works so DEPEND on libcap (2011-12-24 10:05:35 +0000)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib josh/devices
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/devices
>
> Joshua Lock (2):
>    alsa-state: add alsa-state from oe classic
>    task-base: add alsa-state to task-base-alsa
>
>   meta/recipes-bsp/alsa-state/alsa-state.bb          |   57 ++++++++++++++++++++
>   meta/recipes-bsp/alsa-state/alsa-state/alsa-state  |   29 ++++++++++
>   meta/recipes-bsp/alsa-state/alsa-state/asound.conf |   12 ++++
>   .../recipes-bsp/alsa-state/alsa-state/asound.state |    1 +
>   meta/recipes-core/tasks/task-base.bb               |    5 +-
>   5 files changed, 102 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-bsp/alsa-state/alsa-state.bb
>   create mode 100755 meta/recipes-bsp/alsa-state/alsa-state/alsa-state
>   create mode 100644 meta/recipes-bsp/alsa-state/alsa-state/asound.conf
>   create mode 100644 meta/recipes-bsp/alsa-state/alsa-state/asound.state
>


