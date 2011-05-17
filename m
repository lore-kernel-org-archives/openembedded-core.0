Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QMH5Q-0007tt-W4 for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 12:01:09 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QMH2g-0004Vu-02
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 11:58:18 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305588971.3424.142.camel@rex>
References: <cover.1305580484.git.sgw@linux.intel.com>
	<3f105b122736772aa2cf11d4b346d764239b2a68.1305580484.git.sgw@linux.intel.com>
	<1305588971.3424.142.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 17 May 2011 10:58:16 +0100
Message-ID: <1305626296.2429.179.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 04/14] xserver-kdrive: upgrade from 1.7.99.2 to 1.10.1
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
X-List-Received-Date: Tue, 17 May 2011 10:01:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 00:36 +0100, Richard Purdie wrote:
> As far as I can tell, we can throw away xtscal, libxcalibrate, and
> calibrateproto after that change since they need that X extension. Its a
> good example of why changes need to get upstream as if the build fix was
> there, they'd have had less reason to remove it. 

It is a bit of a shame that XCALIBRATE has been removed upstream, but
it's fairly self-contained and it wouldn't be all that hard for
oe[-core] to patch it back in again.

> We probably are going to need to rewrite xtscal to use XI2 at this
> point :/.

Yes, or that might be a better answer in the long term.  I do have a
certain fondness for XCALIBRATE but it was never an especially elegant
solution to the problem.  If XI2 can do the same thing more neatly then
updating xtscal to use it is probably the right thing.  Patches welcome
I guess :-}

p.




