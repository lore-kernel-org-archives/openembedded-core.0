Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QjWNF-0000rS-MG
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 14:59:37 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QjWJJ-0003Av-LV
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 14:55:33 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jul 2011 13:55:32 +0100
In-Reply-To: <202EE89F-DBDC-444E-B95F-01DD7DC36201@kernel.crashing.org>
References: <611DBEB9-A901-4A01-AEB0-EAC2724FBED1@kernel.crashing.org>
	<1311165818.30326.67.camel@phil-desktop>
	<202EE89F-DBDC-444E-B95F-01DD7DC36201@kernel.crashing.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311166533.30326.69.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: lzo build failure
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
X-List-Received-Date: Wed, 20 Jul 2011 12:59:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-20 at 07:51 -0500, Kumar Gala wrote:
> On Jul 20, 2011, at 7:43 AM, Phil Blundell wrote:
> 
> > On Wed, 2011-07-20 at 07:31 -0500, Kumar Gala wrote:
> >> configure: 
> >> configure: Your compiler failed the ACC conformance test - for details see 
> >> configure: `config.log'. Please check that log file and consider sending
> >> configure: a patch or bug-report to <markus@oberhumer.com>.
> >> configure: Thanks for your support.
> >> configure: 
> >> configure: error: ACC conformance test failed. Stop.
> > 
> > Did you check config.log as it suggests?  If yes, what did you find
> > there?

> Here's what config.log looks like:
> 
> http://pastebin.com/y9KzkQ5M
> 
> Can't see anything obvious in there.

Well, if you search for "ACC conformance test" in that pastebin, you
will see:

configure:13578: checking whether your compiler passes the ACC
conformance test
configure:13623: ccache powerpc64-poky-linux-gcc -mcpu=e5500 -m64
--sysroot=/local/home/galak/git/poky64/build-p5020/tmp/sysroots/p5020-ds
-c -O2 -pipe -g -feliminate-unused-debug-types -I.  conftest.c >&5
In file included from conftest.c:118:0:
src/miniacc.h:4348:16: error: size of array '__acc_cta' is negative
[...]
configure:13631: result: FAILED

So I think you need to inspect that part of the code and figure out what
exactly it's upset about.

p.




