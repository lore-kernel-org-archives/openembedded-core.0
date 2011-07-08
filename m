Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QfEMW-0003sr-82 for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 18:57:08 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1QfEIn-0007MY-Mq
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 18:53:17 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 08 Jul 2011 17:53:16 +0100
In-Reply-To: <1310143750.20015.911.camel@rex>
References: <1310139697.6337.134.camel@phil-desktop>
	<1310143750.20015.911.camel@rex>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310143997.6337.143.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: eglibc issuettes continued
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
X-List-Received-Date: Fri, 08 Jul 2011 16:57:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 17:49 +0100, Richard Purdie wrote:
> I'm guessing something is going wrong with prefixes somewhere. I'm
> certainly not seeing the bulk of those locally...

I just realised that the gconv/locale ones are my fault; I had patched
do_install_locale() locally to try to fix a different problem and this
was causing that stuff to get left in ${D} rather than moved out of the
way.  Sorry about that false report.

Are you seeing the libc-extra-nss and libc-thread-db warnings?

For things like /etc/rpc, I was wondering this morning whether we should
introduce some sort of "FILES_NOT_WANTED" kind of variable which could
declare the files that are being left deliberately unshipped.  That
would avoid the need for adhoc do_install_append() { rm -rf } kind of
arrangements.

p.




