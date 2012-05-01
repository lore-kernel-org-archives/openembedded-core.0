Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPIS9-0004D5-RF
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 21:09:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 May 2012 11:59:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="135815370"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 01 May 2012 11:59:53 -0700
Message-ID: <4FA032A9.1070901@linux.intel.com>
Date: Tue, 01 May 2012 11:59:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335439784.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335439784.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 0/2] kernel.bbclass sync, new efl release, systemd machine support
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
X-List-Received-Date: Tue, 01 May 2012 19:09:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/26/2012 06:19 AM, Martin Jansa wrote:
> The following changes since commit 5a1f172d35be610688842a8a9a84f24edb9aeb51:
>
>    bitbake.conf: use TUNE_PKGARCH instead of TARGET_ARCH in SDK_NAME (2012-04-26 10:59:20 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib jansa/pull
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull
>
> Martin Jansa (2):
>    xorg: add more native BBCLASSEXTENDs from meta-oe
>    opkg-utils: bump SRCREV for Packages cache fix and other fixes
>
>   .../opkg-utils/opkg-utils/add-license-field.patch  |   39 -----------
>   .../opkg-utils/arfile_header_split.patch           |   27 -------
>   .../opkg-utils/index-ignore-filenotfound.patch     |   73 --------------------
>   .../opkg-utils/opkg-utils/mtime-int.patch          |   30 --------
>   .../opkg-utils/opkg-utils/shebang.patch            |   46 ------------
>   meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    7 +--
>   .../xorg-lib/libxcomposite_0.4.3.bb                |    1 +
>   .../recipes-graphics/xorg-lib/libxcursor_1.1.13.bb |    1 +
>   meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb |    1 +
>   meta/recipes-graphics/xorg-lib/libxfixes_5.0.bb    |    2 +-
>   meta/recipes-graphics/xorg-lib/libxrandr_1.3.2.bb  |    2 +-
>   .../xorg-proto/compositeproto_0.4.2.bb             |    1 +
>   .../xorg-proto/damageproto_1.2.1.bb                |    1 +
>   meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb |    2 +-
>   .../xorg-proto/randrproto_1.3.2.bb                 |    2 +-
>   15 files changed, 10 insertions(+), 225 deletions(-)
>   delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/add-license-field.patch
>   delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split.patch
>   delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
>   delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
>   delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch
>
Merged into OE-Core

Thanks
	Sau!


