Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.20504.1589568838784859012
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 11:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3152140AB5;
	Fri, 15 May 2020 18:53:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IUlpFQZeU_PH; Fri, 15 May 2020 18:53:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EB33D40A9E;
	Fri, 15 May 2020 18:53:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B7CD417314B; Fri, 15 May 2020 14:53:54 -0400 (EDT)
Date: Fri, 15 May 2020 14:53:54 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, jdmason@kudzu.us,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
Message-ID: <20200515185354.GE11927@denix.org>
References: <20200514210458.33543-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200514210458.33543-1-JPEWhacker@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I see Richard has merged these to master-next, thanks!
And thanks Joshua for volunteering to maintain these recipes :)
I submitted removal patches to meta-python.

So, it is good we are getting this extra dependency resolved in master. The 
question is - can we get these backported to dunfell, does it qualify?

Otherwise Jon wanted to finally branch off meta-arm into dunfell today and 
we'll have to live with it until gatesgarth.

-- 
Denys


On Thu, May 14, 2020 at 04:04:54PM -0500, Joshua Watt wrote:
> Imports and upgrades pycryptodome, pycryptodomex, and pyelftools from
> meta-python.  These recipes are commonly used by other layers (e.g.
> meta-arm) so putting them in oe-core reduces layer dependencies.
> 
> Joshua Watt (4):
>   pycryptodome: Import from meta-python
>   pyelftools: Import from meta-python
>   python3-pycryptodome(x): Upgrade 3.9.4 -> 3.9.7
>   python3-pyelftools: Upgrade 0.25 -> 0.26
> 
>  meta/conf/distro/include/maintainers.inc      |  5 +++-
>  .../python/python-pycryptodome.inc            | 26 +++++++++++++++++++
>  .../python/python3-pycryptodome_3.9.7.bb      |  5 ++++
>  .../python/python3-pycryptodomex_3.9.7.bb     |  9 +++++++
>  .../python/python3-pyelftools_0.26.bb         | 14 ++++++++++
>  5 files changed, 58 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/python/python-pycryptodome.inc
>  create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.9.7.bb
>  create mode 100644 meta/recipes-devtools/python/python3-pycryptodomex_3.9.7.bb
>  create mode 100644 meta/recipes-devtools/python/python3-pyelftools_0.26.bb
> 
> -- 
> 2.17.1
> 
