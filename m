Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UUxO1-0003Cr-Jm; Wed, 24 Apr 2013 12:57:20 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UUx6v-0001yO-BS; Wed, 24 Apr 2013 12:39:37 +0200
Message-ID: <1366799976.14512.21.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 24 Apr 2013 11:39:36 +0100
In-Reply-To: <1366790466.23738.86.camel@ted>
References: <CA+YB3rb6xwk2-rsSa=dQx19qp7jKAVBZiMmQB5DvrGOmLUFG2Q@mail.gmail.com>
	<20130424064319.GD3217@jama> <1366790466.23738.86.camel@ted>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] OpenEmbedded TSC 8 April 2013
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
X-List-Received-Date: Wed, 24 Apr 2013 10:57:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-04-24 at 09:01 +0100, Richard Purdie wrote:
> The TSC talked about it and agreed a particular direction. Its clear
> that some people don't like the direction so they just ignored it and do
> their own thing anyway.
> 
> This is the wrong way to go about making decisions and I'm extremely
> disappointed people are doing this.

It's maybe worth pointing out that this change was discussed on the
mailing list at the time.  During that thread, two members of the
TSC spoke in favour of the change and neither they nor anybody else
pointed out that it was contrary to the TSC's stated policy. 

So, although I agree it is a bit unfortunate that meta-oe has decided
to go off and plough its own furrow, it doesn't seem that the TSC made
much of an effort to dissuade them at the time and I can understand how
Martin might have interpreted the responses he got as approval.

>At this point I assume I'm free to ignore the TSC since we now have
>precedent for it?

As far as I know you've always been free to do that.  It's up to the TSC
to enforce its own decisions if it wishes to.

All that said, I have had a suspicion for a while that the TSC is
perhaps becoming superfluous to requirements.  When the TSC was first
set up, the environment within which OE operated was very different:
this was a time before the Yocto Project and before oe-core, when
everything was in a single tree, a vast number of people had
indiscriminate commit access, and there was no identified maintainer who
was empowered to make decisions about which patches went in and which
didn't.

Nowadays it seems (and I don't intend this as a criticism) that most of the
technical direction is coming from the Yocto side and the OE project
itself is mostly just going along for the ride.  Plus, every layer does
now have its own maintainer so the original power vacuum that the TSC
was created to fill no longer exists.  In this sort of scenario it seems
as though OE is rather over-equipped with governance mechanisms (the
TSC, the e.V. board and the e.V. membership itself) that aren't
necessarily accomplishing very much.

Also, now that we have a multiplicity of layers rather than a single
monolithic tree, it isn't entirely obvious where the TSC's authority
begins and ends.  I think everyone would agree that oe-core falls under
the aegis of the TSC, but beyond that it isn't totally obvious which
layers do and don't count as part of "OE" for that purpose.

And finally, it's been apparent during the last few TSC and board
elections that it is a bit of a struggle to attract high-quality
candidates to stand for membership of either body.  I don't think we've
had an election which was actually contested for quite some time: this
makes the elections themselves seem like just a waste of everybody's
time.

So, maybe it's time that we as a project had a bit of a re-think
regarding what sort of governance structures we actually need and want
in this day and age.

p.




