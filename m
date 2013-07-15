Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 0C6BA619DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 07:14:12 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 15 Jul 2013 00:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,667,1367996400"; d="scan'208";a="268361706"
Received: from unknown (HELO [10.255.13.97]) ([10.255.13.97])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Jul 2013 00:14:12 -0700
Message-ID: <51E3A144.7080307@linux.intel.com>
Date: Mon, 15 Jul 2013 00:14:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Hongxu Jia <hongxu.jia@windriver.com>
References: <cover.1373599041.git.hongxu.jia@windriver.com>
	<8c39af966fa951e9395639e403195b34c37e6dbb.1373599041.git.hongxu.jia@windriver.com>
In-Reply-To: <8c39af966fa951e9395639e403195b34c37e6dbb.1373599041.git.hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/6] atom-pc:fix xuser write to usb storage failed
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
X-List-Received-Date: Mon, 15 Jul 2013 07:14:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2013 02:29 AM, Hongxu Jia wrote:
> Add package pmount to atom-pc, the normal user could invoke pmount to mount
> storage device and would have permissions to access it.
>
This should really have gone to the Poky ML (poky@yoctoproject.org)

Sau!

> [YOCTO #4004]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta-yocto-bsp/conf/machine/atom-pc.conf | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-yocto-bsp/conf/machine/atom-pc.conf b/meta-yocto-bsp/conf/machine/atom-pc.conf
> index 6318d60..127b3ad 100644
> --- a/meta-yocto-bsp/conf/machine/atom-pc.conf
> +++ b/meta-yocto-bsp/conf/machine/atom-pc.conf
> @@ -35,3 +35,4 @@ GLIBC_ADDONS = "nptl"
>   EXTRA_OECONF_append_pn-matchbox-panel-2 = " --with-battery=acpi"
>
>   ROOTLESS_X = "1"
> +IMAGE_INSTALL_append = " pmount"
>

