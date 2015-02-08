Return-Path: <kergoth@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 03075723C4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Feb 2015 21:17:09 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id 131so5684314ykp.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Feb 2015 13:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=rdISBi+DdxiQtXfjkigqNfcd1Q79Knzgtb170/zdTEE=;
	b=FGscOXLgtZ6bBP7leGCeRsP/OizNmKoztWu2RQT/lrHePY4s8n3zSHmgi5Qp1i9rIn
	rSYxbvJoajzqMsQGKRCDJYV1BSzpbvsuOq+5TktHbBGpZyU0jlVUfmHP40XtMSfhPkyE
	dGf/F9Nd37xH+yTG8K/5SIqil8iaamsmFeP6+vtlH0ZrVxv6/KyP3tDJVzCzXDUjB/M6
	k5l/aVXKZI/Jg0aUCGLmtTLz9Uwx+jpMrnC9KNUlyjLP/sRaXTraMEiiiKbV6schSGTe
	x0qquyFH+fh8QKz6bxZ52oJMfuBFSupTy+QW8qdnsADuNjP0qheb/A0cpwoVsfUPan8o
	3V9A==
X-Received: by 10.170.209.14 with SMTP id a14mr5463748ykf.11.1423430230715;
	Sun, 08 Feb 2015 13:17:10 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.170.205.88 with HTTP; Sun, 8 Feb 2015 13:16:48 -0800 (PST)
In-Reply-To: <cover.1423420390.git.pab@pabigot.com>
References: <cover.1423420390.git.pab@pabigot.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Sun, 8 Feb 2015 14:16:48 -0700
X-Google-Sender-Auth: RZiQL0Wmomfr9e40pvldjwUMBYU
Message-ID: <CABcZANmkGNPwvdt==h_LAA-Q6e5Umwti2g=qvj3r_vyQrqxjHA@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 00/10] bluez4/bluez5 selection fixing Yocto 5031
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
X-List-Received-Date: Sun, 08 Feb 2015 21:17:17 -0000
Content-Type: multipart/alternative; boundary=001a11398f6243b235050e9a2d47

--001a11398f6243b235050e9a2d47
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 8, 2015 at 11:42 AM, Peter A. Bigot <pab@pabigot.com> wrote:

> This series has been in RFC for over two months; not that I mean to be
> impatient, but it's pretty straightforward.  I've rebased it once
> more.  Please give it serious consideration before some feature freeze
> means another Yocto release won't support modern Bluetooth
> infrastructure.
>
> Details from the previous submission can be found here:
>
>
> http://lists.openembedded.org/pipermail/openembedded-core/2014-November/099312.html
>
> With this all you should need to switch to bluez5 is the following in
> local.conf or some similar location:
>
>     DISTRO_FEATURES_append = " bluez5"
>     PREFERRED_PROVIDER_bluez-hcidump = "bluez5"
>     PNBLACKLIST[bluez-hcidump] = "superseded by bluez5"
>     PNBLACKLIST[gst-plugin-bluetooth] = "dropped from bluez5"
>     PNBLACKLIST[bluez4] = "superseded by bluez5"
>

For what it's worth, I like the look of this series (and have since they
were first posted). Hopefully it gets merged.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11398f6243b235050e9a2d47
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sun, Feb 8, 2015 at 11:42 AM, Peter A. Bigot <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:pab@pabigot.com" target=3D"_blank">pab@pabigot.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":17p" class=3D"a3s"=
 style=3D"overflow:hidden">This series has been in RFC for over two months;=
 not that I mean to be<br>
impatient, but it&#39;s pretty straightforward.=C2=A0 I&#39;ve rebased it o=
nce<br>
more.=C2=A0 Please give it serious consideration before some feature freeze=
<br>
means another Yocto release won&#39;t support modern Bluetooth<br>
infrastructure.<br>
<br>
Details from the previous submission can be found here:<br>
<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2014-N=
ovember/099312.html" target=3D"_blank">http://lists.openembedded.org/piperm=
ail/openembedded-core/2014-November/099312.html</a><br>
<br>
With this all you should need to switch to bluez5 is the following in<br>
local.conf or some similar location:<br>
<br>
=C2=A0 =C2=A0 DISTRO_FEATURES_append =3D &quot; bluez5&quot;<br>
=C2=A0 =C2=A0 PREFERRED_PROVIDER_bluez-hcidump =3D &quot;bluez5&quot;<br>
=C2=A0 =C2=A0 PNBLACKLIST[bluez-hcidump] =3D &quot;superseded by bluez5&quo=
t;<br>
=C2=A0 =C2=A0 PNBLACKLIST[gst-plugin-bluetooth] =3D &quot;dropped from blue=
z5&quot;<br>
=C2=A0 =C2=A0 PNBLACKLIST[bluez4] =3D &quot;superseded by bluez5&quot;</div=
></blockquote></div><br>For what it&#39;s worth, I like the look of this se=
ries (and have since they were first posted). Hopefully it gets merged.<br>=
-- <br><div class=3D"gmail_signature">Christopher Larson<br>clarson at kerg=
oth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - =
Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a11398f6243b235050e9a2d47--
