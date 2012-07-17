Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrASe-0001Wn-Kw
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:17:20 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jul 2012 09:06:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193982569"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jul 2012 09:06:00 -0700
Message-ID: <50058D68.1090505@linux.intel.com>
Date: Tue, 17 Jul 2012 09:06:00 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1342038551.git.peter.seebach@windriver.com>
In-Reply-To: <cover.1342038551.git.peter.seebach@windriver.com>
Subject: Re: [PATCH 0/1] package.bbclass: Allow overriding of debugedit base path
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
X-List-Received-Date: Tue, 17 Jul 2012 16:17:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2012 01:31 PM, Peter Seebach wrote:
> As before, only with the prettier and smaller change RP suggested. This
> provides a mechanism for making the existing debugedit that gets done
> from package.bbclass work for prebuilt binaries with debug paths that
> aren't related directly to the build environment.
>
> The following changes since commit 20405bdab18b7a2b101f818e72863d289d5945e4:
>    Bruce Ashfield (1):
>          linux-yocto/3.0: perf scripting support
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib seebs/debugsrc
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/debugsrc
>
> Peter Seebach (1):
>    package.bbclass: Allow overriding of debugedit starting path
>
>   meta/classes/package.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
Merged into OE-Core

Thanks
	Sau!



