Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T24zz-0000DY-Jb
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 20:40:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Aug 2012 11:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="187349289"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by orsmga002.jf.intel.com with ESMTP; 16 Aug 2012 11:28:52 -0700
Message-ID: <502D3BE4.2080009@linux.intel.com>
Date: Thu, 16 Aug 2012 11:28:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20120808150633.GB32611@giant>
	<ED067880-C84B-42D9-B3C8-92F5E5B1250F@dominion.thruhere.net>
	<20120809071713.GA26150@giant> <5023C1FD.5040506@linux.intel.com>
	<20120810095802.GA22136@giant>
In-Reply-To: <20120810095802.GA22136@giant>
Subject: Re: [PATCH] pigz: Update to upstream version 2.2.5
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
X-List-Received-Date: Thu, 16 Aug 2012 18:40:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 08/10/2012 02:58 AM, Björn Stenberg wrote:
> Also added beginline/endline to LIC_FILES_CHKSUM to not track whole pigz.c.
>
> Signed-off-by: Björn Stenberg <bjst@enea.com>
> ---
>   .../pigz/{pigz_2.2.4.bb => pigz_2.2.5.bb}          |    8 +++-----
>   1 files changed, 3 insertions(+), 5 deletions(-)
>   rename meta/recipes-extended/pigz/{pigz_2.2.4.bb => pigz_2.2.5.bb} (26%)
>
> diff --git a/meta/recipes-extended/pigz/pigz_2.2.4.bb
> b/meta/recipes-extended/pigz/pigz_2.2.5.bb
> similarity index 26%
> rename from meta/recipes-extended/pigz/pigz_2.2.4.bb
> rename to meta/recipes-extended/pigz/pigz_2.2.5.bb
> index e76c49c..76c7c6c 100644
> --- a/meta/recipes-extended/pigz/pigz_2.2.4.bb
> +++ b/meta/recipes-extended/pigz/pigz_2.2.5.bb
> @@ -1,11 +1,9 @@
>   require pigz.inc
>
> -PR = "r2"
> -
>   NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
>
>   BBCLASSEXTEND = "native"
>
> -SRC_URI[md5sum] = "9df2a3c742524446fa4e797c17e8fd85"
> -SRC_URI[sha256sum] =
> "7e7967c47f66c07be97cbfa25c8816b72f9d35258466ea31eddc7666c914160e"
> -LIC_FILES_CHKSUM = "file://pigz.c;md5=53f47c097bbf11b937a421b1816a8dc5"
> +SRC_URI[md5sum] = "188f769ccedc403893d03049ad31e969"
> +SRC_URI[sha256sum] =
> "e37498cbf3a475d7ebe2519751188c29564bf8dd27ba68bd3c7fe1ac08792759"
> +LIC_FILES_CHKSUM =
> "file://pigz.c;beginline=7;endline=21;md5=a21d4075cb00ab4ca17fce5e7534ca95"
> --
> 1.7.5.4
>

Merged into OE-Core

Thanks
	Sau!



