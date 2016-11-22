Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 788C4719CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 03:22:52 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id u15so772130oie.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 19:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=QwBOgtxxJjn8nr0yZT5DmZzmWrJDe8iPihwE33jrDNg=;
	b=Fq7qOdDrBftw9bN1Kdnso54vkC0Aa1L74BRo8K5Uv9OADcChTIIuc6yuhdbTTQUST7
	/HKiX21Y5vJHK+qbCYlTEH1OnjN8YsksbHH4d8uwj203B+kYdIW7Twf3dwUhToOMGOZA
	q4U+y0hB9hCkWrREnE4aiXSuvf64UREnQZKrt0T4kSHJBydGy1Ev0kfyz1ioCfEPkFHC
	aHnPtOI5Rm40DWxs06/nUtxmOB3AoG7I91/pxCAFSRtSz4WuSazjNBIT180DWiLAZs29
	jZNUcQz8l+RW8gfLAaxHHlrbespFq5c5Nkf3KfQ90DZXPmMkFTZZphpXR20KwIcGS1aZ
	7C8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=QwBOgtxxJjn8nr0yZT5DmZzmWrJDe8iPihwE33jrDNg=;
	b=eaCfPzHoyYf3mz+QfRDLttg7WHXy6CKRxEDvwWKh/O18TcYvfQr/JwrwW6CqC6mU9O
	JUfXvFWmSU8HpmYIkdI4M/eydxo2BOxvFi/Z6H9k686sjBGkBIHlic524bURhmmZ3fzl
	J+WX+tywGaBwApw6WtpW5CIkbysUw143cFx+LfmUnonr8DP/jFJQOIdymQldNNRZh/79
	MnaAauItkoVEtZSedOUgvpGOadm3M4oI3GvjhawGDdzROYuiFDDcWjjlq7kb0UO7IK2K
	XRB2AwiuQZD48lOuDzPTsla0bf/EwMz5MnoS5nbSnhPN/vIzgMQrg0ZyxHkq4mht9qwp
	Yf4Q==
X-Gm-Message-State: AKaTC02GSFU4CQRqj7KjKWqwH1WYxVeLWaWN+0SQvv0hPPpKndJroizA+LmCDi9EsG4iKVRqiRcqQLgZMAWt5Q==
X-Received: by 10.157.35.34 with SMTP id j31mr12234647otb.0.1479784973364;
	Mon, 21 Nov 2016 19:22:53 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.35.65 with HTTP; Mon, 21 Nov 2016 19:22:32 -0800 (PST)
In-Reply-To: <1479296396-724-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1479296396-724-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 21 Nov 2016 20:22:32 -0700
X-Google-Sender-Auth: zHRPTamkavdnokQDhNT8D788bTk
Message-ID: <CABcZANmqH9gEhO67-9_0fEinU6FhMxRsgaC0hcVrkxd9_cH1HA@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@ensc.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity: removed broken compiler check
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
X-List-Received-Date: Tue, 22 Nov 2016 03:22:52 -0000
Content-Type: multipart/alternative; boundary=001a113e1d28ae775c0541db49ef

--001a113e1d28ae775c0541db49ef
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 16, 2016 at 4:39 AM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> From: Enrico Scholz <enrico.scholz@ensc.de>
>
> The compiler check is broken because it checks for the existance of
> ${CC} as a file.  This fails with ccache with
>
> |    Please install the following missing utilities: C Compiler (ccache
> gcc ),C++ Compiler (ccache g++ )
>
> Remove this check for now.
>
> Signed-off-by: Enrico Scholz <enrico.scholz@ensc.de>
> ---
>  meta/classes/sanity.bbclass | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 7388da6..46f54df 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -669,12 +669,6 @@ def check_sanity_version_change(status, d):
>      if not check_app_exists("${MAKE}", d):
>          missing =3D missing + "GNU make,"
>
> -    if not check_app_exists('${BUILD_CC}', d):
> -        missing =3D missing + "C Compiler (%s)," % d.getVar("BUILD_CC",
> True)
> -
> -    if not check_app_exists('${BUILD_CXX}', d):
> -        missing =3D missing + "C++ Compiler (%s)," % d.getVar("BUILD_CXX=
",
> True)
> -
>

Is there a reason check_app_exists() wasn=E2=80=99t fixed to handle symlink=
s
instead?
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113e1d28ae775c0541db49ef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Nov 16, 2016 at 4:39 AM, Enrico Scholz <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:enrico.scholz@sigma-chemnitz.de" target=3D"_blank">enrico.schol=
z@sigma-chemnitz.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div id=3D":h6" class=3D"a3s aXjCH m1586cf7785f2336f">From: Enrico Scholz =
&lt;<a href=3D"mailto:enrico.scholz@ensc.de">enrico.scholz@ensc.de</a>&gt;<=
br>
<br>
The compiler check is broken because it checks for the existance of<br>
${CC} as a file.=C2=A0 This fails with ccache with<br>
<br>
|=C2=A0 =C2=A0 Please install the following missing utilities: C Compiler (=
ccache<br>
gcc ),C++ Compiler (ccache g++ )<br>
<br>
Remove this check for now.<br>
<br>
Signed-off-by: Enrico Scholz &lt;<a href=3D"mailto:enrico.scholz@ensc.de">e=
nrico.scholz@ensc.de</a>&gt;<br>
---<br>
=C2=A0meta/classes/sanity.bbclass | 6 ------<br>
=C2=A01 file changed, 6 deletions(-)<br>
<br>
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass<br>
index 7388da6..46f54df 100644<br>
--- a/meta/classes/sanity.bbclass<br>
+++ b/meta/classes/sanity.bbclass<br>
@@ -669,12 +669,6 @@ def check_sanity_version_change(<wbr>status, d):<br>
=C2=A0 =C2=A0 =C2=A0if not check_app_exists(&quot;${MAKE}&quot;, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0missing =3D missing + &quot;GNU make,&quo=
t;<br>
<br>
-=C2=A0 =C2=A0 if not check_app_exists(&#39;${BUILD_CC}&#39;<wbr>, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 missing =3D missing + &quot;C Compiler (%s),&q=
uot; % d.getVar(&quot;BUILD_CC&quot;, True)<br>
-<br>
-=C2=A0 =C2=A0 if not check_app_exists(&#39;${BUILD_CXX}<wbr>&#39;, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 missing =3D missing + &quot;C++ Compiler (%s),=
&quot; % d.getVar(&quot;BUILD_CXX&quot;, True)<br>
-</div></blockquote></div><br>Is there a reason check_app_exists() wasn=E2=
=80=99t fixed to handle symlinks instead?<br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">Christopher Larson<br>clarson at=
 kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintain=
er - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a113e1d28ae775c0541db49ef--
