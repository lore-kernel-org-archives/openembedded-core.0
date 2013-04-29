Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UWoxC-0001vN-Oo for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 16:21:27 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UWofz-0001Gh-93; Mon, 29 Apr 2013 16:03:31 +0200
Message-ID: <1367244210.14512.126.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <rpurdie@rpsys.net>
Date: Mon, 29 Apr 2013 15:03:30 +0100
In-Reply-To: <1367243669.5379.21.camel@ted>
References: <1366894048.14512.87.camel@phil-desktop.brightsign>
	<1367243669.5379.21.camel@ted>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-utils: Move alsaconf to its own recipe
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
X-List-Received-Date: Mon, 29 Apr 2013 14:21:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-04-29 at 14:54 +0100, Richard Purdie wrote:
> I merged this however I'm not convinced its the right way to handle
> this. I'm wondering about a PACKAGECONFIG which when turned off, deletes
> alsaconf. I suspect that might be a nicer way to handle this kind of
> issue going forward...

I guess the downside with PACKAGECONFIG is that you need to set it
manually: you can't just build an image which depends on
alsa-utils-alsaconf and have everything happen automatically.  

But from my own point of view, the main thing I care about is not
building bash and PACKAGECONFIG would indeed solve that problem.

p.




