Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTG5c-0007Wi-Bt for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 17:54:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pANGlsW9014546;
	Wed, 23 Nov 2011 16:47:54 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13595-10; Wed, 23 Nov 2011 16:47:50 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pANGlmgJ014540
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 23 Nov 2011 16:47:49 GMT
Message-ID: <1322066874.15626.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Julian Pidancet <julian.pidancet@gmail.com>
Date: Wed, 23 Nov 2011 16:47:54 +0000
In-Reply-To: <CAKZ=5EXYgDQTO9UQxcEOxxM0LCii2b59097J8k20=u-DgDiFuw@mail.gmail.com>
References: <689a6fbace429988bf14f144e9a93dc828a7e7bf.1321391467.git.julian.pidancet@gmail.com>
	<CAKZ=5EXYgDQTO9UQxcEOxxM0LCii2b59097J8k20=u-DgDiFuw@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: B29882@freescale.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] Introduce multiarch DISTRO_FEATURE
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
X-List-Received-Date: Wed, 23 Nov 2011 16:54:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-23 at 16:39 +0000, Julian Pidancet wrote:
> On Wed, Nov 16, 2011 at 1:01 AM, Julian Pidancet
> <julian.pidancet@gmail.com> wrote:
> > This patch introduces a distro feature which enables gcc to produce
> > both 32bit and 64bit code, and enables binutils to operate on both
> > 32bit and 64bit binaries. It differs from multilib toolchains in
> > that it does not require to compile a version of the libc for each
> > architecture variant. However, the code produced for the secondary
> > architecture will not be linkable against the libc.
> >
> > v2: - Renamed the feature name from "biarch" to "multiarch". The GCC
> > installation manual claims that the mips-linux can be made a tri-arch
> > compiler (http://gcc.gnu.org/install/configure.html)
> >    - For x86_64, the compiler is made bi-arch by default, so nothing
> > has to be done in particular.
> >    - I analyzed the gcc/config.gcc from GCC sources and added in this
> > patch all the architectures that could be made biarch with the version
> > of gcc currently used in OE, which are powerpc, and sparc, in addition
> > to x86. mips and s390 will probably be supported in future versions of
> > gcc. For x86 and sparc, only the --enable-targets=all option is valid
> > to make this work (this option doesn't have any other side effects than
> > making the compiler bi-arch). For powerpc, I used the
> > --enable-targets=powerpc64 option (although 'all' also works).
> >
> > Note: - Untested on powerpc and sparc. But I believe it works the same
> > as with x86.
> >      - gcc in meta-toolchain is also made multiarch.
> >
> 
> Anybody got the time to review this ?

Funnily enough I was just talking with Saul about this. We're going to
try and expose this to some extended testing (which we try and do for
all compiler changes).

Cheers,

Richard



