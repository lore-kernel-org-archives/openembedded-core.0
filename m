Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 4341B74500
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 22:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D6A4C20B70;
	Thu, 29 Mar 2018 22:41:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id J3GuXGHxhV0l; Thu, 29 Mar 2018 22:41:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B21432098D;
	Thu, 29 Mar 2018 22:41:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 36CED1633B2; Thu, 29 Mar 2018 18:41:29 -0400 (EDT)
Date: Thu, 29 Mar 2018 18:41:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180329224129.GK2786@denix.org>
References: <cover.1521507765.git.denys@ti.com>
MIME-Version: 1.0
In-Reply-To: <cover.1521507765.git.denys@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 0/3] Package upgrades
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
X-List-Received-Date: Thu, 29 Mar 2018 22:41:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping. It's been 10 days - are there any issues with these updates?


On Mon, Mar 19, 2018 at 09:11:06PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Upgrades for lzip, hdparm and lz4.
> 
> The following changes since commit c94271d87d16323f920891344642f76dfb3c994f:
> 
>   buildperf: measure the size of core-image-sato rootfs (2018-03-16 03:42:03 -0700)
> 
> are available in the git repository at:
> 
>   git://push.openembedded.org/openembedded-core-contrib denix/master
> 
> Denys Dmytriyenko (3):
>   lzip: upgrade 1.19 -> 1.20
>   hdparm: upgrade 9.53 -> 9.55
>   lz4: upgrade 1.7.4 -> 1.8.1.2
> 
>  .../hdparm/{hdparm_9.53.bb => hdparm_9.55.bb}      |  4 +-
>  .../lzip/{lzip_1.19.bb => lzip_1.20.bb}            |  4 +-
>  ...sts-Makefile-don-t-use-LIBDIR-as-variable.patch | 82 ----------------------
>  .../lz4/{lz4_1.7.4.bb => lz4_1.8.1.2.bb}           | 10 +--
>  4 files changed, 9 insertions(+), 91 deletions(-)
>  rename meta/recipes-extended/hdparm/{hdparm_9.53.bb => hdparm_9.55.bb} (90%)
>  rename meta/recipes-extended/lzip/{lzip_1.19.bb => lzip_1.20.bb} (88%)
>  delete mode 100644 meta/recipes-support/lz4/files/0001-tests-Makefile-don-t-use-LIBDIR-as-variable.patch
>  rename meta/recipes-support/lz4/{lz4_1.7.4.bb => lz4_1.8.1.2.bb} (79%)
> 
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

