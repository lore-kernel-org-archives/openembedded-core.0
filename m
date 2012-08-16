Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T24xb-00007f-Hq
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 20:38:23 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Aug 2012 11:26:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="187348602"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by orsmga002.jf.intel.com with ESMTP; 16 Aug 2012 11:26:24 -0700
Message-ID: <502D3B50.2070706@linux.intel.com>
Date: Thu, 16 Aug 2012 11:26:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1344479229.git.jackie.huang@windriver.com>
In-Reply-To: <cover.1344479229.git.jackie.huang@windriver.com>
Subject: Re: [PATCH 0/1] gdk-pixbuf: fix the postinstall script failure when no icon is installed
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
X-List-Received-Date: Thu, 16 Aug 2012 18:38:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2012 07:30 PM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> If gtk+ is added to core-image-minimal, postinstall script failed on boot:
>
> Running postinst /etc/rpm-postinsts/104...
> gtk-update-icon-cache: No theme index file.
> ERROR: postinst /etc/rpm-postinsts/104 failed.
>
> This patch fixed the postinstall script to check for the icon
> file first and not run the gtk-update-icon-cache if no icon
> is installed.
>
> [YOCTO #2905]
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
> The following changes since commit 1e873271362b770381903098d46c4aec164d81de:
>
>    automake: Fix version reference in path substitutions (2012-08-07 23:35:54 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib jhuang0/bug2905_gdk_0809
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/bug2905_gdk_0809
>
> Jackie Huang (1):
>    gdk-pixbuf: fix the postinstall script failure when no icon is
>      installed
>
>   meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |   10 ++++++++--
>   1 files changed, 8 insertions(+), 2 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



