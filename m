Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SrUox-0005QK-1g for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 16:01:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6IDoMKB025409
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:50:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24227-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:50:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6IDoC6h025403
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:50:14 +0100
Message-ID: <1342619416.513.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jul 2012 14:50:16 +0100
In-Reply-To: <CADkTA4NTBME99-JMBy1+22iwqV7nxpsB=CSsLNuT8wDKgQY-eA@mail.gmail.com>
References: <1342011739-6416-1-git-send-email-bogdan.a.marinescu@intel.com>
	<CAMKF1sq_D4nDSSOctRRht=_93yacfMNfnO9AENCg-aTGyPNreg@mail.gmail.com>
	<CAMZjud0ZtRDiE-kpNw6mZz33BQEBJN3LzG5shHEzMn6wk5+sSA@mail.gmail.com>
	<CADkTA4OkYB6ZsA81mz1YUrYeukVjrtSTph8b5mJ9jiomPibMKg@mail.gmail.com>
	<CAMZjud1JPfU7pfd2C+gQEmEpY_8ePSvrsMiyUMOAH4SnMd-pqg@mail.gmail.com>
	<CADkTA4NTBME99-JMBy1+22iwqV7nxpsB=CSsLNuT8wDKgQY-eA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] linux-libc-headers: updated to 3.4.3
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
X-List-Received-Date: Wed, 18 Jul 2012 14:01:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-18 at 09:23 -0400, Bruce Ashfield wrote:
> On Wed, Jul 18, 2012 at 9:17 AM, Marinescu, Bogdan A
> <bogdan.a.marinescu@intel.com> wrote:
> > On Wed, Jul 18, 2012 at 4:03 PM, Bruce Ashfield
> > <bruce.ashfield@gmail.com> wrote:
> >> On Wed, Jul 18, 2012 at 7:30 AM, Marinescu, Bogdan A
> >> <bogdan.a.marinescu@intel.com> wrote:
> >>> On Tue, Jul 17, 2012 at 7:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>>> Why is recipe renamed
> >>>
> >>> Wasn't I supposed to do that when I upgraded the package from 3.4 to 3.4.3 ?
> >>
> >> No one replied to my other question (or at least no one replied that I
> >> noticed), about
> >> why we even bothered to bump it to 3.4.3 ...
> >
> > Quite simply, I'm the owner of the recipe and I'm supposed to upgrade
> > it when a new version appears :)
> 
> I must have missed that .. because I'd disagree with both counts.
> 
>  - libc-headers does not need to be upgraded with every korg stable update
>  - it is coupled to the kernel, and I've done it in the past, and had planned to
>    leave it a 3.4.

Bogdan: This is probably one of the cases we shouldn't automatically
update just based on the output of the version checking scripts. We
should only change the point release version here if there is a change
to the kernel headers that we need.

As for the recipe owner, this one may be best owned by Bruce but I'm
open minded on that.


Cheers,

Richard



