Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (unknown [209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 730BA6601E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 03:08:21 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id ar20so1291946iec.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 20:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6w0uxMGy6RC6ihquoZk7ARs9BIxQEIdJxjAn+IgZNXY=;
	b=LeIaIXjuSydrBKfLOhaTKvEf2tOgamGQgv1nFtW6kN90XEW53RG1rbMz05wXIPMlFq
	IYvt+jmnRMmVAE1HYZKbp9WbL/YozttloTm8d26Mv4HU0Aj/F2Y1j9lviGn6Vll82haL
	mNKM3CBSNlOV0VYXpHW/LmXLPncRra431lYiUNkAE743suZQNvBYNAhjTfQDcfsBX4SR
	O4EnryKoZyT+Q2h7Fq7TngMFUktokZ02GPaeITiSy9YY51PQCtj3EJIK9qKHlocEEU7S
	RasUNl8RjS3oBaG82mTwRFn8e/xrIZM7hycZKFue9zTuCT0V1VcJyQnnWoUgi8mBssRM
	R1ag==
X-Received: by 10.42.214.143 with SMTP id ha15mr634115icb.59.1400036902979;
	Tue, 13 May 2014 20:08:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.133 with HTTP; Tue, 13 May 2014 20:07:52 -0700 (PDT)
In-Reply-To: <CAGw0TDMuODtcF6P-DFDsGg3d4Vuvgu0nuHG5muAFDBuO=6ZDoA@mail.gmail.com>
References: <CAGw0TDMuODtcF6P-DFDsGg3d4Vuvgu0nuHG5muAFDBuO=6ZDoA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 May 2014 20:07:52 -0700
Message-ID: <CAMKF1srioT7m2MTSKJ-fh+43jWH2HX-PoFCTPigybwh-81QySg@mail.gmail.com>
To: Charles Oram <charles@oram.co.nz>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] libmtp_1.1.5.bb : Fix 'Makefile.am: No such file or directory' build error.
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
X-List-Received-Date: Wed, 14 May 2014 03:08:33 -0000
Content-Type: multipart/alternative; boundary=20cf301d439a464dea04f9537eb8

--20cf301d439a464dea04f9537eb8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2014 at 7:10 PM, Charles Oram <charles@oram.co.nz> wrote:

> libmtp_1.1.5.bb : Fix "Makefile.am: No such file or directory" build
> error.
>
> skip_udev_rules_generation() needs to reference Makefile.am in the recipe
> source directory.
>
>
=E2=80=8BLooks good though it belongs to a oe devel mailing list.=E2=80=8B



> Signed-off-by: Charles Oram <charles at oram.co.nz <http://lists.openembe=
dded.org/mailman/listinfo/openembedded-core>>
>
> ---
>  meta-oe/recipes-connectivity/
> libmtp/libmtp_1.1.5.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bbb/meta-oe=
/recipes-connectivity/libmtp/
> libmtp_1.1.5.bb
> index f4ea800..e164f49 100644
> --- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
> +++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
> @@ -29,7 +29,7 @@ do_unpack[vardeps] +=3D "skip_udev_rules_generation"
>  do_unpack[postfuncs] +=3D "skip_udev_rules_generation"
>
>  skip_udev_rules_generation () {
> -       sed -i -e '/^noinst_DATA=3D/,/util\/mtp-hotplug -H/d' Makefile.am
> +       sed -i -e '/^noinst_DATA=3D/,/util\/mtp-hotplug -H/d'
> ${S}/Makefile.am
>         cp ${WORKDIR}/69-libmtp.rules ${S}/
>  }
>
>
> --
> 1.7.10.4
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--20cf301d439a464dea04f9537eb8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif"><br></div><div class=3D"gmail_extra"><br><br><div class=3D"gmai=
l_quote">On Tue, May 13, 2014 at 7:10 PM, Charles Oram <span dir=3D"ltr">&l=
t;<a href=3D"mailto:charles@oram.co.nz" target=3D"_blank">charles@oram.co.n=
z</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><font><span style=3D"font-f=
amily:arial,helvetica,sans-serif"><a href=3D"http://libmtp_1.1.5.bb" target=
=3D"_blank">libmtp_1.1.5.bb</a> : Fix &quot;Makefile.am: No such file or di=
rectory&quot; build error.<br>

<br>skip_udev_rules_generation() needs to reference Makefile.am in the reci=
pe source directory.<br>
<br></span></font><pre><font><span style=3D"font-family:arial,helvetica,san=
s-serif"></span></font></pre></div></blockquote><div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-family:verdana,sans-serif">=E2=80=8BLoo=
ks good though it belongs to a oe devel mailing list.=E2=80=8B</div>

<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">=
<pre><font><span style=3D"font-family:arial,helvetica,sans-serif">Signed-of=
f-by: Charles Oram &lt;<a href=3D"http://lists.openembedded.org/mailman/lis=
tinfo/openembedded-core" target=3D"_blank">charles at oram.co.nz</a>&gt;</s=
pan></font><br>


</pre>---<br>
=C2=A0meta-oe/recipes-connectivity/<div>libmtp/<a href=3D"http://libmtp_1.1=
.5.bb" target=3D"_blank">libmtp_1.1.5.bb</a> | =C2=A0 =C2=A02 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-connectivity/libmtp/<a href=3D"http://libmtp_1=
.1.5.bb" target=3D"_blank">libmtp_1.1.5.bb</a> b/meta-oe/recipes-connectivi=
ty/libmtp/<a href=3D"http://libmtp_1.1.5.bb" target=3D"_blank">libmtp_1.1.5=
.bb</a><br>



index f4ea800..e164f49 100644<br>
--- a/meta-oe/recipes-connectivity/libmtp/<a href=3D"http://libmtp_1.1.5.bb=
" target=3D"_blank">libmtp_1.1.5.bb</a><br>
+++ b/meta-oe/recipes-connectivity/libmtp/<a href=3D"http://libmtp_1.1.5.bb=
" target=3D"_blank">libmtp_1.1.5.bb</a><br>
@@ -29,7 +29,7 @@ do_unpack[vardeps] +=3D &quot;skip_udev_rules_generation&=
quot;<br>
=C2=A0do_unpack[postfuncs] +=3D &quot;skip_udev_rules_generation&quot;<br>
<br>
=C2=A0skip_udev_rules_generation () {<br>
- =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;/^noinst_DATA=3D/,/util\/mtp-hotplug =
-H/d&#39; Makefile.am<br>
+ =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;/^noinst_DATA=3D/,/util\/mtp-hotplug =
-H/d&#39; ${S}/Makefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/69-libmtp.rules ${S}/<br>
=C2=A0}<div><div><img src=3D"https://mail.google.com/mail/u/0/images/cleard=
ot.gif"></div></div><div><br>
</div><span><font color=3D"#888888"><br>
--<br>
1.7.10.4</font></span></div><br></div>
<br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
<br></blockquote></div><br></div></div>

--20cf301d439a464dea04f9537eb8--
