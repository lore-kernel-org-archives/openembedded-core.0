Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 837367753B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 13:44:35 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id g62so146560254lfe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Sep 2016 06:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1A+5d/6NmurV/5qW9NMeV/AuroECSXIVokm3SmloSpI=;
	b=lz5Vm+AbjgPUwQVwqm6R8I3hktOTXSW8MhBEEJSpQKgeTFOOeCZemd4fUwhBgkblce
	MpjBULqAC+DxX1NUcIB5kedxHAL1JT4FM+1LmVcy49oXYcIJA8aJPXfC9tSm6WH6Sz9Q
	NI7XlRDLoriTRfxLZDxztE8IvWihzMqBaU6PJC/Wxuk2L9mJUJc+FdLRAABS3tmCwRte
	SJFdRozN5z0x24V0CN5z7PDce/+LZ1PbdIV60k10nyFTAxwzBtRZJYOnaZvbsdgoCuvF
	WQCgC9MxGSvjU0hWKIbSbPAK9Vmbh6rDSu63IID/X9QAk9vPHBW8eDlW8+Fkrt6XrX4j
	4hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1A+5d/6NmurV/5qW9NMeV/AuroECSXIVokm3SmloSpI=;
	b=Sf/3YeL2QYLtvKWiPs17HJbOqeiLnaR0MgKASC9V1q4I9XvOaTsmJxBscXcj6nBD6s
	upLq470m03hVFvFL9WCMncd243m66F0McO0V6xelK7oCI/2X6lZVNWu8hAyd71ZcP+ue
	5+EgcfTzD65+iAGR4wbR1dQUL3YsDoLlIpruyWSuzOvPU9q2s2o7g6yTIFFkjBT4LaSm
	uXN56LF4O4DjdrjtIpJGsEx1z/aaMKgrQJ6YdRdlSISNwhmgl+s3QTvcJAMkHuzAr59H
	IPdQP5d1+cS8afRp/rCpX3bu45g4bAtj6LsJXbxFGYcQUmzbQe7oKLxd53/ad9wbVXzq
	RjQQ==
X-Gm-Message-State: AE9vXwNuBUusPLefaJIYEeKq975Hvus+E5ly3dxy1ZJaLtntBstYw2YYN4lzsxhHSmws1fSOtlTPzYMX6BTeAA==
X-Received: by 10.25.216.104 with SMTP id p101mr10107893lfg.192.1473169475903; 
	Tue, 06 Sep 2016 06:44:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.221.67 with HTTP; Tue, 6 Sep 2016 06:44:05 -0700 (PDT)
X-Originating-IP: [179.105.254.222]
In-Reply-To: <1472241302-7437-2-git-send-email-fabio.berton@ossystems.com.br>
References: <1472241302-7437-1-git-send-email-fabio.berton@ossystems.com.br>
	<1472241302-7437-2-git-send-email-fabio.berton@ossystems.com.br>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Tue, 6 Sep 2016 10:44:05 -0300
Message-ID: <CAAPZna0nTZVVPXrBNYg+Kbw8RjUMthy0g47b6N4wXvEyt0Z1bQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 2/2] watchdog-config: Add recipe
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
X-List-Received-Date: Tue, 06 Sep 2016 13:44:37 -0000
Content-Type: multipart/alternative; boundary=001a114012604e3991053bd6ffde

--001a114012604e3991053bd6ffde
Content-Type: text/plain; charset=UTF-8

ping?

On Fri, Aug 26, 2016 at 4:55 PM, Fabio Berton <fabio.berton@ossystems.com.br
> wrote:

