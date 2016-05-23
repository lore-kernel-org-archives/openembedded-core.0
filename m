Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4758562135
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 22:30:06 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id 190so233328iow.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 15:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=UfxMugG2m9FOYBnrS6S1Ggr4UqslrjppmyV6MFEQsp0=;
	b=hiNejLkZeU7X/YAubL1aCy9/rbeDFHt4DAfKaJxwOZhuhAAfyO27h31/UOpNvtYo6n
	W+/OZSLImbA8uugcQaeM2q/fXEbATIXz1ADrbkmp0r6qyv2JOrV1+wING+5dvoHxbjxx
	sLOpjcrNl9Dr49lGVitcG9nIiJMw6h2QC/5Ls7QyLGHtp7BaWVAinbl92SKKC9m8JR6/
	PJA91AovzuaL+eNAWtTE/7Yuin2ACC0YN2CMuKcF37DLDPqWFzaOhNCbGHgBbm4nagN2
	J7aOasy0ePBXPwmio4I8m4IzijFm85oWQCagw2PV3EPhZ/bgVcy2FdMzUkz9IXKN92Ek
	larQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=UfxMugG2m9FOYBnrS6S1Ggr4UqslrjppmyV6MFEQsp0=;
	b=Un8KEmRWrA15o6VhaRj3kn5qs7bz4KrFe2XjtDaJ9Gb8W/98tmRkJWpt1sbkErdAqi
	S4dBhPVQJywLDkAiez2JpccHfR4Nu0ReeDRBizs07rhVGgutbLdAJM1n4s2bsauhT44y
	2AopuLooCS0zjd3pR6E1B8ZqxvHl3wyttEbKPxrDYCjYe+V1XMs/20lMzyrlkk3R/r9C
	gcpBnjHcTOBgI3NkdZk4X/Ns+aKIfHcETYrra6PFWmIFmKSSbY3bVv2RvXulGn9WTz73
	wYi19YRnl/8NSiHMh/cuhiO7pVUzbrz6ADRXaOjmXHsbay6haM2gMeelt13C5rhTv5F6
	8+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=UfxMugG2m9FOYBnrS6S1Ggr4UqslrjppmyV6MFEQsp0=;
	b=U+9svTxpY+G+eeiGgyx+lEZouK61kOL2Fmj0hwAjjHzqOOxFwvD5h4rZmvK8Qu7L21
	Z2BQOVyNsBv1zG19lakz7Pq+vfDZmFicMthKiNo3EUijo+DG3e/18VyxcqwXzK82wg8U
	KU15RNbA3RIPslbCxiBoZAqcGOR1FZK1ftVRr1ZPUuH5wbmSisdWxKJR8teK+rRlLdsH
	GOO7R638bBgRy7yoeCTaKyYpf4mJ5WXvO5k/tRgLj/JdPXb8oZf/ZQs/K2gxHH6iMiWg
	9jcEzkGHtfQ31jSSpD1t8SeCIwmV3MKT1NC6+R3P2HbDUk9U+O3ojECu+zPOEK8iCp25
	dRVw==
X-Gm-Message-State: AOPr4FVVn0RUHZmMGJMn96ZcZXXSxvV/bMeoom4i570YM85j+cEiV8sDHv+9oqeA4hBCpEyeLPJaGTnLRCPo4w==
X-Received: by 10.107.2.70 with SMTP id 67mr14837428ioc.70.1464042606792; Mon,
	23 May 2016 15:30:06 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Mon, 23 May 2016 15:29:47 -0700 (PDT)
In-Reply-To: <38494711adeba8a1d6adfcb0f9132d14d7e9962b.1464040555.git.randy.e.witt@linux.intel.com>
References: <cover.1464040555.git.randy.e.witt@linux.intel.com>
	<38494711adeba8a1d6adfcb0f9132d14d7e9962b.1464040555.git.randy.e.witt@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 23 May 2016 15:29:47 -0700
X-Google-Sender-Auth: KBQoxzuqdjNz5kim7P87ST984vQ
Message-ID: <CABcZANmhx-72y89drJm3McB8gwOPkBUpCUAEY8TasQ2o7fDjwg@mail.gmail.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sstate.bbclass: Don't create symlinks, download to the correct location
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
X-List-Received-Date: Mon, 23 May 2016 22:30:07 -0000
Content-Type: multipart/alternative; boundary=001a113968148395f0053389fb88

