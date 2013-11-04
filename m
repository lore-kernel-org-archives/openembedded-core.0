Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C9A226D662;
	Mon,  4 Nov 2013 14:43:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA4Eh17k015705; Mon, 4 Nov 2013 14:43:01 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6upKpSlo0tw7; Mon,  4 Nov 2013 14:43:01 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA4EgvCO015701
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 4 Nov 2013 14:42:58 GMT
Message-ID: <1383576172.6271.138.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 04 Nov 2013 14:42:52 +0000
In-Reply-To: <20131104130253.GD3684@jama>
References: <20131014154535.D40A750398@opal> <20131104130253.GD3684@jama>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : gcc: Fix strange C++ repo issues
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
X-List-Received-Date: Mon, 04 Nov 2013 14:43:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-11-04 at 14:02 +0100, Martin Jansa wrote:
> On Mon, Oct 14, 2013 at 03:45:35PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 9f6c4edf40963d1f3fb9f7e2d2b7a866aa1afe57
> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=9f6c4edf40963d1f3fb9f7e2d2b7a866aa1afe57
> > 
> > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Date:   Wed Oct  9 20:37:49 2013 +0000
> > 
> > gcc: Fix strange C++ repo issues
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> > ---
> > 
> >  meta/recipes-devtools/gcc/gcc-4.8.inc              |    1 +
> >  .../gcc/gcc-4.8/0047-repomembug.patch              |   53 ++++++++++++++++++++
> >  2 files changed, 54 insertions(+), 0 deletions(-)
> > 
> > diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
> > index 4af98f8..8d50bf7 100644
> > --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> > @@ -76,6 +76,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
> >  	   file://0044-gengtypes.patch \
> >  	   file://0045-gcc-4.8-PR57717-PowerPC-E500v2.patch \
> >  	   file://0046-libatomic-deptracking.patch \
> > +	   file://0047-repomembug.patch \
> >  	  "
> 
> Don't mix tabs and spaces in multiline variables.
> 
> All tabs in meta/recipes-devtools/gcc/gcc-4.8.inc are used incorrectly.

Agreed, however I just copied the existing style which was better than
the alternatives. Whitespace changes need to be in a separate patch.

Cheers,

Richard


