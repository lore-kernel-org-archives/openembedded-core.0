Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1REg2X-0005cc-GJ for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 13:35:01 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EBZuar010221 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 12:35:56 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WJRTN4h0fq2H
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 12:35:56 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EBZpO9010216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 12:35:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2011 12:29:08 +0100
In-Reply-To: <CAP9ODKp-CRpH0U7=k3inmg3gKqLFuHSUOA2JTc9+Jev+Op5p_Q@mail.gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
	<c30a13301850b76b1e7362b99322ffad72598612.1318505196.git.Martin.Jansa@gmail.com>
	<1318512243.23801.217.camel@ted> <20111013133221.GC28525@jama.jama.net>
	<1318514192.23801.229.camel@ted>
	<CAP9ODKp-CRpH0U7=k3inmg3gKqLFuHSUOA2JTc9+Jev+Op5p_Q@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318591756.23801.259.camel@ted>
Mime-Version: 1.0
Subject: Re: [oe-core 14/20] mesa-dri: introduce MACHINE_DRI_MODULES
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
X-List-Received-Date: Fri, 14 Oct 2011 11:35:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-13 at 11:32 -0300, Otavio Salvador wrote:
> On Thu, Oct 13, 2011 at 10:56, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> ...
> >> btw: in old recipes there was --with-dri-drivers with only one -, so maybe it
> >> wasn't actually working even for i915, i965 before or configure has benevolent syntax
> >
> > It defaults to enable all modules. We don't have libdrm-nouveau (or
> > llvm) so we had to change the config options to explicitly enable the
> > pieces I know are cared about on x86 in the latest version. This is why
> > the COMPATIBLE_HOST is there too since that recipe was always meaning to
> > compile these modules.
> ...
> 
> At least here it hadn't built i915 or i965 drivers.

I think there is a slight change in behaviour as the architectures it
would have built certain modules on used to get applied, now it doesn't
as we're passing a fixed list. We need to fix this but it shouldn't be
hard.

Cheers,

Richard






