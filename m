Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3760.1628043275354060645
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Aug 2021 19:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A95D240C16;
	Wed,  4 Aug 2021 02:14:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z8QrioZyb6lv; Wed,  4 Aug 2021 02:14:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 622F740C06;
	Wed,  4 Aug 2021 02:14:29 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2001117464E; Tue,  3 Aug 2021 22:14:29 -0400 (EDT)
Date: Tue, 3 Aug 2021 22:14:29 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Steve Sakoman <steve@sakoman.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Anuj Mittal <anuj.mittal@intel.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/4] yocto-check-layer: add support to check for dependencies
Message-ID: <20210804021429.GV1528@denix.org>
References: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
 <33b5d60e01b3995046709b17b8014fd45b0c48e5.camel@linuxfoundation.org>
 <CAP71WjxcSk64Snj8Hd0Vy9nJyUH8mE9MjnkfAZC095mPt9bd6g@mail.gmail.com>
 <98ab2870e07ad6d296d29322b7ee78bade43b9ea.camel@linuxfoundation.org>
 <CAP71Wjz5-CQJ7nJzRU+Kij7itOLFeyxsyYkc=XGm=U5iWHqN7w@mail.gmail.com>
 <CAOSpxdaMyYkAnuM72SjwZYMegvRyPN3oAL+Qo1BjiFjC8R67Yg@mail.gmail.com>
 <7419111ad58a262461b858dd92771c075f7ae1bc.camel@linuxfoundation.org>
 <CAOSpxdY2evRkfm55sJro4HY7Gc29aN-sh9ByNLX2fkjM2=aWdg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOSpxdY2evRkfm55sJro4HY7Gc29aN-sh9ByNLX2fkjM2=aWdg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 02, 2021 at 05:07:41AM -1000, Steve Sakoman wrote:
> On Mon, Aug 2, 2021 at 5:04 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Mon, 2021-08-02 at 04:57 -1000, Steve Sakoman wrote:
> > > On Mon, Aug 2, 2021 at 12:35 AM Nicolas Dechesne
> > > <nicolas.dechesne@linaro.org> wrote:
> > > >
> > > > These patches are now merged in master, and I believe they should be merged in
> > > > dunfell and hardknott too. The 4 patches apply as-is in both branches. Let me
> > > > know if you need anything from me!
> > >
> > > Done.  I assume I also need a version of the autobuilder-helper patch:
> > >
> > > https://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-
> > > helper/commit/?id=fe72e222961d69dcd4d638e7e05b437a65e8f34c
> > >
> > > It seems that dunfell is checking a much more limited set of layers
> > > (only meta-intel for check-layer-nightly)  Should I expand this list?
> >
> > There has been work to get some of them working, so yes, I think it would
> > be good to test and see where we stand.
> 
> OK, will do.

Steve,

Would you be able to publish results of your testing on dunfell?

I'm interested in some expanded compat checks in master, but they were blocked 
by known limitations in dunfell - was wondering if those got resolved yet. 
Thanks!

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
