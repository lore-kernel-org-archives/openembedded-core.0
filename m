Return-Path: <dannenberg@ti.com>
X-Greylist: delayed 951 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Apr 2016 19:49:40 UTC
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by mail.openembedded.org (Postfix) with ESMTP id BD794606D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 19:49:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3KJXnYW020835;
	Wed, 20 Apr 2016 14:33:49 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3KJXnxI001219;
	Wed, 20 Apr 2016 14:33:49 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 20 Apr 2016 14:33:48 -0500
Received: from borg.dal.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u3KJXmc1009584;	Wed, 20 Apr 2016 14:33:48 -0500
Date: Wed, 20 Apr 2016 14:33:48 -0500
From: Andreas Dannenberg <dannenberg@ti.com>
To: Yannick Gicquel <yannick.gicquel@iot.bzh>
Message-ID: <20160420193348.GA16786@borg.dal.design.ti.com>
References: <1461160239-7799-2-git-send-email-yannick.gicquel@iot.bzh>
MIME-Version: 1.0
In-Reply-To: <1461160239-7799-2-git-send-email-yannick.gicquel@iot.bzh>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC, v2, 1/4] u-boot: basic support of dtb append for verified boot
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
X-List-Received-Date: Wed, 20 Apr 2016 19:49:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 20, 2016 at 03:50:36PM +0200, Yannick Gicquel wrote:
> This introduces a new uboot-sign.class to support U-Boot verified boot.
> 
> This part delivers the new class file, with related environment variables, and
> a basic prepend to do_install task which performs the concatenation of the
> u-boot-nodtb.bin and the device tree blob. The 'cat' command used
> overrides the u-boot.bin in both DEPLOYDIR & build dir to propagate the
> changes in later tasks (do_install, do_package, etc.)
> 
> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
> Reviewed-by: Tom Rini <trini@konsulko.com>

Acked-by: Andreas Dannenberg <dannenberg@ti.com>


Thanks for the submission! Agreed with Tom, this will hopefully make the
FIT-based authentication scheme easier and more accessible.


--
Andreas Dannenberg
Texas Instruments Inc

