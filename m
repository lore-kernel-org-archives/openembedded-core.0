Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id A882578544
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 08:04:46 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id e98-v6so9571958itd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 01:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e8dKgXA92+gC0ZuWr7vdWvHWiEawV4tjdLx+eUGBO1g=;
	b=NyqkghtKiV6G2FngqJ02LzYX3tLUYzjBM3+AfgLQKfDlxU4IXk6UpiUsyi1w9tob0/
	cbrj7VTVzRogaZjyV3yF4gOJ2fZ+unK1WyTiZC1F93Vg+WZFeCFnXEa4c2+yh6Ig67VJ
	/uWCNASyOzJ+qZzTXsP6EVdyLxZmoUsl9scycicVHqV7MUOOmNtq7t56pKexT3DDIYl8
	Sxcv3IVDDtJmQRnsckLg4kfp/WVQJ4o1DafUkIqQleXXguGT96VZgbzf8QY6pbQITJYV
	EbDpP3Nn5YsW/8pUAPjwgBBk8iH3jLal7c33CJ+Xcof7iq0t+y1JkOyF/Elsq6RWfvz7
	VOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e8dKgXA92+gC0ZuWr7vdWvHWiEawV4tjdLx+eUGBO1g=;
	b=fRNxB+0Daf2lAi8dUk+3bDLkn5cdQWgNzHT7EdefQua0fd5qRPPHxRgYOpc7whthDA
	R9vd3jLPk49B21gQdR7mq0NLROZqAyb/I1E0MvehfJ0kSa51XoLf4biiC5IGNkMfXCRX
	beiYzuYOW2mlxKa8/03GeBFHAQuOKW8wCzqokjUaHmlfvlLzwvsUFZ83N6ag9tLVufaN
	CliAtNPbJgaeVxlDsD+LjLv/3VafKtvxfJYp4BubAWEJ/ZWcSwPR8VJVVQYTrYVW47TW
	hKxePGwCfjLswMz0ElhizX4q6TPScvUmm5NCgnZ21rIgx8aoqh7qywNgjcb26uQlkT6Z
	5yVQ==
X-Gm-Message-State: AElRT7Fob1KC7dwvMexeOAefQ1rppO5PSDHq7sVSw2lwXdy8XwF8Oso7
	Sup4Rfd941G8VwPPdaplTwcMNDi8Dgr/5VRmtMQ=
X-Google-Smtp-Source: AIpwx4/UQl5n9sTH1qELn42bqaq7F4ecgvjG78SLc7W1uZz1xFiWiUYM1jBATN0pwCAa4lzODzJdaLtey15FKcxDexM=
X-Received: by 2002:a24:3d4f:: with SMTP id
	n76-v6mr3435984itn.147.1522051487577; 
	Mon, 26 Mar 2018 01:04:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.176.144 with HTTP; Mon, 26 Mar 2018 01:04:27 -0700 (PDT)
In-Reply-To: <E152D784-A26D-42D8-B3E4-FCF83A9A4A67@contoso.com>
References: <E152D784-A26D-42D8-B3E4-FCF83A9A4A67@contoso.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Mon, 26 Mar 2018 10:04:27 +0200
Message-ID: <CAB2nKc9fmGbmNdx9gc4fDbrvdhW-Y-M+4sqye9X3U8JR1LisKQ@mail.gmail.com>
To: "Ryan Pabis (pabisr)" <pabisr@cisco.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: What is the recommended approach to upgrade Openssl?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Mar 2018 08:04:46 -0000
Content-Type: multipart/alternative; boundary="0000000000003f3bf605684c3a47"

--0000000000003f3bf605684c3a47
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I'd say if you start looking at CVE/security issues, I think best option is
to update the whole thing as any breach should be fixed.
As you are working on NXP product, updating Yocto version should be quite
straightforward, by replacing krogoth branch to rocko.
You can watch this presentation
https://www.youtube.com/watch?v=3DF5R8VXnfwYw  that
indroduces a particular workflow to ease version migrations.

