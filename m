Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qcayh-0007Lk-6X for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 12:29:39 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1Qcav7-0002C2-0H
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 12:25:57 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTi=iS0wADj=2=vq9BtTSKt_bHWCw+Q@mail.gmail.com>
References: <1309453832.7987.33.camel@desktop.home>
	<1309472051.20015.465.camel@rex>
	<BANLkTimzg79tkU+=-AgwgYhJSC52jJVT6Q@mail.gmail.com>
	<1299A20C-0494-4434-84C4-E1503FAE0CFC@dominion.thruhere.net>
	<BANLkTimqAhtqPWbhvnA4KdzYO2oJw63bvQ@mail.gmail.com>
	<57C7DA2B-0811-40F1-AACA-9F710955A4D1@dominion.thruhere.net>
	<BANLkTi=iS0wADj=2=vq9BtTSKt_bHWCw+Q@mail.gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 01 Jul 2011 11:25:56 +0100
Message-ID: <1309515956.2633.43.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: Proposal: recipe feature switches
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
X-List-Received-Date: Fri, 01 Jul 2011 10:29:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 12:19 +0200, Frans Meulenbroeks wrote:
> Well, as far as I know if it is in DEPENDS it will implicitly end up
> in RDEPENDS 

No, you've got it backwards.  Items appearing in RDEPENDS are (to a
first approximation) treated as if they are also in DEPENDS, but not the
converse.

p.





