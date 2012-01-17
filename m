Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnF1F-0002jt-FE
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 20:48:33 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 11:40:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="57372449"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jan 2012 11:40:54 -0800
Message-ID: <4F15CEC6.3090700@linux.intel.com>
Date: Tue, 17 Jan 2012 11:40:54 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326481387.git.josh@linux.intel.com>
In-Reply-To: <cover.1326481387.git.josh@linux.intel.com>
Subject: Re: [PATCH 0/4] Add alsa-state from OE Classic v3
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
X-List-Received-Date: Tue, 17 Jan 2012 19:48:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/13/2012 11:10 AM, Joshua Lock wrote:
> The small series which follows introduces the alsa-state recipe from oe-classic.
> The reason for doing so is to remove the requirement for recipes like the
> beagleboard-audio recipe in meta-yocto, which ensures the beagleboards sound
> device has the volume turned up.
>
> Long term I'd like to implement something more generic for handling device
> quirks, but alsa-state is a simple fix for an immediate need that should
> standardise how alsa configuration is handled in layers.
>
> Since v1 I added an extra commit which:
> a) defaults to /var/lib/alsa/ for state files, as this is the directory
> alsactl writes to by default.
> b) sed's the path to the state files into the init script, rather than hard
> coding them.
>
> Since v2 I've modified the task-base commit to add VIRTUAL-RUNTIME_alsa-state
> rather than hard code the alsa-state recipe per suggestion from Martin Jansa
> and added an extra commit to move the defintion of VIRTUAL-RUNTIME_apm from
> task-base to default-providers.inc
>
> Cheers,
>
> Joshua
>
> The following changes since commit bd047935305c872b565f30b46c94b7077e5fb3a2:
>
>    patch.bbclass: Ensure the DATE and SRCDATE variable exclusions apply to the correct function (2012-01-13 16:56:20 +0000)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib josh/devices
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/devices
>
> Joshua Lock (4):
>    task-base: move default definition of VIRTUAL-RUNTIME_apm
>    alsa-state: add alsa-state from oe classic
>    alsa-state: move state files to localstatedir
>    task-base: add VIRTUAL-RUNTIME_alsa-state to task-base-alsa
>
>   meta/conf/distro/include/default-providers.inc     |    2 +
>   meta/recipes-bsp/alsa-state/alsa-state.bb          |   59 ++++++++++++++++++++
>   meta/recipes-bsp/alsa-state/alsa-state/alsa-state  |   29 ++++++++++
>   meta/recipes-bsp/alsa-state/alsa-state/asound.conf |   12 ++++
>   .../recipes-bsp/alsa-state/alsa-state/asound.state |    1 +
>   meta/recipes-core/tasks/task-base.bb               |    8 +--
>   6 files changed, 106 insertions(+), 5 deletions(-)
>   create mode 100644 meta/recipes-bsp/alsa-state/alsa-state.bb
>   create mode 100755 meta/recipes-bsp/alsa-state/alsa-state/alsa-state
>   create mode 100644 meta/recipes-bsp/alsa-state/alsa-state/asound.conf
>   create mode 100644 meta/recipes-bsp/alsa-state/alsa-state/asound.state
>

Merged into OE-Core

Thanks
	Sau!