> Provides configuration files for watchdog.
> Add watchdog-config as a runtime dependence of watchdog and remove
> watchdog.conf file from watchdog installation.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-extended/watchdog/watchdog-config.bb  | 20 +++++++++++
>  .../watchdog/watchdog-config/watchdog.conf         | 42
> ++++++++++++++++++++++
>  .../watchdog/watchdog-config/watchdog.default      |  2 ++
>  meta/recipes-extended/watchdog/watchdog_5.15.bb    |  6 +++-
>  4 files changed, 69 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/watchdog/watchdog-config.bb
>  create mode 100644 meta/recipes-extended/watchdog/watchdog-config/
> watchdog.conf
>  create mode 100644 meta/recipes-extended/watchdog/watchdog-config/
> watchdog.default
>
> diff --git a/meta/recipes-extended/watchdog/watchdog-config.bb
> b/meta/recipes-extended/watchdog/watchdog-config.bb
> new file mode 100644
> index 0000000..8bf40f0
> --- /dev/null
> +++ b/meta/recipes-extended/watchdog/watchdog-config.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "Software watchdog"
> +DESCRIPTION = "Watchdog is a daemon that checks if your system is still \
> +working. If programs in user space are not longer executed it will reboot
> \
> +the system."
> +HOMEPAGE = "http://watchdog.sourceforge.net/"
> +BUGTRACKER = "http://sourceforge.net/tracker/?group_id=172030&atid=860194
> "
> +
> +LICENSE = "MIT-X"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=
> 3da9cfbcb788c80a0384361b4de20420"
> +
> +SRC_URI = " \
> +    file://watchdog.default \
> +    file://watchdog.conf \
> +"
> +
> +do_install() {
> +    install -Dm 0644 ${WORKDIR}/watchdog.default
> ${D}${sysconfdir}/default/watchdog
> +    install -Dm 0644 ${WORKDIR}/watchdog.conf ${D}${sysconfdir}/watchdog.
> conf
> +}
> +
> diff --git a/meta/recipes-extended/watchdog/watchdog-config/watchdog.conf
> b/meta/recipes-extended/watchdog/watchdog-config/watchdog.conf
> new file mode 100644
> index 0000000..c493d12
> --- /dev/null
> +++ b/meta/recipes-extended/watchdog/watchdog-config/watchdog.conf
> @@ -0,0 +1,42 @@
> +#ping                  = 172.31.14.1
> +#ping                  = 172.26.1.255
> +#interface             = eth0
> +#file                  = /var/log/messages
> +#change                        = 1407
> +
> +# Uncomment to enable test. Setting one of these values to '0' disables
> it.
> +# These values will hopefully never reboot your machine during normal use
> +# (if your machine is really hung, the loadavg will go much higher than
> 25)
> +#max-load-1            = 24
> +#max-load-5            = 18
> +#max-load-15           = 12
> +
> +# Note that this is the number of pages!
> +# To get the real size, check how large the pagesize is on your machine.
> +#min-memory            = 1
> +
> +#repair-binary         = /usr/sbin/repair
> +#repair-timeout                =
> +#test-binary           =
> +#test-timeout          =
> +
> +watchdog-device        = /dev/watchdog
> +
> +# Defaults compiled into the binary
> +#temperature-device    =
> +#max-temperature       = 120
> +
> +# Defaults compiled into the binary
> +#admin                 = root
> +#interval              = 1
> +#logtick                = 1
> +#log-dir               = /var/log/watchdog
> +
> +# This greatly decreases the chance that watchdog won't be scheduled
> before
> +# your machine is really loaded
> +realtime               = yes
> +priority               = 1
> +
> +# Check if rsyslogd is still running by enabling the following line
> +#pidfile               = /var/run/rsyslogd.pid
> +
> diff --git a/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
> b/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
> new file mode 100644
> index 0000000..647d5ab
> --- /dev/null
> +++ b/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
> @@ -0,0 +1,2 @@
> +# Start watchdog at boot time? 0 or 1
> +run_watchdog=1
> diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb
> b/meta/recipes-extended/watchdog/watchdog_5.15.bb
> index 1c0049c..cedfc04 100644
> --- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
> +++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
> @@ -40,6 +40,9 @@ INITSCRIPT_PARAMS_${PN}-keepalive = "start 15 1 2 3 4 5
> . stop 85 0 6 ."
>  do_install_append() {
>         install -D ${S}/redhat/watchdog.init ${D}/${sysconfdir}/init.d/
> watchdog.sh
>      install -Dm 0755 ${WORKDIR}/wd_keepalive.init
> ${D}${sysconfdir}/init.d/wd_keepalive
> +
> +    # watchdog.conf is provided by the watchdog-config recipe
> +    rm ${D}${sysconfdir}/watchdog.conf
>  }
>
>  PACKAGES =+ "${PN}-keepalive"
> @@ -49,7 +52,8 @@ FILES_${PN}-keepalive = " \
>      ${sbindir}/wd_keepalive \
>  "
>
> -RDEPENDS_${PN} += "${PN}-keepalive"
> +RDEPENDS_${PN} += "${PN}-config ${PN}-keepalive"
> +RDEPENDS_${PN}-keepalive += "${PN}-config"
>
>  RRECOMMENDS_${PN} = "kernel-module-softdog"
>
> --
> 2.1.4
>
>

