Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TbsOe-0000gv-BX
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 13:30:21 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TbsB0-0005Jn-7p; Fri, 23 Nov 2012 13:16:10 +0100
From: Phil Blundell <philb@gnu.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 23 Nov 2012 12:16:09 +0000
In-Reply-To: <1353672077.1361.4.camel@ted>
References: <1353620179.10459.59.camel@ted>
	<1353621014.2000.16.camel@x121e.pbcl.net>
	<1353621779.10459.67.camel@ted>
	<1353665804.13864.713.camel@phil-desktop> <1353672077.1361.4.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1353672970.13864.739.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-cross: Explicitly depend on linux-libc-headers
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
X-List-Received-Date: Fri, 23 Nov 2012 12:30:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-11-23 at 12:01 +0000, Richard Purdie wrote:
> I'm not sure "gratuitous" is entirely fair, the metadata as it stands
> today is fairly linux centric.

For some (maybe large) parts of the metadata that's probably true, but
gcc-cross does happen to be usable on non-linux with only minor
adjustments to EXTRA_OECONF and it would be nice to keep it that way.

>I will however change this to use anonymous python despite the
>performance and readability downsides 

Thank you.

>... since I appear to have hit some nerve.

I guess you could view it that way.  I am indeed sensitive to having my
builds broken in easily-avoidable ways. 

p.




