Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Px225-0008GQ-EZ for openembedded-core@lists.openembedded.org;
	Tue, 08 Mar 2011 19:53:21 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p28Ipd1B023221;
	Tue, 8 Mar 2011 18:51:39 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22665-10; Tue,  8 Mar 2011 18:51:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p28IpROX023215
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 8 Mar 2011 18:51:30 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <AANLkTi=bCN5b7TmByhECJpRYf05q3i6FKSDk5GSh1-3N@mail.gmail.com>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
	<1299135167-18330-3-git-send-email-raj.khem@gmail.com>
	<AANLkTi=bCN5b7TmByhECJpRYf05q3i6FKSDk5GSh1-3N@mail.gmail.com>
Date: Tue, 08 Mar 2011 10:51:24 -0800
Message-ID: <1299610284.602.99.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "saul.wold" <saul.wold@intel.com>
Subject: Re: [PATCHv3 2/6] distro_tracking_fields.inc: Use 2.6.37.2 instead of 2.6.36 for linux-libc-headers
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
X-List-Received-Date: Tue, 08 Mar 2011 18:53:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-07 at 22:39 -0800, Khem Raj wrote:
> On Wed, Mar 2, 2011 at 10:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../conf/distro/include/distro_tracking_fields.inc |    6 +++---
> >  1 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
> > index 1dab90a..beb18e2 100644
> > --- a/meta/conf/distro/include/distro_tracking_fields.inc
> > +++ b/meta/conf/distro/include/distro_tracking_fields.inc
> > @@ -2884,9 +2884,9 @@ RECIPE_LAST_UPDATE_pn-libtool = "Nov 8, 2010"
> >  RECIPE_MAINTAINER_pn-libtool = "Nitin A Kamble <nitin.a.kamble@intel.com>"
> >
> >  RECIPE_STATUS_pn-linux-libc-headers="green"
> > -RECIPE_LATEST_VERSION_pn-linux-libc-headers="2.6.36"
> > -RECIPE_LAST_UPDATE_pn-linux-libc-headers = "Nov 8, 2010"
> > -RECIPE_MAINTAINER_pn-linux-libc-headers = "Nitin A Kamble <nitin.a.kamble@intel.com>"
> > +RECIPE_LATEST_VERSION_pn-linux-libc-headers="2.6.37.2"
> > +RECIPE_LAST_UPDATE_pn-linux-libc-headers = "Mar 1, 2011"
> > +RECIPE_MAINTAINER_pn-linux-libc-headers = "Khem Raj <raj.khem@gmail.com>"
> >
> >  RECIPE_STATUS_pn-lsof="green"
> >  RECIPE_LATEST_VERSION_pn-lsof="4.84"
> > --
> > 1.7.4.1

With this patch, I need to work out who "owns" these tracking fields
going forwards and what the policy is regarding them. I'd like some
input from Saul on this although it might not happen until next week as
we're both travelling.

Cheers,

Richard



