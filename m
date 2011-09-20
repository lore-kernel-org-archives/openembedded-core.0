Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R67WN-0001s1-56
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 23:06:27 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 20 Sep 2011 14:01:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,413,1312182000"; d="scan'208";a="18943611"
Received: from unknown (HELO [10.255.14.170]) ([10.255.14.170])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Sep 2011 14:01:08 -0700
Message-ID: <4E78FF13.7030802@linux.intel.com>
Date: Tue, 20 Sep 2011 14:01:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US;
	rv:1.9.2.22) Gecko/20110902 Thunderbird/3.1.14
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1316551810.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316551810.git.sgw@linux.intel.com>
Subject: Re: [PATCH 0/1 v3] Fix avahi x11 dependency with non-GPLv3 Build
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
X-List-Received-Date: Tue, 20 Sep 2011 21:06:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/20/2011 01:53 PM, Saul Wold wrote:
> Richard,
>
> Koen was right, it was a little half baked, I forgot to commit
> the avahi_0.6.30.bb file with the PR set up correctly.
>
> Otherwise, at this point, read my last comment, if someone has a
> need for the avahi-ui bits, then they can request that the be add
> back into OE-core, at this point we don't beleive anyone is using
> them.

Time to insert foot in mouth!

Turns out I don't know our own system that well, as oprofileui uses 
avahi-ui bits.

I guess I will try to pull the OE bits in, I started to look at earlier.

Sau!

>
> As this is targeted for the RC3 build, I do not want to take in more
> change than necessary.
>
> Thanks
> 	Sau!
>
> The following changes since commit 81274f4488fbc4d68d150870735ec0181b60b451:
>
>    freetype: disable bzip2 compressed font support (2011-09-19 13:14:03 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib sgw/oe-fix
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/oe-fix
>
> Saul Wold (1):
>    avahi: remove avahi-ui related packages
>
>   meta/recipes-connectivity/avahi/avahi.inc       |   19 +++++++------------
>   meta/recipes-connectivity/avahi/avahi_0.6.30.bb |    2 +-
>   2 files changed, 8 insertions(+), 13 deletions(-)
>


