Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TB6E8-0000DC-6I
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 17:48:44 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Sep 2012 08:36:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,398,1344236400"; d="scan'208";a="143375736"
Received: from unknown (HELO [10.255.13.123]) ([10.255.13.123])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Sep 2012 08:36:12 -0700
Message-ID: <504E08EC.1090807@linux.intel.com>
Date: Mon, 10 Sep 2012 08:36:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1346779930.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1346779930.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] linux-yocto-rt: remaining 3.4.9-rt17 fixes
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
X-List-Received-Date: Mon, 10 Sep 2012 15:48:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2012 10:34 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> .. and here's the predicted tweaks to my morning -rt refresh.
> The exported SRCREVs were part 1/2 due to a merge conflict combined
> with a force reset making me miss several files. Both -rt updates
> build and boot (and the full -rt was tested), but without this, you
> don't get much of a realtime kernel :)
>
> Cheers,
>
> Bruce
>
> The following changes since commit 99c85ba93075a1aff789cafabbacf42e6a93bd32:
>
>    build-appliance-image: Update to latest poky master (2012-09-04 18:04:40 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel-rt
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (1):
>    linux-yocto-rt: 3.4.9-rt17 remaining changes
>
>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