Best regards,
Vincent

2018-03-23 20:53 GMT+01:00 Ryan Pabis (pabisr) <pabisr@cisco.com>:

> All,
>
>
>
> I=E2=80=99m working on a bundled package from NXP  that=E2=80=99s based o=
n Yocto Krogroth
> (so 2015 ish).  But now I need to update openssl from 1.0.2d to 1.0.2n to
> fix multiple CVE vulnerabilities.  However, this is proving to be quite
> difficult.  I=E2=80=99ve been able to upgrade curl, expat, python, etc. b=
y adding
> the new component to my layer and then updating the layer.conf file.  But
> it appears openssl is different.
>
>
>
> If I try the same approach with openssl the first thing that goes wrong i=
s
> the openssl_1.0.2n.bb file complains about the python function .filter
> not being supported as well as hostperl-runtime-native not being found.
> So, I fix those by reverting back to .contains and changing to
> perl-native-runtime.  That seems to solve the .bb problem.  However, then=
 I
> get an rpm error.   Which I fix by upgrading to 4.14.1. However, now I=E2=
=80=99m
> stuck with an =E2=80=98ar=E2=80=99 error that I can=E2=80=99t figure out.
>
>
>
> So, my question is A) Is this the right approach or should I be updating
> the entire openembedded layer (if so are there instructions anywhere on h=
ow
> to do that?) and B).  If my approach is ok what is causing the =E2=80=98a=
r=E2=80=99 error
> since this built previously with openssl 1.0.2d?
>
>
>
> Here is snippet of the error.
>
>
>
> | gcc  -I.. -I../.. -I../modes -I../asn1 -I../evp -I../../include  -fPIC
> -DOPENSSL_PIC -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H
> -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS -DL_ENDIAN    -DTERMIO
> -isystem/home/pabisr/inode/build/tmp/sysroots/x86_64-linux/usr/include
> -O2 -pipe -Wall -Wa,--noexecstack -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGEST=
S
> -fPIC -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5
> -DOPENSSL_BN_ASM_GF2m -DRC4_ASM -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM
> -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM -DWHIRLPOOL_ASM -DGHASH_ASM
> -DECP_NISTZ256_ASM -isystem/home/pabisr/inode/build/tmp/sysroots/x86_64-l=
inux/usr/include
> -c -o obj_xref.o obj_xref.c
>
> | ar ../../libcrypto.a o_names.o obj_dat.o obj_lib.o obj_err.o obj_xref.o
>
> | ar: invalid option -- '.'
>
> | Usage: ar [emulation options] [-]{dmpqrstx}[abcDfilMNoPsSTuvV]
> [--plugin <name>] [member-name] [count] archive-file file...
>
> |        ar -M [<mri-script]
>
> |  commands:
>
> |   d            - delete file(s) from the archive
>
> |   m[ab]        - move file(s) in the archive
>
> |   p            - print file(s) found in the archive
>
> |   q[f]         - quick append file(s) to the archive
>
> |   r[ab][f][u]  - replace existing or insert new file(s) into the archiv=
e
>
> |   s            - act as ranlib
>
> |   t            - display contents of archive
>
> |   x[o]         - extract file(s) from the archive
>
> |  command specific modifiers:
>
> |   [a]          - put file(s) after [member-name]
>
> |   [b]          - put file(s) before [member-name] (same as [i])
>
> |   [D]          - use zero for timestamps and uids/gids (default)
>
> |   [U]          - use actual timestamps and uids/gids
>
> |   [N]          - use instance [count] of name
>
> |   [f]          - truncate inserted file names
>
> |   [P]          - use full path names when matching
>
> |   [o]          - preserve original dates
>
> |   [u]          - only replace files that are newer than current archive
> contents
>
> |  generic modifiers:
>
> |   [c]          - do not warn if the library had to be created
>
> |   [s]          - create an archive index (cf. ranlib)
>
> |   [S]          - do not build a symbol table
>
> |   [T]          - make a thin archive
>
> |   [v]          - be verbose
>
> |   [V]          - display the version number
>
> |   @<file>      - read options from <file>
>
> |   --target=3DBFDNAME - specify the target object format as BFDNAME
>
> |  optional:
>
> |   --plugin <p> - load the specified plugin
>
> |  emulation options:
>
> |   No emulation specific options
>
> | ar: supported targets: elf64-x86-64 elf32-i386 elf32-iamcu elf32-x86-64
> a.out-i386-linux pei-i386 pei-x86-64 elf64-l1om elf64-k1om elf64-little
> elf64-big elf32-little elf32-big pe-x86-64 pe-bigobj-x86-64 pe-i386 plugi=
n
> srec symbolsrec verilog tekhex binary ihex
>
> | Makefile:37: recipe for target 'lib' failed
>
> | make[2]: *** [lib] Error 1
>
> | make[2]: Leaving directory '/home/pabisr/inode/build/tmp/
> work/x86_64-linux/openssl-native/1.0.2n-r0/openssl-1.0.2n/crypto/objects'
>
> | Makefile:88: recipe for target 'subdirs' failed
>
> | make[1]: *** [subdirs] Error 1
>
> | make[1]: Leaving directory '/home/pabisr/inode/build/tmp/
> work/x86_64-linux/openssl-native/1.0.2n-r0/openssl-1.0.2n/crypto'
>
> | Makefile:288: recipe for target 'build_crypto' failed
>
> | make: *** [build_crypto] Error 1
>
> | WARNING: exit code 1 from a shell command.
>
> | ERROR: oe_runmake failed
>
> | ERROR: Function failed: do_compile (log file is located at
> /home/pabisr/inode/build/tmp/work/x86_64-linux/openssl-
> native/1.0.2n-r0/temp/log.do_compile.102235)
>
> ERROR: Task 87 (virtual:native:/home/pabisr/inode/sources/meta-inode-eval=
/
> recipes-connectivity/openssl/openssl_1.0.2n.bb, do_compile) failed with
> exit code '1'
>
> NOTE: Tasks Summary: Attempted 240 tasks of which 231 didn't need to be
> rerun and 1 failed.
>
> Waiting for 0 running tasks to finish:
>
>
>
> Summary: 1 task failed:
>
>   virtual:native:/home/pabisr/inode/sources/meta-inode-eval/
> recipes-connectivity/openssl/openssl_1.0.2n.bb, do_compile
>
> Summary: There was 1 WARNING message shown.
>
> Summary: There were 2 ERROR messages shown, returning a non-zero exit cod=
e.
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--0000000000003f3bf605684c3a47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;d say if you start looking at=
 CVE/security issues, I think best option is to update the whole thing as a=
