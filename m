Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RsuGc-0005jJ-R6
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 11:51:50 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Rsu8z-0005JP-26
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 11:43:57 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 02 Feb 2012 10:43:56 +0000
In-Reply-To: <CAP9ODKqgPLHzPo6cNdx-9pijqW1wx2Pd5QejF-HaYax8F71Dqw@mail.gmail.com>
References: <cover.1328127940.git.otavio@ossystems.com.br>
	<429ddbe3779c6957e6ecad5ae37200865e19fa0f.1328127940.git.otavio@ossystems.com.br>
	<1328129842.2716.156.camel@x121e.pbcl.net>
	<CAP9ODKqgPLHzPo6cNdx-9pijqW1wx2Pd5QejF-HaYax8F71Dqw@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1328179437.29933.185.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 2/3] dhcp: move dhcp leases files handling to postinst/postrm
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
X-List-Received-Date: Thu, 02 Feb 2012 10:51:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-01 at 19:01 -0200, Otavio Salvador wrote:
> On Wed, Feb 1, 2012 at 18:57, Phil Blundell <philb@gnu.org> wrote:
>         On Wed, 2012-02-01 at 20:27 +0000, Otavio Salvador wrote:
>         >  pkg_postinst_dhcp-server() {
>         > +    install -d $D/${localstatedir}/lib/dhcp
>         
>         
>         Is "install" guaranteed to be available on the target?  I
>         would have
>         thought "mkdir -p" would be better.
> 
> 
> It worked on all images I tested. I have no strong opinions about it. 

I just checked a rootfs that I happened to have lying around and there
was indeed no "install" binary in there.  Admittedly I always build with
O_P_M=none so it isn't going to cause me any real problem, but
presumably there might be other folks who have O_P_M on and still lack
"install".  So I think it would be best to change this.

p.





