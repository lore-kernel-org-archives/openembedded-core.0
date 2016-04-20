Return-Path: <dannenberg@ti.com>
X-Greylist: delayed 329 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Apr 2016 19:40:00 UTC
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by mail.openembedded.org (Postfix) with ESMTP id B2B8B606D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 19:40:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3KJZPR2004797;
	Wed, 20 Apr 2016 14:35:25 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3KJZPsK002861;
	Wed, 20 Apr 2016 14:35:25 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 20 Apr 2016 14:35:25 -0500
Received: from borg.dal.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u3KJZPWd016654;	Wed, 20 Apr 2016 14:35:25 -0500
Date: Wed, 20 Apr 2016 14:35:25 -0500
From: Andreas Dannenberg <dannenberg@ti.com>
To: Yannick Gicquel <yannick.gicquel@iot.bzh>
Message-ID: <20160420193525.GD16786@borg.dal.design.ti.com>
References: <1461160239-7799-5-git-send-email-yannick.gicquel@iot.bzh>
MIME-Version: 1.0
In-Reply-To: <1461160239-7799-5-git-send-email-yannick.gicquel@iot.bzh>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC, v2, 4/4] kernel: fitimage: basic support for fitimage signature
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
X-List-Received-Date: Wed, 20 Apr 2016 19:40:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 20, 2016 at 03:50:39PM +0200, Yannick Gicquel wrote:
> This is an initial support of fitImage signature to enable U-Boot verified
> boot. This feature is implemented by adding a signature tag to the
> configuration section of the generated fit-image.its file.
> 
> When a UBOOT_SIGN_ENABLE variable is set to "1", the signature procedure is
> activated and performs a second call to mkimage to sign the fitImage file and
> to include the public key in the deployed U-Boot device tree blob. (This
> implementation depends on the use of CONFIG_OF_SEPARATE in U-Boot.)
> 
> As the U-Boot device tree blob is appended in the deploy dir, a dependency
> on 'u-boot:do_deploy' is added when the feature is activated.
> 
> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
> Reviewed-by: Tom Rini <trini@konsulko.com>


Acked-by: Andreas Dannenberg <dannenberg@ti.com>

--
Andreas Dannenberg
Texas Instruments Inc

