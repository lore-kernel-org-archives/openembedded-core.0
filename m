Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UViao-0007Zy-8q for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 15:22:09 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UViJe-00065b-JE; Fri, 26 Apr 2013 15:03:54 +0200
Message-ID: <1366981433.14512.102.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 26 Apr 2013 14:03:53 +0100
In-Reply-To: <517998E2.4040409@linux.intel.com>
References: <1366894048.14512.87.camel@phil-desktop.brightsign>
	<517998E2.4040409@linux.intel.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-utils: Move alsaconf to its own recipe
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
X-List-Received-Date: Fri, 26 Apr 2013 13:22:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-04-25 at 13:58 -0700, Saul Wold wrote:
> > +S = "${WORKDIR}/alsa-utils-${PV}"
> > +
> Do you mean to point into the alsa-utils actual workdir where alsaconf 
> has been created?  Then you could also avoid unpacking.

That wasn't really my intention.  I guess we could try to do that but I
don't think it's straightforward to guarantee that the alsa-utils
workdir actually exists at the right time.  We'd probably end up having
to do something like work-shared/gcc which seems like overkill.

> > +do_configure() {
> > +	# Nothing to configure
> > +	:
> 
> By doing nothing here, the alsaconf does not get created since there is 
> only an alsaconf.in

Hm, yes, you're quite right.  I had convinced myself that the generated
alsaconf was getting shipped in the tarball, but apparently I didn't
clean thoroughly enough before checking that.  I'll send a new patch
which corrects that.

thanks

p.




