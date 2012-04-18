Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SKWXY-0003r5-Vr
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 17:11:29 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Apr 2012 08:02:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="131229970"
Received: from unknown (HELO [10.255.12.104]) ([10.255.12.104])
	by orsmga001.jf.intel.com with ESMTP; 18 Apr 2012 08:02:00 -0700
Message-ID: <4F8ED767.7010206@linux.intel.com>
Date: Wed, 18 Apr 2012 08:01:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334583221.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1334583221.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/3] meta-toolchain-sdk: /bin/perl is needed by some pkgs on FC 17
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
X-List-Received-Date: Wed, 18 Apr 2012 15:11:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/16/2012 06:38 AM, Robert Yang wrote:
> Test info:
> Tested on FC 13/16/17 64bit
> 1) $ bitbake  meta-toolchain-sdk core-image-sato
> 2) untar the sdk, and use the sdk to build some pkgs (autoreconf, configure and make)
>
> // Robert
>
> The following changes since commit 4e1a8ed1ab7e7bd950e511c79ddfe072cb280a6e:
>
>    bitbake.conf: Include abi_version.conf in a early stage (2012-04-16 12:51:50 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/fc17_sdk
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/fc17_sdk
>
> Robert Yang (3):
>    glib-2.0: fix builds on fedora 17
>    autoconf-nativesdk: fix builds on fedora 17
>    automake-nativesdk: fix builds on fedora 17
>
>   meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb     |   12 +++++++++++-
>   meta/recipes-devtools/autoconf/autoconf.inc       |   16 +++++++++++++++-
>   meta/recipes-devtools/autoconf/autoconf_2.68.bb   |    2 +-
>   meta/recipes-devtools/automake/automake_1.11.2.bb |   20 +++++++++++++++++---
>   4 files changed, 44 insertions(+), 6 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged updated version into OE-Core

Thanks
	Sau!


