Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnFtx-0007FW-ND
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 21:45:05 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jan 2012 12:37:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="99695893"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by orsmga002.jf.intel.com with ESMTP; 17 Jan 2012 12:37:27 -0800
Message-ID: <4F15DC07.6060001@linux.intel.com>
Date: Tue, 17 Jan 2012 12:37:27 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326437644.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1326437644.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 0/3]: Fix the error when building image "core-image-gtk-directfb"
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
X-List-Received-Date: Tue, 17 Jan 2012 20:45:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2012 11:06 PM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> Hi Saul,
>
> I remove ${sysconfdir}/* because bitbake will package this directory as default.
>
> The following part was previous description.
> ----------------------------------------------
> Bitbake complain " No package 'cairo-xlib' found" when building image "core-image-gtk-directfb".
> Misconfiguration of directfb in PACKAGECONFIG causes this problem. I change directfb to gtk-directfb.
> Another problem is about messy code when running gtk-demo because of no "/etc/pango".
> I create this directory in pango.inc.
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: xiaofeng/gtk-directfb
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/gtk-directfb
>
> Thanks,
>      Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>
>
> Xiaofeng Yan (3):
>    gtk.inc: Change configuration of directfb to gtk-directfb
>    cairo.inc: Change configuration of directfb to gtk-directfb
These first 2 were merged into OE-Core
>    pango.inc: add directory "/etc/pango"
>
This was also merged, but there where a couple of other changes to 
pango.inc, I think that we need one more change to fix the /etc/pango -> 
${sysconfdir} in the FILES_${PN}list.

Sau!

>   meta/recipes-gnome/gtk+/gtk+.inc      |    2 +-
>   meta/recipes-graphics/cairo/cairo.inc |    2 +-
>   meta/recipes-graphics/pango/pango.inc |    7 ++++++-
>   3 files changed, 8 insertions(+), 3 deletions(-)
>


