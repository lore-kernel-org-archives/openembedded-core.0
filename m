Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Sz6SD-00032v-Rq
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 15:37:41 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Sz6Gq-0006Rw-VO
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 15:25:57 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 08 Aug 2012 14:25:56 +0100
In-Reply-To: <50226880.6050808@windriver.com>
References: <1344360704-23172-1-git-send-email-yao.zhao@windriver.com>
	<502152B8.6070100@gmail.com> <50215ED9.3070505@windriver.com>
	<1344364223.4874.16.camel@x121e.pbcl.net>
	<50216009.6020601@windriver.com>
	<1344364696.4874.19.camel@x121e.pbcl.net>
	<502161DC.9020705@windriver.com>
	<1344365134.4874.23.camel@x121e.pbcl.net>
	<50216C8B.20802@windriver.com>
	<1344374402.4874.32.camel@x121e.pbcl.net>
	<50226880.6050808@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1344432356.23275.247.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] cracklib, zlib: install to /lib instead of /usr/libxx
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
X-List-Received-Date: Wed, 08 Aug 2012 13:37:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-08 at 09:24 -0400, Yao Zhao wrote:
> I want both libz.a and libz.so* in /lib.
> 
> I wrote a simple test case:
> cat Makefile
> all:
>          gcc -c -fPIC -DPIC -o test.o test.c -g
>          gcc -o libtest.so -shared test.o
>          gcc -c -o test_main.o test_main.c -g
>          ar rc libtest.a test.o
>          mv libtest.a usr/lib
>          mv libtest.so lib
>          gcc -o test_main_static test_main.o -L./usr/lib -L./lib -ltest
>          gcc -o test_main_shared test_main.o -L./lib -L./usr/lib -ltest
> 
> If don't install to same directory then it will have problems.

That testcase isn't terribly representative since you have libtest.so
being the actual shared library.  In the zlib case, since it has a
proper SONAME, libz.so.1 and libz.so are distinct.

p.




