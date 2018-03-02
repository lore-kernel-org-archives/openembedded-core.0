Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id EF1B4789AF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 18:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8F2AA2099C;
	Fri,  2 Mar 2018 18:14:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id IIj-8my6KXKd; Fri,  2 Mar 2018 18:14:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 88FFC20862;
	Fri,  2 Mar 2018 18:14:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 999151632EF; Fri,  2 Mar 2018 13:14:49 -0500 (EST)
Date: Fri, 2 Mar 2018 13:14:49 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180302181449.GR2786@denix.org>
References: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
	<20180301140052.1388-14-alexander.kanavin@linux.intel.com>
	<CAJTo0LbB5ZAHTmcbv5Moof0kjYejw4XOskNawqH3sCopyxPSFg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbB5ZAHTmcbv5Moof0kjYejw4XOskNawqH3sCopyxPSFg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/15] expect: upgrade 5.45.3 -> 5.45.4
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
X-List-Received-Date: Fri, 02 Mar 2018 18:14:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

FYI, sourceforge is currently experiencing issues (another DDoS attack?) and 
instead of tarballs, serves HTML file with this text:

We're sorry -- the Sourceforge site is currently in Disaster Recovery mode, 
and currently requires the use of javascript to function.  Please check back 
later.

-- 
Denys


On Fri, Mar 02, 2018 at 02:12:22PM +0000, Burton, Ross wrote:
> ERROR: expect-5.45.4-r0 do_fetch: Fetcher failure for URL: '
> http://downloads.sourceforge.net/expect/Expect/5.45.4/expect5.45.4.tar.gz'.
> Checksum mismatch!
> File: '/srv/autobuilder/
> autobuilder.yoctoproject.org/current_sources/expect5.45.4.tar.gz' has md5
> checksum cb530d737c8f2d1023797cf0587b4e05 when
> 00fce8de158422f5ccd2666512329bd2 was expected
> File: '/srv/autobuilder/
> autobuilder.yoctoproject.org/current_sources/expect5.45.4.tar.gz' has
> sha256 checksum
> 7a07d3f7cca5c0b38ca811984ef8da536da32932d68c1a6cce33ec2462b930bf when
> 49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c4781f89caf760b92c34 was
> expected
> If this change is expected (e.g. you have upgraded to a new version without
> updating the checksums) then you can use these lines within the recipe:
> SRC_URI[md5sum] = "cb530d737c8f2d1023797cf0587b4e05"
> SRC_URI[sha256sum] =
> "7a07d3f7cca5c0b38ca811984ef8da536da32932d68c1a6cce33ec2462b930bf"
> 
> Yes, they changed the tarball between you submitting this (and me testing
> it here), and the autobuilder run last night.
> 
> Actually worth checking they haven't been hacked, although god knows who
> would want to compromise expect of all things.
> 
> Ross
> 
> On 1 March 2018 at 14:00, Alexander Kanavin <
> alexander.kanavin@linux.intel.com> wrote:
> 
> > Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> > ---
> >  meta/recipes-devtools/expect/{expect_5.45.3.bb => expect_5.45.4.bb} | 4
> > ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-devtools/expect/{expect_5.45.3.bb => expect_5.45.4.bb}
> > (95%)
> >
> > diff --git a/meta/recipes-devtools/expect/expect_5.45.3.bb
> > b/meta/recipes-devtools/expect/expect_5.45.4.bb
> > similarity index 95%
> > rename from meta/recipes-devtools/expect/expect_5.45.3.bb
> > rename to meta/recipes-devtools/expect/expect_5.45.4.bb
> > index 445eca5742d..96eacd92934 100644
> > --- a/meta/recipes-devtools/expect/expect_5.45.3.bb
> > +++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
> > @@ -26,8 +26,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/
> > Expect/${PV}/${BPN}${PV}.tar.gz \
> >             file://0001-Resolve-string-formatting-issues.patch \
> >             file://0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch
> > \
> >            "
> > -SRC_URI[md5sum] = "a8855cd41c1ef004b9794db9e2a57a9d"
> > -SRC_URI[sha256sum] = "c520717b7195944a69ce1492ec82ca
> > 0ac3f3baf060804e6c5ee6d505ea512be9"
> > +SRC_URI[md5sum] = "00fce8de158422f5ccd2666512329bd2"
> > +SRC_URI[sha256sum] = "49a7da83b0bdd9f46d04a04deec19c
> > 7767bb9a323e40c4781f89caf760b92c34"
> >
> >  UPSTREAM_CHECK_URI = "http://sourceforge.net/
> > projects/expect/files/Expect/"
> >  UPSTREAM_CHECK_REGEX = "/Expect/(?P<pver>(\d+[\.\-_]*)+)/"
> > --
> > 2.15.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


