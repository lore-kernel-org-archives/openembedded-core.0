Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RiT2M-0002nH-OY for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 16:45:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04FcWl2020329;
	Wed, 4 Jan 2012 15:38:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19653-07; Wed,  4 Jan 2012 15:38:28 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04FcLV3020323
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 4 Jan 2012 15:38:23 GMT
Message-ID: <1325691502.20759.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 15:38:22 +0000
In-Reply-To: <CAEsOVNdBy7uAtJnMmOBLMobXg=XHfpsrgTvmDOz9=pszh7hHLg@mail.gmail.com>
References: <1325055308-17731-1-git-send-email-b19537@freescale.com>
	<8285067.9cfZeAKmYZ@helios>
	<1325103622.3089.8.camel@lenovo.internal.reciva.com>
	<CA452391058F6D4E9715FB2C29D9312A010BD995@039-SN2MPN1-023.039d.mgd.msft.net>
	<1325591055.24417.330.camel@phil-desktop>
	<065BBB7616BCE543832A2EF096986B94018AA0@039-SN2MPN1-011.039d.mgd.msft.net>
	<CAEsOVNe0j=Kq+irY3wnP46pbDywRtM1g-8jNnfsHRZXWuU0avA@mail.gmail.com>
	<065BBB7616BCE543832A2EF096986B94018AC3@039-SN2MPN1-011.039d.mgd.msft.net>
	<CAEsOVNeQ2zrS8dviqJ0TLfkwKdiEHPs_pZ=6KXvJcJ1h9ur2qw@mail.gmail.com>
	<065BBB7616BCE543832A2EF096986B94018ADB@039-SN2MPN1-011.039d.mgd.msft.net>
	<CAEsOVNdBy7uAtJnMmOBLMobXg=XHfpsrgTvmDOz9=pszh7hHLg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Phil Blundell <philb@gnu.org>, Garg Vakul-B16394 <B16394@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: [PATCH oe-core] valgrind: add powerpc to the compatible host and add eglibc-dbg in rdepends
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
X-List-Received-Date: Wed, 04 Jan 2012 15:45:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-04 at 04:39 +0000, McClintock Matthew-B29882 wrote:
> On Tue, Jan 3, 2012 at 10:31 PM, Garg Vakul-B16394 <B16394@freescale.com> wrote:
> > Hi Matthew
> >
> > I am not sure if I understood your point fully.
> >
> > I am suggesting to do below mentioned as suggested on valgrind page.
> > http://valgrind.org/docs/manual/dist.readme-packagers.html
> >
> >
> > "If you don't want to leave symbols on ld.so, alternatively you can
> have your distro install ld.so's debuginfo package by default, or make
> ld.so.debuginfo be a requirement of your Valgrind RPM/DEB/whatever."
> 
> This is what I am suggest. If we include valgrind in an image and the
> arch is powerpc or powerpc64, we need to include ld.so with debug
> symbols by default. Otherwise valgrind will not work at all. This
> seems like a reasonable thing to do for these two arches.

I think the RRECOMMENDS on ppc only is therefore the right solution for
now. 

There is perhaps a case here for splitting out the ld.so -dbg from the
rest of libc so the installation requirements aren't so large.

Cheers,

Richard



