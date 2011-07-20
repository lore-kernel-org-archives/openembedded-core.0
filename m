Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qja85-0005ar-EP
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 19:00:13 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jul 2011 09:56:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,236,1309762800"; d="scan'208";a="30291878"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jul 2011 09:56:06 -0700
Message-ID: <4E2708A5.2050904@linux.intel.com>
Date: Wed, 20 Jul 2011 09:56:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311089204.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311089204.git.tom_rini@mentor.com>
Subject: Re: [PATCH 0/4] Misc fixes, July 19
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
X-List-Received-Date: Wed, 20 Jul 2011 17:00:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/19/2011 08:34 AM, Tom Rini wrote:
> Hey all,
>
> As part of doing some "fix builds in very long paths" builds of world I've
> hit a few DEPENDS problems.  The following series is mostly adding DEPENDS
> where they're missing today.  While I was fixing up gnome-doc-utils-native
> I noticed it has the installed but not packaged QA problem so I fixed that
> while in here.
>
> The following changes since commit e66c2999afa2b3efbce8bb46c89f9db5e15f35c7:
>    Saul Wold (1):
>          libx11: ensure nativesdk uses correct DEPENDS and XCB flags
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib trini/misc-fixes-19july
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/misc-fixes-19july
>
> Tom Rini (4):
>    metacity: Add gnome-doc-utils to DEPENDS
>    gnome-doc-utils: Package up python site packages, bump PR
>    iptuils: Add sgmlspl-native to DEPENDS
>    btrfs-tools: Add util-linux to DEPENDS
>
>   .../btrfs-tools/btrfs-tools_git.bb                 |    3 ++-
>   meta/recipes-extended/iputils/iputils_s20101006.bb |    4 ++--
>   meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    4 ++--
>   meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    2 +-
>   meta/recipes-gnome/gnome/metacity_2.30.3.bb        |    4 ++--
>   5 files changed, 9 insertions(+), 8 deletions(-)
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


