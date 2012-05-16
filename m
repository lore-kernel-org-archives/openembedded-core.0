Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SUijv-000521-71
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 20:14:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 May 2012 11:04:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144012905"
Received: from unknown (HELO [10.255.13.103]) ([10.255.13.103])
	by azsmga001.ch.intel.com with ESMTP; 16 May 2012 11:04:19 -0700
Message-ID: <4FB3EC22.3030006@linux.intel.com>
Date: Wed, 16 May 2012 21:04:18 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1336756602.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1336756602.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/1] Further optimizations to the sstate.bbclass
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
X-List-Received-Date: Wed, 16 May 2012 18:14:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2012 08:17 PM, Mark Hatle wrote:
> A few minor changes to the generation of the fixmepaths file in
> the sstate cache file generation can lead to significant performance
> improvements in recipes that generate large file sets.
>
> The following changes since commit 9cd30beba77497288eeb2545920bc23f2a77cf16:
>
>    .gitignore: add /bitbake to the ignore list for external distributions (2012-05-11 17:59:53 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/sstate
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/sstate
>
> Mark Hatle (1):
>    sstate.bbclass: Optimize the generation and install path fixups
>
>   meta/classes/sstate.bbclass |    7 ++++++-
>   1 files changed, 6 insertions(+), 1 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


