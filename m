Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SyrPF-00017E-5h
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 23:33:37 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SyrDt-0005nY-4V
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 23:21:53 +0200
Message-ID: <1344374402.4874.32.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 07 Aug 2012 22:20:02 +0100
In-Reply-To: <50216C8B.20802@windriver.com>
References: <1344360704-23172-1-git-send-email-yao.zhao@windriver.com>
	<502152B8.6070100@gmail.com> <50215ED9.3070505@windriver.com>
	<1344364223.4874.16.camel@x121e.pbcl.net>
	<50216009.6020601@windriver.com>
	<1344364696.4874.19.camel@x121e.pbcl.net>
	<502161DC.9020705@windriver.com>
	<1344365134.4874.23.camel@x121e.pbcl.net>
	<50216C8B.20802@windriver.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] cracklib, zlib: install to /lib instead of /usr/libxx
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
X-List-Received-Date: Tue, 07 Aug 2012 21:33:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-08-07 at 15:29 -0400, Yao Zhao wrote:
> On 12-08-07 02:45 PM, Phil Blundell wrote:
> > On Tue, 2012-08-07 at 14:43 -0400, Yao Zhao wrote:
> >> On 12-08-07 02:38 PM, Phil Blundell wrote:
> >>> On Tue, 2012-08-07 at 14:35 -0400, Yao Zhao wrote:
> >>>> On 12-08-07 02:30 PM, Phil Blundell wrote:
> >>>>> Where do libz.a and libz.so end up after your patch?
> >>>> =E2=94=9C=E2=94=80=E2=94=80 zlib-dev
> >>>> =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 lib
> >>>> =E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 libz.so -> libz.so.1=
.2.7
> >>>> =E2=94=94=E2=94=80=E2=94=80 zlib-staticdev
> >>>> =E2=94=94=E2=94=80=E2=94=80 lib
> >>>> =E2=94=94=E2=94=80=E2=94=80 libz.a
> >>> I found the output from "tree" a bit hard to read, but that doesn't l=
ook
> >>> right to me.
> >> any reason? It shouldn't go to lib, but still /usr/libxx?
> > Conventionally, yeah.  I think the linker does search both but the
> > development files would traditionally go in /usr/lib.
> If don't install libz.a to the same directory, will linker find libz.a=
=20
> not libz.so if -L /usr/lib -L /lib?

You want both libz.a and libz.so in /usr/lib so I think that ought to be
a non-issue.  But in any case, I think (though I'm not 100% certain)
that it will look for libz.so in all paths before searching for libz.a.

p.




