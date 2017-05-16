Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 8401577D80
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 21:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DDD87208B3;
	Tue, 16 May 2017 21:49:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id uzVB8uw-qA-Y; Tue, 16 May 2017 21:49:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C3EAE20756;
	Tue, 16 May 2017 21:49:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8A3671624C2; Tue, 16 May 2017 17:49:06 -0400 (EDT)
Date: Tue, 16 May 2017 17:49:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170516214906.GN28053@denix.org>
References: <1494367136-21140-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1494367136-21140-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] tcmode-default: use SDK_SYS suffix instead of SDK_ARCH for binutils-crosssdk
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
X-List-Received-Date: Tue, 16 May 2017 21:49:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping

On Tue, May 09, 2017 at 05:58:56PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Commit d2eccccb70e809d482c493922f23aef4409cfd82 has changed suffixes for
> all -crosssdk packages from SDK_ARCH to SDK_SYS, but missed one line with
> binutils-crosssdk. This change fixes that omission.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 3db16e8..bdc70cf 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -48,7 +48,7 @@ PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
>  PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
>  PREFERRED_VERSION_binutils-native ?= "${BINUVERSION}"
>  PREFERRED_VERSION_binutils-cross-${TARGET_ARCH} ?= "${BINUVERSION}"
> -PREFERRED_VERSION_binutils-crosssdk-${SDK_ARCH} ?= "${BINUVERSION}"
> +PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?= "${BINUVERSION}"
>  PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${BINUVERSION}"
>  PREFERRED_VERSION_gdb ?= "${GDBVERSION}"
>  PREFERRED_VERSION_gdb-cross-${TARGET_ARCH} ?= "${GDBVERSION}"
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

