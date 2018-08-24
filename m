Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 796AD7961C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 21:08:12 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id q204-v6so17606620oig.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 14:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=478DN40+kBp1eJ476QNX0lrqn5b0J58Ul3qfb//IO0Y=;
	b=fjCQcFJxJdJCN1ginHwsJrTB7/xmpMnrWbjRwoH/l+rShq8BYf1Sa0+1gVdMAc53zh
	pMgiI+JVYZdv/tg2n1AfDkIUIcdmR3spye0N4+5MivSl8a7h8JhffJ7JlhuxPcu8ny9t
	T1TrurUSqKAyXNI9JnomxJg79atKX3O5u3qAWYZXSHl0MQ6nCdsGRtCCucRZcS4mL8fT
	P5BJmXECOy2haHnwgGP+NE0e5prZLjdAGUQD81bxOygyom/llHsmi3IxE8Qg1VENm/Mx
	KCtJ0Ol1WYm2S8DCdW3+nw4FDEqKcHongWCe8jGIuxWZsI7/88zoiUuGfOI8fVIJe4MG
	Z/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=478DN40+kBp1eJ476QNX0lrqn5b0J58Ul3qfb//IO0Y=;
	b=W41XbNHUgSULhWp3ya9dNA4swwBfciR9J2AemRAFDNDOZ9rjOOzxupm/99A9GhhQ5c
	w+5dIKcBHRgaS7JeTm5394ktGrBNr0Eb9x2c23Q5gSHmd0QQm3BFp+l4hRCUEVAyMofY
	llAdIzfnW/gOF19oCZFkG49ObJVj/s93z0FSsK9z1Ch8Gy5NGiILrhVXcPWFlqX+Q/Ep
	WPUj5YfmnLPjjyCvLkeDTlrzItbGxibnZFRba5OGoOlsfyEdZlQE7IBhjLU7ksA4Y9Ua
	x9AVHgJbyVNtr8xT/2Qlqqhzwkxlju9e4z0jS0AzrNSMIH2mxXSHoRvhOuTJiMYniOoF
	BnVQ==
X-Gm-Message-State: APzg51CKCkbvMVNeMYHu9eLh5kSliBfhlrVXM/owbJzm61iE/wvBh4jl
	gVMRxW5kjcVJjYoHSvCDhREcgJ4RYViRIqTd7b29BQ==
X-Google-Smtp-Source: ANB0VdYbx9DQlHYxWFgI7WIaEd5bhdisJlxLiA5/qGN9jEtXU2V7pu+jG1gbCpBomDtDWaAEeV6egDs2WyYffoXmg/0=
X-Received: by 2002:aca:e748:: with SMTP id
	e69-v6mr2996004oih.263.1535144893211; 
	Fri, 24 Aug 2018 14:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <1534553964-16157-1-git-send-email-ankur.tyagi85@gmail.com>
	<1534553964-16157-2-git-send-email-ankur.tyagi85@gmail.com>
In-Reply-To: <1534553964-16157-2-git-send-email-ankur.tyagi85@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 25 Aug 2018 09:08:00 +1200
Message-ID: <CADySD0G+OPKMv1jCEJ1rd-aQBhAHkfzQr+LMQwGvh8NN=q-LFQ@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][sumo][master][PATCH 2/2] base-files: respect PERSISTENT_LOG_DIR
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
X-List-Received-Date: Fri, 24 Aug 2018 21:08:12 -0000
Content-Type: multipart/alternative; boundary="00000000000009ec20057434c6e9"

--00000000000009ec20057434c6e9
Content-Type: text/plain; charset="UTF-8"

Ping

Regards
Ankur

On Sat 18 Aug, 2018, 12:59 PM Ankur Tyagi, <ankur.tyagi85@gmail.com> wrote:

