Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RNsgG-0007B4-Bn
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 21:54:04 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1RNsaF-0007XA-Sb; Tue, 08 Nov 2011 21:47:51 +0100
From: Phil Blundell <philb@gnu.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAEsOVNdLNUO+nDVjyU8DeoYzRDb0drGT3J2osopX_qGTZ4Swrg@mail.gmail.com>
References: <1320441301.3137.1.camel@lenovo.internal.reciva.com>
	<1320441941-30850-1-git-send-email-msm@freescale.com>
	<1320442499.3296.4.camel@lenovo.internal.reciva.com>
	<CAEsOVNdRnM_TachXg=WD4g6iYFGxSgGfx2bWx+PdArfhvuFseA@mail.gmail.com>
	<CAEsOVNdLNUO+nDVjyU8DeoYzRDb0drGT3J2osopX_qGTZ4Swrg@mail.gmail.com>
Date: Tue, 08 Nov 2011 20:47:44 +0000
Message-ID: <1320785264.3080.1.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH v2] Introduce new SERIAL_CONSOLES to add multiple consoles for your MACHINE
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
X-List-Received-Date: Tue, 08 Nov 2011 20:54:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-08 at 19:36 +0000, McClintock Matthew-B29882 wrote:
> On Mon, Nov 7, 2011 at 5:03 PM, Matthew McClintock <msm@freescale.com> wrote:
> > I don't get it. I think the first version was still OK. The first
> > version is pasted below.
> >
> >> +    idx=0
> >> +    tmp="${SERIAL_CONSOLES}" <- If it's not defined this will catch it.
> >> +    for i in $tmp
> >> +    do
> >> +     j=`echo ${i} | sed s/\;/\ /g`
> >> +        echo "${idx}:2345:respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
> >> +     idx=`expr $idx + 1`
> >> +    done
> >
> > See my inline comment above, but if SERIAL_CONSOLES is not defined
> > tmp="" and the for loop won't execute. Not sure if there is a more
> > standard way to do this though.
> 
> ping..

Yeah, now I look at this again I think it is probably OK.  Bitbake won't
expand ${SERIAL_CONSOLES} if it's unset, but the shell will and I think
you probably will get the right results.  Assuming you've actually
tested that case and it does work, I think I'm happy with what you have
above.

p.




