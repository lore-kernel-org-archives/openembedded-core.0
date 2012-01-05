Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Riqn8-0007Gc-My
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 18:07:50 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1Riqg1-0003KO-Dp; Thu, 05 Jan 2012 18:00:29 +0100
From: Phil Blundell <philb@gnu.org>
To: Andrei Gherzan <andrei.gherzan@windriver.com>
Date: Thu, 05 Jan 2012 17:00:28 +0000
In-Reply-To: <4F05D5CB.2070404@windriver.com>
References: <1325781559-18967-1-git-send-email-andrei@gherzan.ro>
	<1325781698.28005.132.camel@phil-desktop>
	<4F05D5CB.2070404@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325782829.28005.136.camel@phil-desktop>
Mime-Version: 1.0
Cc: Andrei Gherzan <andrei@gherzan.ro>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wpa-supplicant: Patch this recipe order to remove a duplicate defconfig file
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
X-List-Received-Date: Thu, 05 Jan 2012 17:07:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-05 at 18:54 +0200, Andrei Gherzan wrote:
> On 01/05/2012 06:41 PM, Phil Blundell wrote: 
> > On Thu, 2012-01-05 at 18:39 +0200, Andrei Gherzan wrote:
> > > From: Andrei Gherzan <andrei.gherzan@windriver.com>
> > > 
> > > Instead of having two defconfigs we can have only one and append this file with de specific
> > > CONFIG if GPLv3 packages are allowed.
> > As I said the other day, I think it would be better to just have one
> > defconfig and turn off the GPLv3 stuff entirely.  Do you know of anybody
> > who actually wants to use it?
> > 
> > p.
> > 
> > 
> Now about that extra config. The idea of having it into a a build were
> gplv3 are allowed,was support for TLS/IA which was designed to be used
> in the EAP-TTLSv1
> https://lists.yoctoproject.org/pipermail/poky/2011-December/007386.html

Well, right.  But the point I was making in my previous email

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-January/015375.html

is that nobody seems to be using TLS/IA, the code in wpa-supplicant was
apparently never all that well tested, and support for it has been
removed entirely in the latest versions of all the relevant software
(and hence, barring heroic efforts, we will lose it anyway next time
wpa-supplicant is upgraded).  

So, unless you know of anybody who actually has a requirement for that
protocol today, I would be inclined to just turn it off unconditionally
rather than adding some mechanism to turn it on and off based on
INCOMPATIBLE_LICENSE.

p.




