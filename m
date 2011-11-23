Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <swaplinker@gmail.com>) id 1RTGjI-0001Iy-9j
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 18:35:28 +0100
Received: by vbbfc21 with SMTP id fc21so344019vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 09:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=RbLPWej6Y1ra5fHznRJOryo7+WiSImIlZxVKOBLM4nI=;
	b=jwVbTc2tDIlNjq06J1PJSE5SpF0pzu+iK3esrgFSAMxhDMfTjfba7nueWuacMrqMoA
	ufw3NUoaX8l3LAtRXFJgbbhrkIG4DHaRBoGgn+QTWFdr2G7DYrlxEr0+ktyH4o5EKMCV
	t6GvA+9c93eJJV4OU/6EY+NFKihE38qeAGntk=
Received: by 10.52.92.42 with SMTP id cj10mr27751254vdb.62.1322069335076; Wed,
	23 Nov 2011 09:28:55 -0800 (PST)
MIME-Version: 1.0
Sender: swaplinker@gmail.com
Received: by 10.52.20.113 with HTTP; Wed, 23 Nov 2011 09:28:34 -0800 (PST)
In-Reply-To: <1322066874.15626.1.camel@ted>
References: <689a6fbace429988bf14f144e9a93dc828a7e7bf.1321391467.git.julian.pidancet@gmail.com>
	<CAKZ=5EXYgDQTO9UQxcEOxxM0LCii2b59097J8k20=u-DgDiFuw@mail.gmail.com>
	<1322066874.15626.1.camel@ted>
From: Julian Pidancet <julian.pidancet@gmail.com>
Date: Wed, 23 Nov 2011 17:28:34 +0000
X-Google-Sender-Auth: CcaPv38hIGiandVgu2oxPyh7pQQ
Message-ID: <CAKZ=5EU+4mg0Dq47Pm73A7rvoA7SeX4NxMCSxpdxdEL6KjT0mg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 23 Nov 2011 17:35:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2011 at 4:47 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-11-23 at 16:39 +0000, Julian Pidancet wrote:
>> On Wed, Nov 16, 2011 at 1:01 AM, Julian Pidancet
>> <julian.pidancet@gmail.com> wrote:
>> > This patch introduces a distro feature which enables gcc to produce
>> > both 32bit and 64bit code, and enables binutils to operate on both
>> > 32bit and 64bit binaries. It differs from multilib toolchains in
>> > that it does not require to compile a version of the libc for each
>> > architecture variant. However, the code produced for the secondary
>> > architecture will not be linkable against the libc.
>> >
>> > v2: - Renamed the feature name from "biarch" to "multiarch". The GCC
>> > installation manual claims that the mips-linux can be made a tri-arch
>> > compiler (http://gcc.gnu.org/install/configure.html)
>> > =C2=A0 =C2=A0- For x86_64, the compiler is made bi-arch by default, so=
 nothing
>> > has to be done in particular.
>> > =C2=A0 =C2=A0- I analyzed the gcc/config.gcc from GCC sources and adde=
d in this
>> > patch all the architectures that could be made biarch with the version
>> > of gcc currently used in OE, which are powerpc, and sparc, in addition
>> > to x86. mips and s390 will probably be supported in future versions of
>> > gcc. For x86 and sparc, only the --enable-targets=3Dall option is vali=
d
>> > to make this work (this option doesn't have any other side effects tha=
n
>> > making the compiler bi-arch). For powerpc, I used the
>> > --enable-targets=3Dpowerpc64 option (although 'all' also works).
>> >
>> > Note: - Untested on powerpc and sparc. But I believe it works the same
>> > as with x86.
>> > =C2=A0 =C2=A0 =C2=A0- gcc in meta-toolchain is also made multiarch.
>> >
>>
>> Anybody got the time to review this ?
>
> Funnily enough I was just talking with Saul about this. We're going to
> try and expose this to some extended testing (which we try and do for
> all compiler changes).
>

That's good news. In the mean-time, if there is any additional testing
you'd like me to perform, feel free to ask.

--=20
Julian


