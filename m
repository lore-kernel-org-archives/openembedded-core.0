Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T3NZF-00015i-AJ
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 10:42:37 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1T3NNd-0002Tw-5y; Mon, 20 Aug 2012 10:30:37 +0200
Message-ID: <1345451321.24626.77.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Mon, 20 Aug 2012 09:28:41 +0100
In-Reply-To: <8627395.gapg0V4nHB@helios>
References: <1345448771-4656-1-git-send-email-radu.moisan@intel.com>
	<1345450697.24626.67.camel@x121e.pbcl.net> <8627395.gapg0V4nHB@helios>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] busybox: Upgrade to upstream 1.20.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2012 08:42:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-08-20 at 09:25 +0100, Paul Eggleton wrote:
> On Monday 20 August 2012 09:18:17 Phil Blundell wrote:
> > On Mon, 2012-08-20 at 10:46 +0300, Radu Moisan wrote:
> > > @@ -97,6 +97,8 @@ do_prepare_config () {
> > > 
> > >  		< ${WORKDIR}/defconfig > ${S}/.config
> > >  	
> > >  	sed -i -e '/CONFIG_STATIC/d' .config
> > >  	echo "# CONFIG_STATIC is not set" >> .config
> > > 
> > > +	sed -i -e '/CONFIG_LSOF/d' .config
> > > +	echo "# CONFIG_LSOF is not set" >> .config
> > > 
> > >  	for i in 'CROSS' 'DISTRO FEATURES'; do echo "### $i"; done >> \
> > >  	
> > >  		${S}/.config
> > >  	
> > >  	sed -i -e '${configmangle}' ${S}/.config
> > 
> > Why is this desirable?
> 
> Well, the more appropriate question would be: could we not just update the 
> defconfig and then make that change to it directly?
> 
> (In case it isn't clear - lsof is being disabled because it was not enabled in 
> the previous 1.19.4 version.)

Ah, I see.  In that case, yes, just updating the defconfig is the right
thing to do.  The patch above will, if I am understanding it correctly,
make it impossible (or at least quite hard) for any other layer to turn
CONFIG_LSOF back on.

p.




