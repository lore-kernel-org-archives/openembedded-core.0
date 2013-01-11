Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1TtaP9-0006em-Fh
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 09:56:00 +0100
Received: by mail-pb0-f52.google.com with SMTP id ro2so829822pbb.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2013 00:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=tAyLj2ztCXh6cKdY9dOe7a/xb47LJahozPz93UJ3F08=;
	b=K5A+HGrNdCaEFwc/uVe1ijHTvCdlFi4DUOAgYiPRhvZZnryVMXD5iRXrRptjzwc0l9
	wLwjUgaoHkhxok8JWNlToc8rKKtXI56QZ+rBVJPhgfW1RpHnbSmniR1hqCQpWLxEkQwQ
	6MRZnFzcvhqajyhx2Wj6LFsVgdwpIW4CaxMFQRSP7vg8NlCepb6iUwWkI1ya9yLm7GFp
	ewCKsltbp5hkv45w5KAg4yFddJ2513Ntz/N01P96BxL1XDjqDEGAWoeznZv9qsDxG66s
	VBLFdVwgFWjUdzIKfjV5I2p2XEhqHtJCpjGrPvpjWC7B5jtDa5VGy1/Y/HGIv8wXrNUV
	Zo3g==
MIME-Version: 1.0
Received: by 10.68.219.67 with SMTP id pm3mr228548982pbc.150.1357893644048;
	Fri, 11 Jan 2013 00:40:44 -0800 (PST)
Received: by 10.68.230.196 with HTTP; Fri, 11 Jan 2013 00:40:43 -0800 (PST)
In-Reply-To: <CACW_hTZdivwbMO8jskuhPNefEL2riDfQ6_XWdG7bkpZJNOmnzQ@mail.gmail.com>
References: <CACW_hTbcpzGuQw3HfNc1bL+a7L6oGcJWfhE5=YKyXR6fwQeVfg@mail.gmail.com>
	<1357751835.13022.103.camel@ted>
	<CAAQYJAsygkKtJiu7QFSM2o+5iNx7GSmwvOZ6E+LBkoAh4ChQzA@mail.gmail.com>
	<CACW_hTZdivwbMO8jskuhPNefEL2riDfQ6_XWdG7bkpZJNOmnzQ@mail.gmail.com>
Date: Fri, 11 Jan 2013 09:40:43 +0100
Message-ID: <CACW_hTaR+s1OyZFCseA1Nx0kxwi_W0NHzpBw7r-8jinKeBA21w@mail.gmail.com>
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
X-List-Received-Date: Fri, 11 Jan 2013 08:56:00 -0000
Content-Type: multipart/alternative; boundary=047d7b2eda8b4bd96004d2ff400d

--047d7b2eda8b4bd96004d2ff400d
Content-Type: text/plain; charset=ISO-8859-1

Along the lines of the oe classic patch I propose to split as follows:


mtd-utils-jffs2 package containing
jffs2dump
jffs2reader
mkfs.jffs2

mtd-utils-ubifs package containing:
mkfs.ubifs
ubiattach
ubicrc32
ubidetach
ubiformat
ubimkvol
ubinfo
ubinize
ubirename
ubirmvol
ubirsvol
ubiupdatevol

mtd-utils package containing:
docfdisk
doc_loadbios
flashcp
flash_erase
flash_eraseall
flash_lock
flash_otp_dump
flash_otp_info
flash_unlock
ftl_check
ftl_format
mtd_debug
mtdinfo
nanddump
nandtest
nandwrite
nftldump
nftl_format
recv_image
rfddump
rfdformat
serve_image
sumtool

Or do we need to make additional packages (like e.g. for (n)tfl )

Best regards, Frans




2013/1/10 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