ny breach should be fixed.</div><div>As you are working on NXP product, upd=
ating Yocto version should be quite straightforward, by replacing krogoth b=
ranch to rocko.</div><div>You can watch this presentation <a href=3D"https:=
//www.youtube.com/watch?v=3DF5R8VXnfwYw">https://www.youtube.com/watch?v=3D=
F5R8VXnfwYw</a>=C2=A0=C2=A0that indroduces a particular workflow t<span sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">o ease version migrations.</span><br></div><div><br></div>=
<div>Best regards,</div><div>Vincent</div></div><div class=3D"gmail_extra">=
<br><div class=3D"gmail_quote">2018-03-23 20:53 GMT+01:00 Ryan Pabis (pabis=
r) <span dir=3D"ltr">&lt;<a href=3D"mailto:pabisr@cisco.com" target=3D"_bla=
nk">pabisr@cisco.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">







<div bgcolor=3D"white" lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"m_1366815990309656769WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">All,<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><u></u>=C2=A0<u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I=E2=80=99m working=
 on a bundled package from NXP=C2=A0 that=E2=80=99s based on Yocto Krogroth=
 (so 2015 ish).=C2=A0 But now I need to update openssl from 1.0.2d to 1.0.2=
n to fix multiple CVE vulnerabilities.=C2=A0 However, this is proving
 to be quite difficult.=C2=A0 I=E2=80=99ve been able to upgrade curl, expat=
