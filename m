Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnEOY-0001gm-6w
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 20:08:34 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Jan 2012 11:00:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="97521180"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by orsmga001.jf.intel.com with ESMTP; 17 Jan 2012 11:00:55 -0800
Message-ID: <4F15C567.9090108@linux.intel.com>
Date: Tue, 17 Jan 2012 11:00:55 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326282692.git.shane.wang@intel.com>
In-Reply-To: <cover.1326282692.git.shane.wang@intel.com>
Subject: Re: [PATCH 0/2][V2] upgrade hdparm to 9.37 and add its dependency stat 3.3
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
X-List-Received-Date: Tue, 17 Jan 2012 19:08:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/11/2012 03:53 AM, Shane Wang wrote:
> This patch is to upgrade hdparm to 9.37 and bring its new dependency stat 3.3.
> Please review.
>
> The following changes since commit 468998cddbe1a803096c9b357e1b5daa3b7e8c2e:
>
>    command.py: add parseConfigurationFiles API (2012-01-06 16:01:44 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib shane/upgrade3
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/upgrade3
>
> Shane Wang (2):
>    stat: add recipe stat with version 3.3
>    hdparm: upgrade to 9.37
>
>   .../recipes-extended/hdparm/hdparm-6.3/bswap.patch |   37 --------------------
>   .../hdparm/hdparm-6.3/uclibc.patch                 |   34 ------------------
>   meta/recipes-extended/hdparm/hdparm_6.3.bb         |   18 ---------
>   meta/recipes-extended/hdparm/hdparm_9.37.bb        |   36 +++++++++++++++++++
>   meta/recipes-extended/stat/stat_3.3.bb             |   26 ++++++++++++++
>   5 files changed, 62 insertions(+), 89 deletions(-)
>   delete mode 100644 meta/recipes-extended/hdparm/hdparm-6.3/bswap.patch
>   delete mode 100644 meta/recipes-extended/hdparm/hdparm-6.3/uclibc.patch
>   delete mode 100644 meta/recipes-extended/hdparm/hdparm_6.3.bb
>   create mode 100644 meta/recipes-extended/hdparm/hdparm_9.37.bb
>   create mode 100644 meta/recipes-extended/stat/stat_3.3.bb
>
Merged into OE-Core

Thanks
	Sau!


