Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 46CDE77562
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 13:44:26 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id s64so1158387lfs.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Sep 2016 06:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KBe6yITwgRzRz+hkWaF7rHdi4GcuWlMNHcZH8h5VXgA=;
	b=jLGav4ujEllrFCbKwFHP0xJOdRQ7s47aUJxNAL5VDWZXEH5MRdJXFgcytvAOXS/cPy
	R6HtTHcWRzYXdKhme3Huf8Sz031y89/mMI6G5+Ihufieamdiy+YUcd1Ow+8vsw6ugnxb
	W166N7LpEbvrbaxteQA4v2jKhA/Qk9sMY5M4DvB+MLyMlWzyt6fcxARSG65iQXxZRqbR
	eBXuROMDBsAeejEOzVTUeUfUU1LGsdhnLNblejuEa9SQgO8VwIWrXq1OhgLthCZBZIQp
	1wSsr1KH7PakRlhLskoPu2E5N34I4hQbUnrYg2qSU182y3gfW5NiOW7h7bhK6Sk6ZH0z
	6evQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KBe6yITwgRzRz+hkWaF7rHdi4GcuWlMNHcZH8h5VXgA=;
	b=bZmpcx+pU8aJ3T76UzVzwYYBBgTTqXHgF7rLKbueJoY/qu1wtuXMvPCjjUb23qzSmp
	IV/yavAGBYd9QJyld69ELMHo0vAwnzGvTgRe9hnfsVgrpiR/ApP/yNgFui2jwJBjV3+z
	02LdbPZ0kFZ3JzgJOkfXT3d3NsWmTB94bk3l5SCqWE3OSlJYJsgpP6pC0+c51zv9mYR8
	N9zGxdiuEdfxrjmwUontRstFeIOl3NNqStVNOEy1Ycmsb83bRdXkBq7Jtx2HsZPNK44/
	SORkfMmu4Oh7EsqiE3gIrKiZxuIunyyVc+xxjNqMBMtFf7b7DK92rCB/E+Jbn94SoaCG
	SRfw==
X-Gm-Message-State: AE9vXwMlD7Glkcm20uJW7NnpvvG9yqkkuDlMbBhzb4YtiLcHk2a3s0enXHbg7g7u/vUjBgFY56YIMcETpcFfGA==
X-Received: by 10.25.139.195 with SMTP id n186mr3399237lfd.62.1473169466755;
	Tue, 06 Sep 2016 06:44:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.221.67 with HTTP; Tue, 6 Sep 2016 06:43:56 -0700 (PDT)
X-Originating-IP: [179.105.254.222]
In-Reply-To: <1472241302-7437-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1472241302-7437-1-git-send-email-fabio.berton@ossystems.com.br>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Tue, 6 Sep 2016 10:43:56 -0300
Message-ID: <CAAPZna0iZwimLc7yUP7AypN4xKtng7OCRHPy+JH7kOcBxnwr1w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 1/2] watchdog: Add wd_keepalive package
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
X-List-Received-Date: Tue, 06 Sep 2016 13:44:28 -0000
Content-Type: multipart/alternative; boundary=001a113ebaa6c2a010053bd6fe33

--001a113ebaa6c2a010053bd6fe33
Content-Type: text/plain; charset=UTF-8

ping?

On Fri, Aug 26, 2016 at 4:55 PM, Fabio Berton <fabio.berton@ossystems.com.br
> wrote:

