Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2040.1591208331655153767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 11:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E16AC40C2E;
	Wed,  3 Jun 2020 18:18:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXbkXOkeQ6Pe; Wed,  3 Jun 2020 18:18:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 522E240A9E;
	Wed,  3 Jun 2020 18:18:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7FA921731FF; Wed,  3 Jun 2020 14:18:47 -0400 (EDT)
Date: Wed, 3 Jun 2020 14:18:47 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: akuster808 <akuster808@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][dunfell 0/5] Patch review
Message-ID: <20200603181847.GZ17660@denix.org>
References: <cover.1591197295.git.steve@sakoman.com>
 <fa08dc08-22f5-f82f-58dc-02b976acdf2b@gmail.com>
 <20200603173620.GY17660@denix.org>
 <9c5425d3-fc0a-a63e-e090-e83f364edd3e@gmail.com>
MIME-Version: 1.0
In-Reply-To: <9c5425d3-fc0a-a63e-e090-e83f364edd3e@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 03, 2020 at 11:17:20AM -0700, akuster808 wrote:
> 
> 
> On 6/3/20 10:36 AM, Denys Dmytriyenko wrote:
> > On Wed, Jun 03, 2020 at 10:33:55AM -0700, akuster wrote:
> >> Does someone have the complementary set of patches for meta-openbedded
> >> to remove these?
> > https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca
> > https://git.openembedded.org/meta-openembedded/commit/?id=7aee545a61c4f91d5e462d5b46b1b8f9a8bad1e3
> >
> > Do you want me to re-submit them with [dunfell] tag?
> 
> changes in stable/dunfell-nut for testing with my other backports.

Thanks!

> -armin
> >
> >
> >> - armin
> >>
> >> On 6/3/20 8:33 AM, Steve Sakoman wrote:
> >>> Pending final approval for an exception to LTS policy in this case please
> >>> review this patch series and have comments back by end of day Thursday.
> >>>
> >>> For details on the motivation for this change see:
> >>>
> >>> https://lists.openembedded.org/g/openembedded-architecture/message/1085
> >>>
> >>> The following changes since commit ef5af31f406076107402694f5d6afb27b240eba6:
> >>>
> >>>   linux-yocto/5.4: update to v5.4.43 (2020-06-01 07:19:09 -1000)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
> >>>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut
> >>>
> >>> Joshua Watt (5):
> >>>   pycryptodome: Import from meta-python
> >>>   pyelftools: Import from meta-python
> >>>   python3-pycryptodome(x): Upgrade 3.9.4 -> 3.9.7
> >>>   python3-pyelftools: Upgrade 0.25 -> 0.26
> >>>   layer.conf: Bump OE-Core layer version
> >>>
> >>>  meta/conf/distro/include/maintainers.inc      |  5 +++-
> >>>  meta/conf/layer.conf                          |  2 +-
> >>>  .../python/python-pycryptodome.inc            | 26 +++++++++++++++++++
> >>>  .../python/python3-pycryptodome_3.9.7.bb      |  5 ++++
> >>>  .../python/python3-pycryptodomex_3.9.7.bb     |  9 +++++++
> >>>  .../python/python3-pyelftools_0.26.bb         | 14 ++++++++++
> >>>  6 files changed, 59 insertions(+), 2 deletions(-)
> >>>  create mode 100644 meta/recipes-devtools/python/python-pycryptodome.inc
> >>>  create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.9.7.bb
> >>>  create mode 100644 meta/recipes-devtools/python/python3-pycryptodomex_3.9.7.bb
> >>>  create mode 100644 meta/recipes-devtools/python/python3-pyelftools_0.26.bb
> >>>
> >>>
> >>>
> >> 
> 
