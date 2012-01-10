Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RkgNo-00074O-N7
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 19:25:16 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RkgGc-0007Zz-15
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 19:17:50 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jan 2012 18:17:48 +0000
In-Reply-To: <1326218233.23315.6.camel@ted>
References: <cover.1326174744.git.sgw@linux.intel.com>
	<1326218233.23315.6.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1326219470.12160.107.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 00/22] Patches and Updates for M2
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
X-List-Received-Date: Tue, 10 Jan 2012 18:25:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-10 at 17:57 +0000, Richard Purdie wrote:
> > Khem Raj (8):
> >   site/common-uclibc: Cache gl_cv_func_wcwidth_works
>
> I merged these apart from:
>    default-distrovars: Define DISTRO_FEATURES_LIBC for uclibc

I think the consensus on that common-uclibc patch (see previous
discussion on this list) was that it oughtn't to be merged.  Certainly
not if:

>   uclibc: Configure UCLIBC_HAS_WCHAR based on libc-posix-clang-wchar
>     distro feature

is in, since the latter will make the value in the site file wrong.

p.