> This is a simplified version of the watchdog daemon. It only opens
> /dev/watchdog, and keeps writing to it often enough to keep the kernel
> from resetting, at least once per minute. Each write delays the reboot
> time another minute. After a minute of inactivity the watchdog hardware
> will cause a reset. In the case of the software watchdog the ability to
> reboot will depend on the state of the machines and interrupts.
>
> Installs wd_keepalive binary and enable initscript.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../watchdog/watchdog/wd_keepalive.init            | 121
> +++++++++++++++++++++
>  meta/recipes-extended/watchdog/watchdog_5.15.bb    |  23 +++-
>  2 files changed, 141 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-extended/watchdog/watchdog/wd_
> keepalive.init
>
> diff --git a/meta/recipes-extended/watchdog/watchdog/wd_keepalive.init
> b/meta/recipes-extended/watchdog/watchdog/wd_keepalive.init
> new file mode 100644
> index 0000000..1d3e4c5
> --- /dev/null
> +++ b/meta/recipes-extended/watchdog/watchdog/wd_keepalive.init
> @@ -0,0 +1,121 @@
> +#!/bin/sh
> +#/etc/init.d/wd_keepalive: start wd_keepalive daemon.
> +
> +### BEGIN INIT INFO
> +# Provides:          wd_keepalive
> +# Short-Description: Start watchdog keepalive daemon
> +# Required-Start:    $remote_fs
> +# Required-Stop:     $remote_fs
> +# X-Start-Before:    $all
> +# Default-Start:     2 3 4 5
> +# Default-Stop
> +### END INIT INFO
> +
> +PATH=/bin:/usr/bin:/sbin:/usr/sbin
> +
> +test -x /usr/sbin/wd_keepalive || exit 0
> +
> +# For configuration of the init script use the file
> +# /etc/default/watchdog, do not edit this init script.
> +
> +# Set run_watchdog to 1 to start watchdog or 0 to disable it.
> +run_watchdog=0
> +
> +# Specify additional watchdog options here (see manpage).
> +watchdog_options=""
> +
> +# Specify module to load
> +watchdog_module="none"
> +
> +[ -e /etc/default/watchdog ] && . /etc/default/watchdog
> +
> +NAME=wd_keepalive
> +DAEMON=/usr/sbin/wd_keepalive
> +
> +STOP_RETRY_SCHEDULE='TERM/10/forever/KILL/1'
> +
> +# . /lib/lsb/init-functions
> +
> +# Mock Debian stuff
> +log_begin_msg() {
> +    echo -n $*
> +}
> +
> +log_end_msg() {
> +    if [ "$1" = "0" ]; then
> +        echo 'done'
> +    else
> +        echo 'error'
> +    fi
> +}
> +
> +log_daemon_msg() {
> +    echo $*
> +}
> +
> +log_progress_msg() {
> +    echo $*
> +}
> +
> +
> +case "$1" in
> +  start)
> +    if [ $run_watchdog = 1 ]
> +    then
> +        [ ${watchdog_module:-none} != "none" ] && /sbin/modprobe
> $watchdog_module
> +       echo -n "Starting watchdog keepalive daemon: "
> +       if start-stop-daemon --start --quiet \
> +           --exec $DAEMON -- $watchdog_options
> +       then
> +           echo wd_keepalive.
> +       else
> +           echo
> +       fi
> +    fi
> +    ;;
> +
> +  stop)
> +    if [ $run_watchdog = 1 ]
> +    then
> +       echo -n "Stopping watchdog keepalive daemon: "
> +       if start-stop-daemon --stop --quiet --pidfile /var/run/$NAME.pid \
> +           $STOP_RETRY_SCHEDULE
> +       then
> +           echo wd_keepalive.
> +       else
> +           echo
> +       fi
> +    fi
> +    ;;
> +
> +  status)
> +    status_of_proc "$DAEMON" "$NAME" && exit 0 || exit $?
> +    ;;
> +
> +  restart)
> +    $0 force-reload
> +    ;;
> +
> +  force-reload)
> +    if [ $run_watchdog = 0 ]; then exit 0; fi
> +    echo -n "Restarting $NAME daemon."
> +    start-stop-daemon --stop --quiet --pidfile /var/run/$NAME.pid \
> +       $STOP_RETRY_SCHEDULE
> +    echo -n "."
> +    if start-stop-daemon --start --quiet --pidfile /var/run/$NAME.pid \
> +       --exec $DAEMON -- $watchdog_options
> +    then
> +       echo "done."
> +    else
> +       echo
> +    fi
> +    ;;
> +
> +  *)
> +    echo "Usage: /etc/init.d/wd_keepalive {start|stop|status|restart|
> force-reload}"
> +    exit 1
> +
> +esac
> +
> +exit 0
> +
> diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb
> b/meta/recipes-extended/watchdog/watchdog_5.15.bb
> index ee1a893..1c0049c 100644
> --- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
> +++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
> @@ -12,6 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz
> \
>             file://0001-Include-linux-param.h-for-EXEC_PAGESIZE-definition.patch
> \
>             file://watchdog-init.patch \
>             file://watchdog-conf.patch \
> +           file://wd_keepalive.init \
>  "
>
>  SRC_URI[md5sum] = "678c32f6f35a0492c9c1b76b4aa88828"
> @@ -28,11 +29,27 @@ CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc "
>  LDFLAGS_append_libc-musl = " -ltirpc "
>  EXTRA_OECONF_append_libc-musl = " --disable-nfs "
>
> -INITSCRIPT_NAME = "watchdog.sh"
> -INITSCRIPT_PARAMS = "start 15 1 2 3 4 5 . stop 85 0 6 ."
> +INITSCRIPT_PACKAGES = "${PN} ${PN}-keepalive"
>
> -RRECOMMENDS_${PN} = "kernel-module-softdog"
> +INITSCRIPT_NAME_${PN} = "watchdog.sh"
> +INITSCRIPT_PARAMS_${PN} = "start 15 1 2 3 4 5 . stop 85 0 6 ."
> +
> +INITSCRIPT_NAME_${PN}-keepalive = "wd_keepalive"
> +INITSCRIPT_PARAMS_${PN}-keepalive = "start 15 1 2 3 4 5 . stop 85 0 6 ."
>
>  do_install_append() {
>         install -D ${S}/redhat/watchdog.init ${D}/${sysconfdir}/init.d/
> watchdog.sh
> +    install -Dm 0755 ${WORKDIR}/wd_keepalive.init
> ${D}${sysconfdir}/init.d/wd_keepalive
>  }
> +
> +PACKAGES =+ "${PN}-keepalive"
> +
> +FILES_${PN}-keepalive = " \
> +    ${sysconfdir}/init.d/wd_keepalive \
> +    ${sbindir}/wd_keepalive \
> +"
> +
> +RDEPENDS_${PN} += "${PN}-keepalive"
> +
> +RRECOMMENDS_${PN} = "kernel-module-softdog"
> +
> --
> 2.1.4
>
>

