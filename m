Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QveHs-00028k-GM
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 01:52:12 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Aug 2011 16:47:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,266,1312182000"; 
   d="scan'208";a="9944972"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Aug 2011 16:47:26 -0700
Message-ID: <4E52EA8D.1070704@linux.intel.com>
Date: Mon, 22 Aug 2011 16:47:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313587776.git.anders@chargestorm.se>
In-Reply-To: <cover.1313587776.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [PATCH 0/2] Make qemu & runqemu detect libgl on Debian
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
X-List-Received-Date: Mon, 22 Aug 2011 23:52:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2011 06:30 AM, Anders Darander wrote:
>
> Modify the patches to make qemu-native compile and run on Ubuntu 11.10, to use
> a wildcard match instead of `uname -i`. The latter only returns unknown on
> e.g. Debian.
>
> These patches are similar to what we did for perl-native in the
> Configure-multilib.patch (commit id 9260c1b9d04a88d15ab5376c7cd56f381fe3e53b
> in oe-core).
>
> The following changes since commit 13db5f420ca9bff98561f80d78958278734ad1f4:
>
>    distro-tracking: Update info for gpgme, libassuan, apr... after last upgrade. (2011-08-15 15:26:04 +0100)
>
> are available in the git repository at:
>    git://github.com/darander/oe-core qemu-native
>    https://github.com/darander/oe-core/tree/qemu-native
>
> Anders Darander (2):
>    qemu: modify search paths for libgl
>    scripts/runqemu: modify search paths for libgl
>
>   meta/recipes-devtools/qemu/qemu.inc |    2 +-
>   scripts/runqemu                     |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


