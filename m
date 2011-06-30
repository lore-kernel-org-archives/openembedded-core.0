Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QcQ5z-0003lO-G8
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 00:52:27 +0200
Received: (qmail invoked by alias); 30 Jun 2011 22:48:43 -0000
Received: from p5B0A28A6.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.40.166]
	by mail.gmx.net (mp067) with SMTP; 01 Jul 2011 00:48:43 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/VFWw75lHVjWBEVbgYE1H4rrT9gnV+IcMMvlshyx
	v0TpR4pet2SoGX
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 1 Jul 2011 00:50:28 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
References: <201106291728.47032.schnitzeltony@gmx.de>
	<BANLkTin06jiHrgrf2C3eEbkdVrtcYyOShQ@mail.gmail.com>
In-Reply-To: <BANLkTin06jiHrgrf2C3eEbkdVrtcYyOShQ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201107010050.28558.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [was oe] In which meta/layer is a home for not yet supported machines
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
X-List-Received-Date: Thu, 30 Jun 2011 22:52:27 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday, June 29, 2011 05:32:54 PM Khem Raj wrote:
> On Wed, Jun 29, 2011 at 8:28 AM, Andreas Mueller <schnitzeltony@gmx.de> wrote:
> > Hi,
> > 
> > just started to collect first oe-core experiences and would like to get
> > the hardware on my (or friend's) desk supported. To check already
> > available I did
> > 
> > find -name "*.conf" | grep machine
> > 
> > and miss
> > 
> > o gumstix overo ( http://www.gumstix.com/store/index.php?cPath=33 )
> > o tx28 ( http://www.karo-electronics.com/tx28.html / have prepared
> > support for oe but would like to get this to oe-core )
> > o mx28evk (
> > http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=MCIMX28EVK
> > J&fr=g )
> > 
> > In which meta/layer is the first place for
> > configurations/bootloader/kernels?
> 
> you would need meta layer for the new machines. There already are some
> layers checkout angstrom if the machines do not fit into those existing
> you can create a new
> layer something like meta-gumstix
for tx28 / mx28evk see https://gitorious.org/schnitzeltony-oe-meta/meta-
freescale 

I run tested for tx28 / console-image and am happy (let's see for how long..) 
with it. Maybe someone wants to test mx28evk or have some review on it.

Really was'nt that big deal - and nobody nitpicked :-)

Andreas


