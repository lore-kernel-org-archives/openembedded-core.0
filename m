Return-Path: <dannenberg@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by mail.openembedded.org (Postfix) with ESMTP id 24E6F606D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 19:40:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3KJYuj6004725;
	Wed, 20 Apr 2016 14:34:56 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3KJYucW002328;
	Wed, 20 Apr 2016 14:34:56 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 20 Apr 2016 14:34:55 -0500
Received: from borg.dal.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u3KJYtZK016110;	Wed, 20 Apr 2016 14:34:55 -0500
Date: Wed, 20 Apr 2016 14:34:55 -0500
From: Andreas Dannenberg <dannenberg@ti.com>
To: Yannick Gicquel <yannick.gicquel@iot.bzh>
Message-ID: <20160420193455.GC16786@borg.dal.design.ti.com>
References: <1461160239-7799-4-git-send-email-yannick.gicquel@iot.bzh>
MIME-Version: 1.0
In-Reply-To: <1461160239-7799-4-git-send-email-yannick.gicquel@iot.bzh>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC, v2, 3/4] kernel: fitimage: support device tree compiler options
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
X-List-Received-Date: Wed, 20 Apr 2016 19:40:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 20, 2016 at 03:50:38PM +0200, Yannick Gicquel wrote:
> This introduces a new variable to set the device tree compiler options while
> calling mkimage ('-D' option). By default, this variable is not set but it can
> be defined in a configuration file, as following example:
> 
> UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
> 
> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
> Reviewed-by: Tom Rini <trini@konsulko.com>


Acked-by: Andreas Dannenberg <dannenberg@ti.com>

--
Andreas Dannenberg
Texas Instruments Inc

