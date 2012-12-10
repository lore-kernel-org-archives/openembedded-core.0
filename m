Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ti5wo-00014V-RO
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 17:11:15 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so1858780pad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2012 07:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=sxNt7A5w29o8ELlYhLmaNiG1KCs7V9vmuEZEyjS+4q8=;
	b=rLv0UclvcjVvLV0UFMwH26Gx4d8Aj3T02R8L0eJfEbcoDbRw2wmQlCMKHDskdWZyQs
	5c6GzVMXXCXv+P+lDTrdpcfXc+nc0iAdKLMRwuWqQkpKFssfbDyTTUO5Dqm9uBmzbBks
	JUNB6vb2MTeiKo2GkK9+bL5UuiHZ8O/wPPMVUTiEJ6NeqtH3OO280TObzlTklgZjAhiL
	Wkk4ZtL8HwdjWcvtjZAvi4P192aQkbZQ135by46+DAo9odg4MWz+wNnwjYiGzs9LNbiG
	BQXxXJtpNcA7se6dg87OUxP5Umm8CCWCFR0kZrUJ5yyDuLxIxPncbLB87VqRkehEHYYT
	Wucw==
MIME-Version: 1.0
Received: by 10.66.85.101 with SMTP id g5mr37137105paz.17.1355155002179; Mon,
	10 Dec 2012 07:56:42 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.125.227 with HTTP; Mon, 10 Dec 2012 07:56:42 -0800 (PST)
In-Reply-To: <1F1FCC0D09F8D74A800E2DC9C69FFD1A1882D6@039-SN2MPN1-011.039d.mgd.msft.net>
References: <1F1FCC0D09F8D74A800E2DC9C69FFD1A1882D6@039-SN2MPN1-011.039d.mgd.msft.net>
Date: Mon, 10 Dec 2012 13:56:42 -0200
X-Google-Sender-Auth: NanIlGk0ZvBsoTO3KN7IRXYpZiw
Message-ID: <CAP9ODKqg98_eOTh=495QxgNwd2-3ZmScVZc5sDbr21KfsaU=KQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mangaud Philippe-R49081 <R49081@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	"Burton, Ross" <ross.burton@intel.com>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>
Subject: Re: [meta-freescale] Building sato-icon-theme
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
X-List-Received-Date: Mon, 10 Dec 2012 16:11:15 -0000
Content-Type: multipart/alternative; boundary=f46d042ef5498540a104d0819c4b

--f46d042ef5498540a104d0819c4b
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 10, 2012 at 11:08 AM, Mangaud Philippe-R49081 <
R49081@freescale.com> wrote:

>  Hello,
>

Hello Philippe,

Thanks by finding this out.


> **
>
> Actually building fsl-image-gui for SabreSD using master branch, had to
> modify recipe to add perlnative and libxml-simple-perl-native to compile
> this package as explained in
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=5b1d45c9fb2394418bb0a8c915c34a8c2fdb0d49
> ****
>
> ** **
>
> Might be brave enough to commit my first patch if you think it is relevant
> for this rev 4 :****
>
> ** **
>
> *--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc<http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc?id=c8e2f1447dd93792626cabf5e238b00cce8c6e70>
> +++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc<http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc?id=5b1d45c9fb2394418bb0a8c915c34a8c2fdb0d49>
> *
>
> -inherit autotools pkgconfig allarch gtk-icon-cache****
>
> +inherit autotools pkgconfig allarch gtk-icon-cache perlnative****
>
> ****
>
> *--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb<http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb?id=c8e2f1447dd93792626cabf5e238b00cce8c6e70>
> +++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb<http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb?id=5b1d45c9fb2394418bb0a8c915c34a8c2fdb0d49>
> *
>
> require sato-icon-theme.inc****
>
> -DEPENDS += "icon-naming-utils-native"****
>
> +DEPENDS += "icon-naming-utils-native libxml-simple-perl-native"
>

I am adding OpenEmbedded-Core and Ross Burton (responsable by danny
maintainence) in CC.

Ross, the above commit (which is included in master) should be backported
to danny if you have no objection.

Please, take a look.

Regards,


-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d042ef5498540a104d0819c4b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mon, D=
ec 10, 2012 at 11:08 AM, Mangaud Philippe-R49081 <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:R49081@freescale.com" target=3D"_blank">R49081@freescale.com<=
/a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div>
<p class=3D"MsoNormal">Hello,</p></div></div></blockquote><div><br></div><d=
iv>Hello Philippe,</div><div><br></div><div>Thanks by finding this out.</di=
v><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple"><p class=3D"MsoNormal"><=
u></u></p>
<p class=3D"MsoNormal">Actually building fsl-image-gui for SabreSD using ma=
ster branch, had to modify recipe to add perlnative and libxml-simple-perl-=
native to compile this package as explained in
<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D5b1d45c9f=
b2394418bb0a8c915c34a8c2fdb0d49" target=3D"_blank">
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D5b1d45c9fb2394418bb0=
a8c915c34a8c2fdb0d49</a><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<p class=3D"MsoNormal">Might be brave enough to commit my first patch if yo=
u think it is relevant for this rev 4 :<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Courier New&quot;;color:white">--- a/<a href=3D"http://git.yoctoproject.or=
g/cgit.cgi/poky/tree/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc?=
id=3Dc8e2f1447dd93792626cabf5e238b00cce8c6e70" target=3D"_blank">meta/recip=
es-sato/sato-icon-theme/sato-icon-theme.inc</a><br>

+++ b/<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipe=
s-sato/sato-icon-theme/sato-icon-theme.inc?id=3D5b1d45c9fb2394418bb0a8c915c=
34a8c2fdb0d49" target=3D"_blank">meta/recipes-sato/sato-icon-theme/sato-ico=
n-theme.inc</a><u></u><u></u></span></b></p>

<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:red">-inherit autotools pkgconfig allarch gtk-icon-ca=
che<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:green">+inherit autotools pkgconfig allarch gtk-icon-=
cache perlnative<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:white"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Courier New&quot;;color:white">--- a/<a href=3D"http://git.yoctoproject.or=
g/cgit.cgi/poky/tree/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.=
1.bb?id=3Dc8e2f1447dd93792626cabf5e238b00cce8c6e70" target=3D"_blank">meta/=
recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb</a><br>

+++ b/<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipe=
s-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb?id=3D5b1d45c9fb2394418bb0a8=
c915c34a8c2fdb0d49" target=3D"_blank">meta/recipes-sato/sato-icon-theme/sat=
o-icon-theme_0.4.1.bb</a><u></u><u></u></span></b></p>

<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:white">require sato-icon-theme.inc<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:red">-DEPENDS +=3D &quot;icon-naming-utils-native&quo=
t;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:green">+DEPENDS +=3D &quot;icon-naming-utils-native l=
ibxml-simple-perl-native&quot;</span></p></div></blockquote><div><br></div>=
<div>
I am adding OpenEmbedded-Core and Ross Burton (responsable by danny maintai=
nence) in CC.</div><div><br></div><div>Ross, the above commit (which is inc=
luded in master) should be backported to danny if you have no objection.</d=
iv>
<div><br></div><div>Please, take a look.</div><div><br></div><div>Regards,<=
/div><div><br></div><div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a h=
ref=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.c=
om.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"_blank">http=
://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>
</div>

--f46d042ef5498540a104d0819c4b--