> Cool, I'll have a peek at the oe classic recipe and give it a stab along
> the same spirit.
>
> Best regards, Frans
>
>
> 2013/1/10 Andrea Adami <andrea.adami@gmail.com>
>
>> On Wed, Jan 9, 2013 at 6:17 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Wed, 2013-01-09 at 17:12 +0100, Frans Meulenbroeks wrote:
>> >> As I am involved in embedded systems where flash is somewhat sparse
>> >> I'm always eager to save a few bytes where possible.
>> >>
>> >> Today I noticed that mtd-utils (1.5.0 from danny) generates for my
>> >> architecture (powerpc) roughly 780k of binaries in usr/sbin. 423k of
>> >> it is due to ubifs related files.
>> >>
>> >> Would it be desired to put this in a separate package?
>> >>
>> >> e.g. mtd-utils-ubi and mtd-utils-nonubi with mtd-utils itself being
>> >> empty but rdepend on those two?
>> >> that way mtd-utils will still give all packages but those only wanting
>> >> the non ubi stuff can limit themselves to that.
>> >>
>> >> If desired I can give this a stab.
>> >
>> > Sounds like a sensible split to me...
>> >
>> > Cheers,
>> >
>> > Richard
>> >
>> >
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> OE-Classic already has one packaging split:
>> PACKAGES =+ "mkfs-jffs2 mkfs-ubifs
>>
>> Recently I faced this same issue: for ubiattach we have to install
>> full mtd-utils (>700KiB)
>> FYI there is a recipe for ubi-utils-klibc for more extreme size
>> optimization.
>>
>>
>> http://cgit.openembedded.org/meta-openembedded/tree/meta-initramfs/recipes-devtools/mtd
>>
>> Cheers
>>
>> Andrea
>>
>
>

--047d7b2eda8b4bd96004d2ff400d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Along the lines of the oe classic patch I p=
ropose to split as follows:<br><br></div><div><br>mtd-utils-jffs2 package c=
ontaining <br>jffs2dump<br>jffs2reader<br>mkfs.jffs2<br><br>mtd-utils-ubifs=
 package containing:<br>
mkfs.ubifs<br>ubiattach<br>ubicrc32<br>ubidetach<br>ubiformat<br>ubimkvol<b=
r>ubinfo<br>ubinize<br>ubirename<br>ubirmvol<br>ubirsvol<br>ubiupdatevol<br=
><br>mtd-utils package containing:<br></div>docfdisk<br>doc_loadbios<br>
flashcp<br>flash_erase<br>flash_eraseall<br>flash_lock<br>flash_otp_dump<br=
>flash_otp_info<br>flash_unlock<br>ftl_check<br>ftl_format<br>mtd_debug<br>=
mtdinfo<br>nanddump<br>nandtest<br>nandwrite<br>nftldump<br>nftl_format<br>
recv_image<br>rfddump<br>rfdformat<br>serve_image<br>sumtool<br><br></div>O=
r do we need to make additional packages (like e.g. for (n)tfl )<br><br></d=
iv>Best regards, Frans<br><div><div><div><div><br><div><br></div></div>
</div></div></div></div><div class=3D"gmail_extra"><br><br><div class=3D"gm=
ail_quote">2013/1/10 Frans Meulenbroeks <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:fransmeulenbroeks@gmail.com" target=3D"_blank">fransmeulenbroeks@gmail=
.com</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Cool, I&#39;ll have a =
peek at the oe classic recipe and give it a stab along the same spirit.<br>=
<br>
</div>Best regards, Frans<br></div><div class=3D"HOEnZb"><div class=3D"h5">=
<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">2013/1/10 And=
rea Adami <span dir=3D"ltr">&lt;<a href=3D"mailto:andrea.adami@gmail.com" t=
arget=3D"_blank">andrea.adami@gmail.com</a>&gt;</span><br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><div>On Wed, Jan 9, 2013 at 6:17 PM, Ri=
chard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
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
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
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
<span><font color=3D"#888888"><br>
Andrea<br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--047d7b2eda8b4bd96004d2ff400d--
