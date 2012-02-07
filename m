Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RupnS-0004x1-AI
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 19:29:42 +0100
Received: by eaal10 with SMTP id l10so2005660eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 10:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=PlY60OwpJk/1yAOdkSCbhRXo96hg78xoxw42vjFvXeU=;
	b=fTkRxsAIZ2+WGlX6XRMYmT+bDqNuZPDTY4CEdkdkN9L0q2K8GvqzMIx6dm2C3CkrOA
	T+Z0S8+GCnF81dmenxn6WyfS5/5i/v7qUeFEvfZJj2VOcTq+pQAgALUqNtbZHQALF1hl
	MNBfm3rO24sInAr1Mzo1SNgS/WFXmCkIJcEX4=
MIME-Version: 1.0
Received: by 10.213.26.8 with SMTP id b8mr2216380ebc.88.1328638899583; Tue, 07
	Feb 2012 10:21:39 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Tue, 7 Feb 2012 10:21:39 -0800 (PST)
In-Reply-To: <1328638770-31141-1-git-send-email-andrei@gherzan.ro>
References: <1328638770-31141-1-git-send-email-andrei@gherzan.ro>
Date: Tue, 7 Feb 2012 16:21:39 -0200
X-Google-Sender-Auth: -4GOy-Zaepb9u2v3uzFBOPUO8t4
Message-ID: <CAP9ODKoRYo-bRXBmjGUvLHN1UwXf9aASpmzZa1NkjFy6MsauYw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] nspr: Integrate version 4.8.9
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Feb 2012 18:29:42 -0000
Content-Type: multipart/alternative; boundary=0015174a0576a4fab504b863d9f0

--0015174a0576a4fab504b863d9f0
Content-Type: text/plain; charset=ISO-8859-1

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Tue, Feb 7, 2012 at 16:19, Andrei Gherzan <andrei@gherzan.ro> wrote:

> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> Signed-off-by: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
> ---
>  meta/recipes-support/nspr/files/nspr.pc.in |   11 ++++++++
>  meta/recipes-support/nspr/nspr_4.8.9.bb    |   36
> ++++++++++++++++++++++++++++
>  2 files changed, 47 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-support/nspr/files/nspr.pc.in
>  create mode 100644 meta/recipes-support/nspr/nspr_4.8.9.bb
>
> diff --git a/meta/recipes-support/nspr/files/nspr.pc.inb/meta/recipes-support/nspr/files/
> nspr.pc.in
> new file mode 100644
> index 0000000..bbb7b5a
> --- /dev/null
> +++ b/meta/recipes-support/nspr/files/nspr.pc.in
> @@ -0,0 +1,11 @@
> +os_libs=-lpthread -ldl
> +prefix=OEPREFIX
> +exec_prefix=OEEXECPREFIX
> +libdir=OELIBDIR
> +includedir=OEINCDIR
> +
> +Name: NSPR
> +Description: The Netscape Portable Runtime
> +Version: 4.8.9
> +Libs: -L${libdir} -lplds4 -lplc4 -lnspr4 -lpthread -ldl
> +Cflags:
> diff --git a/meta/recipes-support/nspr/nspr_4.8.9.bbb/meta/recipes-support/nspr/
> nspr_4.8.9.bb
> new file mode 100644
> index 0000000..9ae5c70
> --- /dev/null
> +++ b/meta/recipes-support/nspr/nspr_4.8.9.bb
> @@ -0,0 +1,36 @@
> +DESCRIPTION = "Netscape Portable Runtime Library"
> +HOMEPAGE =  "http://www.mozilla.org/projects/nspr/"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM =
> "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> +SECTION = "libs/network"
> +
> +PR = "r0"
> +
> +SRC_URI = "
> ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
> "
> +
> +SRC_URI += "file://nspr.pc.in "
> +
> +SRC_URI[md5sum] = "60770d45dc08c0f181b22cdfce5be3e8"
> +SRC_URI[sha256sum] =
> "ff43c7c819e72f03bb908e7652c5d5f59a5d31ee86c333e692650207103d1cce"
> +
> +S = "${WORKDIR}/nspr-${PV}/mozilla/nsprpub"
> +
> +inherit autotools
> +
> +do_configure() {
> +       oe_runconf
> +}
> +
> +do_compile_prepend() {
> +       oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX" LDFLAGS="" CC=gcc -C
> config export
> +}
> +
> +do_install_append() {
> +    install -D ${WORKDIR}/nspr.pc.in ${D}${libdir}/pkgconfig/nspr.pc
> +    sed -i s:OEPREFIX:${prefix}:g ${D}${libdir}/pkgconfig/nspr.pc
> +    sed -i s:OELIBDIR:${libdir}:g ${D}${libdir}/pkgconfig/nspr.pc
> +    sed -i s:OEINCDIR:${includedir}:g ${D}${libdir}/pkgconfig/nspr.pc
> +    sed -i s:OEEXECPREFIX:${exec_prefix}:g ${D}${libdir}/pkgconfig/nspr.pc
> +}
> +
> +
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0015174a0576a4fab504b863d9f0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by:=A0<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:13px;background-color:rgb(245,245,245)">Otavio Salvador &lt;<a h=
ref=3D"mailto:otavio@ossystems.com.br">otavio@ossystems.com.br</a>&gt;</spa=
n><br>
<br><div class=3D"gmail_quote">On Tue, Feb 7, 2012 at 16:19, Andrei Gherzan=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:andrei@gherzan.ro">andrei@gherzan.=
ro</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andre=
i@gherzan.ro">andrei@gherzan.ro</a>&gt;<br>
Signed-off-by: Sergey &#39;Jin&#39; Bostandzhyan &lt;jin@mediatomb.cc&gt;<b=
r>
---<br>
</div>=A0meta/recipes-support/nspr/files/<a href=3D"http://nspr.pc.in" targ=
et=3D"_blank">nspr.pc.in</a> | =A0 11 ++++++++<br>
=A0meta/recipes-support/nspr/<a href=3D"http://nspr_4.8.9.bb" target=3D"_bl=
ank">nspr_4.8.9.bb</a> =A0 =A0| =A0 36 ++++++++++++++++++++++++++++<br>
=A02 files changed, 47 insertions(+), 0 deletions(-)<br>
=A0create mode 100644 meta/recipes-support/nspr/files/<a href=3D"http://nsp=
r.pc.in" target=3D"_blank">nspr.pc.in</a><br>
=A0create mode 100644 meta/recipes-support/nspr/<a href=3D"http://nspr_4.8.=
9.bb" target=3D"_blank">nspr_4.8.9.bb</a><br>
<br>
diff --git a/meta/recipes-support/nspr/files/<a href=3D"http://nspr.pc.in" =
target=3D"_blank">nspr.pc.in</a> b/meta/recipes-support/nspr/files/<a href=
=3D"http://nspr.pc.in" target=3D"_blank">nspr.pc.in</a><br>
<div class=3D"im">new file mode 100644<br>
index 0000000..bbb7b5a<br>
--- /dev/null<br>
</div>+++ b/meta/recipes-support/nspr/files/<a href=3D"http://nspr.pc.in" t=
arget=3D"_blank">nspr.pc.in</a><br>
<div class=3D"im">@@ -0,0 +1,11 @@<br>
+os_libs=3D-lpthread -ldl<br>
+prefix=3DOEPREFIX<br>
+exec_prefix=3DOEEXECPREFIX<br>
+libdir=3DOELIBDIR<br>
+includedir=3DOEINCDIR<br>
+<br>
+Name: NSPR<br>
+Description: The Netscape Portable Runtime<br>
+Version: 4.8.9<br>
+Libs: -L${libdir} -lplds4 -lplc4 -lnspr4 -lpthread -ldl<br>
+Cflags:<br>
diff --git a/meta/recipes-support/nspr/<a href=3D"http://nspr_4.8.9.bb" tar=
get=3D"_blank">nspr_4.8.9.bb</a> b/meta/recipes-support/nspr/<a href=3D"htt=
p://nspr_4.8.9.bb" target=3D"_blank">nspr_4.8.9.bb</a><br>
new file mode 100644<br>
</div>index 0000000..9ae5c70<br>
--- /dev/null<br>
+++ b/meta/recipes-support/nspr/<a href=3D"http://nspr_4.8.9.bb" target=3D"=
_blank">nspr_4.8.9.bb</a><br>
@@ -0,0 +1,36 @@<br>
<div class=3D"im">+DESCRIPTION =3D &quot;Netscape Portable Runtime Library&=
quot;<br>
+HOMEPAGE =3D =A0&quot;<a href=3D"http://www.mozilla.org/projects/nspr/" ta=
rget=3D"_blank">http://www.mozilla.org/projects/nspr/</a>&quot;<br>
+LICENSE =3D &quot;GPLv2&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=3D801f=
80980d171dd6425610833a22dbe6&quot;<br>
+SECTION =3D &quot;libs/network&quot;<br>
+<br>
+PR =3D &quot;r0&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"ftp://ftp.mozilla.org/pub/mozilla.org/nspr/re=
leases/v${PV}/src/nspr-${PV}.tar.gz" target=3D"_blank">ftp://ftp.mozilla.or=
g/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz</a>&quot;<br>
+<br>
</div>+SRC_URI +=3D &quot;file://<a href=3D"http://nspr.pc.in" target=3D"_b=
lank">nspr.pc.in</a> &quot;<br>
<div class=3D"im">+<br>
+SRC_URI[md5sum] =3D &quot;60770d45dc08c0f181b22cdfce5be3e8&quot;<br>
+SRC_URI[sha256sum] =3D &quot;ff43c7c819e72f03bb908e7652c5d5f59a5d31ee86c33=
3e692650207103d1cce&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/nspr-${PV}/mozilla/nsprpub&quot;<br>
+<br>
+inherit autotools<br>
+<br>
+do_configure() {<br>
+ =A0 =A0 =A0 oe_runconf<br>
+}<br>
+<br>
+do_compile_prepend() {<br>
+ =A0 =A0 =A0 oe_runmake CROSS_COMPILE=3D1 CFLAGS=3D&quot;-DXP_UNIX&quot; L=
DFLAGS=3D&quot;&quot; CC=3Dgcc -C config export<br>
+}<br>
+<br>
+do_install_append() {<br>
</div>+ =A0 =A0install -D ${WORKDIR}/<a href=3D"http://nspr.pc.in" target=
=3D"_blank">nspr.pc.in</a> ${D}${libdir}/pkgconfig/nspr.pc<br>
<div class=3D"im HOEnZb">+ =A0 =A0sed -i s:OEPREFIX:${prefix}:g ${D}${libdi=
r}/pkgconfig/nspr.pc<br>
+ =A0 =A0sed -i s:OELIBDIR:${libdir}:g ${D}${libdir}/pkgconfig/nspr.pc<br>
+ =A0 =A0sed -i s:OEINCDIR:${includedir}:g ${D}${libdir}/pkgconfig/nspr.pc<=
br>
+ =A0 =A0sed -i s:OEEXECPREFIX:${exec_prefix}:g ${D}${libdir}/pkgconfig/nsp=
r.pc<br>
+}<br>
+<br>
+<br>
</div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.5.4<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D=
"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com=
.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--0015174a0576a4fab504b863d9f0--
