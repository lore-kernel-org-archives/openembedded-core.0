Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnER6-0001nX-Nt
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 20:11:13 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jan 2012 11:02:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113290197"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jan 2012 11:02:57 -0800
Message-ID: <4F15C5E1.7020800@linux.intel.com>
Date: Tue, 17 Jan 2012 11:02:57 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326360842.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1326360842.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 0/2] Small fixes
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
X-List-Received-Date: Tue, 17 Jan 2012 19:11:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2012 01:34 AM, Martin Jansa wrote:
> The following changes since commit 1d2697e6f00cc3771f39f5a7d4384a22d9696b16:
>
>    multilib.conf: Clean up file and add missing entries for various dependencies (2012-01-11 23:53:21 +0000)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib jansa/pull
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull
>
> Denis 'GNUtoo' Carikli (1):
>    alsa-utils: depend on libsamplerate0
>
> Martin Jansa (1):
>    xorg-*: disable xmlto where it was failing
>
>   meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    2 +-
>   .../xorg-proto/xorg-proto-common.inc               |    2 +-
>   .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    1 +
>   .../recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb |    4 ++--
>   4 files changed, 5 insertions(+), 4 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!


