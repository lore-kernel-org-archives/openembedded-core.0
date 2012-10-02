Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TJ56S-0005vh-W2
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 18:13:49 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TJ4tv-00042J-NS; Tue, 02 Oct 2012 18:00:52 +0200
From: Phil Blundell <philb@gnu.org>
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Tue, 02 Oct 2012 17:00:50 +0100
In-Reply-To: <CAPhnLPBNv8EVfJsfNfGo9tTNTu55GLR9A8GnxnYOygQp9yVjYw@mail.gmail.com>
References: <025adb591e6811bcd1bc5480d6c297015d373a02.1323286080.git.elizabeth.flanagan@intel.com>
	<38bec96fcbe89f8dc264c8889f69e4f5afff35ad.1323286080.git.elizabeth.flanagan@intel.com>
	<1349174767.32611.79.camel@phil-desktop>
	<CAPhnLPBNv8EVfJsfNfGo9tTNTu55GLR9A8GnxnYOygQp9yVjYw@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1349193651.32611.93.camel@phil-desktop>
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] OECore license fixes: meta/*
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
X-List-Received-Date: Tue, 02 Oct 2012 16:13:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-02 at 08:16 -0700, Flanagan, Elizabeth wrote:
> On Tue, Oct 2, 2012 at 3:46 AM, Phil Blundell <philb@gnu.org> wrote:
> >
> > This (and the corresponding change to busybox) doesn't seem quite right.
> > Although it is true that the bzip2 licence does have four clauses and is
> > approximately BSD-ish, these four clauses are not actually the same as
> > the ones in the traditional 4-clause BSD licence.
> 
> That's correct, thanks for the catch. When I was going through these,
> I relied on a lot on what others had listed the package as. OBS lists
> it as BSD (3 clause I believe). Gentoo lists it as bzip2.
> I dislike having singular licenses but in this case, due to clause 2
> and 3, the correct path here is to change it back to bzip2, add the
> bzip2 text to the license directory and then email the bzip2
> developers and ask them if BSD-4-clause is appropriate or not. I'll do
> that today.

If you're going to ask the maintainers about varying the license
wording, it might be better to ask for BSD-3-Clause rather than the
4-clause one.  Having it licensed under terms which include the
advertising clause would be a bit of a pain.

p.




