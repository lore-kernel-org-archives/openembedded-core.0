Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qjgnt-00074D-1p
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 02:07:49 +0200
Received: (qmail invoked by alias); 21 Jul 2011 00:03:42 -0000
Received: from p5B0A1B10.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.27.16]
	by mail.gmx.net (mp071) with SMTP; 21 Jul 2011 02:03:42 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX189BZg61Sg9BZHcICgN9q+f4UsSPibNE6X+n5dZnj
	mOjQF+pxz3y+VD
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 02:05:48 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
References: <201107182310.56104.schnitzeltony@gmx.de>
	<201107200038.55362.schnitzeltony@gmx.de>
	<1311118512.2115.15.camel@scimitar>
In-Reply-To: <1311118512.2115.15.camel@scimitar>
MIME-Version: 1.0
Message-Id: <201107210205.48991.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-oe] Problems on downloading sources (was Problems downloading xfwm4 4.8.1)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jul 2011 00:07:49 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday, July 20, 2011 01:35:05 AM Joshua Lock wrote:
> On Wed, 2011-07-20 at 00:38 +0200, Andreas Mueller wrote:
> > On Monday, July 18, 2011 11:19:01 PM Andreas Mueller wrote:
> > > On Monday, July 18, 2011 11:10:55 PM you wrote:
> > > > Ciao
> > > > 
> > > > currently I am porting my local oe recipes for xfce-4.8 to oe-core.
> > > > Everything seems fine so far - except xfwm4. This one drives me
> > > > totally insane: If you check the fetch log attched and copy the
> > > > first url into a browser it starts downloading without problems but
> > > > oe complains.
> > > > 
> > > > Could somebody please point me onto what is going wrong - if you need
> > > > further information I'll send...
> > > 
> > > I found a hook on what is going wrong - forget my prevoius mail - sorry
> > > fo the noise..
> > 
> > Sorry but my 'hook' was some late night crap.
> > 
> > I attached what I did up to now. It is meta-xfce which should live in
> > meta- openembedded. I checked on fresh tmp and without downloaded
> > sources. For (at least) xfwm4 and xfce4-appfinder build fails when
> > downloading sources. For xfce4- appfinder I get:
> > 
> > ERROR: Function 'Fetcher failure for URL:
> > 'http://archive.xfce.org/src/xfce/xfce4-appfinder/4.8/xfce4-
> > appfinder-4.8.0.tar.bz2'. Unable to fetch URL
> > http://archive.xfce.org/src/xfce/xfce4-appfinder/4.8/xfce4-appfinder-4.8.
> > 0.tar.bz2 from any source.' failed
> > ERROR: Logfile of failure stored in: /home/Superandy/tmp/oe-core-
> > eglibc/work/armv7a-angstrom-linux-gnueabi/xfce4-appfinder-4.8.0-
> > r0/temp/log.do_fetch.30009
> > 
> > Log data follows:
> > | NOTE: fetch http://archive.xfce.org/src/xfce/xfce4-appfinder/4.8/xfce4-
> > 
> > appfinder-4.8.0.tar.bz2
> > 
> > | NOTE: fetch
> > | http://www.angstrom-distribution.org/unstable/sources/xfce4-
> > 
> > appfinder-4.8.0.tar.bz2
> > 
> > | ERROR: Function 'Fetcher failure for URL:
> > 'http://archive.xfce.org/src/xfce/xfce4-appfinder/4.8/xfce4-
> > appfinder-4.8.0.tar.bz2'. Unable to fetch URL
> > http://archive.xfce.org/src/xfce/xfce4-appfinder/4.8/xfce4-appfinder-4.8.
> > 0.tar.bz2 from any source.' failed
> > NOTE: package xfce4-appfinder-4.8.0-r0: task do_fetch: Failed
> > 
> > If I enter http://archive.xfce.org/src/xfce/xfce4-appfinder/4.8/xfce4-
> > appfinder-4.8.0.tar.bz2 in my browser or perform wget manually, the
> > source file is downloaded properly!!
> > 
> > Could somebody please spend some time with the attachment and tell me
> > what's going on here??
> 
> I'd guess it's Yocto #1256[1], namely that "fetcher reports a download
> failure when only the SRC_URI checksums mismatched"
> 
> The idea is that the fetcher retries downloads a few times when the
> checksums do not match, unfortunately at the default log level this just
> looks like a fetch failure.
> 
> Can you run bitbake with -DD and see if you can see a checksum error? Or
> just verify checksums by hand?
> 
> Cheers,
> Joshua
> 1. http://bugzilla.pokylinux.org/show_bug.cgi?id=1256
Thank you *very* much for pointing on this - this confused me totally...

Andreas


