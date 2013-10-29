Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 25E966D4F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 19:34:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Oct 2013 12:34:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="426650327"
Received: from unknown (HELO [10.255.12.29]) ([10.255.12.29])
	by orsmga002.jf.intel.com with ESMTP; 29 Oct 2013 12:34:39 -0700
Message-ID: <4EC69CC8.20402@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321351373.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1321351373.git.xiaofeng.yan@windriver.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 0/1] libx11-diet: update to 1.4.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
Date: Tue, 29 Oct 2013 19:34:38 -0000
X-Original-Date: Fri, 18 Nov 2011 09:58:32 -0800
X-List-Received-Date: Tue, 29 Oct 2013 19:34:38 -0000
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
Looks like the original got merged already, can you rebase this with the 
line removal please.

Thanks

Sau!
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

