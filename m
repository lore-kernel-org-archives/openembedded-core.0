Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5813574703
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 18:26:40 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id 14-v6so12327085oie.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 11:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=u14TWJ2khYL0JLOrUhVH+gIo532HYK8nn2Jipaih1A0=;
	b=hJGcy/uAx5nFDfnKEu1dF/q3eDN7fDm0yY9LbijA3pq2N/8ZUXPPr0Vvxowxiyws++
	Ns5s1/m3tQHDq6FAjjCKwQH7SNQnft8kEEnfGTNj7T+SPguJ1qcSL+pUoqIof9mU2v6d
	tkH3c0s42tD8Q2FakF8E/eVnir1OJluXTpSb1UxDSf3R5S9tzP8wucrCjuZxU7tyDyk1
	qjhGQVz+PneKOxWs2hyJ2DIG6e1qaIJv67Lhbg6sA2+bFACBmK3TV45WvcvMu9QsAvm2
	cqcFciD4fLApkvyORkUYo50VA+6DIwXdZJZIjNZta5RxXpY2iMu6cNdIhhu+u1ka8b/X
	O4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=u14TWJ2khYL0JLOrUhVH+gIo532HYK8nn2Jipaih1A0=;
	b=puah2LpSfh+vXmZh/SS/QsCRNUO207f3zUzuxIIO6GBZhOvdYMesgOtq9hhG2mFJa8
	Z2s45ZTXvE44jPtIa04Zn86Kmai2gjLZlPdGy5OA3zf1B2akDTFJ3IyUInuxEOBHXfos
	8frSHDEuurzwzPbK4QdDAHoNekLq8aLlUU4a/nypDNOgAjiyBMel6dw5265ThyeGzAVV
	1oA8MGtgGVDlzz4o0XrBAcXiMMp51Oc2w1/DHZGbGzk70bLMh4kbjzj+oMPwbppceBwG
	soh3un4K1c5pdpn2sfhOTdHx+PWEy9+uALaz4pfor/S8Z9OvHJ4TAJy3WMjE3jWCQotr
	X3rw==
X-Gm-Message-State: ALKqPwfafbifZLUEwcPZmNzmFYHkTKKV2YPgpKv5DFi0EO6VzoP82Fir
	J0oTIWr7/yLWWiO7JV+u42sS6E0QVpAhN5tBcyc=
X-Google-Smtp-Source: ADUXVKJlrFcsA5nRLYYM/qdOaxWhh7skVJPbh5eFVaIP09RtO79cPs63cVY7Ed7RrwDzGX2fbo4rcNZVOvEh8kJOs8I=
X-Received: by 2002:aca:3d05:: with SMTP id
	k5-v6mr4800755oia.302.1527791201963; 
	Thu, 31 May 2018 11:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20180531172504.28519-1-nick83ola@gmail.com>
In-Reply-To: <20180531172504.28519-1-nick83ola@gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 31 May 2018 11:26:30 -0700
Message-ID: <CABcZANmKZM=D6DG2Y=iAtsODD7b+4GqHsZUiHdR=9rDUaiN_5w@mail.gmail.com>
To: nick83ola@gmail.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core: fix /sbin/nologin path
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
X-List-Received-Date: Thu, 31 May 2018 18:26:41 -0000
Content-Type: multipart/alternative; boundary="000000000000e260d8056d849b11"

--000000000000e260d8056d849b11
Content-Type: text/plain; charset="UTF-8"

On Thu, May 31, 2018 at 10:25 AM Nicola Lunghi <nick83ola@gmail.com> wrote:

