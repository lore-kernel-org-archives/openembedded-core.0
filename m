Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TL9d0-0003c8-QT; Mon, 08 Oct 2012 11:27:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q989Enxq017525;
	Mon, 8 Oct 2012 10:14:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16463-05; Mon,  8 Oct 2012 10:14:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q989Egpa017519
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 8 Oct 2012 10:14:43 +0100
Message-ID: <1349687686.15658.98.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Mon, 08 Oct 2012 10:14:46 +0100
In-Reply-To: <5072904F.8060007@intel.com>
References: <20121003114821.8D16410375@opal>
	<20121006162136.GA24453@jama.jama.net>
	<CAMKF1spAUgXTptMAdXe=utSRap2_xc6ULuLMA7=QdX0ewis6BQ@mail.gmail.com>
	<5072904F.8060007@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Laurentiu Palcu : qemu: add wrapper for qemu-mips binary
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
X-List-Received-Date: Mon, 08 Oct 2012 09:27:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-08 at 11:35 +0300, Laurentiu Palcu wrote:
> 
> On 10/06/2012 09:13 PM, Khem Raj wrote:
> > On Sat, Oct 6, 2012 at 9:21 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> >>
> >>> +# IMPORTANT: This piece needs to be removed once the root cause is fixed!
> >>> +do_install_append() {
> >>> +     create_wrapper ${D}/${bindir}/qemu-mips \
> >>> +             QEMU_RESERVED_VA=0x0
> >>> +}
> >>> +# END of qemu-mips workaround
> >>
> >> What about checking if mips is in QEMU_TARGETS before doing this?
> >>
> > 
> > or simply for check for existence of qemu-mips before creating the wrapper
> > 
> >> Right now this breaks all distros without mips in QEMU_TARGETS.
> Sorry, I totally missed this. :| What about adding a simple check in the
> create_wrapper script itself? We create the wrapper only if the target
> binary exists. It sounds better this way and the user does not
> necessarily have to remember to check for the binary existence before
> creating the wrapper.
> 
> I'll prepare a patch.

In general I think we expect the target to exist. qemu is a little
special since the user can configure it different ways. I therefore see
qemu as being the exception in this case rather than the rule and think
the default behaviour for create_wrapper should be to fail if it doesn't
exist as there is likely some other issue.

Cheers.

Richard





