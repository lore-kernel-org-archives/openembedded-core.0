Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 636706CA2B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 19:34:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Oct 2013 12:34:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="426650320"
Received: from unknown (HELO [10.255.12.29]) ([10.255.12.29])
	by orsmga002.jf.intel.com with ESMTP; 29 Oct 2013 12:34:39 -0700
Message-ID: <4EC699B5.2070604@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321006415.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1321006415.git.xiaofeng.yan@windriver.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 0/1] directfb: update to 1.4.15
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
Date: Tue, 29 Oct 2013 19:34:37 -0000
X-Original-Date: Fri, 18 Nov 2011 09:45:25 -0800
X-List-Received-Date: Tue, 29 Oct 2013 19:34:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2011 03:14 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> I update it to 1.4.15 because directfb at 1.5 or higher need instruction set of armv6.
> Some codes are realized with assemble language for new directfb but the current qemuarm base on armv5.
> Some error will appear like "No xxx instruction ..." when compiling directfb at 1.5.3 for qemuarm.
> For directfb running on more platform I update it to 1.4.15.
> I will seek some patches to use instrcutions of armv5 instead of armv6 for new directfb on platform qemuarm.
> It could take some time for me. Please share your experience with me if you know. I will appreciate you very much.
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: xiaofeng/directfb
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/directfb
>
> Thanks,
>      Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>
>
> Xiaofeng Yan (1):
>    diretfb: update to 1.4.15
>
>   .../{directfb_1.4.12.bb =>  directfb_1.4.15.bb}     |    9 ++++-
>   .../directfb-1.2.x-fix-pkgconfig-cflags.patch      |   36 +++++++++----------
>   2 files changed, 24 insertions(+), 21 deletions(-)
>   rename meta/recipes-graphics/directfb/{directfb_1.4.12.bb =>  directfb_1.4.15.bb} (63%)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Merged Updated version to OE-Core

Thanks
	Sau!

