Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8JHb-0008Mw-4x
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 00:04:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Sep 2011 14:58:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,446,1312182000"; d="scan'208";a="55906199"
Received: from unknown (HELO [10.255.14.215]) ([10.255.14.215])
	by azsmga001.ch.intel.com with ESMTP; 26 Sep 2011 14:58:49 -0700
Message-ID: <4E80F598.3000407@linux.intel.com>
Date: Mon, 26 Sep 2011 14:58:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US;
	rv:1.9.2.22) Gecko/20110902 Thunderbird/3.1.14
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAHod+GefxnzwC0BGDYKe44Wjx=kVXUGK_YhbzYVT0uBxz7FbUw@mail.gmail.com>
In-Reply-To: <CAHod+GefxnzwC0BGDYKe44Wjx=kVXUGK_YhbzYVT0uBxz7FbUw@mail.gmail.com>
Subject: Re: [PATCH] bluez4:replace deprecated configure switch
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
X-List-Received-Date: Mon, 26 Sep 2011 22:04:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/21/2011 01:47 PM, Marko Katić wrote:
> "--enable-configfiles" is deprecated upstream. Here is the original
> reason & patch:
>
> http://www.spinics.net/lists/linux-bluetooth/msg14266.html
>
> Replace "--enable-configfiles" with "--enable-datafiles" in the bluez4
> recipe.
>
> diff --git a/meta/recipes-connectivity/bluez/bluez4_4.96.bb
> <http://bluez4_4.96.bb> b/meta/recipes-connectivity/bluez/bluez4_4
> index 994cec7..7ca6ac1 100644
> --- a/meta/recipes-connectivity/bluez/bluez4_4.96.bb <http://bluez4_4.96.bb>
> +++ b/meta/recipes-connectivity/bluez/bluez4_4.96.bb <http://bluez4_4.96.bb>
> @@ -12,7 +12,7 @@ RDEPENDS_${PN}-dev = "bluez-hcidump"
>   ASNEEDED = ""
> -PR = "r0"
> +PR = "r1"
>   SRC_URI = "\
>     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
> @@ -39,7 +39,7 @@ EXTRA_OECONF = "\
>     --enable-dund \
>     --disable-cups \
>     --enable-test \
> -  --enable-configfiles \
> +  --enable-datafiles \
> "
>   do_install_append() {
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Merged into OE-Core

Thanks
	Sau!


