Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SfFJC-00051D-1o for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 21:02:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5EIpagd004982;
	Thu, 14 Jun 2012 19:51:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04665-04; Thu, 14 Jun 2012 19:51:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5EIpSdP004976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 14 Jun 2012 19:51:30 +0100
Message-ID: <1339699888.24333.96.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Thu, 14 Jun 2012 19:51:28 +0100
In-Reply-To: <4FDA1BF5.2000005@linux.intel.com>
References: <1339575975-22078-1-git-send-email-bogdan.a.marinescu@intel.com>
	<4FDA1BF5.2000005@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gcc-configure-common: Use build time sysroot for target gcc
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
X-List-Received-Date: Thu, 14 Jun 2012 19:02:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-06-14 at 10:14 -0700, Saul Wold wrote:
> On 06/13/2012 01:26 AM, Bogdan Marinescu wrote:
> > From: Khem Raj<raj.khem@gmail.com>
> >
> > Otherwise it assumes / as sysroot on build host and starts
> > searching for directories in there.
> >
> > Signed-off-by: Khem Raj<raj.khem@gmail.com>
> > ---
> > diff --git a/meta/recipes-devtools/gcc/gcc-configure-target.inc b/meta/recipes-devtools/gcc/gcc-configure-target.inc
> > index 1ee7504..5bca2b7 100644
> > --- a/meta/recipes-devtools/gcc/gcc-configure-target.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-configure-target.inc
> > @@ -1,4 +1,6 @@
> >   require gcc-configure-common.inc
> >
> >   EXTRA_OECONF_PATHS = " \
> > +    --with-sysroot \
> 
> I can't seem to find the reply to this, but RP added a "=" to the
> end of this and that seems to have re-introduced the problem we were 
> attempting to fix.
> 
> Apparently this is a bug in the configure script then also.

I screwed up, I've fixed it. Sorry about that.

Cheers,

Richard



