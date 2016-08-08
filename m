Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by mail.openembedded.org (Postfix) with ESMTP id BA05977196
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 18:05:57 +0000 (UTC)
Received: from vz-proxy-m001.mx.aol.com ([64.236.83.14])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBL00LT1RLDQO80@vms173013.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2016 13:05:37 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=MJxOpqxZADbEbEImuSX/mw==:117
	a=kj9zAlcOel0A:10 a=7z1cN_iqozsA:10	a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
	a=a7i9wNmy_W_54KNtFsgA:9	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 6d16cc27; Mon, 08 Aug 2016 18:05:37 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9AC051620DA; Mon,
	8 Aug 2016 14:05:36 -0400 (EDT)
Date: Mon, 08 Aug 2016 14:05:36 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: George McCollister <george.mccollister@gmail.com>
Message-id: <20160808180536.GP8521@denix.org>
References: <cover.1470672689.git.george.mccollister@gmail.com>
MIME-version: 1.0
In-reply-to: <cover.1470672689.git.george.mccollister@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: marex@denx.de, trini@konsulko.com, denys@ti.com,
	andrew.bradford@kodakalaris.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/5] kernel-fitimage: Add initramfs, x86 support
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
X-List-Received-Date: Mon, 08 Aug 2016 18:06:01 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Aug 08, 2016 at 11:37:52AM -0500, George McCollister wrote:
> Add support for building fitImages that include an initramfs and booting
> on x86.

I'm in the process of testing this version now.


I'm wondering, if bundling everything in a single patchset will delay 
acceptance even further? Case in point - I'm mostly interested in initramfs 
support and it's been in limbo state for several months now. It was a single 
patch back then and there were no major comments or issues with it. Few months 
later, 2 extra patches were added with x86 support. Now recent $B change broke 
few things and we need 2 more patches just to get everything working again...

The reason I'm bringing this up is because I've been working on this area 
recently and would like to contribute back some code (fixes, customizations). 
Since it depends on this patchset, I'm not sure if I should wait for it to get 
accepted or we'll just end up growing the patchset for another iteration...

-- 
Denys


> * V2
>  - Include Andrew Bradford's cd to $B patch since it is now required for
>    do_assemble_fitimage to work
>  - Fix initramfs support patch to cd to $B in do_assemble_fitimage_initramfs
>  - Remove ${B} in call to fitimage_emit_section_ramdisk per
>    Denys Dmytriyenko's suggestion
>  - Add patch to cd to $B in do_concat_dtb()
> 
> The following changes since commit c4dda05cb9755cb865c1d1bd142196f8a9f45d3d:
> 
>   Revert "packagegroup-core-x11-base.bb: replace pointercal with pointercal-xinput" (2016-08-04 20:54:57 +0100)
> 
> are available in the git repository at:
> 
>   git://github.com/gmccollister/openembedded-core master-fit
>   https://github.com/gmccollister/openembedded-core/tree/master-fit
> 
> Andrew Bradford (1):
>   kernel-fitimage.bbclass: do_assemble_fitimage(): cd to $B
> 
> George McCollister (4):
>   kernel-fitimage: add initramfs support
>   kernel-fitimage: Add x86 support
>   uboot-sign: Handle .rom signing the same as .img
>   uboot-sign: do_concat_dtb(): cd to $B
> 
>  meta/classes/kernel-fitimage.bbclass | 346 +++++++++++++++++++++++++----------
>  meta/classes/uboot-sign.bbclass      |   4 +-
>  2 files changed, 249 insertions(+), 101 deletions(-)
> 
> -- 
> 2.8.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

