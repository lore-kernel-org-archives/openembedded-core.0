Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S9fcQ-0004WG-VV
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 17:39:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Mar 2012 09:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120676246"
Received: from unknown (HELO [10.255.15.160]) ([10.255.15.160])
	by azsmga001.ch.intel.com with ESMTP; 19 Mar 2012 09:30:46 -0700
Message-ID: <4F675F36.4030503@linux.intel.com>
Date: Mon, 19 Mar 2012 09:30:46 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331924409.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1331924409.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/6] Misc fixes
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
X-List-Received-Date: Mon, 19 Mar 2012 16:39:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/16/2012 12:00 PM, Paul Eggleton wrote:
> The following changes since commit efd80fd23cb96ccc203893017938c1163d20b898:
>
>    tcl: Fix bad RPATH QA warning (2012-03-16 16:47:27 +0000)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/fixes16
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes16
>
> Paul Eggleton (6):
>    classes/image: avoid cp race condition when building multiple images
>    buildhistory_analysis: fix duplicate PE/PV/PR in related fields
>    buildhistory: allow disabling image and/or package history
>    buildhistory: avoid reruns of do_package
>    iproute2: fix unpackaged files warning
>    qt4: add RPROVIDES/RREPLACES for qmake2 recipe
>
>   meta/classes/buildhistory.bbclass                  |   24 +++++++++++++++++--
>   meta/classes/image.bbclass                         |    2 +-
>   meta/lib/oe/buildhistory_analysis.py               |    2 +-
>   meta/recipes-connectivity/iproute2/iproute2.inc    |    2 +-
>   .../iproute2/iproute2_3.2.0.bb                     |    2 +
>   meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
>   meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
>   meta/recipes-qt/qt4/qt4.inc                        |    3 ++
>   8 files changed, 31 insertions(+), 8 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


