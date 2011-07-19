Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qj9Ij-0007jy-Mv
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 14:21:25 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qj9En-0002Ec-UB
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 14:17:22 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jul 2011 13:17:20 +0100
In-Reply-To: <4E24AFF0.9060408@mentor.com>
References: <cover.1310758615.git.tom_rini@mentor.com>
	<c7276dd332ad9e38935443d679c0296a032a511c.1310758615.git.tom_rini@mentor.com>
	<1310770123.20015.1259.camel@rex> <4E20C4E0.2030908@mentor.com>
	<4E24AFF0.9060408@mentor.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311077841.30326.28.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 3/5] help2man-native: Add 1.36.4 (GPLv2) and 1.38.2 (GPLv3)
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
X-List-Received-Date: Tue, 19 Jul 2011 12:21:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-18 at 15:13 -0700, Tom Rini wrote:
> OK, here's a "why" on not changing:
> | configure.in:4: error: possibly undefined macro: AC_PROG_PERL
> |       If this token and others are legitimate, please use
> m4_pattern_allow.
> |       See the Autoconf documentation.
> | configure.in:7: error: possibly undefined macro: AC_PERL_MODULE
> 
> Which if we fix by building vs perlnative we then need autotools.bbclass
> to inherit perlnative to make life reliable which isn't what you want
> wrt perl-native in the build chain :)

How about fixing it by installing those two macros into ${S} before
running aclocal?  You could do that just as a patch, I guess.

p.