, python, etc. by adding the new component to my layer and then updating th=
e layer.conf file.=C2=A0 But it appears openssl is different.<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><u></u>=C2=A0<u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">If I try the same a=
pproach with openssl the first thing that goes wrong is the <a href=3D"http=
://openssl_1.0.2n.bb" target=3D"_blank">openssl_1.0.2n.bb</a> file complain=
s about the python function .filter not being supported as well as hostperl=
-runtime-native not
 being found.=C2=A0 So, I fix those by reverting back to .contains and chan=
ging to perl-native-runtime.=C2=A0 That seems to solve the .bb problem.=C2=
=A0 However, then I get an rpm error. =C2=A0=C2=A0Which I fix by upgrading =
to 4.14.1. However, now I=E2=80=99m stuck with an =E2=80=98ar=E2=80=99 erro=
r that
 I can=E2=80=99t figure out.=C2=A0 <u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><u></u>=C2=A0<u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">So, my question is =
A) Is this the right approach or should I be updating the entire openembedd=
ed layer (if so are there instructions anywhere on how to do that?) and B).=
=C2=A0 If my approach is ok what is causing
 the =E2=80=98ar=E2=80=99 error since this built previously with openssl 1.=
0.2d?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><u></u>=C2=A0<u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Here is snippet of =
the error.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><u></u>=C2=A0<u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">| gcc=C2=A0 -I.. -I../.. -I../modes -I../asn1 -I../e=
vp -I../../include=C2=A0 -fPIC -DOPENSSL_PIC -DOPENSSL_THREADS -D_REENTRANT=
 -DDSO_DLFCN -DHAVE_DLFCN_H -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
 -DL_ENDIAN =C2=A0 =C2=A0-DTERMIO -isystem/home/pabisr/inode/<wbr>build/tmp=
/sysroots/x86_64-<wbr>linux/usr/include -O2 -pipe -Wall -Wa,--noexecstack -=
DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS -fPIC -DOPENSSL_IA32_SSE2 -DOPENSSL=
_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m
 -DRC4_ASM -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DMD5_ASM -DAES_ASM -DVPAES=
