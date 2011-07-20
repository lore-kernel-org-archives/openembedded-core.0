Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qja2f-0005AY-KC
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 18:54:37 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Jul 2011 09:50:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,236,1309762800"; d="scan'208";a="32590244"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jul 2011 09:50:30 -0700
Message-ID: <4E270756.9090500@linux.intel.com>
Date: Wed, 20 Jul 2011 09:50:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311035762.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1311035762.git.dongxiao.xu@intel.com>
Subject: Re: [PATCH 0/1 v2][PULL] alsa-tools: fix recipe build error.
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
X-List-Received-Date: Wed, 20 Jul 2011 16:54:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/18/2011 05:37 PM, Dongxiao Xu wrote:
> Hi Richard and Saul,
>
> This is the second version of alsa-tools build fix, please help to review and pull.
>
> Changes from v1:
> Remove some sub-components to avoid further dependency on gtk+ and fltk.
>
> Thanks,
> Dongxiao
>
> The following changes since commit fa4bcfdb73167f8159b88e5a4d711c0d37627a70:
>
>    bb-matrix: correct BB and PM number canonicalization (2011-07-14 22:23:09 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dxu4/alsa-tools
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/alsa-tools
>
> Dongxiao Xu (1):
>    alsa-tools: Fix recipe build error.
>
>   .../alsa/alsa-tools-1.0.24.1/autotools.patch       |   34 ++++++++++++++++++++
>   .../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |    7 +++-
>   2 files changed, 39 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotools.patch
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


