Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id BD1BD71A1C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 20:15:38 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id m75so20072313oig.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 12:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ixAdtOoAkTP020KylcgR8zFwkse+IhCpHqhM+S4f014=;
	b=AUi7MuTYo3Jqarb0iP7CExA/RS9gTqpoRFXa2cz1F2OyWLOuDszHMTqpZb42/hmPo1
	w5rA0/aN9tkzHVgJzW569386FGJnlftluocZwNxsp8e79iS80mjBc65qgcvv6CVHg+JR
	FkrDFUE1gIHHxb8YLQRWSrwC0wED4o2vYGOIjvtv2HAn2+26PQsMouvlegJEDgFi8UCb
	IaSDEsDUz4n7UXLKdSxF5ylKSspTLuQesed/WoJvtH4FLvd9aZmJSzQYobZErE6dXe6u
	igykhp8muzGXsjvJ8gKccHQSZaU+Iei5PM5eQRY91Giik10yd0HhsbdehU0rvN1sH8cj
	vQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=ixAdtOoAkTP020KylcgR8zFwkse+IhCpHqhM+S4f014=;
	b=hOswtM0Aay/brg432kNtjEwlQZFlpCHZtzKB0m0MUU7+eyEf8LWWA36FdqTmNYo9Yc
	sQWYsi/S4HQV5lN7cQvKklPTJTbCO8U9t8UsyINx4dqg9MtbkurCaKyXdBUV93ky49JB
	M1B4v7aP24s5d6yb3gJBzuI61ZYzyCaDGSZkL6et+bHMqMIIEDV72UEBdIi0kPv70/qv
	oKe9iDISULNXyVGvmcnq+l9fMIprOrMtxto2s3GIQANiY5v4X4uvrlgxqcnDTCO8JxQ/
	+KUyrlEEXSvmX8HwAIt6WfAFphckaHLYdUB3AJdisWkgKY+z/LDiKFbpze1BTcfNmQyM
	tmUw==
X-Gm-Message-State: AKaTC00vIOm95wUdUXYMXo4UDBk6uYb09EZvGZfrQ6pTSsu1Zo69YKxVREyMyCK1x6Ymtux1wnHfMbq8zagf4w==
X-Received: by 10.202.231.68 with SMTP id e65mr16139837oih.200.1480450540015; 
	Tue, 29 Nov 2016 12:15:40 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.14.20 with HTTP; Tue, 29 Nov 2016 12:15:19 -0800 (PST)
In-Reply-To: <1480444188-27310-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
References: <1480444188-27310-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 29 Nov 2016 13:15:19 -0700
X-Google-Sender-Auth: Un6nCkSYwpHoc_KzWCRdbWXbNCU
Message-ID: <CABcZANnQ87Q=h4-ponSyGP_-Q8bsRPfMOQ+UZWf0S7i85D2-GQ@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sysvinit-inittab: fix getty device removal
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
X-List-Received-Date: Tue, 29 Nov 2016 20:15:41 -0000
Content-Type: multipart/alternative; boundary=001a1141ba248b990f054276409d

--001a1141ba248b990f054276409d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2016 at 11:29 AM, <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> getty devices were not being removed in some cases because device name
> was not at the end of the line, for example a ttyS1 device:
>
> S1:12345:respawn:/bin/start_getty 115200 ttyS1 vt102
>
> Removing this limitation allows sed to remove any line containing
> the device.
>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@
> linux.intel.com>
> ---
>  meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> index c219cbf..dd30f43 100644
> --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> @@ -62,7 +62,7 @@ if [ "x$D" =3D "x" ] && [ -e /proc/consoles ]; then
>                 k=3D`echo ${i} | sed s/^.*\://g`
>                 if [ -z "`grep ${j} /proc/consoles`" ]; then
>                         if [ -z "${k}" ] || [ -z "`grep ${k}
> /proc/consoles`" ] || [ ! -e /dev/${j} ]; then
> -                               sed -i /^.*${j}$/d /etc/inittab
> +                               sed -i /^.*${j}/d /etc/inittab
>

This doesn=E2=80=99t check for the end of a word, so it=E2=80=99d match a p=
artial as well.
Would that be a problem? i.e. ttyS1 vs ttyS10.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1141ba248b990f054276409d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Nov 29, 2016 at 11:29 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:=
leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sand=
oval.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div id=3D":2m0" class=3D"a3s aXjCH m158b154f368e9e70">From: Leo=
nardo Sandoval &lt;<a href=3D"mailto:leonardo.sandoval.gonzalez@linux.intel=
.com">leonardo.sandoval.gonzalez@<wbr>linux.intel.com</a>&gt;<br>
<br>
getty devices were not being removed in some cases because device name<br>
was not at the end of the line, for example a ttyS1 device:<br>
<br>
S1:12345:respawn:/bin/start_<wbr>getty 115200 ttyS1 vt102<br>
<br>
Removing this limitation allows sed to remove any line containing<br>
the device.<br>
<br>
Signed-off-by: Leonardo Sandoval &lt;<a href=3D"mailto:leonardo.sandoval.go=
nzalez@linux.intel.com">leonardo.sandoval.gonzalez@<wbr>linux.intel.com</a>=
&gt;<br>
---<br>
=C2=A0meta/recipes-core/sysvinit/<a href=3D"http://sysvinit-inittab_2.88dsf=
.bb" rel=3D"noreferrer" target=3D"_blank">sys<wbr>vinit-inittab_2.88dsf.bb<=
/a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/sysvinit/<a href=3D"http://sysvinit-inittab_=
2.88dsf.bb" rel=3D"noreferrer" target=3D"_blank">s<wbr>ysvinit-inittab_2.88=
dsf.bb</a> b/meta/recipes-core/sysvinit/<a href=3D"http://sysvinit-inittab_=
2.88dsf.bb" rel=3D"noreferrer" target=3D"_blank">s<wbr>ysvinit-inittab_2.88=
dsf.bb</a><br>
index c219cbf..dd30f43 100644<br>
--- a/meta/recipes-core/sysvinit/<a href=3D"http://sysvinit-inittab_2.88dsf=
.bb" rel=3D"noreferrer" target=3D"_blank">s<wbr>ysvinit-inittab_2.88dsf.bb<=
/a><br>
+++ b/meta/recipes-core/sysvinit/<a href=3D"http://sysvinit-inittab_2.88dsf=
.bb" rel=3D"noreferrer" target=3D"_blank">s<wbr>ysvinit-inittab_2.88dsf.bb<=
/a><br>
@@ -62,7 +62,7 @@ if [ &quot;x$D&quot; =3D &quot;x&quot; ] &amp;&amp; [ -e =
/proc/consoles ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k=3D`echo ${i} | se=
d s/^.*\://g`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &quot;`grep=
 ${j} /proc/consoles`&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if [ -z &quot;${k}&quot; ] || [ -z &quot;`grep ${k} /proc/consol=
es`&quot; ] || [ ! -e /dev/${j} ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i /^.*${j}$/d /etc/inittab<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i /^.*${j}/d /etc/inittab</div><=
/blockquote></div><br>This doesn=E2=80=99t check for the end of a word, so =
it=E2=80=99d match a partial as well. Would that be a problem? i.e. ttyS1 v=
s ttyS10.<br>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_=
signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - Bi=
tBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software En=
gineer, Mentor Graphics</div>
</div></div>

--001a1141ba248b990f054276409d--
