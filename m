Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 270E6772E7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 22:39:37 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id y140so1722152oie.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 14:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ftfhydJOpxzfabsRu8LlfnBp4ZGWH2d7iPz5t4VQ/iE=;
	b=S6XxkJeCnK3ppokeBkyVeS5IwDumF7tq5RAnXN1F+fu4A8BGNk+35TEOD/Gv3ouIbw
	7Ng2sSCB70GQDh5cA2loL+yivqXMBBQUPDZbFT9CT4ZV9CLCZtFWNnK0ZUBln4kkxTen
	pf4GRnC//v1MBUhVVUc5v68Fz5ygPtkZO4xp9FEnGX96y14M4foiAoUjezeXKr2jO4sJ
	3BAdxoVYjh0jK6P77hS1gfmbpkZobble8VaMyh+JrBZ1zjTb4rO+PfuvAY3NQTisrpnK
	z/r9VFSNhzRJ5MVT8vTRQMCVjyXaGOgYiQStBcZewwy3hUsvQx4NJmU++XIhH698Swbg
	DvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ftfhydJOpxzfabsRu8LlfnBp4ZGWH2d7iPz5t4VQ/iE=;
	b=Eeod94/7rqZpZjaw+U7IiEaQ6GDMYDnnFwmb4KYXaBi0OHWfkLG0LbD929Av3wdNGq
	nRtSq0ep0DEI+AvBnYyi6Fmkg7OZRoq1fl0qoanANn6ptXeScv6N1uLlck+MEn/161X3
	KBj63wL5Bx4UqeSSQHpgMMD6HuIspZAeAV7ybHFueQxfsET9z1GMbWM4npjdxx7AoHTk
	wMS4a6KfElenxb4NM69Ad/3Gi5eR2Act19ThGHeUnOm1nwkqAvjJ7dIH9lGn899h6QRo
	Rx8IVCUEF/6t8mXjaL5nLh80eOC9e/MvyMk9jWg5leDs1LYVNThCY2NhmCyFvA8O5B6g
	O5RA==
X-Gm-Message-State: AMke39lM8NUUj66s/5nYKQH3/tfuGMOveJj89WojVTX1AJ/Cm8gJOCRzfUOPKSdJ1rzYIaapzuyzeGawaHVRXQ==
X-Received: by 10.202.71.137 with SMTP id u131mr5667536oia.111.1487371178010; 
	Fri, 17 Feb 2017 14:39:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.5.8 with HTTP; Fri, 17 Feb 2017 14:39:17 -0800 (PST)
In-Reply-To: <1487366767-28347-1-git-send-email-anibal.limon@linux.intel.com>
References: <1487366767-28347-1-git-send-email-anibal.limon@linux.intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 17 Feb 2017 15:39:17 -0700
Message-ID: <CABcZANksgFTdb52szMJVWo4EWxDT9ZA6hpnznHAfGH-KB15CnA@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: yocto <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] yocto-compat-layer.py: Add script to YP Compatible Layer validation
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
X-List-Received-Date: Fri, 17 Feb 2017 22:39:39 -0000
Content-Type: multipart/alternative; boundary=001a113e3c68b6f1a20548c19608

--001a113e3c68b6f1a20548c19608
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2017 at 2:26 PM, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux=
.intel.com>
wrote:

> +    parser.add_argument('-l', '--layer', metavar=3D'LAYER_DIR',
> +            help=3D'Layer to test compatibility with Yocto Project',
> +            action=3D'store', required=3DTrue)
>

The behavior of this argument is quite unintuitive. First, this path isn=E2=
=80=99t
actually used as the layer directory, detect_layers searches down from that
path to *find* layers in that subdirectory, so the argument isn=E2=80=99t w=
hat it
says it is. Second, why are you making an option mandatory rather than just
using arguments?

That is, why `layer-compat-layer.py -l layerpath` rather than
`layer-compat-layer.py layerpath`. If you change the call to
`parser.add_argument(=E2=80=98layer=E2=80=99, =E2=80=A6)` it=E2=80=99d chan=
ge to the latter behavior.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a113e3c68b6f1a20548c19608
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Feb 17, 2017 at 2:26 PM, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&=
lt;<a href=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal=
.limon@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":dp" class=3D"a3s aXjCH m15a4df4b55dec0a4">+=C2=A0 =C2=A0 pa=
rser.add_argument(&#39;-l&#39;, &#39;--layer&#39;, metavar=3D&#39;LAYER_DIR=
&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&#39;Layer to test compat=
ibility with Yocto Project&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 action=3D&#39;store&#39;, requir=
ed=3DTrue)</div></blockquote></div><br>The behavior of this argument is qui=
te unintuitive. First, this path isn=E2=80=99t actually used as the layer d=
irectory, detect_layers searches down from that path to *find* layers in th=
at subdirectory, so the argument isn=E2=80=99t what it says it is. Second, =
why are you making an option mandatory rather than just using arguments?</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">That is,=
 why `layer-compat-layer.py -l layerpath` rather than `layer-compat-layer.p=
y layerpath`. If you change the call to `parser.add_argument(=E2=80=98layer=
=E2=80=99, =E2=80=A6)` it=E2=80=99d change to the latter behavior.<br>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div di=
r=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot =
com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engin=
eer, Mentor Graphics</div></div></div></div>
</div></div>

--001a113e3c68b6f1a20548c19608--
