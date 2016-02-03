Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 52F3B77384
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 20:32:11 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id p63so182954335wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 12:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fEiSthEUdNr/XGvbAtigW7RM6WccQG/RfOYa+Sx1LwI=;
	b=RGELHYFYqayjQigsngsfn/Oi8Tj/gJuoH8KNcdIFJ46Fe1FeQX5/tj7TxXWXHmdDA1
	/k/xNNyrfHkVqbNhTAA9ARUW4DrIfk1nvcNYqw57qO+d++Sgkdj6gnU48tdI8kRwaxUX
	rvKskcW7c/smgJx710sMHvdgFHggU2epoIzJySQ6rqfwB/44SoWxFPCNr2zkMOBqW17s
	3PMfYWCoirmboe9QZKWB3UCISBXZMYgr0l02VjcOdvSuwjCnMOCh5+UJ6oViWPrLNPVA
	i5hAYsXNY9S8MEfmWdDfBfyBRMjR5ebEhkQ7QChfvw1Riaqn+OK804+w2uPfqbuoDEgw
	iLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=fEiSthEUdNr/XGvbAtigW7RM6WccQG/RfOYa+Sx1LwI=;
	b=BwpkFf6edi+kO/3XN/tYtHT7DSR/0lMxRJBAvHjnWn1dr6O836KrWrYWrBh4/r7z+N
	mZjJWRPVljLNd45gXHNdigGROceyWEHj6Ve8CnNDZNeT8OhfUoXdP5gH/JugPq0kttMr
	equ4+nLOZ5Tbx4acYvfNz6Tq+Vz784Q7URwcXYc3rhWFpBZsGL56eVKLbn9v5I3Eugr9
	frIjCDa0ljI3OGCXuTi/LQlkARlAtWddYg5Qs2es0uACxOUru3KblINjiAgSBt3GE1sH
	NmEhXJTR3nF3PiYSegvx5X0ro3bt8qRQLJBVX7/bFBV7IH76HqF8N3qcQKLo3e8WlVUx
	uSFA==
X-Gm-Message-State: AG10YORvXcuXjvMFPY/ZANF2vuifSVgqnRB2glzBCQJb+2EpJgKzgwPGCQQcZU7oztLLcaTm+VEVNd04ZB0xoQ==
MIME-Version: 1.0
X-Received: by 10.194.250.39 with SMTP id yz7mr4408086wjc.92.1454531532356;
	Wed, 03 Feb 2016 12:32:12 -0800 (PST)
Received: by 10.194.67.168 with HTTP; Wed, 3 Feb 2016 12:32:12 -0800 (PST)
In-Reply-To: <56E071BC-9E02-44DD-8236-9697A647F8F7@gmail.com>
References: <56B25500.7030402@gmail.com>
	<34309FCD-61ED-4DC8-BD3C-219DE8924BDA@gmail.com>
	<1478930.Uaq5cohNMu@peggleto-mobl.ger.corp.intel.com>
	<56E071BC-9E02-44DD-8236-9697A647F8F7@gmail.com>
Date: Wed, 3 Feb 2016 21:32:12 +0100
Message-ID: <CA+chaQd2Cdzpo0_LP2mJUoYe8UtwmOK3DCpE-yXk_s80t41QSA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: binutils upgrade to 2.26 failure - unsupported reloc 42 against global symbol __gmon_start__
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
X-List-Received-Date: Wed, 03 Feb 2016 20:32:12 -0000
Content-Type: multipart/alternative; boundary=001a11c29d824d1b57052ae38361

--001a11c29d824d1b57052ae38361
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This could be caused by chromium using own bundled binutils where the
version doesn't match, I've solved it in our recipe by:
+GYP_DEFINES_append =3D " linux_use_bundled_gold=3D0"
+GYP_DEFINES_append =3D " linux_use_bundled_binutils=3D0"


In my cases it was failing while building native libvpx (also bundled in
chromium sources) when I've upgraded host binutils to
(GNU gold (GNU Binutils for Ubuntu 2.25.90.20160101) 1.11) included in
Ubuntu-16.04 Alpha