--001a113ebaa6c2a010053bd6fe33
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">ping?<br></div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On Fri, Aug 26, 2016 at 4:55 PM, Fabio Ber=
ton <span dir=3D"ltr">&lt;<a href=3D"mailto:fabio.berton@ossystems.com.br" =
target=3D"_blank">fabio.berton@ossystems.com.br</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><span class=3D"">This is a simplified version =
of the watchdog daemon. It only opens<br>
/dev/watchdog, and keeps writing to it often enough to keep the kernel<br>
from resetting, at least once per minute. Each write delays the reboot<br>
time another minute. After a minute of inactivity the watchdog hardware<br>
will cause a reset. In the case of the software watchdog the ability to<br>
reboot will depend on the state of the machines and interrupts.<br>
<br>
Installs wd_keepalive binary and enable initscript.<br>
<br>
Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.co=
m.br">fabio.berton@ossystems.com.br</a><wbr>&gt;<br>
</span>Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystem=
s.com.br">otavio@ossystems.com.br</a>&gt;<br>
<div class=3D"HOEnZb"><div class=3D"h5">---<br>
=C2=A0.../watchdog/watchdog/wd_<wbr>keepalive.init=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 121 +++++++++++++++++++++<br>
=C2=A0meta/recipes-extended/<wbr>watchdog/<a href=3D"http://watchdog_5.15.b=
b" rel=3D"noreferrer" target=3D"_blank">watchdog_5.15.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 23 +++-<br>
=C2=A02 files changed, 141 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-extended/<wbr>watchdog/watchdog/wd_<w=
br>keepalive.init<br>
<br>
diff --git a/meta/recipes-extended/<wbr>watchdog/watchdog/wd_<wbr>keepalive=
.init b/meta/recipes-extended/<wbr>watchdog/watchdog/wd_<wbr>keepalive.init=
<br>
new file mode 100644<br>
index 0000000..1d3e4c5<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/<wbr>watchdog/watchdog/wd_<wbr>keepalive.init<b=
r>
@@ -0,0 +1,121 @@<br>
+#!/bin/sh<br>
+#/etc/init.d/wd_keepalive: start wd_keepalive daemon.<br>
+<br>
+### BEGIN INIT INFO<br>
+# Provides:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wd_keepalive<br>
+# Short-Description: Start watchdog keepalive daemon<br>
+# Required-Start:=C2=A0 =C2=A0 $remote_fs<br>
+# Required-Stop:=C2=A0 =C2=A0 =C2=A0$remote_fs<br>
+# X-Start-Before:=C2=A0 =C2=A0 $all<br>
+# Default-Start:=C2=A0 =C2=A0 =C2=A02 3 4 5<br>
+# Default-Stop<br>
+### END INIT INFO<br>
+<br>
+PATH=3D/bin:/usr/bin:/sbin:/<wbr>usr/sbin<br>
+<br>
+test -x /usr/sbin/wd_keepalive || exit 0<br>
+<br>
+# For configuration of the init script use the file<br>
+# /etc/default/watchdog, do not edit this init script.<br>
+<br>
+# Set run_watchdog to 1 to start watchdog or 0 to disable it.<br>
+run_watchdog=3D0<br>
+<br>
+# Specify additional watchdog options here (see manpage).<br>
+watchdog_options=3D&quot;&quot;<br>
+<br>
+# Specify module to load<br>
+watchdog_module=3D&quot;none&quot;<br>
+<br>
+[ -e /etc/default/watchdog ] &amp;&amp; . /etc/default/watchdog<br>
+<br>
+NAME=3Dwd_keepalive<br>
+DAEMON=3D/usr/sbin/wd_keepalive<br>
+<br>
+STOP_RETRY_SCHEDULE=3D&#39;TERM/10/<wbr>forever/KILL/1&#39;<br>
+<br>
+# . /lib/lsb/init-functions<br>
+<br>
+# Mock Debian stuff<br>
+log_begin_msg() {<br>
+=C2=A0 =C2=A0 echo -n $*<br>
+}<br>
+<br>
+log_end_msg() {<br>
+=C2=A0 =C2=A0 if [ &quot;$1&quot; =3D &quot;0&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &#39;done&#39;<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &#39;error&#39;<br>
+=C2=A0 =C2=A0 fi<br>
+}<br>
+<br>
+log_daemon_msg() {<br>
+=C2=A0 =C2=A0 echo $*<br>
+}<br>
+<br>
+log_progress_msg() {<br>
+=C2=A0 =C2=A0 echo $*<br>
+}<br>
+<br>
+<br>
+case &quot;$1&quot; in<br>
+=C2=A0 start)<br>
+=C2=A0 =C2=A0 if [ $run_watchdog =3D 1 ]<br>
+=C2=A0 =C2=A0 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ ${watchdog_module:-none} !=3D &quot;none&quo=
t; ] &amp;&amp; /sbin/modprobe $watchdog_module<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo -n &quot;Starting watchdog keepalive daemo=
n: &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if start-stop-daemon --start --quiet \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--exec $DAEMON -- $watchdog_optio=
ns<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo wd_keepalive.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 ;;<br>
+<br>
+=C2=A0 stop)<br>
+=C2=A0 =C2=A0 if [ $run_watchdog =3D 1 ]<br>
+=C2=A0 =C2=A0 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo -n &quot;Stopping watchdog keepalive daemo=
n: &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if start-stop-daemon --stop --quiet --pidfile /=
var/run/$NAME.pid \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$STOP_RETRY_SCHEDULE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo wd_keepalive.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 ;;<br>
+<br>
+=C2=A0 status)<br>
+=C2=A0 =C2=A0 status_of_proc &quot;$DAEMON&quot; &quot;$NAME&quot; &amp;&a=
mp; exit 0 || exit $?<br>
+=C2=A0 =C2=A0 ;;<br>
+<br>
+=C2=A0 restart)<br>
+=C2=A0 =C2=A0 $0 force-reload<br>
+=C2=A0 =C2=A0 ;;<br>
+<br>
+=C2=A0 force-reload)<br>
+=C2=A0 =C2=A0 if [ $run_watchdog =3D 0 ]; then exit 0; fi<br>
+=C2=A0 =C2=A0 echo -n &quot;Restarting $NAME daemon.&quot;<br>
+=C2=A0 =C2=A0 start-stop-daemon --stop --quiet --pidfile /var/run/$NAME.pi=
d \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$STOP_RETRY_SCHEDULE<br>
+=C2=A0 =C2=A0 echo -n &quot;.&quot;<br>
+=C2=A0 =C2=A0 if start-stop-daemon --start --quiet --pidfile /var/run/$NAM=
E.pid \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0--exec $DAEMON -- $watchdog_options<br>
+=C2=A0 =C2=A0 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;done.&quot;<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo<br>
+=C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 ;;<br>
+<br>
+=C2=A0 *)<br>
+=C2=A0 =C2=A0 echo &quot;Usage: /etc/init.d/wd_keepalive {start|stop|statu=
s|restart|<wbr>force-reload}&quot;<br>
+=C2=A0 =C2=A0 exit 1<br>
+<br>
+esac<br>
+<br>
+exit 0<br>
+<br>
diff --git a/meta/recipes-extended/<wbr>watchdog/<a href=3D"http://watchdog=
_5.15.bb" rel=3D"noreferrer" target=3D"_blank">watchdog_5.15.bb</a> b/meta/=
recipes-extended/<wbr>watchdog/<a href=3D"http://watchdog_5.15.bb" rel=3D"n=
oreferrer" target=3D"_blank">watchdog_5.15.bb</a><br>
index ee1a893..1c0049c 100644<br>
--- a/meta/recipes-extended/<wbr>watchdog/<a href=3D"http://watchdog_5.15.b=
b" rel=3D"noreferrer" target=3D"_blank">watchdog_5.15.bb</a><br>
+++ b/meta/recipes-extended/<wbr>watchdog/<a href=3D"http://watchdog_5.15.b=
b" rel=3D"noreferrer" target=3D"_blank">watchdog_5.15.bb</a><br>
@@ -12,6 +12,7 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/<wbr>watchdog/wat=
chdog-${PV}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Include-linux-<wbr>pa=
ram.h-for-EXEC_PAGESIZE-<wbr>definition.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://watchdog-init.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://watchdog-conf.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://wd_keepalive.init \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>678c32f6f35a0492c9c1b76b4aa888<wbr>28&=
quot;<br>
@@ -28,11 +29,27 @@ CFLAGS_append_libc-musl =3D &quot; -I${STAGING_INCDIR}/=
tirpc &quot;<br>
=C2=A0LDFLAGS_append_libc-musl =3D &quot; -ltirpc &quot;<br>
=C2=A0EXTRA_OECONF_append_libc-musl =3D &quot; --disable-nfs &quot;<br>
<br>
-INITSCRIPT_NAME =3D &quot;watchdog.sh&quot;<br>
-INITSCRIPT_PARAMS =3D &quot;start 15 1 2 3 4 5 . stop 85 0 6 .&quot;<br>
+INITSCRIPT_PACKAGES =3D &quot;${PN} ${PN}-keepalive&quot;<br>
<br>
-RRECOMMENDS_${PN} =3D &quot;kernel-module-softdog&quot;<br>
+INITSCRIPT_NAME_${PN} =3D &quot;watchdog.sh&quot;<br>
+INITSCRIPT_PARAMS_${PN} =3D &quot;start 15 1 2 3 4 5 . stop 85 0 6 .&quot;=
<br>
+<br>
+INITSCRIPT_NAME_${PN}-<wbr>keepalive =3D &quot;wd_keepalive&quot;<br>
+INITSCRIPT_PARAMS_${PN}-<wbr>keepalive =3D &quot;start 15 1 2 3 4 5 . stop=
 85 0 6 .&quot;<br>
<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D ${S}/redhat/watchdog.init ${D}/${sys=
confdir}/init.d/<wbr>watchdog.sh<br>
+=C2=A0 =C2=A0 install -Dm 0755 ${WORKDIR}/wd_keepalive.init ${D}${sysconfd=
ir}/init.d/wd_<wbr>keepalive<br>
=C2=A0}<br>
+<br>
+PACKAGES =3D+ &quot;${PN}-keepalive&quot;<br>
+<br>
+FILES_${PN}-keepalive =3D &quot; \<br>
+=C2=A0 =C2=A0 ${sysconfdir}/init.d/wd_<wbr>keepalive \<br>
+=C2=A0 =C2=A0 ${sbindir}/wd_keepalive \<br>
+&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot;${PN}-keepalive&quot;<br>
+<br>
+RRECOMMENDS_${PN} =3D &quot;kernel-module-softdog&quot;<br>
+<br>
--<br>
2.1.4<br>
<br>
</div></div></blockquote></div><br></div>

--001a113ebaa6c2a010053bd6fe33--
