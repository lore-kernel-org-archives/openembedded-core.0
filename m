Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1TxFg5-00038K-Vy
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 12:36:39 +0100
Received: by mail-da0-f49.google.com with SMTP id v40so2660015dad.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 03:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=9qKYdE7BakLi0NTIZeHTTHSTXrEQSkmlcv8C2d63Qas=;
	b=O4DxW4poMYyB0kexRa5/nmtsbazjTPvlThjoaLcQCChN8E+7ILqPGLa8chIbP/1k73
	WWscbz9fZ3uzIzZHjSVO1V1pU0ZPiA4fKqzC8OTdw6Fcmb13ooGV3w4VP0FuIc/xGN5a
	A+8s+hcCHBHl//fzBcktLOzmRMH6KNGwqzrmZB914G2Mhc8K+oJb57J5cFUMWuRA35JM
	j5ZxzPpJzK/IHSHLIt0/igTZ8Eihpe2u4mhMzdbR2DMdoxXaYWvxKTSz8FFLhLL6SDjv
	vB94ZPVn66A1mLW9mMDeHt+8/7kziawmANcK5/B37k4gFy0kL4Em2ny2MX4EKPTRCEiS
	Yhig==
MIME-Version: 1.0
X-Received: by 10.68.251.233 with SMTP id zn9mr47442686pbc.7.1358767268667;
	Mon, 21 Jan 2013 03:21:08 -0800 (PST)
Received: by 10.68.230.196 with HTTP; Mon, 21 Jan 2013 03:21:08 -0800 (PST)
In-Reply-To: <CACW_hTab1ALUqN8GnaMZ2+tJ0fOq4qg9Zt8m6SnMW1j+V-vMjg@mail.gmail.com>
References: <CACW_hTbcpzGuQw3HfNc1bL+a7L6oGcJWfhE5=YKyXR6fwQeVfg@mail.gmail.com>
	<1357751835.13022.103.camel@ted>
	<CAAQYJAsygkKtJiu7QFSM2o+5iNx7GSmwvOZ6E+LBkoAh4ChQzA@mail.gmail.com>
	<CACW_hTZdivwbMO8jskuhPNefEL2riDfQ6_XWdG7bkpZJNOmnzQ@mail.gmail.com>
	<CACW_hTaR+s1OyZFCseA1Nx0kxwi_W0NHzpBw7r-8jinKeBA21w@mail.gmail.com>
	<20130111094825.13615ca8@e6520eb>
	<CACW_hTab1ALUqN8GnaMZ2+tJ0fOq4qg9Zt8m6SnMW1j+V-vMjg@mail.gmail.com>
Date: Mon, 21 Jan 2013 12:21:08 +0100
Message-ID: <CACW_hTb4gjraMLqEyY_MZf_8F4SgvmyScVM33Et9qZtn615GQg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
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
X-List-Received-Date: Mon, 21 Jan 2013 11:36:48 -0000
Content-Type: multipart/alternative; boundary=047d7b2e06c961a1ce04d3caa857

--047d7b2e06c961a1ce04d3caa857
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

patch submitted.
Enjoy.
Frans


2013/1/11 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

>
>
>
> 2013/1/11 Eric B=E9nard <eric@eukrea.com>
>
>> Hi Frans,
>>
>> [...]
>
>> IIRC sumtol is used for jffs2 images (to create the erase block
>> summary) so that may better fit into mtd-utils-jffs2
>>
>> Also, nftl* rfd* doc* ftl* serve_image may go into a separate packate
>> (mtd-utils-misc ?) as I believe those tools are not very usefull in
>> most configurations using mtd with nowadays's flashs.
>>
>> Eric
>>
> Hi Eric,
>
> Thanks for the feedback. I'm not into the details of all tools in the
> package (I typically only use the flash* mtd* and jffs2 things)
> Seems a good plan to me to put these in a misc package
> (actually I also considered moving all other stuff that is in my proposal
> in mtd-utils into a differently named package, e.g. mtd-utils-core) and
> have mtd-utils as an umbrella package dragging in what it does now (so it
> should RDEPEND on the meta-utils-* packages but have no other stuff in it=
).
>
> Best regards, Frans.
>
> PS: partially related: I have filed yocto bug 3702 asking for more
> fine-grained control on what is included in an image.
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3702
>

--047d7b2e06c961a1ce04d3caa857
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>patch submitted.<br></div>Enjoy.<br></div>Frans<=
br></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">2013=
/1/11 Frans Meulenbroeks <span dir=3D"ltr">&lt;<a href=3D"mailto:fransmeule=
nbroeks@gmail.com" target=3D"_blank">fransmeulenbroeks@gmail.com</a>&gt;</s=
pan><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_ext=
ra"><br><br><div class=3D"gmail_quote">2013/1/11 Eric B=E9nard <span dir=3D=
"ltr">&lt;<a href=3D"mailto:eric@eukrea.com" target=3D"_blank">eric@eukrea.=
com</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Hi Frans,<br>
<br></blockquote><div>[...] <br></div><div class=3D"im"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
IIRC sumtol is used for jffs2 images (to create the erase block<br>
summary) so that may better fit into mtd-utils-jffs2<br>
<br>
Also, nftl* rfd* doc* ftl* serve_image may go into a separate packate<br>
(mtd-utils-misc ?) as I believe those tools are not very usefull in<br>
most configurations using mtd with nowadays&#39;s flashs.<br>
<span><font color=3D"#888888"><br>
Eric<br>
</font></span></blockquote></div></div>Hi Eric,<br><br>Thanks for the feedb=
ack. I&#39;m not into the details of all tools in the package (I typically =
only use the flash* mtd* and jffs2 things)<br></div><div class=3D"gmail_ext=
ra">

Seems a good plan to me to put these in a misc package<br></div><div class=
=3D"gmail_extra">(actually I also considered moving all other stuff that is=
 in my proposal in mtd-utils into a differently named package, e.g. mtd-uti=
ls-core) and have mtd-utils as an umbrella package dragging in what it does=
 now (so it should RDEPEND on the meta-utils-* packages but have no other s=
tuff in it).<br>

<br></div><div class=3D"gmail_extra">Best regards, Frans.<br><br>PS: partia=
lly related: I have filed yocto bug 3702 asking for more fine-grained contr=
ol on what is included in an image.<br><a href=3D"https://bugzilla.yoctopro=
ject.org/show_bug.cgi?id=3D3702" target=3D"_blank">https://bugzilla.yoctopr=
oject.org/show_bug.cgi?id=3D3702</a> <br>

</div></div>
</blockquote></div><br></div>

--047d7b2e06c961a1ce04d3caa857--
