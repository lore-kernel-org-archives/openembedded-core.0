Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B82BF6BC7A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 13:21:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46HqJM3HZ9z3J;
	Tue, 27 Aug 2019 15:21:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566912067;
	bh=jRrGSNfQPNJTHgiz/F0lA3lbWRC1v0cl9HspKHDVXwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G/kFRp6q2x+MZpEnUXUpJtnVVZpaH/u9Dbnn+pd1VBYN2xcm656t2+G5mpgmLas3j
	vMhA/lOERFWujjRgA2u8MD74dq1ij9I2Fi2ElE6+GRB1IxNJ/tzQY2r3GDifxJ66ui
	xNKg7Ee0S0AUtCJQAidI/4hN7TpIsHei4VFTYISYx7m/CFXfGGGFPi8kZEAG1Rm1JE
	33nOGQyEnloKuLZonWJ7OI5vRPDy8f1W/kY3QS36O8rTY0pK21ryTeFYX3po64V+8N
	1+1SzdF5ZGRYti48RweFwUhT4Xm1B+I0PCnhxpTIeP6+ctorGeX3WLLBbfuQxv2YY1
	t1evscpA/43nHp/sBLVV3ZL1DlxKEbIcEtv9vvCVp1BwsdjaD0F93V+0obaAYt2fkS
	IRzYqephBZrMnhZb8+eJT87AnpznjyOoeIqpTXCOl6HBM6n68O8vgtzpSXSnrxBV2Q
	lUncW97oPq6vYTtrE6oF3w/6PIToUfV5hQjdPnNqUMnzsYvJqtdzJs0xtQndGtVQvp
	CIuT29yaboZXMkbbh4ujOkJFgfc/DzJDBw10FQ6XhbZ4zUSUDPHA4RFtPY19L5ombC
	AN/teWZaTBjNyPTNEFk0A4D13tMtnLiNs0IT9TmX1N5GNGXgtBuzNIAuLvRn6R/YfY
	3bX0LQdrrHe5PKUbkL86nBpA=
Date: Tue, 27 Aug 2019 16:21:05 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20190827132105.GA17139@localhost>
References: <20190826053238.28912-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190826053238.28912-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] libxcrypt:upgrade 4.4.6 -> 4.4.7
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
X-List-Received-Date: Tue, 27 Aug 2019 13:21:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Aug 26, 2019 at 01:32:38PM +0800, Zang Ruochen wrote:
> -License-Update: Many individual files are under other licenses,update their information.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../libxcrypt/{libxcrypt_4.4.6.bb => libxcrypt_4.4.7.bb}            | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.6.bb => libxcrypt_4.4.7.bb} (86%)
>...

You also have to rename libxcrypt-compat_4.4.6.bb

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


