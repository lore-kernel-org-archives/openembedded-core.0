Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rixr8-0000YM-9j
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 01:40:29 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2012 16:32:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104020432"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2012 16:32:53 -0800
Message-ID: <4F064135.8060406@linux.intel.com>
Date: Thu, 05 Jan 2012 16:32:53 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325742856.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1325742856.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 0/1] matchbox-wm: remove x-session-manager handling
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
X-List-Received-Date: Fri, 06 Jan 2012 00:40:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2012 09:57 PM, edwin.zhai@intel.com wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> This is V2 version that made clear commit mesg and adjust alternative priority
> to make mini-x has high priority over matchbox-session according to Saul's
> suggestion.
>
> Thanks,
> Edwin
>
>
> The following changes since commit 021848be9eeb71de8acfba6c66c11645b01523b8:
>
>    valgrind: Fix for automake update (2012-01-04 16:04:08 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib gzhai/master2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2
>
> Zhai Edwin (1):
>    matchbox-wm: Remove x-session-manager handling
>
>   .../matchbox-wm/matchbox-wm_1.2.bb                 |    9 ++-------
>   .../matchbox-wm/matchbox-wm_git.bb                 |    9 ++-------
>   .../mini-x-session/mini-x-session_0.1.bb           |    2 +-
>   3 files changed, 5 insertions(+), 15 deletions(-)
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


