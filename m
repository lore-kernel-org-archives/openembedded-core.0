Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RjTsp-0002Up-JT
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 11:52:19 +0100
Received: by lami14 with SMTP id i14so745550lam.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Jan 2012 02:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=hgLYU1T60kSvZQ9Jtj4NV6m03n3azEwDnQnQbHXOGcU=;
	b=ZL7nLhT2CKmj3aMlWihKM79CI8atdMsaE0IJk5hKFMc+i3l21AtOAc2lUXQNARwrhN
	SrB3Gu9zEL5lz2XgdBx71W0I4z+d7FMtNvvguJcwWstnJAxESsbSMyxG3QsyM3udlSO4
	I1/OC49VlU65aRw/ktfshJtNwjrsC0RWuVBm8=
MIME-Version: 1.0
Received: by 10.112.100.197 with SMTP id fa5mr1721849lbb.91.1325933094209;
	Sat, 07 Jan 2012 02:44:54 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.48.69 with HTTP; Sat, 7 Jan 2012 02:44:54 -0800 (PST)
In-Reply-To: <1325911915-16001-4-git-send-email-steve@sakoman.com>
References: <1325911915-16001-4-git-send-email-steve@sakoman.com>
Date: Sat, 7 Jan 2012 08:44:54 -0200
X-Google-Sender-Auth: WbG5bBM08usC-Z5qMy4NPoiFI4U
Message-ID: <CAP9ODKouLE_rOAk1-CP9zsTBOiAD2105w70j8eTpQmbRhBocSA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH RFC v2] dhcp: package /var/lib/dhcp with dhcp-client rather than dhcp-server
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
X-List-Received-Date: Sat, 07 Jan 2012 10:52:19 -0000
Content-Type: multipart/alternative; boundary=f46d0401fa3713878a04b5eddb27

--f46d0401fa3713878a04b5eddb27
Content-Type: text/plain; charset=ISO-8859-1

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

On Sat, Jan 7, 2012 at 02:51, Steve Sakoman <steve@sakoman.com> wrote:

> Otherwise dhclient encounters errors of this type:
>
> dhclient: can't create
> /var/lib/dhcp/dhclient-c0c60402-0bc5-4bd7-bc3b-49a27fa37d72-eth1.lease: No
> such file or directory
>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-connectivity/dhcp/dhcp.inc      |    4 ++--
>  meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc
> b/meta/recipes-connectivity/dhcp/dhcp.inc
> index f9d80e7..be256ce 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp.inc
> +++ b/meta/recipes-connectivity/dhcp/dhcp.inc
> @@ -59,14 +59,14 @@ PACKAGES += "dhcp-server dhcp-server-config
> dhcp-client dhcp-relay dhcp-omshell"
>
>  FILES_${PN} = ""
>
> -FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server
> ${localstatedir}/lib/dhcp/"
> +FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server"
>  RRECOMMENDS_dhcp-server = "dhcp-server-config"
>
>  FILES_dhcp-server-config = "${sysconfdir}/default/dhcp-server
> ${sysconfdir}/dhcp/dhcpd.conf"
>
>  FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay
> ${sysconfdir}/default/dhcp-relay"
>
> -FILES_dhcp-client = "${base_sbindir}/dhclient
> ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
> +FILES_dhcp-client = "${base_sbindir}/dhclient
> ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf
> ${localstatedir}/lib/dhcp/"
>  RDEPENDS_dhcp-client = "bash"
>
>  FILES_dhcp-omshell = "${bindir}/omshell"
> diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bbb/meta/recipes-connectivity/dhcp/
> dhcp_4.2.0.bb
> index 2471d61..a3a560b 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
> +++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
> @@ -1,6 +1,6 @@
>  require dhcp.inc
>
> -PR = "r4"
> +PR = "r5"
>
>  SRC_URI += "file://fixincludes.patch \
>             file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
> --
> 1.7.1
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

