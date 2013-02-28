Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UAvkN-0003rE-HU
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 06:09:45 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Feb 2013 20:53:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,753,1355126400"; d="scan'208";a="292863318"
Received: from unknown (HELO [10.255.12.143]) ([10.255.12.143])
	by fmsmga001.fm.intel.com with ESMTP; 27 Feb 2013 20:53:12 -0800
Message-ID: <512EE2B8.3080709@linux.intel.com>
Date: Wed, 27 Feb 2013 20:53:12 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Peter Seebach <peter.seebach@windriver.com>
References: <cover.1361999203.git.peter.seebach@windriver.com>
In-Reply-To: <cover.1361999203.git.peter.seebach@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] pseudo 1.5.1
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
X-List-Received-Date: Thu, 28 Feb 2013 05:10:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


No Tarball yet?  Did you give it to Michael H.?

Sau!


On 02/27/2013 01:19 PM, Peter Seebach wrote:
> It turns out that I forgot the part where it would be useful to be
> able to temporarily suppress the suppression of fsync()-type calls.
> Also the documentation had bitrotted (no references to FASTOP or to
> the fsync stuff, or to some other changes), so I fixed a few obvious
> gaps.
>
> This should have no immediate functional change on anything in oe-core,
> but it allows for specifying
> 	PSEUDO_ALLOW_FSYNC=1 <command>
> and getting fsync behavior from that command.
>
> There's also a performance improvement in the case where NDEBUG is
> defined, which is "never" in our context.
>
> This is a lowish-priority change for oe-core, and in any event I don't
> believe the tarballs are up on the Yocto servers yet, but we need it
> internally and paperwork's easier if I submit it and then backport it.
> (I do recommmend it, though, because this makes it a LOT easier to
> check whether the fsync behavior is affecting something.)
>
> The following changes since commit 8e69f0ea42505e8f703893e18d73658b83d3b046:
>    Constantin Musca (1):
>          augeas: change SRC_URI
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib seebs/pseudo151
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo151
>
> Peter Seebach (1):
>    Update pseudo to 1.5.1
>
>   .../pseudo/{pseudo_1.5.bb => pseudo_1.5.1.bb}      |    4 ++--
>   meta/recipes-devtools/pseudo/pseudo_git.bb         |    4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>   rename meta/recipes-devtools/pseudo/{pseudo_1.5.bb => pseudo_1.5.1.bb} (52%)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


