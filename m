Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3314760034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 20:29:45 +0000 (UTC)
Received: by iegc3 with SMTP id c3so49336501ieg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 13:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=uFArXFf5XoGYvkYIwhEFa290/frkXP6uGjmZ5/5Vt4A=;
	b=UqBEKpweg6FexAU3jhGQlSzcsmnJSiMd0QteFmGc+h/4qIwbJ0z4HqvWjooo+pPH85
	fEU4ejfoFtcplD/0UHLkAe4Sc/AaL7ImWfRKdEr8geirKqRldf3lEqFXugyKzOnzODaS
	UzLnz0jmM7cdHZFcOUZQ4qzKOZWTQN0FCoWojC4P/kgx5d7NSkKypsJ6Je5tPLJ1vG2V
	wxKoGBI4vrheAU7AYjDTG1voSt/9b7Trp2DO/cTSRD8qYsmLbsxwfmkQB9CwaMvvcoNE
	0EWLZblAF+NWuEgOIBiq8f+FUu3K+7ySIC6qXiVl0xqOYWQ7l9OCHNdES+2PB3J53640
	Zxog==
MIME-Version: 1.0
X-Received: by 10.42.89.72 with SMTP id f8mr74711154icm.24.1426710586925; Wed,
	18 Mar 2015 13:29:46 -0700 (PDT)
Received: by 10.50.117.7 with HTTP; Wed, 18 Mar 2015 13:29:46 -0700 (PDT)
Received: by 10.50.117.7 with HTTP; Wed, 18 Mar 2015 13:29:46 -0700 (PDT)
In-Reply-To: <1426681293-30112-1-git-send-email-benjamin.esquivel@linux.intel.com>
References: <1426681293-30112-1-git-send-email-benjamin.esquivel@linux.intel.com>
Date: Wed, 18 Mar 2015 13:29:46 -0700
Message-ID: <CAMKF1spV93W=+jfSvC_7JsuC8xokm5V=4PB3y4TUEO03iCow-g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Cc: Khemraj Sharma <khem.raj@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: avoid configure stall by feeding prompt
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
X-List-Received-Date: Wed, 18 Mar 2015 20:29:48 -0000
Content-Type: multipart/alternative; boundary=90e6ba6147e2bb2c71051195f171

--90e6ba6147e2bb2c71051195f171
Content-Type: text/plain; charset=UTF-8

That's ok
On Mar 18, 2015 1:28 PM, "Benjamin Esquivel" <
benjamin.esquivel@linux.intel.com> wrote:

> Addresses a stall (by prompt) condition of the run.do_configure at when
> executed directly from the workdir, like when using the devshell.
>
> [YOCTO 7369]
>
> Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
> ---
>  meta/recipes-core/glibc/glibc.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc.inc
> b/meta/recipes-core/glibc/glibc.inc
> index 767d4b8..835f4ae 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -82,7 +82,7 @@ do_configure_prepend() {
>  }
>
>  do_configure_append() {
> -       oe_runmake config
> +       yes '' | oe_runmake config
>
>         # Remove quotation marks from OPTION_EGLIBC_NSSWITCH_FIXED_*. This
> will
>         # avoid install error.
> --
> 1.8.4.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--90e6ba6147e2bb2c71051195f171
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">That&#39;s ok</p>
<div class=3D"gmail_quote">On Mar 18, 2015 1:28 PM, &quot;Benjamin Esquivel=
&quot; &lt;<a href=3D"mailto:benjamin.esquivel@linux.intel.com">benjamin.es=
quivel@linux.intel.com</a>&gt; wrote:<br type=3D"attribution"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">Addresses a stall (by prompt) condition of the run.do_con=
figure at when<br>
executed directly from the workdir, like when using the devshell.<br>
<br>
[YOCTO 7369]<br>
<br>
Signed-off-by: Benjamin Esquivel &lt;<a href=3D"mailto:benjamin.esquivel@li=
nux.intel.com">benjamin.esquivel@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/glibc.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/gl=
ibc.inc<br>
index 767d4b8..835f4ae 100644<br>
--- a/meta/recipes-core/glibc/glibc.inc<br>
+++ b/meta/recipes-core/glibc/glibc.inc<br>
@@ -82,7 +82,7 @@ do_configure_prepend() {<br>
=C2=A0}<br>
<br>
=C2=A0do_configure_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake config<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0yes &#39;&#39; | oe_runmake config<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove quotation marks from OPTION_EGLIBC_NSS=
WITCH_FIXED_*. This will<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # avoid install error.<br>
--<br>
1.8.4.5<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</blockquote></div>

--90e6ba6147e2bb2c71051195f171--
