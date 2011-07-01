Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qcaxf-0007Js-VB for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 12:28:36 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1Qcau5-0002Bw-Oz
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 12:24:53 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309515335.20015.516.camel@rex>
References: <1309513280.2633.28.camel@phil-desktop>
	<1309515335.20015.516.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 01 Jul 2011 11:24:52 +0100
Message-ID: <1309515892.2633.42.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: PRIORITY
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
X-List-Received-Date: Fri, 01 Jul 2011 10:28:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 11:15 +0100, Richard Purdie wrote:
> On Fri, 2011-07-01 at 10:41 +0100, Phil Blundell wrote:
> > We had some discussion of this a few weeks ago but I'm not sure it ever
> > reached a firm conclusion.
> > 
> > Is everyone agreed that the PRIORITY variable does not serve any useful
> > purpose in oe-core and can/should be removed from the recipes?
> 
> I think that was the conclusion, yes. I'll take a patch (or a
> commandline I guess).

I did:

$ find . -regex ".*\.\(bb\|inc\)$" | xargs sed -i '/^PRIORITY = ".*"$/d'

which seemed to produce the desired results.  I can send a patch if you
like but it would be somewhat large and fairly uninteresting.

p.




