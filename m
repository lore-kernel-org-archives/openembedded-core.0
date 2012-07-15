Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqSi0-0007lL-S3
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jul 2012 19:34:17 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jul 2012 10:22:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="177669275"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by fmsmga001.fm.intel.com with ESMTP; 15 Jul 2012 10:22:58 -0700
Message-ID: <5002FC72.5000502@linux.intel.com>
Date: Sun, 15 Jul 2012 10:22:58 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1342115559.git.andrei@gherzan.ro>
In-Reply-To: <cover.1342115559.git.andrei@gherzan.ro>
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [PATCH 0/2] Update connman to v1.3 and fix dependencies for some tests
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
X-List-Received-Date: Sun, 15 Jul 2012 17:34:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2012 10:54 AM, andrei@gherzan.ro wrote:
> From: Andrei Gherzan <andrei@gherzan.ro>
>
> Machine tested: qemux86
>
> Tests done on connman-gnome
> 	OnlineMode / OfflineMode
> 	Enable / Disable Wired Networks
> 	Set manual IP configuration
>
> Tests on connman v.1.3
> 	addr-test
> 	iptables-test
> 	polkit-test
> 	get-global-timeservers
> 	get-proxy-autoconfig
> 	get-services
> 	get-state
> 	list-services
> 	show-introspection
> 	test-clock
> 	test-connman
> 	test-counter
> 	test-manager
> 	test-session
>
> The following changes since commit 90ad663909c0c8a405b22a510c9f957007d02669:
>
>    upstream_tracking: update boost (2012-07-09 17:21:38 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ag/connman
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/connman
>
> Andrei Gherzan (2):
>    connman: Update to version 1.3
>    connman.inc: Add missing dependencies needed by some tests
>
>   meta/recipes-connectivity/connman/connman.inc      |    4 ++--
>   .../connman/{connman_1.0.bb => connman_1.3.bb}     |    4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>   rename meta/recipes-connectivity/connman/{connman_1.0.bb => connman_1.3.bb} (82%)
>

I am seeing connman fail to start across the Autobuilder sanity tests, I 
know you are investigating a mips failure, but there might be something 
else going on also.

I do not have anything more specific.

Thanks
	Sau!




