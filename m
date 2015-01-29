Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id 32F8760132
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 19:34:18 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.89.130]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NIY0037PECNCW20@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 29 Jan 2015 13:34:10 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=LrklEcZZ c=1 sm=1 tr=0	a=ckUr7rGttv+NBxkAVUaaIw==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=YNv0rlydsVwA:10	a=QyXUC8HyAAAA:8 a=iGHA9ds3AAAA:8
	a=Q4-j1AaZAAAA:8 a=kWtC0CY4WrUucLGHvFYA:9	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5F45120150; Thu,
	29 Jan 2015 14:33:58 -0500 (EST)
Date: Thu, 29 Jan 2015 14:33:58 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-id: <20150129193358.GB2517@denix.org>
References: <0NIX00GV1Z8KO910@vms173019.mailsrvcs.net>
MIME-version: 1.0
In-reply-to: <0NIX00GV1Z8KO910@vms173019.mailsrvcs.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: update to version 2015.01
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
X-List-Received-Date: Thu, 29 Jan 2015 19:34:24 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 29, 2015 at 09:07:29AM -0500, Denys Dmytriyenko wrote:
>    I believe I had that in DEPENDS... I'll check.

So, yes, the patch does have DEPENDS = "openssl"

Does it become openssl-native due to BBCLASSEXTEND = "native"? Or do I need a 
separate DEPENDS_class-native?

-- 
Denys


>    On Jan 29, 2015 8:19 AM, "Burton, Ross" <ross.burton@intel.com> wrote:
> 
>      On 23 January 2015 at 22:40, Denys Dmytriyenko <denis@denix.org> wrote:
> 
>        A rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2014.07.bb =>
>        u-boot-mkimage_2015.01.bb} (45%)
> 
>      u-book-mkimage-native is failing on some autobuilders:
>      | In file included from tools/default_image.c:18:0:
>      | include/image.h:877:27: fatal error: openssl/evp.h: No such file or
>      directory
>      | A # include A <openssl/evp.h>
>      https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-ppc/builds/170/steps/BuildImages/logs/stdio
>      Non-deterministic build dependency on openssl?
>      Ross

> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


