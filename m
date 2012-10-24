Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TR2nA-00044j-Qk
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 17:22:49 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Oct 2012 08:09:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,640,1344236400"; d="scan'208";a="237607010"
Received: from unknown (HELO [10.255.14.104]) ([10.255.14.104])
	by fmsmga001.fm.intel.com with ESMTP; 24 Oct 2012 07:59:17 -0700
Message-ID: <50880244.5010206@linux.intel.com>
Date: Wed, 24 Oct 2012 07:59:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1350996778.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1350996778.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] nativesdk-ncurses 5.9: files were installed but not shipped
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
X-List-Received-Date: Wed, 24 Oct 2012 15:22:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/2012 06:12 AM, Robert Yang wrote:
> Test info:
> $ bitbake core-image-sato meta-toolchain-sdk
>
> There is no warning about "nativesdk-ncurses: files were installed but
> not shipped"
>
> // Robert
>
> The following changes since commit b0187d2ba864a5a218effa01e4ddb23ade40c7e2:
>
>    oe-buildenv-internal: break BB_ENV_EXTRAWHITE into small pieces (2012-10-23 14:00:14 +0800)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/ncurses
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/ncurses
>
> Robert Yang (1):
>    nativesdk-ncurses 5.9: files were installed but not shipped
>
>   meta/recipes-core/ncurses/ncurses.inc |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
Merged into OE-Core

Thanks
	Sau!



