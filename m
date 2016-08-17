Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 66E7F6013D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 07:36:39 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id c15so129254895oig.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 00:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rJlab0PojAw7cW/unT3BapMKJWlxFX8Krko4RD50Q5k=;
	b=2A4tTy30dbeyE15SHXbNf81Ji5UVMAt6pkE1pvWCDqTg+zqxo1HpSlakr1ZvYj+EU/
	BpLPMmYQ/GF09WNnhbUG3yhLi8/Q9Hk1fJslW8ieBjoRP78yCohX+wePT9BFs26QQWHb
	owzHPXSApW90Fb/PN2mLu39xBf7yS9JhKP8M0wNhw4T5mpvx0Fw26lg2Rc+YDzWXm8TR
	R6iD8oi8bL6V9BvMRUlCezbTPVmt3tYbHt/bGu3BkV2j8/fHTJdQWq/+r7V9AMipwEHU
	PRgrhIqv3V8YvQsstCTAayh2Q/yVOH4vX5tcUTOTGhIV8Yg8BpnNMWJjIr+u4TK+QLYl
	J+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rJlab0PojAw7cW/unT3BapMKJWlxFX8Krko4RD50Q5k=;
	b=gTtvy6FK9vferYntnTNtOGGRUm4UHJvy+CPwO4vs5emej5sZAq+5oieNHIy/6BgukP
	16jHht5xo+BLMuHM4Grck7/fbPKCcmwZJzD+JULGehURVB34JdvWZHdb4gofZli7akLC
	ycXTBzr64Nv40LqOAoxBtK0TU792kiB5lczBU3u0Rg+2AXgvhU9sKyAFLc4SlZ7gAbAK
	zMtYiZtMPkbdOvUxNfO4NlE21gSF6cCe9V0oXhn6uJJ3ZerM5pUgaOQAYAMPENicgTfY
	sIwF71JSgfRrtvrp7DSmZv7hbPS4HnLHsuSLisbD/8bf+bUhLrsi1mgJzV1jyHqVmwes
	ce8g==
X-Gm-Message-State: AEkoouv+teGbm2OeDbUYC1A47FMLAFCB5k/gf/25XIVE7ehkLzmw48qCaOx0ZExCU1AsSS0/XfQoJt00rY2ERiw6
X-Received: by 10.202.104.4 with SMTP id d4mr19577244oic.160.1471419400579;
	Wed, 17 Aug 2016 00:36:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.241.11 with HTTP; Wed, 17 Aug 2016 00:36:10 -0700 (PDT)
In-Reply-To: <1461850657-5088-1-git-send-email-daicy.fnst@cn.fujitsu.com>
References: <1461850657-5088-1-git-send-email-daicy.fnst@cn.fujitsu.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 17 Aug 2016 10:36:10 +0300
Message-ID: <CAHiDW_GFUTsHUg3e=1QjOf+ZgUx6WptY9G2UcW_M_89Oxdr_Jw@mail.gmail.com>
To: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dbus: 1.10.8 -> 1.11.2
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
X-List-Received-Date: Wed, 17 Aug 2016 07:36:42 -0000
Content-Type: multipart/alternative; boundary=001a1140e81aafff93053a3f8668

--001a1140e81aafff93053a3f8668
Content-Type: text/plain; charset=UTF-8

On 28 April 2016 at 16:37, Dai Caiyun <daicy.fnst@cn.fujitsu.com> wrote:

> Upgrade dbus from 1.10.8 to 1.11.2.
>

1.11 is the development branch, we should not upgrade to it without a
really good reason.

Also, is there something wrong with your date settings? The date header is
from April.

Jussi


> Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-core/dbus/{dbus_1.10.8.bb => dbus_1.11.2.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-core/dbus/{dbus_1.10.8.bb => dbus_1.11.2.bb} (98%)
>
> diff --git a/meta/recipes-core/dbus/dbus_1.10.8.bb
> b/meta/recipes-core/dbus/dbus_1.11.2.bb
> similarity index 98%
> rename from meta/recipes-core/dbus/dbus_1.10.8.bb
> rename to meta/recipes-core/dbus/dbus_1.11.2.bb
> index 62dd8bb..b8c12c5 100644
> --- a/meta/recipes-core/dbus/dbus_1.10.8.bb
> +++ b/meta/recipes-core/dbus/dbus_1.11.2.bb
> @@ -20,8 +20,8 @@ SRC_URI = "http://dbus.freedesktop.org/
> releases/dbus/dbus-${PV}.tar.gz \
>             file://0001-configure.ac-explicitely-check-stdint.h.patch \
>  "
>
> -SRC_URI[md5sum] = "e912e930f249454752512aa7ac864d43"
> -SRC_URI[sha256sum] = "baf3d22baa26d3bdd9edc587736cd5
> 562196ce67996d65b82103bedbe1f0c014"
> +SRC_URI[md5sum] = "957a07f066f3730d2bb3ea0932f0081b"
> +SRC_URI[sha256sum] = "5abc4c57686fa82669ad0039830788
> f9b03fdc4fff487f0ccf6c9d56ba2645c9"
>
>  inherit useradd autotools pkgconfig gettext update-rc.d
> upstream-version-is-even
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1140e81aafff93053a3f8668
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
8 April 2016 at 16:37, Dai Caiyun <span dir=3D"ltr">&lt;<a href=3D"mailto:d=
aicy.fnst@cn.fujitsu.com" target=3D"_blank">daicy.fnst@cn.fujitsu.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">Upgrade dbus from 1.10.8=
 to 1.11.2.<br></blockquote><div><br></div><div>1.11 is the development bra=
nch, we should not upgrade to it without a really good reason.</div><div><b=
r></div><div>Also, is there something wrong with your date settings? The da=
te header is from April.</div><div><br></div><div>Jussi=C2=A0</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
Signed-off-by: Dai Caiyun &lt;<a href=3D"mailto:daicy.fnst@cn.fujitsu.com">=
daicy.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/dbus/{<a href=3D"http://dbus_1.10.8.bb" rel=3D"nore=
ferrer" target=3D"_blank">dbus_<wbr>1.10.8.bb</a> =3D&gt; <a href=3D"http:/=
/dbus_1.11.2.bb" rel=3D"noreferrer" target=3D"_blank">dbus_1.11.2.bb</a>} |=
 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-core/dbus/{<a href=3D"http://dbus_1.10.8.bb" rel=
=3D"noreferrer" target=3D"_blank">dbus_<wbr>1.10.8.bb</a> =3D&gt; <a href=
=3D"http://dbus_1.11.2.bb" rel=3D"noreferrer" target=3D"_blank">dbus_1.11.2=
.bb</a>} (98%)<br>
<br>
diff --git a/meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.8.bb" rel=
=3D"noreferrer" target=3D"_blank">dbus_<wbr>1.10.8.bb</a> b/meta/recipes-co=
re/dbus/<a href=3D"http://dbus_1.11.2.bb" rel=3D"noreferrer" target=3D"_bla=
nk">dbus_<wbr>1.11.2.bb</a><br>
similarity index 98%<br>
rename from meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.8.bb" rel=3D=
"noreferrer" target=3D"_blank">dbus_1.<wbr>10.8.bb</a><br>
rename to meta/recipes-core/dbus/<a href=3D"http://dbus_1.11.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">dbus_1.<wbr>11.2.bb</a><br>
index 62dd8bb..b8c12c5 100644<br>
--- a/meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.8.bb" rel=3D"noref=
errer" target=3D"_blank">dbus_<wbr>1.10.8.bb</a><br>
+++ b/meta/recipes-core/dbus/<a href=3D"http://dbus_1.11.2.bb" rel=3D"noref=
errer" target=3D"_blank">dbus_<wbr>1.11.2.bb</a><br>
@@ -20,8 +20,8 @@ SRC_URI =3D &quot;<a href=3D"http://dbus.freedesktop.org/=
releases/dbus/dbus-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http:=
//dbus.freedesktop.org/<wbr>releases/dbus/dbus-${PV}.tar.<wbr>gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-configure.ac-<wbr>exp=
licitely-check-stdint.h.<wbr>patch \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>e912e930f249454752512aa7ac864d<wbr>43&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>baf3d22baa26d3bdd9edc587736cd5<wbr>56219=
6ce67996d65b82103bedbe1f0<wbr>c014&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>957a07f066f3730d2bb3ea0932f008<wbr>1b&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>5abc4c57686fa82669ad0039830788<wbr>f9b03=
fdc4fff487f0ccf6c9d56ba26<wbr>45c9&quot;<br>
<br>
=C2=A0inherit useradd autotools pkgconfig gettext update-rc.d upstream-vers=
ion-is-even<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a1140e81aafff93053a3f8668--
