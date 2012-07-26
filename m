Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuTk7-0008MC-Lk
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:29:03 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Jul 2012 12:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127290364"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Jul 2012 12:17:31 -0700
Message-ID: <501197CB.3080401@linux.intel.com>
Date: Thu, 26 Jul 2012 12:17:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343108218-7108-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1343108218-7108-1-git-send-email-cristian.iorga@intel.com>
Subject: Re: [PATCH 0/5] Connectivity and base packages updates.
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
X-List-Received-Date: Thu, 26 Jul 2012 19:29:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/23/2012 10:36 PM, Cristian Iorga wrote:
> Multiple package updates, see below for details.
> Packages and core-image-sato target build on all architectures.
> Basic sanity tests performed in core-image-sato under qemux86.
> No obvious issues observed.
>
> Cristian Iorga (5):
>    telepathy-glib: upgrade to ver. 0.19.4
>    iptables: upgrade to ver. 1.4.14
>    telepathy-mission-control: upgrade to ver. 5.13
>    libpcap: upgrade to ver. 1.3
>    byacc: upgrade to ver. 20120526
>
>   .../{libpcap-1.2.1 => libpcap-1.3.0}/aclocal.patch |    0
>   .../ieee80215-arphrd.patch                         |    0
>   .../libpcap/{libpcap_1.2.1.bb => libpcap_1.3.0.bb} |    4 ++--
>   ...thy-glib_0.19.2.bb => telepathy-glib_0.19.4.bb} |    4 ++--
>   ...12.0.bb => telepathy-mission-control_5.13.0.bb} |    4 ++--
>   .../byacc/{byacc_20120115.bb => byacc_20120526.bb} |    4 ++--
>   .../{iptables_1.4.13.bb => iptables_1.4.14.bb}     |    4 ++--
>   7 files changed, 10 insertions(+), 10 deletions(-)
>   rename meta/recipes-connectivity/libpcap/{libpcap-1.2.1 => libpcap-1.3.0}/aclocal.patch (100%)
>   rename meta/recipes-connectivity/libpcap/{libpcap-1.2.1 => libpcap-1.3.0}/ieee80215-arphrd.patch (100%)
>   rename meta/recipes-connectivity/libpcap/{libpcap_1.2.1.bb => libpcap_1.3.0.bb} (73%)
>   rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.19.2.bb => telepathy-glib_0.19.4.bb} (80%)
>   rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.12.0.bb => telepathy-mission-control_5.13.0.bb} (92%)
>   rename meta/recipes-extended/byacc/{byacc_20120115.bb => byacc_20120526.bb} (75%)
>   rename meta/recipes-extended/iptables/{iptables_1.4.13.bb => iptables_1.4.14.bb} (91%)
>

Merged all but the telepathy-glib as we should wait for stable

Thanks
	Sau!


