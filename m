Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QlRzo-0004MY-C9
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 22:43:24 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QlRvm-00012M-4G
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 22:39:14 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E2DC535.9030406@mentor.com>
References: <cover.1311345613.git.richard.purdie@linuxfoundation.org>
	<1311357628.2344.153.camel@rex> <4E29BE22.5060002@mentor.com>
	<4E2DBC30.9070808@windriver.com>  <4E2DC535.9030406@mentor.com>
Date: Mon, 25 Jul 2011 21:39:08 +0100
Message-ID: <1311626348.3098.20.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 5/3] conf/machine/include: Start to fill out architecture specific tune include files and tune features
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
X-List-Received-Date: Mon, 25 Jul 2011 20:43:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 12:34 -0700, Tom Rini wrote:
> On 07/25/2011 11:55 AM, Mark Hatle wrote:
> > I actually prefer "x86-64" I think that is a reasonable compromise between the
> > x86_64 naming and the need to not use "_".
> 
> That causes other problems, no?  Top of my head would be that deb/ipk
> doesn't allow a dash in that field.  Could be mistaken tho...

The package management backend could always rewrite it to something else
(under control of the DISTRO if need be, so AMD and Intel folks can each
call it their own thing if they want to).

Personally though, I would be tempted just to call it "x64", which is
then nicely symmetric with x32 and doesn't seem likely to collide with
anything else.

p.