--001a113968148395f0053389fb88
Content-Type: text/plain; charset=UTF-8

On Mon, May 23, 2016 at 2:57 PM, Randy Witt <randy.e.witt@linux.intel.com>
wrote:

> Previously the sstate was all downloaded to the same directory and then
> symlinks were added in the directories that pointed to the siginfo and
> sstate in the parent directory.
>
> This change makes it so that now the files are just downloaded to the
> correct location without the need for symlinks.
>
> Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
> ---
>  meta/classes/sstate.bbclass | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 22ce1ee..6d5411f 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -623,10 +623,10 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
>
>      # Try a fetch from the sstate mirror, if it fails just return and
>      # we will build the package
> -    uris = ['file://{0}'.format(sstatefetch),
> -            'file://{0}.siginfo'.format(sstatefetch)]
> +    uris = ['file://{0};downloadfilename={1}'.format(sstatefetch,
> sstatefetch),
> +
> 'file://{0}.siginfo;downloadfilename={1}.siginfo'.format(sstatefetch,
> sstatefetch)]
>      if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG", True), False):
> -        uris += ['file://{0}.sig'.format(sstatefetch)]
> +        uris +=
> ['file://{0}.sig;downloadfilename={1}.sig'.format(sstatefetch, sstatefetch)]
>

The use of {1} and passing the argument a second time is not needed. This
isn't the old style formatting with %s. Just use the existing argument:

    file://{0};downloadfilename={0}'.format(sstatefetch)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113968148395f0053389fb88
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, May 23, 2016 at 2:57 PM, Randy Witt <span dir=3D"ltr">&lt;<a href=
=3D"mailto:randy.e.witt@linux.intel.com" target=3D"_blank">randy.e.witt@lin=
ux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":2hv" class=3D"a3s aXjCH m154df9fb13975a18">Previously the sstate was =
all downloaded to the same directory and then<br>
symlinks were added in the directories that pointed to the siginfo and<br>
sstate in the parent directory.<br>
<br>
This change makes it so that now the files are just downloaded to the<br>
correct location without the need for symlinks.<br>
<br>
Signed-off-by: Randy Witt &lt;<a href=3D"mailto:randy.e.witt@linux.intel.co=
m">randy.e.witt@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/sstate.<span class=3D"il">bbclass</span> | 12 +++-------=
--<br>
=C2=A01 file changed, 3 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/meta/classes/sstate.<span class=3D"il">bbclass</span> b/meta/c=
lasses/sstate.<span class=3D"il">bbclass</span><br>
index 22ce1ee..6d5411f 100644<br>
--- a/meta/classes/sstate.<span class=3D"il">bbclass</span><br>
+++ b/meta/classes/sstate.<span class=3D"il">bbclass</span><br>
@@ -623,10 +623,10 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Try a fetch from the sstate mirror, if it fails just =
return and<br>
=C2=A0 =C2=A0 =C2=A0# we will build the package<br>
-=C2=A0 =C2=A0 uris =3D [&#39;file://{0}&#39;.format(sstatefetch),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;file://{0}.siginfo&#39;.for=
mat(sstatefetch)]<br>
+=C2=A0 =C2=A0 uris =3D [&#39;file://{0};downloadfilename=3D{1}&#39;.format=
(sstatefetch, sstatefetch),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;file://{0}.siginfo;download=
filename=3D{1}.siginfo&#39;.format(sstatefetch, sstatefetch)]<br>
=C2=A0 =C2=A0 =C2=A0if <span class=3D"il">bb</span>.utils.to_boolean(d.getV=
ar(&quot;SSTATE_VERIFY_SIG&quot;, True), False):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uris +=3D [&#39;file://{0}.sig&#39;.format(sst=
atefetch)]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uris +=3D [&#39;file://{0}.sig;downloadfilenam=
e=3D{1}.sig&#39;.format(sstatefetch, sstatefetch)]</div></blockquote></div>=
<br>The use of {1} and passing the argument a second time is not needed. Th=
is isn&#39;t the old style formatting with %s. Just use the existing argume=
nt:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
=C2=A0 =C2=A0 file://{0};downloadfilename=3D{0}&#39;.format(sstatefetch)<br=
>-- <br><div class=3D"gmail_signature">Christopher Larson<br>clarson at ker=
goth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer -=
 Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a113968148395f0053389fb88--
