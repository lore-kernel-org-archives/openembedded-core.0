Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ti8zX-0006QV-EJ
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 20:26:16 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so9125453ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2012 11:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vgaZE1UscEkDGoZ5WjNiS8kNoMztdlnkZi3gGBfGov0=;
	b=z14RFsWIp5cAQXEMUFH8FTvlih1JyN2/GvTIwaXB//gbq8JVe1O+/p0ZbXQoCx7xh3
	8S5NkIPMHoI7wEsIjGeMxFPKcM7RQO6X7Cxug7MdV89EdQls8TqmO+QVZC5V8yEiseye
	lTSXp4DVi/BdT4DDbNeUAs6t+YEnisRGwYXJW+rvC6GeQ3/N4wQVVCocfdXtEF+vWV5p
	z9H4R+TEE+n7aUKz+WDbEo26EHgYrwOX3KhasIoOeKX9B+ACg+Kp7pLwcyiCcZcVpI/3
	GjXfwXRan3VutYI2xB8CBF4PrN2C9CPbnS/yDfRlcUZr9TZ2hn5BVoRGwwBNgFjwCtid
	EL3w==
Received: by 10.42.68.203 with SMTP id y11mr12134479ici.26.1355166703843; Mon,
	10 Dec 2012 11:11:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Mon, 10 Dec 2012 11:11:13 -0800 (PST)
In-Reply-To: <lywqwqktzq.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lywqwqktzq.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Dec 2012 11:11:13 -0800
Message-ID: <CAMKF1srtjRfc37DsMWDFgPs4WWVh_Tt7c6hRZ3HKYmAP=rmC6g@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: binutils: regression on kernel builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Dec 2012 19:26:16 -0000
Content-Type: multipart/alternative; boundary=20cf30334b5ffe779304d08455a4

--20cf30334b5ffe779304d08455a4
Content-Type: text/plain; charset=UTF-8

yes gold is showing some regressions see another one here
http://sourceware.org/bugzilla/show_bug.cgi?id=14592
cant promise but will take a look. meanwhile if you can triage
it would be nice.


On Mon, Dec 10, 2012 at 3:48 AM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> Hi,
>
> with recent binutils, kernel build fails with
>
> | arm-linux-gnueabi-ld: error: arch/arm/boot/compressed/piggy.gzip.o:
> unknown CPU architecture
>
> I am able to reproduce it with
>
> $ > /tmp/x.s
> $ arm-linux-gnueabi-as  -march=armv7-a -march=all -o x0.o /tmp/x.s
> $ arm-linux-gnueabi-as  -march=armv7-a  -o x1.o /tmp/x.s
> $ arm-linux-gnueabi-ld.gold x0.o x1.o
> arm-linux-gnueabi-ld: error: x1.o: unknown CPU architecture
> $ arm-linux-gnueabi-ld.bfd x0.o x1.o
> arm-linux-gnueabi-ld.bfd: warning: cannot find entry symbol _start;
> defaulting to 0000000000008034
>
>
> (kernel sets '-Wa,-march=all' when building piggy.gzip.o)
>
>
> This works fine with binutils 2.22 and when using the BFD linker.
>
>
>
> Enrico
>

--20cf30334b5ffe779304d08455a4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<font><font face=3D"courier new,monospace">yes gold is showing some regr<fo=
nt>essions see another one here<br><font><a href=3D"http://sourceware.org/b=
ugzilla/show_bug.cgi?id=3D14592">http://sourceware.org/bugzilla/show_bug.cg=
i?id=3D14592</a><br>

<font><font>cant promi<font>se but <font>will take a look. meanwhile if you=
 can triage<br><font>it would be nice.</font><br></font></font></font></fon=
t></font></font></font></font><div class=3D"gmail_extra"><br><br><div class=
=3D"gmail_quote">

On Mon, Dec 10, 2012 at 3:48 AM, Enrico Scholz <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:enrico.scholz@sigma-chemnitz.de" target=3D"_blank">enrico.schol=
z@sigma-chemnitz.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>

Hi,<br>
<br>
with recent binutils, kernel build fails with<br>
<br>
| arm-linux-gnueabi-ld: error: arch/arm/boot/compressed/piggy.gzip.o: unkno=
wn CPU architecture<br>
<br>
I am able to reproduce it with<br>
<br>
$ &gt; /tmp/x.s<br>
$ arm-linux-gnueabi-as =C2=A0-march=3Darmv7-a -march=3Dall -o x0.o /tmp/x.s=
<br>
$ arm-linux-gnueabi-as =C2=A0-march=3Darmv7-a =C2=A0-o x1.o /tmp/x.s<br>
$ arm-linux-gnueabi-ld.gold x0.o x1.o<br>
arm-linux-gnueabi-ld: error: x1.o: unknown CPU architecture<br>
$ arm-linux-gnueabi-ld.bfd x0.o x1.o<br>
arm-linux-gnueabi-ld.bfd: warning: cannot find entry symbol _start; default=
ing to 0000000000008034<br>
<br>
<br>
(kernel sets &#39;-Wa,-march=3Dall&#39; when building piggy.gzip.o)<br>
<br>
<br>
This works fine with binutils 2.22 and when using the BFD linker.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
<br>
Enrico<br>
</font></span></blockquote></div><br></div>

--20cf30334b5ffe779304d08455a4--
