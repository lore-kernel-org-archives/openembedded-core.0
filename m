Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F6AA6010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 04:53:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAJ4rfja006684
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 18 Nov 2015 20:53:42 -0800
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 18 Nov 2015 20:53:41 -0800
To: <openembedded-core@lists.openembedded.org>, <maxin.john@intel.com>
References: <1447839279-12119-1-git-send-email-maxin.john@intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <564D55D4.1000808@windriver.com>
Date: Wed, 18 Nov 2015 23:53:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447839279-12119-1-git-send-email-maxin.john@intel.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [PATCH 1/6] iproute2: update to 4.3.0
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
X-List-Received-Date: Thu, 19 Nov 2015 04:53:45 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-11-18 04:34 AM, Maxin B. John wrote:
> 4.1.1 -> 4.3.0
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>   .../iproute2/{iproute2_4.1.1.bb => iproute2_4.3.0.bb}                 | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-connectivity/iproute2/{iproute2_4.1.1.bb => iproute2_4.3.0.bb} (68%)
>
> diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.1.1.bb b/meta/recipes-connectivity/iproute2/iproute2_4.3.0.bb
> similarity index 68%
> rename from meta/recipes-connectivity/iproute2/iproute2_4.1.1.bb
> rename to meta/recipes-connectivity/iproute2/iproute2_4.3.0.bb
> index 10db0ba..0b3d896 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2_4.1.1.bb
> +++ b/meta/recipes-connectivity/iproute2/iproute2_4.3.0.bb
> @@ -4,8 +4,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
>              file://configure-cross.patch \
>              file://0001-iproute2-de-bash-scripts.patch \
>             "
> -SRC_URI[md5sum] = "39290cb3a55d38dd8d10e19a3094109f"
> -SRC_URI[sha256sum] = "73077a989efb934450bd655cbd9aaddaa747cb696c64d0c9a3323768a6a8e66f"
> +SRC_URI[md5sum] = "1a2bbb80cfc7ab3f3e987e18b3207c2f"
> +SRC_URI[sha256sum] = "f03b1188dd6c039512424de82ff7a8f3b446680bd4e908ff42a7b9b137422995"
>
>   # CFLAGS are computed in Makefile and reference CCOPTS
>   #
>


There are other iproute utilities that are not yet packaged:
    misc netem genl tipc
and perhaps more from the make install rule:
   for i in lib ip tc bridge misc netem genl tipc man; \
Note that misc contains these executables:

misc/lnstat
misc/ifstat
misc/arpd
misc/rtacct
misc/nstat
misc/ss

Do we want individual iproute2-FOO packages or a catchall
iproute2-extras ?

I think additional packages for each of: misc netem genl tipc
should be fine but I haven't played with these tools recently
so input is welcome.

These were not packaged in jethro AFAIK so we should pull the
patch back once there is consensus.

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

