Received: from mail-pa0-f45.google.com ([209.85.220.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1TtJwd-00025u-46
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 16:21:27 +0100
Received: by mail-pa0-f45.google.com with SMTP id bg2so404966pad.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 07:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ahcUT3/JWzdoi7bL4LyMWmaQj9LeSZvdurnB0FBVN7s=;
	b=VPRaXtaMhMAxCgaZ4W8yfi60dhdoEwklhP2RGIrFCbsDXeqSESin/YzrIj9BkNtZTZ
	4uF0jp2UbXd76psCR6i6UrABct0JoYL48mRznfqBy8ZDLd5ITqJ8bJyOjCXN119Rb+zB
	3vBHX1VqzTftK/CB1R1fN2y4QDPeKbXW07HhVO5Rq9qOWDmlwWlLFkFsusKZ24jXZdRU
	iawNrHTJnkVdDl0PmIzn82nUBXwfzlJawHrsfCOhA+wgc8pUp5h9j4oxr9ztGoGJ8XL8
	INAeNay2erzBU0usmlHdKN2YvEY6C0lbl2nR4y0LWvsZcUSCO5WV9ZFW1Va/sb7nwIm8
	DIhA==
MIME-Version: 1.0
Received: by 10.68.219.67 with SMTP id pm3mr221263647pbc.150.1357830372961;
	Thu, 10 Jan 2013 07:06:12 -0800 (PST)
Received: by 10.68.230.196 with HTTP; Thu, 10 Jan 2013 07:06:12 -0800 (PST)
In-Reply-To: <CAAQYJAsygkKtJiu7QFSM2o+5iNx7GSmwvOZ6E+LBkoAh4ChQzA@mail.gmail.com>
References: <CACW_hTbcpzGuQw3HfNc1bL+a7L6oGcJWfhE5=YKyXR6fwQeVfg@mail.gmail.com>
	<1357751835.13022.103.camel@ted>
	<CAAQYJAsygkKtJiu7QFSM2o+5iNx7GSmwvOZ6E+LBkoAh4ChQzA@mail.gmail.com>
Date: Thu, 10 Jan 2013 16:06:12 +0100
Message-ID: <CACW_hTZdivwbMO8jskuhPNefEL2riDfQ6_XWdG7bkpZJNOmnzQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: split mtd-utils
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
X-List-Received-Date: Thu, 10 Jan 2013 15:21:29 -0000
Content-Type: multipart/alternative; boundary=047d7b2eda8b0bad0904d2f0853c

--047d7b2eda8b0bad0904d2f0853c
Content-Type: text/plain; charset=ISO-8859-1

Cool, I'll have a peek at the oe classic recipe and give it a stab along
the same spirit.

Best regards, Frans


2013/1/10 Andrea Adami <andrea.adami@gmail.com>

> On Wed, Jan 9, 2013 at 6:17 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2013-01-09 at 17:12 +0100, Frans Meulenbroeks wrote:
> >> As I am involved in embedded systems where flash is somewhat sparse
> >> I'm always eager to save a few bytes where possible.
> >>
> >> Today I noticed that mtd-utils (1.5.0 from danny) generates for my
> >> architecture (powerpc) roughly 780k of binaries in usr/sbin. 423k of
> >> it is due to ubifs related files.
> >>
> >> Would it be desired to put this in a separate package?
> >>
> >> e.g. mtd-utils-ubi and mtd-utils-nonubi with mtd-utils itself being
> >> empty but rdepend on those two?
> >> that way mtd-utils will still give all packages but those only wanting
> >> the non ubi stuff can limit themselves to that.
> >>
> >> If desired I can give this a stab.
> >
> > Sounds like a sensible split to me...
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> OE-Classic already has one packaging split:
> PACKAGES =+ "mkfs-jffs2 mkfs-ubifs
>
> Recently I faced this same issue: for ubiattach we have to install
> full mtd-utils (>700KiB)
> FYI there is a recipe for ubi-utils-klibc for more extreme size
> optimization.
>
>
> http://cgit.openembedded.org/meta-openembedded/tree/meta-initramfs/recipes-devtools/mtd
>
> Cheers
>
> Andrea
>

--047d7b2eda8b0bad0904d2f0853c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Cool, I&#39;ll have a peek at the oe classic recipe a=
nd give it a stab along the same spirit.<br><br></div>Best regards, Frans<b=
r></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">2013/=
1/10 Andrea Adami <span dir=3D"ltr">&lt;<a href=3D"mailto:andrea.adami@gmai=
l.com" target=3D"_blank">andrea.adami@gmail.com</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On W=
ed, Jan 9, 2013 at 6:17 PM, Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@li=
nuxfoundation.org</a>&gt; wrote:<br>
&gt; On Wed, 2013-01-09 at 17:12 +0100, Frans Meulenbroeks wrote:<br>
&gt;&gt; As I am involved in embedded systems where flash is somewhat spars=
e<br>
&gt;&gt; I&#39;m always eager to save a few bytes where possible.<br>
&gt;&gt;<br>
&gt;&gt; Today I noticed that mtd-utils (1.5.0 from danny) generates for my=
<br>
&gt;&gt; architecture (powerpc) roughly 780k of binaries in usr/sbin. 423k =
of<br>
&gt;&gt; it is due to ubifs related files.<br>
&gt;&gt;<br>
&gt;&gt; Would it be desired to put this in a separate package?<br>
&gt;&gt;<br>
&gt;&gt; e.g. mtd-utils-ubi and mtd-utils-nonubi with mtd-utils itself bein=
g<br>
&gt;&gt; empty but rdepend on those two?<br>
&gt;&gt; that way mtd-utils will still give all packages but those only wan=
ting<br>
&gt;&gt; the non ubi stuff can limit themselves to that.<br>
&gt;&gt;<br>
&gt;&gt; If desired I can give this a stab.<br>
&gt;<br>
&gt; Sounds like a sensible split to me...<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
&gt;<br>
&gt;<br>
</div></div>&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
<br>
OE-Classic already has one packaging split:<br>
PACKAGES =3D+ &quot;mkfs-jffs2 mkfs-ubifs<br>
<br>
Recently I faced this same issue: for ubiattach we have to install<br>
full mtd-utils (&gt;700KiB)<br>
FYI there is a recipe for ubi-utils-klibc for more extreme size optimizatio=
n.<br>
<br>
<a href=3D"http://cgit.openembedded.org/meta-openembedded/tree/meta-initram=
fs/recipes-devtools/mtd" target=3D"_blank">http://cgit.openembedded.org/met=
a-openembedded/tree/meta-initramfs/recipes-devtools/mtd</a><br>
<br>
Cheers<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Andrea<br>
</font></span></blockquote></div><br></div>

--047d7b2eda8b0bad0904d2f0853c--
