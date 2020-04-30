Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.420.1588266078648755439
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 10:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9269A40C0F
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 17:01:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eu6BqwitTiJE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2020 17:01:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8303E400E7
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 17:01:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E03E3172BDF; Thu, 30 Apr 2020 13:01:16 -0400 (EDT)
Date: Thu, 30 Apr 2020 13:01:16 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] can i blacklist a particular .bbclass file when there are more than one?
Message-ID: <20200430170116.GT11927@denix.org>
References: <alpine.LFD.2.21.2004300945580.19276@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2004300945580.19276@localhost.localdomain>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 30, 2020 at 09:49:32AM -0400, Robert P. J. Day wrote:
> 
>   given an odd collection of layers wherein there are multiple
> instances of a particular .bbclass file, it turns out that all of the
> recipes i'm interested in build with an older version of the class
> file, and all but one build consulting the newer form of the file
> contained in another layer, so is there any way to blacklist a
> particular class file, either globally or even on a per-recipe basis?
> 
>   i realize this is really, really bad design style, but it will give
> me the chance to use the proper class file for most of the recipes
> while i debug the problematic recipe.

The order of BBLAYERS in bblayers.conf affects which class will be used 
globally for the build. Don't believe can be done per-recipe.

BTW, would these generic questions better belong to yocto list istead of 
openembedded-core?

-- 
Denys
