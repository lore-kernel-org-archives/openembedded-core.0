Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1QMP5i-0003gg-J8
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 20:33:58 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 17 May 2011 11:29:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,226,1304319600"; 
   d="scan'208";a="3485178"
Received: from unknown (HELO [10.255.12.160]) ([10.255.12.160])
	by fmsmga001.fm.intel.com with ESMTP; 17 May 2011 11:29:37 -0700
Message-ID: <4DD2BE91.1090406@intel.com>
Date: Tue, 17 May 2011 11:29:37 -0700
From: Saul Wold <saul.wold@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305442428.git.raj.khem@gmail.com>
In-Reply-To: <cover.1305442428.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/2] Upgrade opkg
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
X-List-Received-Date: Tue, 17 May 2011 18:33:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/14/2011 11:57 PM, Khem Raj wrote:
> These patches help in removing extra size that was being added to
> slugos-image when using oe-core. With these patches both from OE
> the root file system is 100k less than the classic OE. Currently
> the root file size is about 1M bigger due to opkg pulling in curl
> and then bunch of other libraries
>
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>    Branch: kraj/slugos-support
>    Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/slugos-support
>
> Thanks,
>      Khem Raj<raj.khem@gmail.com>
> ---
>
>
> Khem Raj (2):
>    opkg: Bump SRCREV to 609
>    e2fsprogs_1.41.14.bb: Package libraries into separate packages
>
>   .../e2fsprogs/e2fsprogs_1.41.14.bb                 |    6 ++++++
>   meta/recipes-devtools/opkg/opkg.inc                |    8 ++++++--
>   meta/recipes-devtools/opkg/opkg_svn.bb             |    3 ++-
>   3 files changed, 14 insertions(+), 3 deletions(-)
>
Merged into oe-core

Thanks
	Sau!