> In some yocto recipes the /sbin/nologin path is incorrectly set to
> /bin/nologin. set it to the correct path ${base_sbindir}/nologin
>
> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> ---
>  meta-selftest/files/static-passwd        | 20 ++++++++++----------
>  meta/classes/rootfs-postcommands.bbclass |  6 +++---
>  meta/recipes-core/systemd/systemd_237.bb | 19 +++++++++++--------
>  3 files changed, 24 insertions(+), 21 deletions(-)
>
> diff --git a/meta-selftest/files/static-passwd
> b/meta-selftest/files/static-passwd
> index 412f85d469..fe1f3247d4 100644
> --- a/meta-selftest/files/static-passwd
> +++ b/meta-selftest/files/static-passwd
> @@ -1,11 +1,11 @@
>  messagebus:x:500:500::/var/lib/dbus:/bin/false
> -systemd-bus-proxy:x:501:501::/:/bin/nologin
> -systemd-network:x:502:502::/:/bin/nologin
> -systemd-resolve:x:503:503::/:/bin/nologin
> -systemd-timesync:x:504:504::/:/bin/nologin
> -polkitd:x:505:505::/:/bin/nologin
> -avahi:x:509:509::/:/bin/nologin
> -avahi-autoipd:x:510:510::/:/bin/nologin
> -rpc:x:511:511::/:/bin/nologin
> -distcc:x:512:nogroup::/:/bin/nologin
> -rpcuser:x:513:513::/var/lib/nfs:/bin/nologin
> +systemd-bus-proxy:x:501:501::/:/sbin/nologin
> +systemd-network:x:502:502::/:/sbin/nologin
> +systemd-resolve:x:503:503::/:/sbin/nologin
> +systemd-timesync:x:504:504::/:/sbin/nologin
> +polkitd:x:505:505::/:/sbin/nologin
> +avahi:x:509:509::/:/sbin/nologin
> +avahi-autoipd:x:510:510::/:/sbin/nologin
> +rpc:x:511:511::/:/sbin/nologin
> +distcc:x:512:nogroup::/:/sbin/nologin
> +rpcuser:x:513:513::/var/lib/nfs:/sbin/nologin
> diff --git a/meta/classes/rootfs-postcommands.bbclass
> b/meta/classes/rootfs-postcommands.bbclass
> index a4e627fef8..0ee7391957 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -62,8 +62,8 @@ systemd_create_users () {
>         for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf
> ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
>                 [ -e $conffile ] || continue
>                 grep -v "^#" $conffile | sed -e '/^$/d' | while read type
> name id comment; do
> -               if [ "$type" = "u" ]; then
> -                       useradd_params="--shell /sbin/nologin"
> +               if [ "$type" = "u" ]; then:w
>

This won't run as is. ";then:w"
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000e260d8056d849b11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu=
, May 31, 2018 at 10:25 AM Nicola Lunghi &lt;<a href=3D"mailto:nick83ola@gm=
ail.com">nick83ola@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">In some yocto recipes the /sbin/nologin path is incorrectly set to=
<br>
/bin/nologin. set it to the correct path ${base_sbindir}/nologin<br>
<br>
Signed-off-by: Nicola Lunghi &lt;<a href=3D"mailto:nick83ola@gmail.com" tar=
get=3D"_blank">nick83ola@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-selftest/files/static-passwd=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 20 +++=
+++++++----------<br>
=C2=A0meta/classes/rootfs-postcommands.bbclass |=C2=A0 6 +++---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_237.bb</a> | 19 +++++++++++--------<br>
=C2=A03 files changed, 24 insertions(+), 21 deletions(-)<br>
<br>
diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static=
-passwd<br>
index 412f85d469..fe1f3247d4 100644<br>
--- a/meta-selftest/files/static-passwd<br>
+++ b/meta-selftest/files/static-passwd<br>
@@ -1,11 +1,11 @@<br>
=C2=A0messagebus:x:500:500::/var/lib/dbus:/bin/false<br>
-systemd-bus-proxy:x:501:501::/:/bin/nologin<br>
-systemd-network:x:502:502::/:/bin/nologin<br>
-systemd-resolve:x:503:503::/:/bin/nologin<br>
-systemd-timesync:x:504:504::/:/bin/nologin<br>
-polkitd:x:505:505::/:/bin/nologin<br>
-avahi:x:509:509::/:/bin/nologin<br>
-avahi-autoipd:x:510:510::/:/bin/nologin<br>
-rpc:x:511:511::/:/bin/nologin<br>
-distcc:x:512:nogroup::/:/bin/nologin<br>
-rpcuser:x:513:513::/var/lib/nfs:/bin/nologin<br>
+systemd-bus-proxy:x:501:501::/:/sbin/nologin<br>
+systemd-network:x:502:502::/:/sbin/nologin<br>
+systemd-resolve:x:503:503::/:/sbin/nologin<br>
+systemd-timesync:x:504:504::/:/sbin/nologin<br>
+polkitd:x:505:505::/:/sbin/nologin<br>
+avahi:x:509:509::/:/sbin/nologin<br>
+avahi-autoipd:x:510:510::/:/sbin/nologin<br>
+rpc:x:511:511::/:/sbin/nologin<br>
+distcc:x:512:nogroup::/:/sbin/nologin<br>
+rpcuser:x:513:513::/var/lib/nfs:/sbin/nologin<br>
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs=
-postcommands.bbclass<br>
index a4e627fef8..0ee7391957 100644<br>
--- a/meta/classes/rootfs-postcommands.bbclass<br>
+++ b/meta/classes/rootfs-postcommands.bbclass<br>
@@ -62,8 +62,8 @@ systemd_create_users () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for conffile in ${IMAGE_ROOTFS}/usr/lib/sysuser=
s.d/systemd.conf ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -e $conffile ] ||=
 continue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grep -v &quot;^#&qu=
ot; $conffile | sed -e &#39;/^$/d&#39; | while read type name id comment; d=
o<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$type&qu=
ot; =3D &quot;u&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0useradd_params=3D&quot;--shell /sbin/nologin&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$type&qu=
ot; =3D &quot;u&quot; ]; then:w<br></blockquote><div><br></div><div class=
=3D"">This won&#39;t run as is. &quot;;then:w&quot;<br></div></div>-- <br><=
div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature=
"><div dir=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at g=
mail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Softw=
are Engineer, Mentor Graphics</div></div></div></div></div>

--000000000000e260d8056d849b11--