--001a114012604e3991053bd6ffde
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">ping?<br></div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On Fri, Aug 26, 2016 at 4:55 PM, Fabio Ber=
ton <span dir=3D"ltr">&lt;<a href=3D"mailto:fabio.berton@ossystems.com.br" =
target=3D"_blank">fabio.berton@ossystems.com.br</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><span class=3D"">Provides configuration files =
for watchdog.<br>
Add watchdog-config as a runtime dependence of watchdog and remove<br>
watchdog.conf file from watchdog installation.<br>
<br>
Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.co=
m.br">fabio.berton@ossystems.com.br</a><wbr>&gt;<br>
</span>Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystem=
s.com.br">otavio@ossystems.com.br</a>&gt;<br>
<div class=3D"HOEnZb"><div class=3D"h5">---<br>
=C2=A0meta/recipes-extended/<wbr>watchdog/<a href=3D"http://watchdog-config=
.bb" rel=3D"noreferrer" target=3D"_blank">watchdog-config.bb</a>=C2=A0 | 20=
 +++++++++++<br>
=C2=A0.../watchdog/watchdog-config/<wbr>watchdog.conf=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 42 ++++++++++++++++++++++<br>
=C2=A0.../watchdog/watchdog-config/<wbr>watchdog.default=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 ++<br>
=C2=A0meta/recipes-extended/<wbr>watchdog/<a href=3D"http://watchdog_5.15.b=
b" rel=3D"noreferrer" target=3D"_blank">watchdog_5.15.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 6 +++-<br>
=C2=A04 files changed, 69 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-extended/<wbr>watchdog/<a href=3D"htt=
p://watchdog-config.bb" rel=3D"noreferrer" target=3D"_blank">watchdog-confi=
g.bb</a><br>
=C2=A0create mode 100644 meta/recipes-extended/<wbr>watchdog/watchdog-confi=
g/<wbr>watchdog.conf<br>
=C2=A0create mode 100644 meta/recipes-extended/<wbr>watchdog/watchdog-confi=
g/<wbr>watchdog.default<br>
<br>
diff --git a/meta/recipes-extended/<wbr>watchdog/<a href=3D"http://watchdog=
-config.bb" rel=3D"noreferrer" target=3D"_blank">watchdog-config.bb</a> b/m=
eta/recipes-extended/<wbr>watchdog/<a href=3D"http://watchdog-config.bb" re=
l=3D"noreferrer" target=3D"_blank">watchdog-config.bb</a><br>
new file mode 100644<br>
index 0000000..8bf40f0<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/<wbr>watchdog/<a href=3D"http://watchdog-config=
.bb" rel=3D"noreferrer" target=3D"_blank">watchdog-config.bb</a><br>
@@ -0,0 +1,20 @@<br>
+SUMMARY =3D &quot;Software watchdog&quot;<br>
+DESCRIPTION =3D &quot;Watchdog is a daemon that checks if your system is s=
till \<br>
+working. If programs in user space are not longer executed it will reboot =
\<br>
+the system.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://watchdog.sourceforge.net/" rel=3D"nor=
eferrer" target=3D"_blank">http://watchdog.sourceforge.<wbr>net/</a>&quot;<=
br>
+BUGTRACKER =3D &quot;<a href=3D"http://sourceforge.net/tracker/?group_id=
=3D172030&amp;atid=3D860194" rel=3D"noreferrer" target=3D"_blank">http://so=
urceforge.net/<wbr>tracker/?group_id=3D172030&amp;atid=3D<wbr>860194</a>&qu=
ot;<br>
+<br>
+LICENSE =3D &quot;MIT-X&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/<wbr>COPYING.MIT;md5=3D=
<wbr>3da9cfbcb788c80a0384361b4de204<wbr>20&quot;<br>
+<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 file://watchdog.default \<br>
+=C2=A0 =C2=A0 file://watchdog.conf \<br>
+&quot;<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 install -Dm 0644 ${WORKDIR}/watchdog.default ${D}${sysconfdi=
r}/default/<wbr>watchdog<br>
+=C2=A0 =C2=A0 install -Dm 0644 ${WORKDIR}/watchdog.conf ${D}${sysconfdir}/=
watchdog.<wbr>conf<br>
+}<br>
+<br>
diff --git a/meta/recipes-extended/<wbr>watchdog/watchdog-config/<wbr>watch=
dog.conf b/meta/recipes-extended/<wbr>watchdog/watchdog-config/<wbr>watchdo=
g.conf<br>
new file mode 100644<br>
index 0000000..c493d12<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/<wbr>watchdog/watchdog-config/<wbr>watchdog.con=
f<br>
@@ -0,0 +1,42 @@<br>
+#ping=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 17=
2.31.14.1<br>
+#ping=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 17=
2.26.1.255<br>
+#interface=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D eth0<br>
+#file=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D /v=
ar/log/messages<br>
+#change=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D 1407<br>
+<br>
+# Uncomment to enable test. Setting one of these values to &#39;0&#39; dis=
ables it.<br>
+# These values will hopefully never reboot your machine during normal use<=
br>
+# (if your machine is really hung, the loadavg will go much higher than 25=
)<br>
+#max-load-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 24<br>
+#max-load-5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 18<br>
+#max-load-15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 12<br>
+<br>
+# Note that this is the number of pages!<br>
+# To get the real size, check how large the pagesize is on your machine.<b=
r>
+#min-memory=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 1<br>
+<br>
+#repair-binary=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D /usr/sbin/repair<br>
+#repair-timeout=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
<br>
+#test-binary=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
+#test-timeout=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
+<br>
+watchdog-device=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D /dev/watchdog<br>
+<br>
+# Defaults compiled into the binary<br>
+#temperature-device=C2=A0 =C2=A0 =3D<br>
+#max-temperature=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 120<br>
+<br>
+# Defaults compiled into the binary<br>
+#admin=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ro=
ot<br>
+#interval=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 1<br>
+#logtick=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 1<br>
+#log-dir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D /var/lo=
g/watchdog<br>
+<br>
+# This greatly decreases the chance that watchdog won&#39;t be scheduled b=
efore<br>
+# your machine is really loaded<br>
+realtime=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D yes<br>
+priority=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 1<br>
+<br>
+# Check if rsyslogd is still running by enabling the following line<br>
+#pidfile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D /var/ru=
n/rsyslogd.pid<br>
+<br>
diff --git a/meta/recipes-extended/<wbr>watchdog/watchdog-config/<wbr>watch=
dog.default b/meta/recipes-extended/<wbr>watchdog/watchdog-config/<wbr>watc=
hdog.default<br>
new file mode 100644<br>
index 0000000..647d5ab<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/<wbr>watchdog/watchdog-config/<wbr>watchdog.def=
ault<br>
@@ -0,0 +1,2 @@<br>
+# Start watchdog at boot time? 0 or 1<br>
+run_watchdog=3D1<br>
diff --git a/meta/recipes-extended/<wbr>watchdog/<a href=3D"http://watchdog=
_5.15.bb" rel=3D"noreferrer" target=3D"_blank">watchdog_5.15.bb</a> b/meta/=
recipes-extended/<wbr>watchdog/<a href=3D"http://watchdog_5.15.bb" rel=3D"n=
oreferrer" target=3D"_blank">watchdog_5.15.bb</a><br>
index 1c0049c..cedfc04 100644<br>
--- a/meta/recipes-extended/<wbr>watchdog/<a href=3D"http://watchdog_5.15.b=
b" rel=3D"noreferrer" target=3D"_blank">watchdog_5.15.bb</a><br>
+++ b/meta/recipes-extended/<wbr>watchdog/<a href=3D"http://watchdog_5.15.b=
b" rel=3D"noreferrer" target=3D"_blank">watchdog_5.15.bb</a><br>
@@ -40,6 +40,9 @@ INITSCRIPT_PARAMS_${PN}-<wbr>keepalive =3D &quot;start 15=
 1 2 3 4 5 . stop 85 0 6 .&quot;<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D ${S}/redhat/watchdog.init ${D}/${sys=
confdir}/init.d/<wbr>watchdog.sh<br>
=C2=A0 =C2=A0 =C2=A0install -Dm 0755 ${WORKDIR}/wd_keepalive.init ${D}${sys=
confdir}/init.d/wd_<wbr>keepalive<br>
+<br>
+=C2=A0 =C2=A0 # watchdog.conf is provided by the watchdog-config recipe<br=
>
+=C2=A0 =C2=A0 rm ${D}${sysconfdir}/watchdog.<wbr>conf<br>
=C2=A0}<br>
<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-keepalive&quot;<br>
@@ -49,7 +52,8 @@ FILES_${PN}-keepalive =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/wd_keepalive \<br>
=C2=A0&quot;<br>
<br>
-RDEPENDS_${PN} +=3D &quot;${PN}-keepalive&quot;<br>
+RDEPENDS_${PN} +=3D &quot;${PN}-config ${PN}-keepalive&quot;<br>
+RDEPENDS_${PN}-keepalive +=3D &quot;${PN}-config&quot;<br>
<br>
=C2=A0RRECOMMENDS_${PN} =3D &quot;kernel-module-softdog&quot;<br>
<br>
--<br>
2.1.4<br>
<br>
</div></div></blockquote></div><br></div>

--001a114012604e3991053bd6ffde--
