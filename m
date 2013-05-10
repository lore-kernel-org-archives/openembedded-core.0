Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UavzT-0003Y7-Sf
	for openembedded-core@lists.openembedded.org;
	Sat, 11 May 2013 00:40:47 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 May 2013 15:20:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,651,1363158000"; d="scan'208";a="335093784"
Received: from unknown (HELO [10.255.12.100]) ([10.255.12.100])
	by orsmga002.jf.intel.com with ESMTP; 10 May 2013 15:22:31 -0700
Message-ID: <518D7326.1030901@linux.intel.com>
Date: Fri, 10 May 2013 15:22:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
In-Reply-To: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Enable VPN support in ConnMan
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2013 22:40:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2013 05:33 AM, Jukka Rissanen wrote:
> Hi,
>
> this patchset enables OpenVPN, vpnc, L2TP and PPTP VPN
> technogies in ConnMan and fixes this bug
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4456
>
> The VPN support is activated if DISTRO_FEATURES contains
> vpn string.
>

This also create a dependency on the meta-openembedded layer, I am not 
sure we want to do that.

Sau!

> Cheers,
> Jukka
>
>
> Jukka Rissanen (5):
>    connman: Enable VPN support
>    connman: Add OpenVPN support
>    connman: Add vpnc support
>    connman: Add L2TP support
>    connman: Add PPTP support
>
>   meta/recipes-connectivity/connman/connman.inc | 42 +++++++++++++++++++++++++--
>   1 file changed, 40 insertions(+), 2 deletions(-)
>


