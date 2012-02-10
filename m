Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Rvqn4-00010s-9r
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 14:45:30 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RvqfG-0007mw-GY
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 14:37:26 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 10 Feb 2012 13:37:25 +0000
In-Reply-To: <CAMKF1spd_cGhVtd-_ebgUgyMKHFzsB8JhfF0gdByJBeyvr6_9w@mail.gmail.com>
References: <1328812244-32105-1-git-send-email-andrei@gherzan.ro>
	<1328812424.14363.74.camel@phil-desktop>
	<CAMKF1spd_cGhVtd-_ebgUgyMKHFzsB8JhfF0gdByJBeyvr6_9w@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1328881046.14363.85.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] openssl: Move libcrypto to base_libdir
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
X-List-Received-Date: Fri, 10 Feb 2012 13:45:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-02-09 at 11:54 -0800, Khem Raj wrote:
> eventually I think we will end up with everything being in ${base_libdir} :)
> or we have to make sure that stripped out debug files and standard dev
> libs and headers
> go into /usr

The .debug data does always go into /usr/lib/debug (even on micro).
That path is hardcoded in package.bbclass or some such place and doesn't
depend on ${prefix} or ${libdir}.

> this should be made an option before we go on making these changes IMOs
> I like stuff in /usr and I don't so much care about / and /usr being
> on different partitions

Yes, I agree.  As I mentioned the other day, I think having a
DISTRO_FEATURE for "/ usable without /usr mounted" would be a fine idea
and then all this sort of thing can be made conditional on that.

In this particular case I think there's also an underlying issue that,
for most people, having dhcp linked against openssl is probably just not
nececessary.  I assume this dependency is because of secure ddns or some
such thing, which is a fine feature but, I suspect, not one that the
majority of OE distros are actually using.

p.




