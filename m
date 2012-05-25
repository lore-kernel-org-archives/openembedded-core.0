Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXxUi-0004UJ-6M
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 18:36:04 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2012 09:25:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157277409"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 25 May 2012 09:25:50 -0700
Message-ID: <4FBFB28E.3090507@linux.intel.com>
Date: Fri, 25 May 2012 09:25:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337886141.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1337886141.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/1] Help debug QA foo rdepends on bar-dev
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
X-List-Received-Date: Fri, 25 May 2012 16:36:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/24/2012 12:11 PM, Mark Hatle wrote:
> After numerous attempts to try to remotely help people stuck by the QA test
> that a base package requires a -dev package, I needed to figure out a way
> to add diagnostics to the logs to help identify what was happening.
>
> The patch adds some basic diagnostics to indicate what dependency was found
> and what package it triggered to be added to the rdepends.
>
> In addition it was observed that a lot of duplicate processing was occuring
> so I modifed the system to eliminate the duplicates.  This has the potential
> to improve performance, but I was not able to measure anything statistically
> significant in my builds.
>
> The following changes since commit 0f795f81fe5ad3ef78c21a177eca90fbc8810f81:
>
>    qemu: disable vnc-jpeg compression (2012-05-24 08:53:40 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/package
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/package
>
> Mark Hatle (1):
>    package.bbclass: Add additional debugging for dependencies
>
>   meta/classes/package.bbclass |    7 +++++--
>   1 files changed, 5 insertions(+), 2 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