> Respect PERSISTENT_LOG_DIR variable. In this way, if the user overrides
> this variable to be e.g "/home/root/log", /var/log on the final image would
> be a link pointing to /home/root/log on persistent storage.
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta/recipes-core/base-files/base-files_3.0.14.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb
> b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index 1c0863b..597fdaa 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -42,7 +42,7 @@ dirs755 = "/boot /dev ${base_bindir} ${base_sbindir}
> ${base_libdir} \
>             ${localstatedir}/backups ${localstatedir}/lib \
>             /sys ${localstatedir}/lib/misc ${localstatedir}/spool \
>             ${localstatedir}/volatile \
> -           ${localstatedir}/${@'volatile/' if
> oe.types.boolean('${VOLATILE_LOG_DIR}') else ''}log \
> +           ${@'${localstatedir}/volatile/log' if
> oe.types.boolean('${VOLATILE_LOG_DIR}') else '${PERSISTENT_LOG_DIR}' if
> d.getVar('PERSISTENT_LOG_DIR') else '${localstatedir}/log' } \
>             /home ${prefix}/src ${localstatedir}/local \
>             /media"
>
> @@ -106,6 +106,10 @@ do_install () {
>                 ln -sf volatile/$d ${D}${localstatedir}/$d
>         done
>
> +       if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = False -a ! -z
> ${PERSISTENT_LOG_DIR} ]; then
> +               ln -sf ${PERSISTENT_LOG_DIR} ${D}/${localstatedir}/log
> +       fi
> +
>         ln -snf ../run ${D}${localstatedir}/run
>         ln -snf ../run/lock ${D}${localstatedir}/lock
>
> --
> 2.7.4
>
>

--00000000000009ec20057434c6e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ping<div dir=3D"auto"><br></div><div dir=3D"auto">Regards=
</div><div dir=3D"auto">Ankur</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr">On Sat 18 Aug, 2018, 12:59 PM Ankur Tyagi, &lt;<a href=3D"mai=
lto:ankur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Respect PERSISTENT_LOG_DIR variable. In th=
is way, if the user overrides<br>
this variable to be e.g &quot;/home/root/log&quot;, /var/log on the final i=
mage would<br>
be a link pointing to /home/root/log on persistent storage.<br>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.14.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">base-files_3.0.14.bb</a> | =
6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.=
14.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">base-files_3.0.14.bb=
</a> b/meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.14.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">base-files_3.0.14.bb</a><b=
r>
index 1c0863b..597fdaa 100644<br>
--- a/meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.14.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">base-files_3.0.14.bb</a><br=
>
+++ b/meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.14.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">base-files_3.0.14.bb</a><br=
>
@@ -42,7 +42,7 @@ dirs755 =3D &quot;/boot /dev ${base_bindir} ${base_sbindi=
r} ${base_libdir} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${localstatedir}/backups ${locals=
tatedir}/lib \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /sys ${localstatedir}/lib/misc ${=
localstatedir}/spool \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${localstatedir}/volatile \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${localstatedir}/${@&#39;volatile=
/&#39; if oe.types.boolean(&#39;${VOLATILE_LOG_DIR}&#39;) else &#39;&#39;}l=
og \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@&#39;${localstatedir}/volatile=
/log&#39; if oe.types.boolean(&#39;${VOLATILE_LOG_DIR}&#39;) else &#39;${PE=
RSISTENT_LOG_DIR}&#39; if d.getVar(&#39;PERSISTENT_LOG_DIR&#39;) else &#39;=
${localstatedir}/log&#39; } \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /home ${prefix}/src ${localstated=
ir}/local \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /media&quot;<br>
<br>
@@ -106,6 +106,10 @@ do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf volatile/$d =
${D}${localstatedir}/$d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${@ oe.types.boolean(&#39;${VOLATILE_LOG_D=
IR}&#39;) } =3D False -a ! -z ${PERSISTENT_LOG_DIR} ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${PERSISTENT=
_LOG_DIR} ${D}/${localstatedir}/log<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -snf ../run ${D}${localstatedir}/run<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -snf ../run/lock ${D}${localstatedir}/lock<b=
r>
<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div>

--00000000000009ec20057434c6e9--
