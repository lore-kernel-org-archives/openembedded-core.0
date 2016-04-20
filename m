Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 916EB606D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 19:43:26 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.153])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Y004LC6SEFP70@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2016 14:43:27 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=sozttTNsAAAA:8
	a=R-0VkF0K0oXxKZ0VFV4A:9 a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 7ef6fcc8; Wed, 20 Apr 2016 19:43:27 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 36EE8161FB3; Wed,
	20 Apr 2016 15:43:26 -0400 (EDT)
Date: Wed, 20 Apr 2016 15:43:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Tom Rini <trini@konsulko.com>
Message-id: <20160420194326.GO16135@denix.org>
References: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
	<20160420152318.GB1924@bill-the-cat>
MIME-version: 1.0
In-reply-to: <20160420152318.GB1924@bill-the-cat>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH v2 0/4] U-Boot verified boot basic support
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
X-List-Received-Date: Wed, 20 Apr 2016 19:43:28 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 20, 2016 at 11:23:18AM -0400, Tom Rini wrote:
> On Wed, Apr 20, 2016 at 03:50:35PM +0200, Yannick Gicquel wrote:
> 
> > Changes since v1:
> >   * Uses a class uboot-sign.bbclass file instead of include file.
> >   * 'assemble_dtb' task removed and replace by do_install_prepend function
> >     for u-boot recipe.
> > 
> > Yannick Gicquel (4):
> >   u-boot: basic support of dtb append for verified boot
> >   u-boot: deploy u-boot-nodtb and dtb files
> >   kernel: fitimage: support device tree compiler options
> >   kernel: fitimage: basic support for fitimage signature
> > 
> >  meta/classes/kernel-fitimage.bbclass | 52 +++++++++++++++++++++++--
> >  meta/classes/uboot-sign.bbclass      | 75 ++++++++++++++++++++++++++++++++++++
> >  meta/recipes-bsp/u-boot/u-boot.inc   |  2 +-
> >  3 files changed, 125 insertions(+), 4 deletions(-)
> >  create mode 100644 meta/classes/uboot-sign.bbclass
> 
> Thanks for doing this.  It will hopefully make this knowledge more wide
> spread and thus more widely used.

This is very timely for us as well and it is nice to use the standard and open 
implementation. For the entire series:

Acked-by: Denys Dmytriyenko <denys@ti.com>

-- 
Denys

