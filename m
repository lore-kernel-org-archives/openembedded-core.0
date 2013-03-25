Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UKBkg-0000Lj-Ks for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 19:04:53 +0100
Received: from cpc14-cmbg17-2-0-cust423.5-4.cable.virginmedia.com
	([86.14.229.168] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UKBUH-0006w5-9f; Mon, 25 Mar 2013 18:47:13 +0100
Message-ID: <1364233524.25692.139.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Mon, 25 Mar 2013 17:45:24 +0000
In-Reply-To: <51508505.5080706@windriver.com>
References: <1364231993-31670-1-git-send-email-mark.hatle@windriver.com>
	<1364231993-31670-2-git-send-email-mark.hatle@windriver.com>
	<1364230955.25692.138.camel@phil-desktop.brightsign>
	<51508505.5080706@windriver.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2 RFC] rpm: Add workaround for debugedit-segv
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
X-List-Received-Date: Mon, 25 Mar 2013 18:05:05 -0000
X-List-Received-Date: Mon, 25 Mar 2013 18:05:05 -0000
X-List-Received-Date: Mon, 25 Mar 2013 18:05:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-03-25 at 12:10 -0500, Mark Hatle wrote:
> I'm going to look into identifying if the section is a NOBITS and skipping the 
> whole operation if it is.

That would mean that a change in the size of the .bss wouldn't have any
impact on the hash.  Maybe that's fine for your application though, I
dunno.

p.




