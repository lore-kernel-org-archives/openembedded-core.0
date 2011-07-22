Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QkICW-0007Ju-Oh
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 18:03:44 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jul 2011 08:59:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,248,1309762800"; d="scan'208";a="31228457"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2011 08:59:34 -0700
Message-ID: <4E299E66.7060000@linux.intel.com>
Date: Fri, 22 Jul 2011 08:59:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311238455.git.lei.mei@intel.com>
In-Reply-To: <cover.1311238455.git.lei.mei@intel.com>
Subject: Re: [PATCH 0/1]dhcp: Fix hard coded libdir issue for multilib
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
X-List-Received-Date: Fri, 22 Jul 2011 16:03:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/21/2011 01:59 AM, Mei Lei wrote:
> This pull request fixes some hard coded /usr/lib path issues, please review it.
>
> Thanks,
> Lei
>
> The following changes since commit 8af286885353d5740971f137f8c1ada2b43dd2a8:
>    Paul Eggleton (1):
>          README.hardware: update MPC8315E-RDB instructions
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib lmei3/multilib-lsb-v2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/multilib-lsb-v2
>
> Mei Lei (1):
>    dhcp: Fix libdir issue for multilib
>
>   .../dhcp/dhcp-4.2.0/fix-external-bind.patch        |   14 +++++++-------
>   meta/recipes-connectivity/dhcp/dhcp4.inc           |    2 +-
>   2 files changed, 8 insertions(+), 8 deletions(-)
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