On Wed, Feb 3, 2016 at 9:21 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Feb 3, 2016, at 12:09 PM, Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
> >
> > On Wed, 03 Feb 2016 11:56:45 Khem Raj wrote:
> >>> On Feb 3, 2016, at 11:29 AM, Trevor Woerner <twoerner@gmail.com>
> wrote:
> >>>
> >>> My chromium build is now failing due to:
> >>>   commit 86ade2cc2553c942d9526c5323a11ae151653505
> >>>
> >>>       binutils: Upgrade to 2.26
> >>> |
> >>> | FAILED: x86_64-oe-linux-gcc  -m64 -march=3Dcorei7 -mtune=3Dcorei7
> >>> | -mfpmath=3Dsse -msse4.2
> >>> | --sysroot=3D/z/chromium-49/build/tmp-glibc/sysroots/intel-corei7-64
> >>> | -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,now -Wl,-z,re=
lro
> >>> | -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC
> >>> |
> -B/z/chromium-49/build/tmp-glibc/work/corei7-64-oe-linux/chromium/49.0.
> >>> |
> 2612.0-r0/chromium-49.0.2612.0/third_party/binutils/Linux_x64/Release/bi
> >>> | n -Wl,--disable-new-dtags -m64 -Wl,-O1 -Wl,--as-needed
> -Wl,--gc-sections
> >>> | -o chrome_sandbox -Wl,--start-group
> >>> | obj/sandbox/linux/suid/chrome_sandbox.process_util_linux.o
> >>> | obj/sandbox/linux/suid/chrome_sandbox.sandbox.o -Wl,--end-group
> >>> |
> /z/chromium-49/build/tmp-glibc/work/corei7-64-oe-linux/chromium/49.0.26
> >>> |
> 12.0-r0/chromium-49.0.2612.0/third_party/binutils/Linux_x64/Release/bin/
> >>> | ld: error:
> >>> |
> /z/chromium-49/build/tmp-glibc/sysroots/intel-corei7-64/usr/lib/../lib/
> >>> | crti.o: unsupported reloc 42 against global symbol __gmon_start__
> >>> | ../sysdeps/x86_64/crti.S:66: error: unsupported reloc 42
> >>>
> >>> Any suggestions on how to approach this?
> >>
> >> do a clean build. Its mixing objects
> >
> > Should we have bumped PR somewhere to avoid this?
>
> Don=E2=80=99t think so. this could happen due to new relocs appearing in =
glibc due
> to the fact
> thats its now compiled with newer binutils but we are still using old
> linker
> to link the app which does not understand these relocations. Why would
> that happen
> don=E2=80=99t know.
>
> >
> > Cheers,
> > Paul
> >
> > --
> >
> > Paul Eggleton
> > Intel Open Source Technology Centre
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a11c29d824d1b57052ae38361
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This could be caused by chromium using own bundled binutil=
s where the version doesn&#39;t match, I&#39;ve solved it in our recipe by:=
<div><div>+GYP_DEFINES_append =3D &quot; linux_use_bundled_gold=3D0&quot;</=
div><div>+GYP_DEFINES_append =3D &quot; linux_use_bundled_binutils=3D0&quot=
;</div></div><div><br></div><div><br></div><div>In my cases it was failing =
while building=C2=A0native libvpx (also bundled in chromium sources) when I=
&#39;ve upgraded host binutils to</div><div>(GNU gold (GNU Binutils for Ubu=
ntu 2.25.90.20160101) 1.11) included in Ubuntu-16.04 Alpha<br></div><div><b=
r></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On =
Wed, Feb 3, 2016 at 9:21 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=
=3D"h5"><br>
&gt; On Feb 3, 2016, at 12:09 PM, Paul Eggleton &lt;<a href=3D"mailto:paul.=
eggleton@linux.intel.com">paul.eggleton@linux.intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, 03 Feb 2016 11:56:45 Khem Raj wrote:<br>
&gt;&gt;&gt; On Feb 3, 2016, at 11:29 AM, Trevor Woerner &lt;<a href=3D"mai=
lto:twoerner@gmail.com">twoerner@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; My chromium build is now failing due to:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0commit 86ade2cc2553c942d9526c5323a11ae151653505<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0binutils: Upgrade to 2.26<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt; | FAILED: x86_64-oe-linux-gcc=C2=A0 -m64 -march=3Dcorei7 -mtun=
e=3Dcorei7<br>
&gt;&gt;&gt; | -mfpmath=3Dsse -msse4.2<br>
&gt;&gt;&gt; | --sysroot=3D/z/chromium-49/build/tmp-glibc/sysroots/intel-co=
rei7-64<br>
&gt;&gt;&gt; | -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,now -W=
l,-z,relro<br>
&gt;&gt;&gt; | -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC<br>
&gt;&gt;&gt; | -B/z/chromium-49/build/tmp-glibc/work/corei7-64-oe-linux/chr=
omium/49.0.<br>
&gt;&gt;&gt; | 2612.0-r0/chromium-49.0.2612.0/third_party/binutils/Linux_x6=
4/Release/bi<br>
&gt;&gt;&gt; | n -Wl,--disable-new-dtags -m64 -Wl,-O1 -Wl,--as-needed -Wl,-=
-gc-sections<br>
&gt;&gt;&gt; | -o chrome_sandbox -Wl,--start-group<br>
&gt;&gt;&gt; | obj/sandbox/linux/suid/chrome_sandbox.process_util_linux.o<b=
r>
&gt;&gt;&gt; | obj/sandbox/linux/suid/chrome_sandbox.sandbox.o -Wl,--end-gr=
oup<br>
&gt;&gt;&gt; | /z/chromium-49/build/tmp-glibc/work/corei7-64-oe-linux/chrom=
ium/49.0.26<br>
&gt;&gt;&gt; | 12.0-r0/chromium-49.0.2612.0/third_party/binutils/Linux_x64/=
Release/bin/<br>
&gt;&gt;&gt; | ld: error:<br>
&gt;&gt;&gt; | /z/chromium-49/build/tmp-glibc/sysroots/intel-corei7-64/usr/=
lib/../lib/<br>
&gt;&gt;&gt; | crti.o: unsupported reloc 42 against global symbol __gmon_st=
art__<br>
&gt;&gt;&gt; | ../sysdeps/x86_64/crti.S:66: error: unsupported reloc 42<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Any suggestions on how to approach this?<br>
&gt;&gt;<br>
&gt;&gt; do a clean build. Its mixing objects<br>
&gt;<br>
&gt; Should we have bumped PR somewhere to avoid this?<br>
<br>
</div></div>Don=E2=80=99t think so. this could happen due to new relocs app=
earing in glibc due to the fact<br>
thats its now compiled with newer binutils but we are still using old linke=
r<br>
to link the app which does not understand these relocations. Why would that=
 happen<br>
don=E2=80=99t know.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Cheers,<br>
&gt; Paul<br>
&gt;<br>
&gt; --<br>
&gt;<br>
&gt; Paul Eggleton<br>
&gt; Intel Open Source Technology Centre<br>
<br>
</div></div><br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></blockquote></div><br></div>

--001a11c29d824d1b57052ae38361--
