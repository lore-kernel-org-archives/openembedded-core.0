Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TBUGh-0003Gu-U3
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 19:28:59 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TBU4Z-0000SV-M0; Tue, 11 Sep 2012 19:16:28 +0200
Message-ID: <1347383662.29443.21.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Sep 2012 18:14:22 +0100
In-Reply-To: <20120911165323.GJ14077@jama.jama.net>
References: <20120911130155.GC14077@jama.jama.net>
	<1347381972.29443.15.camel@x121e.pbcl.net>
	<20120911165323.GJ14077@jama.jama.net>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qemuarm: should it really have TUNE_ARCH armv5te?
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
X-List-Received-Date: Tue, 11 Sep 2012 17:29:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-11 at 18:53 +0200, Martin Jansa wrote:
> If we drop DEFAULTTUNE from tune-xscale and tune-arm926ejs then
> PACKAGE_ARCH=armv5te would be the same and the same feed will be built
> only once.

Well, that would also make those two tune files rather useless.  It
seems like it would be better to just refrain from including them if you
don't want the corresponding tunings.

p.




