Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QhieM-00071b-EF
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 15:41:50 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QhiaV-0007Ce-T3
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 15:37:52 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jul 2011 14:37:50 +0100
In-Reply-To: <1310736662.20015.1232.camel@rex>
References: <1310736662.20015.1232.camel@rex>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310737071.3805.38.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Performance datapoint - impact of static libs
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
X-List-Received-Date: Fri, 15 Jul 2011 13:41:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

> So static libs add an extra ~30mins of processing (7%) and ~5 mins to
> the overall build time. Not as much of a gain as I'd have liked but
> interesting none the less.

Do you know how many packages actually respect the --disable-static
flag?  I don't think (e)glibc does, for example, which is a bit of a
shame since it obviously has one of the largest build times.

p.




