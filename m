Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TFqUp-00042K-FI
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Sep 2012 20:01:35 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TFqIU-0003k3-HS; Sun, 23 Sep 2012 19:48:50 +0200
Message-ID: <1348422391.4444.238.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Sep 2012 18:46:31 +0100
In-Reply-To: <CAMKF1sr_zaF9B-kWwDexh6jwL8S2oKxnBMqg4BQ7eAdEh4X5vA@mail.gmail.com>
References: <1348331093.4444.218.camel@x121e.pbcl.net>
	<CAMKF1sr_zaF9B-kWwDexh6jwL8S2oKxnBMqg4BQ7eAdEh4X5vA@mail.gmail.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Ensure that ${sbindir} is respected
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
X-List-Received-Date: Sun, 23 Sep 2012 18:01:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-09-23 at 10:31 -0700, Khem Raj wrote:
> On Sat, Sep 22, 2012 at 9:24 AM, Phil Blundell <philb@gnu.org> wrote:
> > The configure script uses a hard-coded value for ${usrsbin_execdir},
> > which is the path that we know as ${sbindir}.  Adjust configure to take
> > this from the environment if it's set there, and have do_configure()
> > pass it in.
> 
> I think our expectation is same as what the configure is defining
> which is sbin dir under exec_prefix

Well, that might be your expectation, but it isn't necessarily what the
user has configured.  There is no guarantee that ${sbindir} will be set
to that particular value, and the recipes ought to respect what it is,
in fact, set to.

p.




