Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id A17BD77F85
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 20:14:29 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id h4so88933881oib.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 13:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7zPQg7pknACA6rtxARoScNEdhm+XN5CvPh8AsPEEONw=;
	b=coLY2BQ3GqM92hHnFVdZ5qj4+6S2EBwQPFX30ELbRU7frYIq+LGgdLphpNSSLec3u8
	MYSMgGXv+tDs2ir/RbvxxFFGZWwDci0lxvnZeXR1VYYBxI9xgDpdsn6lW+x05vPIWEJm
	Xz0wVTWrxDLYBFaFB2bghGmRAXEUI9uPCplwe+oB2DUx/HKhDaKhBR9lv/I7hd74bj7k
	3Kb1wUODeHe/zAxUvKDTOvSPdxRjIchuWc7FCfKog30jcvIA2LyqssnD5doCVuWVQ1co
	UAUOc7gZJ93OcYV9zdy4iNBKpL4yXGKL67o/89kbyCgGZ1Ncs45fvh/vEddcMKygqXQx
	t5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7zPQg7pknACA6rtxARoScNEdhm+XN5CvPh8AsPEEONw=;
	b=qTMVk3hpTcEk+mvJD0iBStD2whGX4B2lOWDDAt8wedKqu5iRjA0y55fBzprlw9o/q1
	2XABf9LyTrFJeOCiwKgeBrsIf/FyNpJ4ISbJQVMWPg/yJvJOtvjWD1ED+5h4+qNNQelW
	NZRG8BgTysay/p+6/rE6BV9s2GQgzq/k2txVHbF8Ew4R501aannY+yDqb7lIAhjZLk6B
	dqCXcq8QoJyLlS1j2blrRNLATJhgGE1kLF851SnZ+uOvhFGUz9oI3i3pk8QVNT1U19L6
	OSYel5Hr3Lbh0jIanfGf8snIzmNQDD/yRK31oiEqg46k1RdhopxEzrHASjrJHADI4aXN
	qluA==
X-Gm-Message-State: AODbwcBpJWuzqmGUikJ4dUoxXRofRvchL73MbS9dYwovTE1wpTx4dHev
	mRT02TwtXXsSY04Th2awmNc6RcBts9hM
X-Received: by 10.202.172.194 with SMTP id v185mr7939338oie.176.1496088871159; 
	Mon, 29 May 2017 13:14:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.30.226 with HTTP; Mon, 29 May 2017 13:14:10 -0700 (PDT)
In-Reply-To: <592C75CC.2090708@linux.intel.com>
References: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
	<c8d26bf705a207b8f639c966f811bbb15556038c.1496071841.git-series.patrick.ohly@intel.com>
	<592C48BD.5020107@linux.intel.com>
	<1496085537.16923.133.camel@intel.com>
	<592C75CC.2090708@linux.intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 29 May 2017 13:14:10 -0700
Message-ID: <CABcZANmeNcT0JHWXaJM2__EZrgarSjCqQO3Af4trGNF_Dria-A@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] yocto-compat-layer.py: apply test_signatures to all layers
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
X-List-Received-Date: Mon, 29 May 2017 20:14:31 -0000
Content-Type: multipart/alternative; boundary="001a113ce7dcb7cff50550af5529"

--001a113ce7dcb7cff50550af5529
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2017 at 12:26 PM, An=C3=ADbal Lim=C3=B3n <anibal.limon@linu=
x.intel.com
> wrote:

> >
> > Changing software versions is indeed a bit more problematic. One could
> > argue that layers shouldn't fight over who provides a certain recipe in
> > the first place. If they do, perhaps the "additional layers" (=3D the o=
nes
> > with lower priority) need to provide explicit .inc files with
> > PREFERRED_VERSION assignments without which the overriding recipes
> > aren't used?
>
> Yes, so in this case will need to set automatically the preferred
> versions to oe-core recipes, and then let the distro layer to change the
> preferred version in this way when test a distro layer with oe-core the
> signatures not will change only when add the combo of distro layer +
> software layer.


Currently, if you add a high priority layer with an older version recipe,
it will change the default selected recipe, lacking a PREFERRED_VERSION.
You can=E2=80=99t use DEFAULT_PREFERENCE to make the new old version of a r=
ecipe
not be used, since bitbake treats layer priority as more important than
default preference, so adding a .inc won=E2=80=99t do much good, since you =
can=E2=80=99t
make the recipe not be preferred by default without a preferred version set
to the current oe-core version. You could add such a line to the
layer.conf, but then you=E2=80=99re hardcoding the oe-core recipe version i=
nto a
separate layer, which is pretty ugly. I don=E2=80=99t htink we should be en=
forcing
this signature change without resolving this.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a113ce7dcb7cff50550af5529
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, May 29, 2017 at 12:26 PM, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">=
&lt;<a href=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">aniba=
l.limon@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><span class=3D"">&gt;<br>
&gt; Changing software versions is indeed a bit more problematic. One could=
<br>
&gt; argue that layers shouldn&#39;t fight over who provides a certain reci=
pe in<br>
&gt; the first place. If they do, perhaps the &quot;additional layers&quot;=
 (=3D the ones<br>
&gt; with lower priority) need to provide explicit .inc files with<br>
&gt; PREFERRED_VERSION assignments without which the overriding recipes<br>
&gt; aren&#39;t used?<br>
<br>
</span>Yes, so in this case will need to set automatically the preferred<br=
>
versions to oe-core recipes, and then let the distro layer to change the<br=
>
preferred version in this way when test a distro layer with oe-core the<br>
signatures not will change only when add the combo of distro layer +<br>
software layer.</blockquote></div><br>Currently, if you add a high priority=
 layer with an older version recipe, it will change the default selected re=
cipe, lacking a PREFERRED_VERSION. You can=E2=80=99t use DEFAULT_PREFERENCE=
 to make the new old version of a recipe not be used, since bitbake treats =
layer priority as more important than default preference, so adding a .inc =
won=E2=80=99t do much good, since you can=E2=80=99t make the recipe not be =
preferred by default without a preferred version set to the current oe-core=
 version. You could add such a line to the layer.conf, but then you=E2=80=
=99re hardcoding the oe-core recipe version into a separate layer, which is=
 pretty ugly. I don=E2=80=99t htink we should be enforcing this signature c=
hange without resolving this.<br>-- <br><div class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Chris=
topher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedde=
d, OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div=
></div>
</div></div>

--001a113ce7dcb7cff50550af5529--
