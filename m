Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8673E60123
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 17:18:27 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id k6so435091ita.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 09:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0HCcvtkjIw8zS8fd0Uvwk06Mw6Jse/To+3snS2kx9/w=;
	b=veygX2ciVEU5zbYoewDZd52oDZe21WochSfM0idiawB3XuZViR3weJmbeibaPfpKcu
	I1yfHZQAAahbvR9C/9DTeIOVH8lRMm6WzW8AA8TXJI0LwQr3KfMS9friU9dw0/6+cdWW
	eu4cEzd/Y++ORia5JM7Q0n/5JYOKk7XVA/URZZ24DAL/F5YDoC98xagakKAaOmL0UdvH
	CJZjZ34eV7OIz6jpwRriMuXqlhNMAMrtyt7wUZPI2Ju6FhOq0/X16F2Dq7QzmBgRjjUF
	riqhr6Edjq8+al/UhA4aPcLftj5KFzuFKIQLiiMCQcsjN1Rdk0Cfc98ZG/JTcK/zpFnO
	5wwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0HCcvtkjIw8zS8fd0Uvwk06Mw6Jse/To+3snS2kx9/w=;
	b=Obw7HZtksdVNDBop1qIXMuyvqVvxfjWs9V4qAzBr1BHRC6WHVFS+0ltcnZ2m16UxSD
	KdBNkeObw85wJwLCMisq702gCt1VsyRTWTBrjCxBKNR+kpBOCOgZWpx5Cr21OLhfK9e/
	cEbJzdYsq+l1pd5CAR+yciYtS3cJJhLuKt+cJQch8Mms5C4PwtaxUMF+TzyijyPiUtXq
	tRH5ykKEZ1fNdcCEtu3LSUjn0XHfbFddiz6/hvW2NlzD5AYlxyemrizxmH9XNzf0WYP9
	WjmB4ZgGxhAM3p1Hc2nAiF3TZY4ZyXnf+SYt8xfM1/2e7j2jtc1MIKCaLVroCNTj5jtG
	OLeA==
X-Gm-Message-State: AKwxyteNj0K794WpZ/SAQzk1I1nQBl01KbSEYBHHOG21ZVLSohQ3VDNO
	qDb9z2DvoNyxPSzBOd26p8RAO6EY54derXs+jZibDw==
X-Google-Smtp-Source: AH8x227wHA7P7FjEWVk25M/HcYOeWYPte9EGTHIz3GXljVHl0PAmgEFjzvx3PELxiwkxTTJi/ontyk6QdncUbMRo2Ik=
X-Received: by 10.36.145.143 with SMTP id i137mr23318207ite.6.1517419109530;
	Wed, 31 Jan 2018 09:18:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Wed, 31 Jan 2018 09:18:09 -0800 (PST)
In-Reply-To: <20180131170230.7183-1-JPEWhacker@gmail.com>
References: <20180131170230.7183-1-JPEWhacker@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 31 Jan 2018 17:18:09 +0000
Message-ID: <CAJTo0LZzB1AobM97HtfsDxZUQf0o+oQekNBGTVsuWxkMp98tpw@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Joe Slater <jslater@windriver.com>, Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] waf.bbclass: cd to ${S} before checking version
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
X-List-Received-Date: Wed, 31 Jan 2018 17:18:28 -0000
Content-Type: multipart/alternative; boundary="94eb2c0ef16effd314056415aaf2"

--94eb2c0ef16effd314056415aaf2
Content-Type: text/plain; charset="UTF-8"

On 31 January 2018 at 17:02, Joshua Watt <jpewhacker@gmail.com> wrote:

> waf requires that the current working directory be the project root (in
> this case ${S} when it is invoked. The check to get the waf version was
> being executed as a prefunc for do_configure, which meant it was
> executed before the current working directory was switched to ${S}, and
> thus would fail with some recipes. Fix this by changing to ${S} before
> executing "waf --version"
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/waf.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> index c3e744e5de..f72ddb7814 100644
> --- a/meta/classes/waf.bbclass
> +++ b/meta/classes/waf.bbclass
> @@ -29,7 +29,8 @@ python waf_preconfigure() {
>      from distutils.version import StrictVersion
>      srcsubdir = d.getVar('S')
>      wafbin = os.path.join(srcsubdir, 'waf')
> -    status, result = oe.utils.getstatusoutput(wafbin + " --version")
> +    cmd = "cd '%s'; %s --version" % (srcsubdir, wafbin)
> +    status, result = oe.utils.getstatusoutput(cmd)
>

I'm being really picky but getstatusoutput is horrible.  How about:

subprocess.check_output(['waf', '--version', cwd=srcsubdir)

Less faffing with the shell, and more modern code.

Ross

--94eb2c0ef16effd314056415aaf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 31 January 2018 at 17:02, Joshua Watt <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:jpewhacker@gmail.com" target=3D"_blank">jpewhacker@g=
mail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">waf requires that the current w=
orking directory be the project root (in<br>
this case ${S} when it is invoked. The check to get the waf version was<br>
being executed as a prefunc for do_configure, which meant it was<br>
executed before the current working directory was switched to ${S}, and<br>
thus would fail with some recipes. Fix this by changing to ${S} before<br>
executing &quot;waf --version&quot;<br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com">JPEW=
hacker@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/waf.bbclass | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass<br>
index c3e744e5de..f72ddb7814 100644<br>
--- a/meta/classes/waf.bbclass<br>
+++ b/meta/classes/waf.bbclass<br>
@@ -29,7 +29,8 @@ python waf_preconfigure() {<br>
=C2=A0 =C2=A0 =C2=A0from distutils.version import StrictVersion<br>
=C2=A0 =C2=A0 =C2=A0srcsubdir =3D d.getVar(&#39;S&#39;)<br>
=C2=A0 =C2=A0 =C2=A0wafbin =3D os.path.join(srcsubdir, &#39;waf&#39;)<br>
-=C2=A0 =C2=A0 status, result =3D oe.utils.getstatusoutput(<wbr>wafbin + &q=
uot; --version&quot;)<br>
+=C2=A0 =C2=A0 cmd =3D &quot;cd &#39;%s&#39;; %s --version&quot; % (srcsubd=
ir, wafbin)<br>
+=C2=A0 =C2=A0 status, result =3D oe.utils.getstatusoutput(cmd)<br></blockq=
uote><div><br></div><div>I&#39;m being really picky but getstatusoutput is =
horrible.=C2=A0 How about:</div><div><br></div><div>subprocess.check_output=
([&#39;waf&#39;, &#39;--version&#39;, cwd=3Dsrcsubdir)</div><div><br></div>=
<div>Less faffing with the shell, and more modern code.</div><div><br></div=
><div>Ross</div></div></div></div>

--94eb2c0ef16effd314056415aaf2--
