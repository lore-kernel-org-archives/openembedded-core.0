Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id AB12260167
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 23:45:54 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s74Njt9U012696; Mon, 4 Aug 2014 18:45:55 -0500
Received: from localhost ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014080418455561-632421 ;
	Mon, 4 Aug 2014 18:45:55 -0500 
Date: Mon, 4 Aug 2014 18:45:36 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140804234536.GA18459@bshelton-desktop>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<78fc1827553729a69ee665bf4ef7e33495d9de0b.1407177403.git.ben.shelton@ni.com>
	<20140804224419.GD11951@haswell>
MIME-Version: 1.0
In-Reply-To: <20140804224419.GD11951@haswell>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 06:45:55 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 06:45:55 PM,
	Serialize complete at 08/04/2014 06:45:55 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-04_05:2014-08-04, 2014-08-04,
	1970-01-01 signatures=0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/20] udev-cache: Compress the cache
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
X-List-Received-Date: Mon, 04 Aug 2014 23:45:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 08/04, Khem Raj wrote:
> On 14-08-04 13:40:53, Ben Shelton wrote:
> > From: Richard Tollerton <rich.tollerton@ni.com>
> > 
> > $DEVCACHE is observed to be 100k uncompressed; compressing it reduces
> > its size to ~5k.
> > 
> > Natinst-Rally-ID: TA44427
> > Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> > Natinst-ReviewBoard-ID: 58620
> > Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> > ---
> >  meta/recipes-core/udev/udev/init               | 2 +-
> >  meta/recipes-core/udev/udev/udev-cache         | 2 +-
> >  meta/recipes-core/udev/udev/udev-cache.default | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
> > index f2c84d5..1e69861 100644
> > --- a/meta/recipes-core/udev/udev/init
> > +++ b/meta/recipes-core/udev/udev/init
> > @@ -69,7 +69,7 @@ case "$1" in
> >  		    readfiles /etc/udev/cache.data
> >  		    OLDDATA="$READDATA"
> >  		    if [ "$OLDDATA" = "$NEWDATA" ]; then
> > -                            (cd /; tar xf $DEVCACHE > /dev/null 2>&1)
> > +                            (cd /; tar xzf $DEVCACHE > /dev/null 2>&1)
> 
> wouldnt cf still handle gz and xz or any other compression ?

Do you mean xf?  If so, then yes, I think it would.

What would be the advantage of doing it that way?  Just one fewer
change?

Thanks,
Ben


