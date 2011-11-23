Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <swaplinker@gmail.com>) id 1RTG3j-0007Sj-WB
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 17:52:32 +0100
Received: by vcbfo11 with SMTP id fo11so1597653vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 08:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=z1UL7UdxWUxNKfulX/Ru7NY6Y5FMXaxE363g1vUJGus=;
	b=tkZeZFYXBwAtJ1bFBlMLQLY0A8Bg4uE5p53Mtp0NDFn0wTZ0D4Wa8Eac1GZSkJ15Lq
	XR5PbFlnLvmHc1pyUY3mc6P2VGgI1bieWtK0EvBeNxEajdmvHGg+6Y721H59rbdgUe7D
	CBjBh/A68BGqe2Cm0ZEzzm4K4Qy5IGVAFIiN4=
Received: by 10.52.77.69 with SMTP id q5mr27854864vdw.11.1322066380065; Wed,
	23 Nov 2011 08:39:40 -0800 (PST)
MIME-Version: 1.0
Sender: swaplinker@gmail.com
Received: by 10.52.20.113 with HTTP; Wed, 23 Nov 2011 08:39:19 -0800 (PST)
In-Reply-To: <689a6fbace429988bf14f144e9a93dc828a7e7bf.1321391467.git.julian.pidancet@gmail.com>
References: <689a6fbace429988bf14f144e9a93dc828a7e7bf.1321391467.git.julian.pidancet@gmail.com>
From: Julian Pidancet <julian.pidancet@gmail.com>
Date: Wed, 23 Nov 2011 16:39:19 +0000
X-Google-Sender-Auth: czvQrmLr2PhHqUFdXwTlgxaa6xo
Message-ID: <CAKZ=5EXYgDQTO9UQxcEOxxM0LCii2b59097J8k20=u-DgDiFuw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: B29882@freescale.com, Julian Pidancet <julian.pidancet@gmail.com>
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
X-List-Received-Date: Wed, 23 Nov 2011 16:52:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 16, 2011 at 1:01 AM, Julian Pidancet
<julian.pidancet@gmail.com> wrote:
> This patch introduces a distro feature which enables gcc to produce
> both 32bit and 64bit code, and enables binutils to operate on both
> 32bit and 64bit binaries. It differs from multilib toolchains in
> that it does not require to compile a version of the libc for each
> architecture variant. However, the code produced for the secondary
> architecture will not be linkable against the libc.
>
> v2: - Renamed the feature name from "biarch" to "multiarch". The GCC
> installation manual claims that the mips-linux can be made a tri-arch
> compiler (http://gcc.gnu.org/install/configure.html)
> =C2=A0 =C2=A0- For x86_64, the compiler is made bi-arch by default, so no=
thing
> has to be done in particular.
> =C2=A0 =C2=A0- I analyzed the gcc/config.gcc from GCC sources and added i=
n this
> patch all the architectures that could be made biarch with the version
> of gcc currently used in OE, which are powerpc, and sparc, in addition
> to x86. mips and s390 will probably be supported in future versions of
> gcc. For x86 and sparc, only the --enable-targets=3Dall option is valid
> to make this work (this option doesn't have any other side effects than
> making the compiler bi-arch). For powerpc, I used the
> --enable-targets=3Dpowerpc64 option (although 'all' also works).
>
> Note: - Untested on powerpc and sparc. But I believe it works the same
> as with x86.
> =C2=A0 =C2=A0 =C2=A0- gcc in meta-toolchain is also made multiarch.
>

Anybody got the time to review this ?


