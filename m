Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RSuf4-00019U-1a
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 19:01:38 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Nov 2011 09:55:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="78869792"
Received: from unknown (HELO [10.255.12.15]) ([10.255.12.15])
	by orsmga001.jf.intel.com with ESMTP; 22 Nov 2011 09:55:05 -0800
Message-ID: <4ECBE1F9.9010605@linux.intel.com>
Date: Tue, 22 Nov 2011 09:55:05 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321351373.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1321351373.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 0/1] libx11-diet: update to 1.4.4
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
X-List-Received-Date: Tue, 22 Nov 2011 18:01:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/2011 02:07 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> Hi Saul,
>
> I have modified my fault according to your suggestion.
> Please review it again.
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: xiaofeng/libx11-diet
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/libx11-diet
>
> Thanks,
>      Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>
>
> Xiaofeng Yan (1):
>    libx11-diet: update to 1.4.4
>
>   .../xorg-lib/libx11-diet-1.3/include_fix.patch     |   25 --------------
>   .../xorg-lib/libx11-diet-1.3/nodolt.patch          |   14 --------
>   .../libx11-diet-1.3/x11_disable_makekeys.patch     |   31 ------------------
>   .../X18NCMSstubs.diff                              |    1 +
>   .../fix-disable-xlocale.diff                       |    1 +
>   .../fix-utf8-wrong-define.patch                    |    2 +
>   .../libx11-diet-1.4.4/keysymdef_include.patch      |   23 +++++++++++++
>   .../libx11-diet-1.4.4/x11_disable_makekeys.patch   |   34 ++++++++++++++++++++
>   .../{libx11-diet_1.3.bb =>  libx11-diet_1.4.4.bb}   |   17 +++++-----
>   9 files changed, 70 insertions(+), 78 deletions(-)
>   delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.3/include_fix.patch
>   delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.3/nodolt.patch
>   delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.3/x11_disable_makekeys.patch
>   rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.3 =>  libx11-diet-1.4.4}/X18NCMSstubs.diff (99%)
>   rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.3 =>  libx11-diet-1.4.4}/fix-disable-xlocale.diff (90%)
>   rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.3 =>  libx11-diet-1.4.4}/fix-utf8-wrong-define.patch (88%)
>   create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/keysymdef_include.patch
>   create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/x11_disable_makekeys.patch
>   rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.3.bb =>  libx11-diet_1.4.4.bb} (51%)
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



