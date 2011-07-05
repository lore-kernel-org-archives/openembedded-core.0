Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qe2nz-0005H9-J1
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 12:24:35 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qe2kK-0001Ei-Ne
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 12:20:48 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 05 Jul 2011 11:20:47 +0100
In-Reply-To: <1309558358.20015.563.camel@rex>
References: <c201845df210143f3170eca54c9870f7e20be47a.1309533254.git.richard.purdie@linuxfoundation.org>
	<469c48cf5611c9e984d8114a48e834d03c44d099.1309533254.git.richard.purdie@linuxfoundation.org>
	<1309533561.2633.76.camel@phil-desktop>
	<1309558358.20015.563.camel@rex>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1309861248.19115.5.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 5/6] beecrypt: Fix up packaging QA warnings
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
X-List-Received-Date: Tue, 05 Jul 2011 10:24:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 23:12 +0100, Richard Purdie wrote:
> On Fri, 2011-07-01 at 16:19 +0100, Phil Blundell wrote:
> > On Fri, 2011-07-01 at 16:17 +0100, Richard Purdie wrote:
> > > +FILES_${PN} = "${sysconfdir} ${libdir}/*.so.* ${libdir}/${BPN}/*.so.*"
> > 
> > You can use ${SOLIBS} there...
> > 
> > > +FILES_${PN}-dev += "${libdir}/${BPN}/*.so ${libdir}/${BPN}/*.la
> > 
> > ... and ${SOLIBSDEV} there.
> 
> I'm in two minds on these. On the one hand they do make sense and have
> allowed us to build darwin targets in the past (and would extend to
> windows too). On the other hand nobody is using them outside the core
> metadata.

I'm not quite sure I understand what you mean by the "core metadata" in
this context.  There are a handful of uses (though admittedly not many)
in meta-oe for example, so it is not quite true to say that their usage
is restricted solely to oe-core.

Regardless, I don't think the fact that these are seldom used at present
is a reason to not use them more in future.  Aside from the
darwin/windows/other OS issue, using the variables rather than writing
out ".so.*" by hand is more robust in that it avoids the risk of typos
causing packaging errors.  We've had several instances in the past, for
example, of people accidentally omitting the second dot and writing
".so*".

p.




