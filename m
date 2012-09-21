Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TFBjf-0005Jn-CO
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 00:30:11 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Sep 2012 15:17:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,464,1344236400"; d="scan'208";a="196221957"
Received: from unknown (HELO [10.255.14.14]) ([10.255.14.14])
	by orsmga001.jf.intel.com with ESMTP; 21 Sep 2012 15:17:25 -0700
Message-ID: <505CE775.4030104@linux.intel.com>
Date: Fri, 21 Sep 2012 15:17:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Scott Garman <scott.a.garman@intel.com>
References: <cover.1348033737.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1348033737.git.scott.a.garman@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] runqemu bugfix [v2]
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
X-List-Received-Date: Fri, 21 Sep 2012 22:30:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/18/2012 10:50 PM, Scott Garman wrote:
> Hello,
>
> This is a fix for Yocto bug #3112, where there are certain edge cases
> where the bitbake command is avalable to fails to run. Previously we
> mistakenly treated that as the same case as if bitbake didn't exist in
> the user's $PATH, and this fix causes us to show the user the output
> of bitbake so they can view the error message.
>
> v2 includes rework based on feedback from Mark Hatle (thanks!).
>
> Scott
>
> The following changes since commit 7887b99646d8e1e736ad6e4a306e47df9955221e:
>
>    local.conf.sample: change valgrind support architecture comment (2012-09-14 17:05:59 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib sgarman/runqemu-bitbake-fix-oe
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgarman/runqemu-bitbake-fix-oe
>
> Scott Garman (1):
>    runqemu: show bitbake errors to user
>
>   scripts/runqemu |   12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>

Merged into OE-Core

Thanks	
	Sau!



