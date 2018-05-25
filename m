Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3EC6A74C3F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 15:34:26 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id b130-v6so4898640oif.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 08:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WSPJQeCAQkMc2jtOw97/gZeb/gDPiroZA7WFjD7fRlA=;
	b=ozWJvkdr36AQX7A6JbGUPZHblhNzo7/ZN6o/CAS6KRcCOfWvexIhwsm7S8V6JtEggJ
	jy9bTG2/HR43FsGSLBojV81DwIVFeuMCtoxM63S6/LwKdz81iEOg1aA6ZjJn6vmx3yvn
	rEUB0GViaGx2PBDM21p56we0610UHNtfa3/bwiCkIZqUNsaAf/RxREtw05CM8sBn0Od2
	mfqV8B31BLxHdoplEXPUq07pegWbP2RqTSvBnKH0GRJ3lXUY1uWaE9ju0Ue3y8HUmWp/
	IvHv7kbFsEDSMI2V4lv+guNxQMhKe+ljGsHK5J/AByOzC5PZAeBEkFM1ak6EqfoQI+z8
	KImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WSPJQeCAQkMc2jtOw97/gZeb/gDPiroZA7WFjD7fRlA=;
	b=A0SqhrhiZsQyW2vztAGI4RNGg9A0YoTzq5rpoIA4rUl3h3IoPRdtIaR3KzPDK1uZPK
	5hCnog6Qifxq3TO0kSToZpB7FcqovAReV+CWjXi4+5VGZEM68uuiQi1F7TAMTFGX8UPc
	y3KDjHXMA6PZ1VcvgHdwRvoozAWrhbqu0XhlM6mf9LSo/8Pd9XaQ5o+SzrKtMMQh4GUe
	igtR/8RBFXaTOghEW2aNOcyQvmc9hZBWvvy185tw0MbplwSGC5VJlEVlNdXRgrleHJWp
	egCIQY1n6HwBChtaYhWyH4oo5YZRFc3y+PdjmXJHLkFdKvYtHEWskjWmyjbQXm/tK7Da
	4U1A==
X-Gm-Message-State: ALKqPwdloxSSbBFlJYkVzerZhXgVO1aXFnP67ecHRNF8pNLmW+upgD7H
	MPkhMWTctF0xy9GzIj2QEB25ShcJgcYXdN8N2J/Umg==
X-Google-Smtp-Source: ADUXVKLOJm3N3OxMb7l4N2D13kvz+SQSi+Q8+lzDX3vvDl8NAK6z3xKzGA1MArMWo99K4FD3/71hcu6cU7OZqrTgU28=
X-Received: by 2002:aca:e046:: with SMTP id
	x67-v6mr1483588oig.143.1527262467517; 
	Fri, 25 May 2018 08:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20180525123739.73219-1-niko.mauno@vaisala.com>
In-Reply-To: <20180525123739.73219-1-niko.mauno@vaisala.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 25 May 2018 08:34:16 -0700
Message-ID: <CABcZANnPjLCrjSksPCDkN0it1jwBS6_MtJjOkCT=NG=Wf-zR6A@mail.gmail.com>
To: niko.mauno@vaisala.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Export SSH_AUTH_SOCK for cmake at configure
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
X-List-Received-Date: Fri, 25 May 2018 15:34:27 -0000
Content-Type: multipart/alternative; boundary="000000000000daf389056d09800a"

--000000000000daf389056d09800a
Content-Type: text/plain; charset="UTF-8"

We should probably investigate if it's possible to shift those into
do_fetch eventually. Contacting upstream during do_configure is not kosher.

On Fri, May 25, 2018 at 5:52 AM Niko Mauno <niko.mauno@vaisala.com> wrote:

> Update cmake_do_configure() to export a set SSH_AUTH_SOCK variable
> before calling cmake.
>
> Otherwise, if cmake call during cmake_do_configure() resorts to
> ExternalProject directive containing a GIT_REPOSITORY entry, and git
> authentication scheme is based on SSH agent forwarding, it fails
> followingly
>
>   | Cloning into 'foo'...
>   | Permission denied (publickey).
>   | fatal: Could not read from remote repository.
>   |
>   | Please make sure you have the correct access rights
>   | and the repository exists.
>   |
>   | ...
>   |
>   | CMake Error at .../tmp/foo-gitclone.cmake:66 (message):
>   |   Failed to clone repository: 'ssh://...
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta/classes/cmake.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index fcfd5dda4f..82d36be8ff 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -137,6 +137,11 @@ cmake_do_configure() {
>                 oecmake_sitefile=
>         fi
>
> +       # Allow cmake to perform eg. git clone in context where
> authentication relies on SSH agent forwarding
> +       if [ "${SSH_AUTH_SOCK}" ] ; then
> +               export SSH_AUTH_SOCK=${SSH_AUTH_SOCK}
> +       fi
> +
>         cmake \
>           ${OECMAKE_GENERATOR_ARGS} \
>           $oecmake_sitefile \
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000daf389056d09800a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We should probably investigate if it&#39;s possible to shi=
ft those into do_fetch eventually. Contacting upstream during do_configure =
is not kosher.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On =
Fri, May 25, 2018 at 5:52 AM Niko Mauno &lt;<a href=3D"mailto:niko.mauno@va=
isala.com">niko.mauno@vaisala.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Update cmake_do_configure() to export a set SSH_AUTH_SOCK var=
iable<br>
before calling cmake.<br>
<br>
Otherwise, if cmake call during cmake_do_configure() resorts to<br>
ExternalProject directive containing a GIT_REPOSITORY entry, and git<br>
authentication scheme is based on SSH agent forwarding, it fails<br>
followingly<br>
<br>
=C2=A0 | Cloning into &#39;foo&#39;...<br>
=C2=A0 | Permission denied (publickey).<br>
=C2=A0 | fatal: Could not read from remote repository.<br>
=C2=A0 |<br>
=C2=A0 | Please make sure you have the correct access rights<br>
=C2=A0 | and the repository exists.<br>
=C2=A0 |<br>
=C2=A0 | ...<br>
=C2=A0 |<br>
=C2=A0 | CMake Error at .../tmp/foo-gitclone.cmake:66 (message):<br>
=C2=A0 |=C2=A0 =C2=A0Failed to clone repository: &#39;ssh://...<br>
<br>
Signed-off-by: Niko Mauno &lt;<a href=3D"mailto:niko.mauno@vaisala.com" tar=
get=3D"_blank">niko.mauno@vaisala.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/cmake.bbclass | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass<br>
index fcfd5dda4f..82d36be8ff 100644<br>
--- a/meta/classes/cmake.bbclass<br>
+++ b/meta/classes/cmake.bbclass<br>
@@ -137,6 +137,11 @@ cmake_do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oecmake_sitefile=3D=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Allow cmake to perform eg. git clone in conte=
xt where authentication relies on SSH agent forwarding<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${SSH_AUTH_SOCK}&quot; ] ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export SSH_AUTH_SOC=
K=3D${SSH_AUTH_SOCK}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmake \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${OECMAKE_GENERATOR_ARGS} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $oecmake_sitefile \<br>
-- <br>
2.11.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><d=
iv dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - =
BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Mentor Graph=
ics</div></div></div></div>

--000000000000daf389056d09800a--
