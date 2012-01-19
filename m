Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnyFT-00025S-Ue
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 21:06:16 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jan 2012 11:58:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="98421043"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by orsmga001.jf.intel.com with ESMTP; 19 Jan 2012 11:58:35 -0800
Message-ID: <4F1875EB.2040405@linux.intel.com>
Date: Thu, 19 Jan 2012 11:58:35 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326870966.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1326870966.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 0/1] install new packages in adt-installer
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
X-List-Received-Date: Thu, 19 Jan 2012 20:06:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/17/2012 11:18 PM, Lianhao Lu wrote:
> This pathc fixed YOCTO bug #1909 by installing autoconf-nativesdk and
> automake-nativesdk packages in adt-installer.
>
> The following changes since commit bd047935305c872b565f30b46c94b7077e5fb3a2:
>    Richard Purdie (1):
>          patch.bbclass: Ensure the DATE and SRCDATE variable exclusions apply to the correct function
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib llu/bug1909
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug1909
>
> Lianhao Lu (1):
>    adt-installer: install autoconf(/automake)-nativesdk
>
>   .../adt-installer/scripts/adt_installer_internal   |   18 ++++++------------
>   .../installer/adt-installer_1.0.bb                 |    2 +-
>   2 files changed, 7 insertions(+), 13 deletions(-)
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


