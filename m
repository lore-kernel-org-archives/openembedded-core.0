Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QnwRB-0000bB-EC
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 19:37:57 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 Aug 2011 10:33:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,301,1309762800"; d="scan'208";a="36737621"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by fmsmga001.fm.intel.com with ESMTP; 01 Aug 2011 10:33:35 -0700
Message-ID: <4E36E36F.4020303@linux.intel.com>
Date: Mon, 01 Aug 2011 10:33:35 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311851957.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1311851957.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 0/1] Fix bug #1299 for meta-environment
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
X-List-Received-Date: Mon, 01 Aug 2011 17:37:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2011 04:24 AM, Lianhao Lu wrote:
> Using recipe-scope variable REAL_MULTIMACH_TARGET_SYS instead of the unavailable
> OLD_MULTIMACH_TARGET_SYS to generate meta-environment files for ADT installer.
>
> The following changes since commit f94b781695cd8fa387daff16ecbf3987a0883018:
>    Bruce Ashfield (1):
>          poky.conf: explicitly referenced preferred linux-yocto version
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib llu/bug1299
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=llu/bug1299
>
> Lianhao Lu (1):
>    meta-environment: set correct *MULTIMACH_TARGET_SYS.
>
>   meta/classes/toolchain-scripts.bbclass     |    7 ++++---
>   meta/recipes-core/meta/meta-environment.bb |    9 +++++----
>   2 files changed, 9 insertions(+), 7 deletions(-)
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



