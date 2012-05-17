Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SV9Gi-0007US-OE
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 00:34:00 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SV971-0002aW-Uy
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 00:24:00 +0200
Message-ID: <1337293371.3181.190.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 17 May 2012 23:22:51 +0100
In-Reply-To: <CAP9ODKqc5eubLWKrbPowvunHaUX0Fhbk-XLFgH=b+pr8m+tGcQ@mail.gmail.com>
References: <1337074341-12708-1-git-send-email-koen@dominion.thruhere.net>
	<1337288563.7473.24.camel@ted> <20120517211637.GD23562@bill-the-cat>
	<2398024.EpgDMcMvMx@helios>
	<CAP9ODKqc5eubLWKrbPowvunHaUX0Fhbk-XLFgH=b+pr8m+tGcQ@mail.gmail.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] Revert "kmod: Use base_libdir for installing libkmod"
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
X-List-Received-Date: Thu, 17 May 2012 22:34:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-17 at 18:51 -0300, Otavio Salvador wrote:
> It is important to state that if OE-Core breaks Meta-OE this is
> crticial. It is not Yocto that people use and many active contributors
> use Meta-OE so it is important and critical to that people. Seems more
> health to the project to give the deserved value to Meta-OE instead of
> badmouth it...

No doubt meta-oe's welfare is indeed critical to those who use it, but
there is a substantial population of oe-core users who don't.

Without wishing to badmouth meta-oe too much, I do get the impression
that its relationship with oe-core is based more on taking than on
giving, and also that meta-oe seems a bit unclear about what exactly its
own mission is.  On the one hand it seems to try to be a sort of
unofficial mod for oe-core which adds newer/older/different versions of
some recipes and adjusts features in others.  On the other hand it seems
to be a repository for recipes which are of general interest but not
quite "core" enough to be in oe-core.  And on the third hand, there
seems to be a view (as Tom alluded to in this thread) that meta-oe
should serve as some sort of staging area for changes which are
ultimately intended for oe-core but perhaps not quite stable enough yet.
As Paul mentioned, the combination of these three things is somewhat
toxic. 

Personally I would like to see the meta-oe folks make a bit more of an
effort to contribute worthwhile improvements back to oe-core (and/or put
them in other layers, as seems to be happening with the systemd bits)
rather than just keeping them as part of the meta-oe monolith
indefinitely.  And, in parallel with that, I think it would make sense
to split meta-oe into three or maybe more separate layers: one which is
purely a collection of "extra" recipes, one which contains all the
policy changes that meta-oe wishes to make compared to what's in
oe-core, and one which is a sort of "oe-core-next", containing changes
which are theoretically candidates for merging into oe-core but for
whatever reason are not quite ready to submit.

p.




