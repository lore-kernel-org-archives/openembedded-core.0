Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvkZz-0008ME-Bb
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 08:35:19 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Aug 2011 23:30:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,267,1312182000"; d="scan'208";a="44091138"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2011 23:30:33 -0700
Message-ID: <4E53490A.20904@linux.intel.com>
Date: Mon, 22 Aug 2011 23:30:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1313636030.git.kai.kang@windriver.com>
In-Reply-To: <cover.1313636030.git.kai.kang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] bug fix for 1212 and split the previous distro tracking fields commit
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
X-List-Received-Date: Tue, 23 Aug 2011 06:35:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/18/2011 02:18 AM, Kang Kai wrote:
> From: Kang Kai<kai.kang@windriver.com>
>
> Hi Saul,
>
> I add a method to check the depencies between eglibc configurable options. When one option
> is set in DISTRO_FEATURES_LIBC then the required options will be set too.
> Fixes [Yocto #1212]
>
> Split the previous update distro tracking fields commit.
>
> Regards,
>
> The following changes since commit a21ff559e7c93e9da61104f4a33e42e6004189fd:
>
>    Fixup remaining bb.msg.domain users (2011-08-15 17:31:52 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib kangkai/distro
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/distro
>
> Kang Kai (5):
>    eglibc: check dependencies among eglibc options
>    mailx: update license and distro tracking fileds
>    slang: add homepage and update distro tracking fields
>    alsa-tools: update license and add distro tracking fields
>    newt: update distro tracking fields
>
>   meta/conf/distro/include/default-distrovars.inc    |    2 +-
>   .../conf/distro/include/distro_tracking_fields.inc |   29 +++++---
>   meta/recipes-core/eglibc/eglibc-options.inc        |   75 +++++++++++++++++++-
>   meta/recipes-extended/mailx/mailx_12.5.bb          |    4 +-
>   meta/recipes-extended/slang/slang_2.2.4.bb         |    3 +-
>   .../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |   11 ++-
>   6 files changed, 104 insertions(+), 20 deletions(-)
>
Merged in OE-Core

Thanks
	Sau!