--f46d0401fa3713878a04b5eddb27
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r">otavio@ossystems.com.br</a>&gt;<br><br><div class=3D"gmail_quote">On Sat=
, Jan 7, 2012 at 02:51, Steve Sakoman <span dir=3D"ltr">&lt;<a href=3D"mail=
to:steve@sakoman.com">steve@sakoman.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Otherwise dhclient encounters errors of this=
 type:<br>
<br>
dhclient: can&#39;t create /var/lib/dhcp/dhclient-c0c60402-0bc5-4bd7-bc3b-4=
9a27fa37d72-eth1.lease: No such file or directory<br>
<br>
Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve=
@sakoman.com</a>&gt;<br>
---<br>
=A0meta/recipes-connectivity/dhcp/dhcp.inc =A0 =A0 =A0| =A0 =A04 ++--<br>
=A0meta/recipes-connectivity/dhcp/<a href=3D"http://dhcp_4.2.0.bb" target=
=3D"_blank">dhcp_4.2.0.bb</a> | =A0 =A02 +-<br>
=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connect=
ivity/dhcp/dhcp.inc<br>
index f9d80e7..be256ce 100644<br>
--- a/meta/recipes-connectivity/dhcp/dhcp.inc<br>
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc<br>
@@ -59,14 +59,14 @@ PACKAGES +=3D &quot;dhcp-server dhcp-server-config dhcp=
-client dhcp-relay dhcp-omshell&quot;<br>
<br>
=A0FILES_${PN} =3D &quot;&quot;<br>
<br>
-FILES_dhcp-server =3D &quot;${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-ser=
ver ${localstatedir}/lib/dhcp/&quot;<br>
+FILES_dhcp-server =3D &quot;${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-ser=
ver&quot;<br>
=A0RRECOMMENDS_dhcp-server =3D &quot;dhcp-server-config&quot;<br>
<br>
=A0FILES_dhcp-server-config =3D &quot;${sysconfdir}/default/dhcp-server ${s=
ysconfdir}/dhcp/dhcpd.conf&quot;<br>
<br>
=A0FILES_dhcp-relay =3D &quot;${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp=
-relay ${sysconfdir}/default/dhcp-relay&quot;<br>
<br>
-FILES_dhcp-client =3D &quot;${base_sbindir}/dhclient ${base_sbindir}/dhcli=
ent-script ${sysconfdir}/dhcp/dhclient.conf&quot;<br>
+FILES_dhcp-client =3D &quot;${base_sbindir}/dhclient ${base_sbindir}/dhcli=
ent-script ${sysconfdir}/dhcp/dhclient.conf ${localstatedir}/lib/dhcp/&quot=
;<br>
=A0RDEPENDS_dhcp-client =3D &quot;bash&quot;<br>
<br>
=A0FILES_dhcp-omshell =3D &quot;${bindir}/omshell&quot;<br>
diff --git a/meta/recipes-connectivity/dhcp/<a href=3D"http://dhcp_4.2.0.bb=
" target=3D"_blank">dhcp_4.2.0.bb</a> b/meta/recipes-connectivity/dhcp/<a h=
ref=3D"http://dhcp_4.2.0.bb" target=3D"_blank">dhcp_4.2.0.bb</a><br>
index 2471d61..a3a560b 100644<br>
--- a/meta/recipes-connectivity/dhcp/<a href=3D"http://dhcp_4.2.0.bb" targe=
t=3D"_blank">dhcp_4.2.0.bb</a><br>
+++ b/meta/recipes-connectivity/dhcp/<a href=3D"http://dhcp_4.2.0.bb" targe=
t=3D"_blank">dhcp_4.2.0.bb</a><br>
@@ -1,6 +1,6 @@<br>
=A0require dhcp.inc<br>
<br>
-PR =3D &quot;r4&quot;<br>
+PR =3D &quot;r5&quot;<br>
<br>
=A0SRC_URI +=3D &quot;file://fixincludes.patch \<br>
 =A0 =A0 =A0 =A0 =A0 =A0 file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=
=3D0 \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.1<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" targe=
t=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems=
.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--f46d0401fa3713878a04b5eddb27--
