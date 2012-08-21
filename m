Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T3nJW-00040e-D4
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 14:12:06 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1T3n7s-0003KS-JI; Tue, 21 Aug 2012 14:00:04 +0200
From: Phil Blundell <philb@gnu.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Tue, 21 Aug 2012 13:00:03 +0100
In-Reply-To: <50337719.7040801@linaro.org>
References: <CAMKF1srjqDsesRcWP7oGzouPj9aOt_Ln0aOWE9cEQwpUQ7Unuw@mail.gmail.com>
	<50337719.7040801@linaro.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1345550404.2673.23.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Toolchain rework, call for testing
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
X-List-Received-Date: Tue, 21 Aug 2012 12:12:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-21 at 13:55 +0200, Marcin Juszkiewicz wrote:
> W dniu 17.08.2012 06:47, Khem Raj pisze:
> > Hi All
> > 
> > Recently glibc build has been simplified upstream. It has dropped the
> > dependency on libgcc_s and libgcc_eh for building glibc itself.
> > This means that we can simplify our toolchain bootstrap a bit by
> > dropping 1 of the 3 cross gcc build stages. We do not need
> > gcc-cross-intermediate anymore. 
> 
> Please adapt also toolchain-layer in meta-oe for those stuck with gcc 4.6.

Why is it that gcc-4.7 doesn't work for those people?

p.




