Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sfb5H-0000sI-Kq
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 20:17:23 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Jun 2012 11:06:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="158159439"
Received: from unknown (HELO [10.255.12.138]) ([10.255.12.138])
	by orsmga002.jf.intel.com with ESMTP; 15 Jun 2012 11:06:43 -0700
Message-ID: <4FDB79B3.5030309@linux.intel.com>
Date: Fri, 15 Jun 2012 11:06:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1339051007.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1339051007.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/1] opkg 0.1.8: do_fetch failed since no checksum specified
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
X-List-Received-Date: Fri, 15 Jun 2012 18:17:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2012 02:24 AM, Robert Yang wrote:
> The following changes since commit f8a054aca9962ebfd4c74fc1d34cd684de6b3568:
>
>    perl: Allow perl to cross build and native build in a directory named "t" (2012-06-05 23:02:20 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/opkg_sum
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/opkg_sum
>
> Robert Yang (1):
>    opkg 0.1.8: do_fetch failed since no checksum specified
>
>   .../opkg/opkg-0.1.8/add_vercmp.patch               |   36 --------------------
>   meta/recipes-devtools/opkg/opkg_0.1.8.bb           |    5 ++-
>   2 files changed, 4 insertions(+), 37 deletions(-)
>   delete mode 100644 meta/recipes-devtools/opkg/opkg-0.1.8/add_vercmp.patch
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

Updated version merged into OE-Core

Thanks
	Sau!


