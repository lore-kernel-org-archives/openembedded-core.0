Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 450C26AA6F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 15:24:23 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Jul 2013 08:24:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,669,1367996400"; d="scan'208";a="331607767"
Received: from unknown (HELO [10.255.13.97]) ([10.255.13.97])
	by azsmga001.ch.intel.com with ESMTP; 15 Jul 2013 08:24:20 -0700
Message-ID: <51E41423.4090901@linux.intel.com>
Date: Mon, 15 Jul 2013 08:24:19 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Cristian Iorga <cristian.iorga@intel.com>
References: <cover.1373896070.git.cristian.iorga@intel.com>
	<809bd57326a24570dfd583e33821f42c4e7b930a.1373896070.git.cristian.iorga@intel.com>
In-Reply-To: <809bd57326a24570dfd583e33821f42c4e7b930a.1373896070.git.cristian.iorga@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] bluez4: conflicts with/replaces bluez5
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
X-List-Received-Date: Mon, 15 Jul 2013 15:25:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/15/2013 06:50 AM, Cristian Iorga wrote:
> - RCONFLICTS/RREPLACES bluez5
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   meta/recipes-connectivity/bluez/bluez4_4.101.bb |    3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
> index f48adfd..b91c9c3 100644
> --- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
> +++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
> @@ -11,6 +11,9 @@ SRC_URI += "file://bluetooth.conf \
>   SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
>   SRC_URI[sha256sum] = "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4ad75fe52846f7487"
>
> +RCONFLICTS_${PN} = "bluez5"
> +RREPLACES_${PN} = "bluez5"
> +
Is the RREPLACES correct here and in the bluez5 recipe?

I know they conflict, but I did not think they could replace each other.

Sau!

>   do_install_append() {
>   	install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
>   	install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
>

