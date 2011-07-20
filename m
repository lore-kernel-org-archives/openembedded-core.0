Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qja8W-0005cP-2S
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 19:00:41 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Jul 2011 09:56:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,236,1309762800"; d="scan'208";a="30292020"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jul 2011 09:56:29 -0700
Message-ID: <4E2708BD.2070606@linux.intel.com>
Date: Wed, 20 Jul 2011 09:56:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311092892.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1311092892.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/2] libpng upgrade
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
X-List-Received-Date: Wed, 20 Jul 2011 17:00:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/19/2011 09:29 AM, Scott Garman wrote:
> Hello,
>
> This upgrade to libpng addresses some security vulnerabilities. It
> has been build tested on all five of our qemu MACHINEs.
>
> The following changes since commit fa4bcfdb73167f8159b88e5a4d711c0d37627a70:
>
>    bb-matrix: correct BB and PM number canonicalization (2011-07-14 22:23:09 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib sgarman/libpng-upgrade
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/libpng-upgrade
>
> Scott Garman (2):
>    libpng: upgrade to v1.2.46
>    distro-tracking: update libpng
>
>   .../conf/distro/include/distro_tracking_fields.inc |   10 +++++-----
>   .../libpng/{libpng_1.2.44.bb =>  libpng_1.2.46.bb}  |   11 ++++++-----
>   2 files changed, 11 insertions(+), 10 deletions(-)
>   rename meta/recipes-multimedia/libpng/{libpng_1.2.44.bb =>  libpng_1.2.46.bb} (55%)
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


