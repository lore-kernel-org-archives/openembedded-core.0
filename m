Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RlbmB-0008Sb-S8
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 08:42:15 +0100
Received: by lami14 with SMTP id i14so108577lam.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 23:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=fBL71ZgD0iAmS0TVMwxoxg+l4Hzi4qk4rwRQm5ZG6JA=;
	b=cRw7mjzQfc3PunGZwsK5vcTL72lk2NaKQ+ViOBEjqRzbVUB7MLIqGDhU8ALsfRjvlF
	o134Te3aI8MdNn6oObn5j5xfweOnF2A6PW2i95FC1vP/k8fxo/4tP13uG6xX+vNv96Xo
	LJ5TtAY+OYLVlG7NonZYgy6FBQEnnQL9BywuY=
Received: by 10.152.131.202 with SMTP id oo10mr509387lab.40.1326440083279;
	Thu, 12 Jan 2012 23:34:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.115.1 with HTTP; Thu, 12 Jan 2012 23:34:12 -0800 (PST)
In-Reply-To: <60B477D225E93B419F9F82BF988B2449D99334@039-SN1MPN1-005.039d.mgd.msft.net>
References: <60B477D225E93B419F9F82BF988B2449D99334@039-SN1MPN1-005.039d.mgd.msft.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Jan 2012 23:34:12 -0800
Message-ID: <CAMKF1srCh6T1b=Lie=XrWRkArgDc9Pqx5fF+ZoQ7b1YDXrEFPg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Garg Vakul-B16394 <B16394@freescale.com>
Subject: Re: Valgrind : Unhanded instructions mfatbu and mfatbl
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
X-List-Received-Date: Fri, 13 Jan 2012 07:42:16 -0000
Content-Type: multipart/alternative; boundary=f46d042d05a0facd6304b663e54c

--f46d042d05a0facd6304b663e54c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2012 at 9:43 PM, Bansal Aneesh-B39320
<B39320@freescale.com>wrote:

>  Hello,****
>
> ** **
>
> PowerPC uses two alternate time base registers which are read from user
> space****
>
> by using PPC instructions mfatbu and mfatbl . However these instructions
> are****
>
> not supported by Valgrind.****
>
> CPU : e500mc****
>
> Here are the logs when an application executing such instruction is
> executed****
>
> with Valgrind 3.7.0:****
>
> ** **
>
> dis_proc_ctl(ppc)(mfspr,SPR)(0x20F)****
>
> disInstr(ppc): unhandled instruction: 0x7C0F82A6****
>
>                  primary 31(0x1F), secondary 678(0x2A6)****
>
> =3D=3D2204=3D=3D valgrind: Unrecognized instruction at address 0x10003dfc=
.****
>
> =3D=3D2204=3D=3D    at 0x10003DFC: ??? (in /usr/bin/simple_crypto)****
>
> =3D=3D2204=3D=3D    by 0x1000181B: ??? (in /usr/bin/simple_crypto)****
>
> =3D=3D2204=3D=3D    by 0xFE179E7: ??? (in /lib/libpthread-2.13.so)****
>
> =3D=3D2204=3D=3D    by 0x40EEA9B: ??? (in /lib/libc-2.13.so)****
>
> =3D=3D2204=3D=3D Your program just tried to execute an instruction that V=
algrind**
> **
>
> =3D=3D2204=3D=3D did not recognise.  There are two possible reasons for t=
his.****
>
> =3D=3D2204=3D=3D 1. Your program has a bug and erroneously jumped to a no=
n-code***
> *
>
> =3D=3D2204=3D=3D    location.  If you are running Memcheck and you just s=
aw a****
>
> =3D=3D2204=3D=3D    warning about a bad jump, it's probably your program'=
s fault.*
> ***
>
> =3D=3D2204=3D=3D 2. The instruction is legitimate but Valgrind doesn't ha=
ndle it,*
> ***
>
> =3D=3D2204=3D=3D    i.e. it's Valgrind's fault.  If you think this is the=
 case or*
> ***
>
> =3D=3D2204=3D=3D    you are not sure, please let us know and we'll try to=
 fix it.*
> ***
>
> =3D=3D2204=3D=3D Either way, Valgrind will now raise a SIGILL signal whic=
h will***
> *
>
> =3D=3D2204=3D=3D probably kill your program.****
>
> ** **
>
> ** **
>
> We have developed a patch to fix the issue and submitted the patch
> upstream to Valgrind community for processing.
>


how about you also submit the patch to oe-core as well
so we can use it until the upstream patch lands in a release
that we will use


