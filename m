Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RsyAa-0004Fy-SA for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 16:01:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q12Erte7007781
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Feb 2012 14:53:55 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06540-08 for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2012 14:53:51 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q12Erjk9007770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Feb 2012 14:53:46 GMT
Message-ID: <1328194429.13744.187.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 02 Feb 2012 14:53:49 +0000
In-Reply-To: <1328179437.29933.185.camel@phil-desktop>
References: <cover.1328127940.git.otavio@ossystems.com.br>
	<429ddbe3779c6957e6ecad5ae37200865e19fa0f.1328127940.git.otavio@ossystems.com.br>
	<1328129842.2716.156.camel@x121e.pbcl.net>
	<CAP9ODKqgPLHzPo6cNdx-9pijqW1wx2Pd5QejF-HaYax8F71Dqw@mail.gmail.com>
	<1328179437.29933.185.camel@phil-desktop>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Thu, 02 Feb 2012 15:01:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-02-02 at 10:43 +0000, Phil Blundell wrote:
> On Wed, 2012-02-01 at 19:01 -0200, Otavio Salvador wrote:
> > On Wed, Feb 1, 2012 at 18:57, Phil Blundell <philb@gnu.org> wrote:
> >         On Wed, 2012-02-01 at 20:27 +0000, Otavio Salvador wrote:
> >         >  pkg_postinst_dhcp-server() {
> >         > +    install -d $D/${localstatedir}/lib/dhcp
> >         
> >         
> >         Is "install" guaranteed to be available on the target?  I
> >         would have
> >         thought "mkdir -p" would be better.
> > 
> > 
> > It worked on all images I tested. I have no strong opinions about it. 
> 
> I just checked a rootfs that I happened to have lying around and there
> was indeed no "install" binary in there.  Admittedly I always build with
> O_P_M=none so it isn't going to cause me any real problem, but
> presumably there might be other folks who have O_P_M on and still lack
> "install".  So I think it would be best to change this.

Agreed, mkdir is much more likely to be available than install on most
target machines.

Cheers,

Richard



