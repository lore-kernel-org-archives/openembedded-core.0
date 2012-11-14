Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TYbIv-0001y8-Ak
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 12:38:49 +0100
Received: by mail-pb0-f47.google.com with SMTP id ro12so281354pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 03:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=O+124H27YLt9yKwYAP6kxIHmctj7pqZTIojDrMEGXFk=;
	b=RkJ/P8ClB9QsnY/fygkutsn+AHsUqAyK/lBzNUOFowAJRzFnKnil5V0Ikdm+06ooOE
	r3B2DeESHKrM0ULAA2fi74DHJjbs8LK5MRZqcmVhqLjZXjCJHfEMdk0chYriV2EqinKc
	Pk4oYNfnMIXygoYBeiU6L0pIuYu/5sh8W+/H0qotnEY9LoDCWND1os4IAUDaN56jpeyg
	v5YBl2ts/nShdXamh+eMGIjnrjH0i7fLjRRAdTBtA9z7X6+9i3qtaiu1tKLdcpwMQzfx
	2NBaenDWoFtmaInMcg9NaAhk764A52gwhN4+kROmEvIxN8PQPVzQYRh6f0lK+cid+eht
	JpZA==
MIME-Version: 1.0
Received: by 10.68.254.10 with SMTP id ae10mr71438827pbd.126.1352892293243;
	Wed, 14 Nov 2012 03:24:53 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 14 Nov 2012 03:24:53 -0800 (PST)
In-Reply-To: <7be8d2a6b27519f24a90a1ed15eb4dadd24f5bd5.1352871028.git.sgw@linux.intel.com>
References: <cover.1352871028.git.sgw@linux.intel.com>
	<7be8d2a6b27519f24a90a1ed15eb4dadd24f5bd5.1352871028.git.sgw@linux.intel.com>
Date: Wed, 14 Nov 2012 09:24:53 -0200
X-Google-Sender-Auth: gyeA0gYuwpu4UBDST00IbUx46EM
Message-ID: <CAP9ODKoNX3+hbyokZjLjjvn_2o7Ye2bRJTBPzYsLKAh=gRR+gw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/9] sysstat: Update to 10.1.2
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
X-List-Received-Date: Wed, 14 Nov 2012 11:38:49 -0000
Content-Type: multipart/alternative; boundary=047d7b2e0da18ee2b204ce72c86e

--047d7b2e0da18ee2b204ce72c86e
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 14, 2012 at 3:32 AM, Saul Wold <sgw@linux.intel.com> wrote:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../{sysstat_10.1.1.bb => sysstat_10.1.2.bb}       |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/sysstat/{sysstat_10.1.1.bb =>
> sysstat_10.1.2.bb} (44%)
>
> diff --git a/meta/recipes-extended/sysstat/sysstat_10.1.1.bbb/meta/recipes-extended/sysstat/
> sysstat_10.1.2.bb
> similarity index 44%
> rename from meta/recipes-extended/sysstat/sysstat_10.1.1.bb
> rename to meta/recipes-extended/sysstat/sysstat_10.1.2.bb
> index 54b0226..6cd90a2 100644
> --- a/meta/recipes-extended/sysstat/sysstat_10.1.1.bb
> +++ b/meta/recipes-extended/sysstat/sysstat_10.1.2.bb
> @@ -4,5 +4,6 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>
>  PR = "${INC_PR}.0"
>
> -SRC_URI[md5sum] = "8250cdcbc4a959c8a05e4186fbd13d84"
> -SRC_URI[sha256sum] =
> "119c7a23c5597d6d0df0b229c54984a35f357ecbd1c96da8cef4d105e8dfdacf"
> +SRC_URI[md5sum] = "c40626b96cc2b4cf303cbcf1efc96eba"
> +SRC_URI[sha256sum] =
> "c68bc2b4b436812f45e6d440a3ac106fa2a77c5cfc9d4ba7d4e7f9ded7bffab4"
> +
>

Please drop the extra empty line.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b2e0da18ee2b204ce72c86e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Wed, Nov 14, 2012 at 3:32 AM, Saul Wo=
ld <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_=
blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;<br>
---<br>
=A0.../{<a href=3D"http://sysstat_10.1.1.bb" target=3D"_blank">sysstat_10.1=
.1.bb</a> =3D&gt; <a href=3D"http://sysstat_10.1.2.bb" target=3D"_blank">sy=
sstat_10.1.2.bb</a>} =A0 =A0 =A0 | =A0 =A05 +++--<br>
=A01 files changed, 3 insertions(+), 2 deletions(-)<br>
=A0rename meta/recipes-extended/sysstat/{<a href=3D"http://sysstat_10.1.1.b=
b" target=3D"_blank">sysstat_10.1.1.bb</a> =3D&gt; <a href=3D"http://syssta=
t_10.1.2.bb" target=3D"_blank">sysstat_10.1.2.bb</a>} (44%)<br>
<br>
diff --git a/meta/recipes-extended/sysstat/<a href=3D"http://sysstat_10.1.1=
.bb" target=3D"_blank">sysstat_10.1.1.bb</a> b/meta/recipes-extended/syssta=
t/<a href=3D"http://sysstat_10.1.2.bb" target=3D"_blank">sysstat_10.1.2.bb<=
/a><br>

similarity index 44%<br>
rename from meta/recipes-extended/sysstat/<a href=3D"http://sysstat_10.1.1.=
bb" target=3D"_blank">sysstat_10.1.1.bb</a><br>
rename to meta/recipes-extended/sysstat/<a href=3D"http://sysstat_10.1.2.bb=
" target=3D"_blank">sysstat_10.1.2.bb</a><br>
index 54b0226..6cd90a2 100644<br>
--- a/meta/recipes-extended/sysstat/<a href=3D"http://sysstat_10.1.1.bb" ta=
rget=3D"_blank">sysstat_10.1.1.bb</a><br>
+++ b/meta/recipes-extended/sysstat/<a href=3D"http://sysstat_10.1.2.bb" ta=
rget=3D"_blank">sysstat_10.1.2.bb</a><br>
@@ -4,5 +4,6 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D8ca43cbc842=
c2336e835926c2166c28b&quot;<br>
<br>
=A0PR =3D &quot;${INC_PR}.0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;8250cdcbc4a959c8a05e4186fbd13d84&quot;<br>
-SRC_URI[sha256sum] =3D &quot;119c7a23c5597d6d0df0b229c54984a35f357ecbd1c96=
da8cef4d105e8dfdacf&quot;<br>
+SRC_URI[md5sum] =3D &quot;c40626b96cc2b4cf303cbcf1efc96eba&quot;<br>
+SRC_URI[sha256sum] =3D &quot;c68bc2b4b436812f45e6d440a3ac106fa2a77c5cfc9d4=
ba7d4e7f9ded7bffab4&quot;<br>
+<br></blockquote><div><br></div><div>Please drop the extra empty line.</di=
v><div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavi=
o@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a hre=
f=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.co=
m.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--047d7b2e0da18ee2b204ce72c86e--
