Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6970.1586329964624202331
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2020 00:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DD55D40C1D;
	Wed,  8 Apr 2020 07:12:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VGxI303khwBE; Wed,  8 Apr 2020 07:12:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C24B8409DE;
	Wed,  8 Apr 2020 07:12:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 791521718E9; Wed,  8 Apr 2020 03:12:42 -0400 (EDT)
Date: Wed, 8 Apr 2020 03:12:42 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Including vendor's pre-built binary in image
Message-ID: <20200408071242.GC1578@denix.org>
References: <CADySD0GO0510UjoSWx=sK9oiyCFCJanB7-C7Ph6y62BtOmfNXA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0GO0510UjoSWx=sK9oiyCFCJanB7-C7Ph6y62BtOmfNXA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 08, 2020 at 01:52:47PM +1200, Ankur Tyagi wrote:
> Hi,
> 
> I am sure this is not being discussed for first time and I tried
> all suggested solution in previous emails but none worked hence I am asking
> again.
> 
> Trying to include a pre-built binary from vendor in my image but getting
> following QA error:
> 
> ERROR: my-recipe-1.0-r0 do_package_qa: QA Issue: /etc/vendor/tool contained
> in package my-recipe requires libstdc++.so.6(CXXABI_1.3), but no providers
> found in RDEPENDS_my-recipe ? [file-rdeps]
> ERROR: my-recipe -1.0-r0 do_package_qa: QA Issue: /etc/vendor/tool
> contained in package my-recipe requires libstdc++.so.6(GLIBCXX_3.4), but no
> providers found in RDEPENDS_my-recipe ? [file-rdeps]
> ERROR: my-recipe -1.0-r0 do_package_qa: QA run found fatal errors. Please
> consider fixing them.
> ERROR: my-recipe -1.0-r0 do_package_qa: Function failed: do_package_qa
> 
> I have tried following in my-recipe_1.0.bb but error still persists
> RDEPENDS_${PN} += "libstdc++6"
> 
> How can I fix this?

https://lists.yoctoproject.org/g/poky/message/11900


> thanks
> Ankur

> 

