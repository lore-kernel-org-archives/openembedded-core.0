Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC5C60043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 18:34:51 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3rFyVg44k3z3hjR6;
	Thu, 26 May 2016 20:34:51 +0200 (CEST)
X-Auth-Info: 7hNROU8567i2EAvSnpqetp+gaiP/SEp5GnKxpA0jq0o=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3rFyVg316SzvdWS; 
	Thu, 26 May 2016 20:34:51 +0200 (CEST)
Message-ID: <574741AB.7050009@denx.de>
Date: Thu, 26 May 2016 20:34:19 +0200
From: Marek Vasut <marex@denx.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: George McCollister <george.mccollister@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <1464270916-2264-1-git-send-email-george.mccollister@gmail.com>
In-Reply-To: <1464270916-2264-1-git-send-email-george.mccollister@gmail.com>
Subject: Re: [PATCH v2] kernel-fitimage: add initramfs support
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
X-List-Received-Date: Thu, 26 May 2016 18:34:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/26/2016 03:55 PM, George McCollister wrote:
> If INITRAMFS_IMAGE is set, build an additional fitImage containing the
> initramfs. Copy the additional fitImage and the source .its file used to
> create it to DEPLOYDIR. The fitImage containing the initramfs must be
> built before do_deploy and after do_install to avoid circular dependencies.
> 
> UBOOT_RD_LOADADDRESS - Specifies the load address used by u-boot for the
>                        initramfs.
> UBOOT_RD_ENTRYPOINT  - Specifies the entry point used by u-boot for the
>                        initramfs.
> 
> Signed-off-by: George McCollister <george.mccollister@gmail.com>

Reviewed-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut

