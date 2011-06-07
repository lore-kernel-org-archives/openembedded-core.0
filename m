Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QTtGE-0007iV-CJ for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 12:11:46 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QTtD5-0006m6-Eu
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 12:08:31 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTinnB+Z5T6HLzjQrpSyDvjxbjKqz5Q@mail.gmail.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
	<3eba2df4c6f2371db24ab2420d037b992725cb84.1307342214.git.sgw@linux.intel.com>
	<1307343323.3131.1.camel@lenovo.internal.reciva.com>
	<1307357430.7672.7.camel@rex> <4DED055A.8010200@linux.intel.com>
	<BANLkTi=5YeR0kkX+9TwkaJXe=azKdwxxwA@mail.gmail.com>
	<1307386818.7672.31.camel@rex>
	<BANLkTinnB+Z5T6HLzjQrpSyDvjxbjKqz5Q@mail.gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 07 Jun 2011 11:08:30 +0100
Message-ID: <1307441310.2529.4748.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [CONSOLIDATED PULL 01/20] bitbake.conf: Create staticlibs pacakge for static libraries
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
X-List-Received-Date: Tue, 07 Jun 2011 10:11:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-06 at 19:07 +0000, Otavio Salvador wrote:
> On Mon, Jun 6, 2011 at 19:00, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2011-06-06 at 17:31 +0000, Otavio Salvador wrote:
> >> I personally prefer -static. -staticlib seems redundant for me since
> >> we can end with libfoo-staticlib
> >
> > -static doesn't really work well given we already have -static packages
> > meaning something else (e.g. the busybox case).
> 
> Aren't we changing the wrong name? In my opinion then busybox ought to
> be renamed. Like busybox-staticlinked or busybox-nolibs.

I don't think busybox-static even exists in oe-core at the moment so
there may not actually be anything to rename.

p.