> ****
>
> ** **
>
> ** **
>
> Regards,****
>
> *Aneesh Bansal*
>
> **
>
> Plot No. =E2=80=93 18 | Sector-16 A, Noida =E2=80=93 201301****
>
> Phone  : 0120395 x3320****
>
> ** **
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

--f46d042d05a0facd6304b663e54c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<font><font face=3D"courier new,monospace"><br></font></font><br><div class=
=3D"gmail_quote">On Thu, Jan 12, 2012 at 9:43 PM, Bansal Aneesh-B39320 <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:B39320@freescale.com">B39320@freescale.=
com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">





<div link=3D"blue" vlink=3D"purple" lang=3D"EN-US">
<div>
<p class=3D"MsoNormal">Hello,<u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"color:#1f497d"><u></u>=C2=A0<u></u></=
span></p>
<p class=3D"MsoNormal">PowerPC uses two alternate time base registers which=
 are read from user space<u></u><u></u></p>
<p class=3D"MsoNormal">by using PPC instructions mfatbu and mfatbl . Howeve=
r these instructions are<u></u><u></u></p>
<p class=3D"MsoNormal">not supported by Valgrind.<u></u><u></u></p>
<p class=3D"MsoNormal">CPU : e500mc<u></u><u></u></p>
<p class=3D"MsoNormal">Here are the logs when an application executing such=
 instruction is executed<u></u><u></u></p>
<p class=3D"MsoNormal">with Valgrind 3.7.0:<u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">dis_proc_ctl(ppc)(mfspr,SPR)(0x20F)<u></u><u></u></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">disInstr(ppc): unhandled instruction: 0x7C0F82A6<u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 primary 31(0x1F), secondary 678(0x2=
A6)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D valgrind: Unrecognized instruction at add=
ress 0x10003dfc.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D=C2=A0=C2=A0=C2=A0 at 0x10003DFC: ??? (in =
/usr/bin/simple_crypto)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D=C2=A0=C2=A0=C2=A0 by 0x1000181B: ??? (in =
/usr/bin/simple_crypto)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D=C2=A0=C2=A0=C2=A0 by 0xFE179E7: ??? (in /=
lib/<a href=3D"http://libpthread-2.13.so" target=3D"_blank">libpthread-2.13=
.so</a>)<u></u><u></u></span></p>


<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D=C2=A0=C2=A0=C2=A0 by 0x40EEA9B: ??? (in /=
lib/<a href=3D"http://libc-2.13.so" target=3D"_blank">libc-2.13.so</a>)<u><=
/u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D Your program just tried to execute an ins=
truction that Valgrind<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D did not recognise.=C2=A0 There are two po=
ssible reasons for this.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D 1. Your program has a bug and erroneously=
 jumped to a non-code<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D=C2=A0=C2=A0=C2=A0 location.=C2=A0 If you =
are running Memcheck and you just saw a<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D=C2=A0=C2=A0=C2=A0 warning about a bad jum=
p, it&#39;s probably your program&#39;s fault.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D 2. The instruction is legitimate but Valg=
rind doesn&#39;t handle it,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D=C2=A0=C2=A0=C2=A0 i.e. it&#39;s Valgrind&=
#39;s fault.=C2=A0 If you think this is the case or<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D=C2=A0=C2=A0=C2=A0 you are not sure, pleas=
e let us know and we&#39;ll try to fix it.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D Either way, Valgrind will now raise a SIG=
ILL signal which will<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">=3D=3D2204=3D=3D probably kill your program.<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal">We have developed a patch to fix the issue and submi=
tted<span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;">
</span>the patch upstream to Valgrind community for processing.</p></div></=
div></blockquote><div><br><br>how about you also submit the patch to oe-cor=
e as well<br>so we can use it until the upstream patch lands in a release<b=
r>

that we will use<br>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0pt 0pt 0pt 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div link=3D"blue" vlink=3D"purple" lang=3D"EN-US"><div><p class=
=3D"MsoNormal">

<span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;"><u></u=
><u></u></span></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt">Regards,<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><b>Aneesh Bansal<u></u><u></u></b></p>
<p class=3D"MsoNormal"><b><img src=3D"" height=3D"30" width=3D"97"><u></u><=
u></u></b></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt">Plot No. =E2=80=93 =
18 | Sector-16 A, Noida =E2=80=93 201301<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt">Phone=C2=A0 : 01203=
95 x3320<u></u><u></u></span></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>

<br>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
<br></blockquote></div><br>

--f46d042d05a0facd6304b663e54c--
