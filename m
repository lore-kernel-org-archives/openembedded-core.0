Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 4CD396B262
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 11:24:51 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V08nr-0001Q0-3H; Fri, 19 Jul 2013 13:24:51 +0200
Message-ID: <1374233090.6324.26.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Holger Freyther <holger@freyther.de>
Date: Fri, 19 Jul 2013 12:24:50 +0100
In-Reply-To: <loom.20130719T072922-639@post.gmane.org>
References: <ly8v1etzn5.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<ly4nc2twyk.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<loom.20130719T072922-639@post.gmane.org>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: kernel miscompilation with gcc 4.8 for ARMv5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Jul 2013 11:24:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-07-19 at 05:39 +0000, Holger Freyther wrote:
> will crash on the above line. Compiling tcp_ipv4.c with GCC4.6.3
> and re-linking doesn't appear to fix the problem but maybe I made
> another mistake.

If your analysis of the path that leads up to the crash is correct then
it sounds like the bug is probably in inet_hashtables.c not tcp_ipv4.c.
Does it help if you recompile that one file with the older GCC and
re-link?

p.