_ASM -DBSAES_ASM -DWHIRLPOOL_ASM -DGHASH_ASM -DECP_NISTZ256_ASM -isystem/ho=
me/pabisr/inode/<wbr>build/tmp/sysroots/x86_64-<wbr>linux/usr/include=C2=A0=
 -c -o obj_xref.o obj_xref.c<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif;color:red">| ar ../../libcrypto.a o_names.o obj_dat.o=
 obj_lib.o obj_err.o obj_xref.o<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">| ar: invalid option -- &#39;.&#39;<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">| Usage: ar [emulation options] [-]{dmpqrstx}[<wbr>a=
bcDfilMNoPsSTuvV] [--plugin &lt;name&gt;] [member-name] [count] archive-fil=
e file...<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ar -M [&=
lt;mri-script]<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0 commands:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 d=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - delete file(s) from the archive<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 m[ab]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 - move file(s) in the archive<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 p=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - print file(s) found in the archive<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 q[f]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 - quick append file(s) to the archive<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 r[ab][f][u]=C2=A0 - replace existing o=
r insert new file(s) into the archive<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 s =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- act as ranlib<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - display contents of archive<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 x[o]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 - extract file(s) from the archive<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0 command specific modifiers:<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 [a]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - put file(s) after [member-name]<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 [b]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - put file(s) before [member-name] (same as [i])<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 [D]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - use zero for timestamps and uids/gids (default)<u><=
/u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 [U]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - use actual timestamps and uids/gids<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 [N]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - use instance [count] of name<u></u><u></u></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 [f]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - truncate inserted file names<u></u><u></u></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 [P]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - use full path names when matching<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 [o]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - preserve original dates<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 [u]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - only replace files that are newer than current arch=
ive contents<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0 generic modifiers:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 [c]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - do not warn if the library had to be created<u></u>=
<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 [s]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - create an archive index (cf. ranlib)<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 [S]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - do not build a symbol table<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 [T]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - make a thin archive<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 [v]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - be verbose<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 [V]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - display the version number<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 @&lt;file&gt;=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - read options from &lt;file&gt;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 --target=3DBFDNAME - specify the targe=
t object format as BFDNAME<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0 optional:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 --plugin &lt;p&gt; - load the specifie=
d plugin<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0 emulation options:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">|=C2=A0=C2=A0 No emulation specific options<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">| ar: supported targets: elf64-x86-64 elf32-i386 elf=
32-iamcu elf32-x86-64 a.out-i386-linux pei-i386 pei-x86-64 elf64-l1om elf64=
-k1om elf64-little elf64-big elf32-little elf32-big
 pe-x86-64 pe-bigobj-x86-64 pe-i386 plugin srec symbolsrec verilog tekhex b=
inary ihex<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">| Makefile:37: recipe for target &#39;lib&#39; faile=
d<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">| make[2]: *** [lib] Error 1<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">| make[2]: Leaving directory &#39;/home/pabisr/inode=
/build/tmp/<wbr>work/x86_64-linux/openssl-<wbr>native/1.0.2n-r0/openssl-1.0=
.<wbr>2n/crypto/objects&#39;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">| Makefile:88: recipe for target &#39;subdirs&#39; f=
ailed<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">| make[1]: *** [subdirs] Error 1<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">| make[1]: Leaving directory &#39;/home/pabisr/inode=
/build/tmp/<wbr>work/x86_64-linux/openssl-<wbr>native/1.0.2n-r0/openssl-1.0=
.<wbr>2n/crypto&#39;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">| Makefile:288: recipe for target &#39;build_crypto&=
#39; failed<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">| make: *** [build_crypto] Error 1<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">| WARNING: exit code 1 from a shell command.<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">| ERROR: oe_runmake failed<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">| ERROR: Function failed: do_compile (log file is lo=
cated at /home/pabisr/inode/build/tmp/<wbr>work/x86_64-linux/openssl-<wbr>n=
ative/1.0.2n-r0/temp/log.do_<wbr>compile.102235)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">ERROR: Task 87 (virtual:native:/home/pabisr/<wbr>ino=
de/sources/meta-inode-eval/<wbr>recipes-connectivity/openssl/<a href=3D"htt=
p://openssl_1.0.2n.bb" target=3D"_blank">o<wbr>penssl_1.0.2n.bb</a>, do_com=
pile) failed with exit code &#39;1&#39;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">NOTE: Tasks Summary: Attempted 240 tasks of which 23=
1 didn&#39;t need to be rerun and 1 failed.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">Waiting for 0 running tasks to finish:<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">Summary: 1 task failed:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">=C2=A0 virtual:native:/home/pabisr/<wbr>inode/source=
s/meta-inode-eval/<wbr>recipes-connectivity/openssl/<a href=3D"http://opens=
sl_1.0.2n.bb" target=3D"_blank">o<wbr>penssl_1.0.2n.bb</a>, do_compile<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">Summary: There was 1 WARNING message shown.<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
urier New&quot;,serif">Summary: There were 2 ERROR messages shown, returnin=
g a non-zero exit code.<u></u><u></u></span></p>
</div>
</div>

<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--0000000000003f3bf605684c3a47--
