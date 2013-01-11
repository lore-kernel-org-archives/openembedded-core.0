Received: from mail-da0-f48.google.com ([209.85.210.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ttafi-0007Ol-Of
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 10:13:16 +0100
Received: by mail-da0-f48.google.com with SMTP id k18so682283dae.21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2013 00:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=GqWn0OgPOWrQE29jIzgrEnHKPrsE1dycfMcJQymGOIE=;
	b=lhj47ntSHAPRjHmpaqjbH9UVj/SVgHAr5xrljO8D3WhDxoTrlc+LIqQ3XhO/ZfsX60
	Q9MOS4IBiJkJjVV5FZO0O1w6eOViNdG9mZOY/8VqPKsP/Xdjc8If85ik6IOgXKEELkI9
	CVPmdIVAlem8OGkP5b8/VYm5TGmjFB/8jAq28EQ+wxrPHvl/H4pkuvhbq0BQJh1bWRA4
	HBN3NFdyn+BDHh9PncNc7xX2AU8+/MUU+EOU6Yvo+vYVE/safN9o8BesBBhzDXLnmP7o
	i/KQ/p2TWXYmWkQLhad3fHX5P6gIdJ4M+SlaOp1XWWgpmh0Xu+e3v6DlnziJ0wGiXj/U
	y0aQ==
MIME-Version: 1.0
Received: by 10.66.88.99 with SMTP id bf3mr205512515pab.62.1357894671589; Fri,
	11 Jan 2013 00:57:51 -0800 (PST)
Received: by 10.68.230.196 with HTTP; Fri, 11 Jan 2013 00:57:51 -0800 (PST)
In-Reply-To: <20130111094825.13615ca8@e6520eb>
References: <CACW_hTbcpzGuQw3HfNc1bL+a7L6oGcJWfhE5=YKyXR6fwQeVfg@mail.gmail.com>
	<1357751835.13022.103.camel@ted>
	<CAAQYJAsygkKtJiu7QFSM2o+5iNx7GSmwvOZ6E+LBkoAh4ChQzA@mail.gmail.com>
	<CACW_hTZdivwbMO8jskuhPNefEL2riDfQ6_XWdG7bkpZJNOmnzQ@mail.gmail.com>
	<CACW_hTaR+s1OyZFCseA1Nx0kxwi_W0NHzpBw7r-8jinKeBA21w@mail.gmail.com>
	<20130111094825.13615ca8@e6520eb>
Date: Fri, 11 Jan 2013 09:57:51 +0100
Message-ID: <CACW_hTab1ALUqN8GnaMZ2+tJ0fOq4qg9Zt8m6SnMW1j+V-vMjg@mail.gmail.com>
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
X-List-Received-Date: Fri, 11 Jan 2013 09:13:20 -0000
Content-Type: multipart/alternative; boundary=f46d042f97988ae22d04d2ff7d9d

--f46d042f97988ae22d04d2ff7d9d
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2013/1/11 Eric B=E9nard <eric@eukrea.com>

> Hi Frans,
>
> [...]

> IIRC sumtol is used for jffs2 images (to create the erase block
> summary) so that may better fit into mtd-utils-jffs2
>
> Also, nftl* rfd* doc* ftl* serve_image may go into a separate packate
> (mtd-utils-misc ?) as I believe those tools are not very usefull in
> most configurations using mtd with nowadays's flashs.
>
> Eric
>
Hi Eric,

Thanks for the feedback. I'm not into the details of all tools in the
package (I typically only use the flash* mtd* and jffs2 things)
Seems a good plan to me to put these in a misc package
(actually I also considered moving all other stuff that is in my proposal
in mtd-utils into a differently named package, e.g. mtd-utils-core) and
have mtd-utils as an umbrella package dragging in what it does now (so it
should RDEPEND on the meta-utils-* packages but have no other stuff in it).

Best regards, Frans.

PS: partially related: I have filed yocto bug 3702 asking for more
fine-grained control on what is included in an image.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3702

--f46d042f97988ae22d04d2ff7d9d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">2013/1/11 Eric B=E9nard <span dir=3D"ltr">&lt;<a href=3D"mailto:eri=
c@eukrea.com" target=3D"_blank">eric@eukrea.com</a>&gt;</span><br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
Hi Frans,<br>
<br></blockquote><div>[...] <br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
IIRC sumtol is used for jffs2 images (to create the erase block<br>
summary) so that may better fit into mtd-utils-jffs2<br>
<br>
Also, nftl* rfd* doc* ftl* serve_image may go into a separate packate<br>
(mtd-utils-misc ?) as I believe those tools are not very usefull in<br>
most configurations using mtd with nowadays&#39;s flashs.<br>
<span class=3D""><font color=3D"#888888"><br>
Eric<br>
</font></span></blockquote></div>Hi Eric,<br><br>Thanks for the feedback. I=
&#39;m not into the details of all tools in the package (I typically only u=
se the flash* mtd* and jffs2 things)<br></div><div class=3D"gmail_extra">
Seems a good plan to me to put these in a misc package<br></div><div class=
=3D"gmail_extra">(actually I also considered moving all other stuff that is=
 in my proposal in mtd-utils into a differently named package, e.g. mtd-uti=
ls-core) and have mtd-utils as an umbrella package dragging in what it does=
 now (so it should RDEPEND on the meta-utils-* packages but have no other s=
tuff in it).<br>
<br></div><div class=3D"gmail_extra">Best regards, Frans.<br><br>PS: partia=
lly related: I have filed yocto bug 3702 asking for more fine-grained contr=
ol on what is included in an image.<br><a href=3D"https://bugzilla.yoctopro=
ject.org/show_bug.cgi?id=3D3702">https://bugzilla.yoctoproject.org/show_bug=
.cgi?id=3D3702</a> <br>
</div></div>

--f46d042f97988ae22d04d2ff7d9d--
