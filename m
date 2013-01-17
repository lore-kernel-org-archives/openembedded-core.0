Received: from mail-ob0-f170.google.com ([209.85.214.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.roxell@gmail.com>) id 1Tvmfb-00036Q-Jk
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 11:26:10 +0100
Received: by mail-ob0-f170.google.com with SMTP id wp18so2375026obc.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 02:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=MKcpjhTiQLV88knk4zJHh2/bqfKMahDg6uWzH6yvNSo=;
	b=WPjUsbWwNWB39/JaOMX2WNYFtTCGTX0s9XekHib6xWO7HsX2AYreSztJB3KQScRGwW
	sjXxt/SifE0XDKY+oW8G8SdQL9WrorJkylE5zcZPfGc5gHVawlVetODS9Z8yLJfCVX48
	NcjZp5qOGjtXVtLmSMz4LGrzBvT3Cfa4bAZGfmXNhyjmeS9tr9Tg7Bi+ywpjlPQWUdzG
	3O2uDi9xdsF1EgBPPO2cLuJLmiNyvIj7sRHkDHRIyg9b/e/Annz2k8hkxmzKTUFNOGLA
	ALEYhCtdJbUIO508G4suT8G4tPCARZg42ZGlDs7egtNB35tFMDbttLZVyy3AVZyJ8pdt
	4ecg==
MIME-Version: 1.0
X-Received: by 10.60.31.19 with SMTP id w19mr3492080oeh.3.1358417440265; Thu,
	17 Jan 2013 02:10:40 -0800 (PST)
Received: by 10.182.78.164 with HTTP; Thu, 17 Jan 2013 02:10:40 -0800 (PST)
In-Reply-To: <1358417014-49625-1-git-send-email-anders.roxell@gmail.com>
References: <1358417014-49625-1-git-send-email-anders.roxell@gmail.com>
Date: Thu, 17 Jan 2013 11:10:40 +0100
Message-ID: <CAEUf8FuQe0ye3BxcKTjUUSDivtM7twdFGJ2O81+wk=XW0_Q1Zg@mail.gmail.com>
From: Anders Roxell <anders.roxell@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Anders Roxell <anders.roxell@enea.com>
Subject: Re: [PATCH] systemtap: sources.redhat.com is deprecated.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2013 10:26:14 -0000
Content-Type: multipart/alternative; boundary=e89a8fb1fd7efbd51204d37934a7

--e89a8fb1fd7efbd51204d37934a7
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I forgot to mention this is for the danny branch.

Regards,
Anders


On Thu, Jan 17, 2013 at 11:03 AM, <anders.roxell@gmail.com> wrote:

> From: Anders Roxell <anders.roxell@enea.com>
>
> Signed-off-by: Anders Roxell <anders.roxell@enea.com>
> ---
>  meta/recipes-kernel/systemtap/systemtap_git.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc
> b/meta/recipes-kernel/systemtap/systemtap_git.inc
> index 093e62d..3e7bc7b 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  SRCREV = "48fa6b5e1d3e636c34cbd5650370e6f634efc294"
>  PV = "1.8+git${SRCPV}"
>
> -SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git \
> +SRC_URI = "git://sourceware.org/git/systemtap.git;protocol=git \
>             file://docproc-build-fix.patch \
>            "
>
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--e89a8fb1fd7efbd51204d37934a7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I forgot to mention this is for the=
 danny branch.</div><div><br></div><div style>Regards,</div><div style>Ande=
rs</div></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote"=
>On Thu, Jan 17, 2013 at 11:03 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto=
:anders.roxell@gmail.com" target=3D"_blank">anders.roxell@gmail.com</a>&gt;=
</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: Anders Roxell &lt;<a href=3D"mailto:an=
ders.roxell@enea.com">anders.roxell@enea.com</a>&gt;<br>
<br>
Signed-off-by: Anders Roxell &lt;<a href=3D"mailto:anders.roxell@enea.com">=
anders.roxell@enea.com</a>&gt;<br>
---<br>
=A0meta/recipes-kernel/systemtap/systemtap_git.inc | =A0 =A02 +-<br>
=A01 files changed, 1 insertions(+), 1 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes=
-kernel/systemtap/systemtap_git.inc<br>
index 093e62d..3e7bc7b 100644<br>
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc<br>
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc<br>
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f=
5fce4486a80fdaf4a4263&quot;<br>
=A0SRCREV =3D &quot;48fa6b5e1d3e636c34cbd5650370e6f634efc294&quot;<br>
=A0PV =3D &quot;1.8+git${SRCPV}&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://sources.redhat.com/git/systemtap=
.git;protocol=3Dgit" target=3D"_blank">sources.redhat.com/git/systemtap.git=
;protocol=3Dgit</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://sourceware.org/git/systemtap.git=
;protocol=3Dgit" target=3D"_blank">sourceware.org/git/systemtap.git;protoco=
l=3Dgit</a> \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://docproc-build-fix.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.7.5.4<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--e89a8fb1fd7efbd51204d37934a7--
