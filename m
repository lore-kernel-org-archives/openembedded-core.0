Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T61pd-0006a2-In
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 18:06:29 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Aug 2012 08:54:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,321,1344236400"; d="scan'208";a="185848135"
Received: from unknown (HELO [10.255.13.20]) ([10.255.13.20])
	by orsmga001.jf.intel.com with ESMTP; 27 Aug 2012 08:54:16 -0700
Message-ID: <503B9828.7030205@linux.intel.com>
Date: Mon, 27 Aug 2012 08:54:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: jackie.huang@windriver.com
References: <cover.1345711916.git.jackie.huang@windriver.com>
In-Reply-To: <cover.1345711916.git.jackie.huang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] gdk-pixbuf: call gtk-update-icon-cache with -t in postinstall script
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
X-List-Received-Date: Mon, 27 Aug 2012 16:06:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/24/2012 06:29 AM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> * Test info:
> $ bitbake core-image-sato core-image-sato-sdk
> $ runqemu qemux86 core-image-sato nographic
> $ runqemu qemux86 core-image-sato-sdk nographic
>
> The following changes since commit e3b0925f4c861393e436deb6b1912f9f1f325d1e:
>
>    libtool: normalize link paths before considering for RPATH (2012-08-22 14:22:51 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib jhuang0/bug2905_gdk_0823
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/bug2905_gdk_0823
>
> Jackie Huang (1):
>    gdk-pixbuf: call gtk-update-icon-cache with -t in postinstall script
>
>   meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



