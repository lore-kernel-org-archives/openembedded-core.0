Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QpN0o-0004dw-9T for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 18:12:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75G8DZC013695
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 17:08:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13123-07 for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2011 17:08:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75G869F013689
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 17:08:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94DE85F57C@orsmsx504.amr.corp.intel.com>
References: <cover.1312469789.git.nitin.a.kamble@intel.com>
	<e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<aa5a0621a4d7110828517949f4c07221e62b068c.1312469790.git.nitin.a.kamble@intel.com>
	<CA+M6bXnGxvjb7y23xss2epiaMXW3CWAK5Hq2ixPqM8iyATXuCA@mail.gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F57C@orsmsx504.amr.corp.intel.com>
Date: Fri, 05 Aug 2011 17:07:44 +0100
Message-ID: <1312560464.14274.128.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 10/10] local.conf.sample: make BBMASK assignment weak
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
X-List-Received-Date: Fri, 05 Aug 2011 16:12:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-04 at 15:54 -0700, Kamble, Nitin A wrote:
> 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Tom Rini
> > Sent: Thursday, August 04, 2011 3:53 PM
> > To: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [PATCH 10/10] local.conf.sample: make BBMASK
> > assignment weak
> > 
> > On Thu, Aug 4, 2011 at 8:01 AM,  <nitin.a.kamble@intel.com> wrote:
> > > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> > >
> > > So that it can be overridden by layers if needed.
> > >
> > > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > > ---
> > >  meta-yocto/conf/local.conf.sample |    2 +-
> > >  1 files changed, 1 insertions(+), 1 deletions(-)
> > >
> > > diff --git a/meta-yocto/conf/local.conf.sample b/meta-
> > yocto/conf/local.conf.sample
> > > index 3e71b0a..4acec37 100644
> > > --- a/meta-yocto/conf/local.conf.sample
> > > +++ b/meta-yocto/conf/local.conf.sample
> > > @@ -39,7 +39,7 @@ DISTRO ?= "poky"
> > >
> > >  # BBMASK is a regular expression that can be used to tell BitBake to
> > ignore
> > >  # certain recipes.
> > > -BBMASK = ""
> > > +BBMASK ?= ""
> > >
> > >  # EXTRA_IMAGE_FEATURES allows extra packages to be added to the
> > generated images
> > >  # (Some of these are automatically added to certain image types)
> > 
> > In oe.dev we just dropped this from local.conf iirc since a real
> > assignmnet was overriding a useful setting we provided.  IMHO, we
> > should do the same here (or at least comment it out).
> 
> I agree. We should comment it out.

I agree too.

Cheers,

Richard



