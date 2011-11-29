Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVQCv-0000cg-8C
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 17:06:57 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Nov 2011 08:00:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="81173516"
Received: from unknown (HELO [10.255.15.251]) ([10.255.15.251])
	by orsmga002.jf.intel.com with ESMTP; 29 Nov 2011 08:00:11 -0800
Message-ID: <4ED5018B.8050508@linux.intel.com>
Date: Tue, 29 Nov 2011 08:00:11 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321862948.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1321862948.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 0/1] libx11-trim: update to 1.4.4
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
X-List-Received-Date: Tue, 29 Nov 2011 16:06:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/2011 12:29 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> Thanks for martin's comment.
> I have modified libx11-trim_1.4.4.bb and don't remove libx11-trim_1.3.4.bb because someone could want to use previous version for some reason. If it is not necessary later, then I will remove the old version.
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: xiaofeng/update_libx11-trim
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/update_libx11-trim
>
> Thanks,
>      Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>
>
> Xiaofeng Yan (1):
>    blibx11-trim: update to 1.4.4
>
>   .../libx11-trim-1.4.4/keysymdef_include.patch      |   23 ++++++++++
>   .../libx11-trim-1.4.4/makekeys_crosscompile.patch  |   45 ++++++++++++++++++++
>   .../libx11-trim-1.4.4/x11_disable_makekeys.patch   |   29 +++++++++++++
>   .../recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb |   20 +++++++++
>   4 files changed, 117 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/keysymdef_include.patch
>   create mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/makekeys_crosscompile.patch
>   create mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/x11_disable_makekeys.patch
>   create mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
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


