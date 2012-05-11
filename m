Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SStyp-0003Zw-QQ
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 19:50:16 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 May 2012 10:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="142863424"
Received: from unknown (HELO [10.255.12.250]) ([10.255.12.250])
	by orsmga002.jf.intel.com with ESMTP; 11 May 2012 10:40:19 -0700
Message-ID: <4FAD4F03.1060901@linux.intel.com>
Date: Fri, 11 May 2012 10:40:19 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1336719792.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1336719792.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 0/2]gdk-pixbuf: Add --with-x11 when building lsb image
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
X-List-Received-Date: Fri, 11 May 2012 17:50:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2012 12:23 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> This is V3 for fixing bug 2284. I made some modification according to Richard's suggestion.
>
> The following was Richard's suggestion:
> We should be using the linuxstdbase override and also make it
> conditional on x11 being in DISTRO_FEATURES.
> Split xlib to a single pakcage.
>
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: xiaofeng/2284
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/2284
>
> Thanks,
>      Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>
>
> Xiaofeng Yan (2):
>    task-core-lsb: Add libgdk-pixbuf-xlib to core-image-lsb
>    gdk-pixbuf: Add --with-x11 when building lsb image
>
>   meta/recipes-extended/tasks/task-core-lsb.bb       |    7 +++----
>   meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |   11 +++++++++--
>   2 files changed, 12 insertions(+), 6 deletions(-)
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


