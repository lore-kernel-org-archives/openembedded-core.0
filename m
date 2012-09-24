Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGBdI-0007Uo-A6
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 18:35:44 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TGBQw-0004eX-CT; Mon, 24 Sep 2012 18:22:58 +0200
From: Phil Blundell <philb@gnu.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Mon, 24 Sep 2012 17:22:57 +0100
In-Reply-To: <50607F4E.5040300@linux.intel.com>
References: <1348501103.31293.51.camel@phil-desktop>
	<50607F4E.5040300@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348503778.31293.52.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: work-shared not being correctly shared
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
X-List-Received-Date: Mon, 24 Sep 2012 16:35:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-24 at 08:42 -0700, Saul Wold wrote:
> Yes, I am seeing something similar with do_patch happening twice on the 
> work-shared area, I talked with Richard a bit ago about it, and I am 
> digging into the siginfo files, you can use bitbake-sigdiff to see what 
> sigs are changed causing it unpack twice (or in my case patch twice).

Ah, right, it seems to be rm_old_work that's causing the problem.  I'll
disable that for now and figure out how to fix it later.

Thanks

p.




