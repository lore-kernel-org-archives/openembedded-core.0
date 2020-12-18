Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.4148.1608259565854158431
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 18:46:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I7u3jIap;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: kergoth@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id z12so512269pjn.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 18:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version;
        bh=Usl4RbMe1IjcrEhhKEKJFrdTkaykpaLvfqlggzRun7A=;
        b=I7u3jIapbgs9Z14+h8ZliD92t6dUjSkocSbdG9urr5fiKG2vOn4w01wYmkYcFORLug
         QUuoQrbGR7wKK3fX6/fD8p1l53tgheHYF32k7knIUciZfFcKHvYBkdlggqTXxorfyxGR
         l6a4dy+N6mpiZqusOUeqNA+Lu0te52Gf3dqq0+n3R+8mQ4oyv8SfV0j9jObImjgZJxnT
         2M8Zx7/DA+Qf2wLnSuTdZzFU8HSEX00e9OBUMEFljDjfb38nKCNcRBN1k0+OmDu+ul0s
         hzJvf8N7BaJeVY10pC5F6bzcbuXRIqxHzNo8ismPtifMs039+Lvg/OsidD3okfqCoyhx
         hGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version;
        bh=Usl4RbMe1IjcrEhhKEKJFrdTkaykpaLvfqlggzRun7A=;
        b=QodDqVyPp/t4GR3z+hb5VJ/MHqiTkR/MJQNrhqBN75Jihq3QeLAM7ZQkUR08BEYcDp
         Wl6nQxgkeuTAaXiRdIIJTwoS8o4JCaI2rpqDZevt5LE9oTzcg9M4HG/a0pV4RpROj3tm
         ihxktApCO5cLM3cfj481Xe2ADIna5qlIn+sRxmyGgJrMh+0wRX75rF7vqaiKU5NPYEfD
         NkZhOH1h9Mbye3MypC+c/KIM3SAt2PGj3azqD6azibeoH/gVKuEmvwurkwhB6DW+DYvp
         zHeGmzOV4oQecF9qfa3SKHwzI3Xy15hDgIbr0ZKHXTr6oLA/HUbBf6NAitgiiRzqKGtB
         ZcfQ==
X-Gm-Message-State: AOAM532z7PmhWt4qIw3xEUiq6ZgBpsxCRts6AUkLavAVAr97KzRUDxCv
	IfQtFqcCi6ehdmihpUJxdvM=
X-Google-Smtp-Source: ABdhPJzrTqejX5Ru5zNc+f0LkpxkOUZDWboIlXGUKbn4H1tSku99SJFAxfIvOVLyIOpPhRIfjIrRbQ==
X-Received: by 2002:a17:902:b688:b029:dc:240a:2bd7 with SMTP id c8-20020a170902b688b02900dc240a2bd7mr2131601pls.50.1608259565198;
        Thu, 17 Dec 2020 18:46:05 -0800 (PST)
Return-Path: <kergoth@gmail.com>
Received: from [192.168.1.17] (ip72-201-170-237.ph.ph.cox.net. [72.201.170.237])
        by smtp.gmail.com with ESMTPSA id y6sm7098627pfn.145.2020.12.17.18.46.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Dec 2020 18:46:04 -0800 (PST)
Date: Thu, 17 Dec 2020 19:45:56 -0700
From: "Christopher Larson" <kergoth@gmail.com>
To: Khem Raj <raj.khem@gmail.com>, Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <252c3e1e-16bc-4828-85e5-542bd6d643de@Spark>
In-Reply-To: <CAJ86T=VVepAL0d4d9AZnDr0auBYZyKOmz-gn3kExpaHkuOgFWg@mail.gmail.com>
References: <20201217225440.2633474-1-raj.khem@gmail.com>
 <20201217225440.2633474-3-raj.khem@gmail.com>
 <CAJ86T=VVepAL0d4d9AZnDr0auBYZyKOmz-gn3kExpaHkuOgFWg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] busybox: Run mdev as daemon
X-Readdle-Message-ID: 252c3e1e-16bc-4828-85e5-542bd6d643de@Spark
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="5fdc17e9_74b0dc51_12997"

--5fdc17e9_74b0dc51_12997
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Afaik, running a daemon in foreground mode and instructing start-stop-daemo=
n to background it is common practice if the daemon doesn=E2=80=99t support=
 writing a pidfile itself, so start-stop-daemon can handle it itself. Witho=
ut using foregrounded process + -b, it wouldn=E2=80=99t know the resulting =
process id. If busybox mdev supports a pidfile, this wouldn=E2=80=99t be ne=
cessary.

--
Christopher =E2=80=9Ckergoth=E2=80=9D Larson
chris_larson@mentor.com, chris.larson@siemens.com, kergoth@gmail.com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics, a Siemens Business
On Dec 17, 2020, 4:59 PM -0700, Andre McCurdy <armccurdy@gmail.com>, wrote=
:
> On Thu, Dec 17, 2020 at 2:54 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > When busybox is used for device management, kernel needs to support
> > older/obsolete mechanism via CONFIG_UEVENT_HELPER and
> > CONFIG_UEVENT_HELPER_PATH to enable /proc/sys/kernel/hotplug but this
> > would require kernel defconfig change and will always be needed when
> > mdev is used, intead run it in daemon mode
> >
> > Update mdev init script to run mdev in daemon mode
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > meta/recipes-core/busybox/busybox/mdev.cfg | 2 +
> > meta/recipes-core/busybox/files/mdev | 56 +++++++++++++++-------
> > 2 files changed, 41 insertions(+), 17 deletions(-)
> >
> > diff --git a/meta/recipes-core/busybox/busybox/mdev.cfg b/meta/recipes=
-core/busybox/busybox/mdev.cfg
> > index 6aefe90e43..143e6097cb 100644
> > --- a/meta/recipes-core/busybox/busybox/mdev.cfg
> > +++ b/meta/recipes-core/busybox/busybox/mdev.cfg
> > @@ -9,3 +9,5 @@ CONFIG_SETSID=3Dy
> > CONFIG_CTTYHACK=3Dy
> >
> > CONFIG_FEATURE_SHADOWPASSWDS=3Dy
> > +CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=3Dy
> > +CONFIG_FEATURE_MDEV_DAEMON=3Dy
> > diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/=
busybox/files/mdev
> > index 8c9c06e96c..2fbdfb073e 100755
> > --- a/meta/recipes-core/busybox/files/mdev
> > +++ b/meta/recipes-core/busybox/files/mdev
> > @@ -1,21 +1,43 @@
> > #!/bin/sh
> > -mount -t proc proc /proc
> > -mount -t sysfs sysfs /sys
> > -mount -t tmpfs tmpfs /dev -o size=3D64k,mode=3D0755
> > -mkdir /dev/pts /dev/shm
> > -chmod 777 /dev/shm
> > -mount -t devpts devpts /dev/pts
> > -touch /dev/mdev.seq
> > -#sysctl -w kernel.hotplug=3D/sbin/mdev
> > -echo "/sbin/mdev" > /proc/sys/kernel/hotplug
> > -mdev -s
> > -
> > #
> > -# We might have mounted something over /dev, see if /dev/initctl is t=
here.
> > +# Run the mdev daemon
> > #
> > -if test ! -p /dev/initctl
> > -then
> > - rm -f /dev/initctl
> > - mknod -m 600 /dev/initctl p
> > -fi
> > +
> > +DAEMON=3D"mdev"
> > +PIDFILE=3D"/var/run/$DAEMON.pid"
> > +
> > +
> > +start() {
> > + echo -n "Starting $DAEMON... "
> > + start-stop-daemon -S -b -m -p $PIDFILE -x /sbin/mdev -- -df
>
> Where do these start-stop-daemon options come from? Using -b for an
> application which is designed to run as a daemon (and deliberately
> telling that app to run in the foreground) looks odd, etc.
>
> Are there bugs or limitations in mdev which you are trying to workaround=
?
>
> > + [ $? -eq 0 ] && echo "OK" || echo "ERROR"
> > +
> > + # coldplug modules
> > + find /sys/ -name modalias -print0 | \
> > + xargs -0 sort -u | \
> > + tr '\n' '\0' | \
> > + xargs -0 modprobe -abq
> > +}
> > +
> > +stop() {
> > + echo -n "Stopping $DAEMON... "
> > + start-stop-daemon -K -p $PIDFILE
> > + [ $? -eq 0 ] && echo "OK" || echo "ERROR"
> > +}
> > +
> > +restart() {
> > + stop
> > + start
> > +}
> > +
> > +case "$1" in
> > + start|stop|restart)
> > + "$1"
> > + ;;
> > + *)
> > + echo "Usage: $0 {start|stop|restart}"
> > + exit 1
> > +esac
> > +
> > +exit $?
> >
> > --
> > 2.29.2
> >
> >
> >
> >
>
>
>=20
>

--5fdc17e9_74b0dc51_12997
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D"http://www.w3.org/1999/xhtml">
<head>
<title></title>
</head>
<body>
<div name=3D"messageBodySection">
<div dir=3D"auto">Afaik, running a daemon in foreground mode and instructi=
ng start-stop-daemon to background it is common practice if the daemon does=
n=E2=80=99t support writing a pidfile itself, so start-stop-daemon can hand=
le it itself. Without using foregrounded process + -b, it wouldn=E2=80=99t =
know the resulting process id. If busybox mdev supports a pidfile, this wou=
ldn=E2=80=99t be necessary.</div>
</div>
<div name=3D"messageSignatureSection"><br />
<div class=3D"matchFont">
<div dir=3D"auto">--</div>
<div dir=3D"auto">Christopher =E2=80=9Ckergoth=E2=80=9D Larson</div>
<div dir=3D"auto">chris_larson@mentor.com, chris.larson@siemens.com, kergo=
th@gmail.com</div>
<div dir=3D"auto">Founder - BitBake, OpenEmbedded, OpenZaurus</div>
<div dir=3D"auto">Senior Software Engineer, Mentor Graphics, a Siemens Bus=
iness</div>
</div>
</div>
<div name=3D"messageReplySection">On Dec 17, 2020, 4:59 PM -0700, Andre Mc=
Curdy &lt;armccurdy@gmail.com&gt;, wrote:<br />
<blockquote type=3D"cite" style=3D"border-left-color: grey; border-left-wi=
dth: thin; border-left-style: solid; margin: 5px 5px;padding-left: 10px;">O=
n Thu, Dec 17, 2020 at 2:54 PM Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<b=
r />
<blockquote type=3D"cite"><br />
When busybox is used for device management, kernel needs to support<br />
older/obsolete mechanism via CONFIG_UEVENT_HELPER and<br />
CONFIG_UEVENT_HELPER_PATH to enable /proc/sys/kernel/hotplug but this<br /=
>
would require kernel defconfig change and will always be needed when<br />
mdev is used, intead run it in daemon mode<br />
<br />
Update mdev init script to run mdev in daemon mode<br />
<br />
Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br />
---<br />
meta/recipes-core/busybox/busybox/mdev.cfg | 2 +<br />
meta/recipes-core/busybox/files/mdev | 56 +++++++++++++++-------<br />
2 files changed, 41 insertions(+), 17 deletions(-)<br />
<br />
diff --git a/meta/recipes-core/busybox/busybox/mdev.cfg b/meta/recipes-cor=
e/busybox/busybox/mdev.cfg<br />
index 6aefe90e43..143e6097cb 100644<br />
--- a/meta/recipes-core/busybox/busybox/mdev.cfg<br />
+++ b/meta/recipes-core/busybox/busybox/mdev.cfg<br />
@@ -9,3 +9,5 @@ CONFIG_SETSID=3Dy<br />
CONFIG_CTTYHACK=3Dy<br />
<br />
CONFIG_FEATURE_SHADOWPASSWDS=3Dy<br />
+CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=3Dy<br />
+CONFIG_FEATURE_MDEV_DAEMON=3Dy<br />
diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/busy=
box/files/mdev<br />
index 8c9c06e96c..2fbdfb073e 100755<br />
--- a/meta/recipes-core/busybox/files/mdev<br />
+++ b/meta/recipes-core/busybox/files/mdev<br />
@@ -1,21 +1,43 @@<br />
#!/bin/sh<br />
-mount -t proc proc /proc<br />
-mount -t sysfs sysfs /sys<br />
-mount -t tmpfs tmpfs /dev -o size=3D64k,mode=3D0755<br />
-mkdir /dev/pts /dev/shm<br />
-chmod 777 /dev/shm<br />
-mount -t devpts devpts /dev/pts<br />
-touch /dev/mdev.seq<br />
-#sysctl -w kernel.hotplug=3D/sbin/mdev<br />
-echo "/sbin/mdev" &gt; /proc/sys/kernel/hotplug<br />
-mdev -s<br />
-<br />
#<br />
-# We might have mounted something over /dev, see if /dev/initctl is there=
.<br />
+# Run the mdev daemon<br />
#<br />
-if test ! -p /dev/initctl<br />
-then<br />
- rm -f /dev/initctl<br />
- mknod -m 600 /dev/initctl p<br />
-fi<br />
+<br />
+DAEMON=3D"mdev"<br />
+PIDFILE=3D"/var/run/$DAEMON.pid"<br />
+<br />
+<br />
+start() {<br />
+ echo -n "Starting $DAEMON... "<br />
+ start-stop-daemon -S -b -m -p $PIDFILE -x /sbin/mdev -- -df<br /></block=
quote>
<br />
Where do these start-stop-daemon options come from? Using -b for an<br />
application which is designed to run as a daemon (and deliberately<br />
telling that app to run in the foreground) looks odd, etc.<br />
<br />
Are there bugs or limitations in mdev which you are trying to workaround?<=
br />
<br />
<blockquote type=3D"cite">+ [ $? -eq 0 ] &amp;&amp; echo "OK" || echo "ERR=
OR"<br />
+<br />
+ # coldplug modules<br />
+ find /sys/ -name modalias -print0 | \<br />
+ xargs -0 sort -u | \<br />
+ tr '\n' '\0' | \<br />
+ xargs -0 modprobe -abq<br />
+}<br />
+<br />
+stop() {<br />
+ echo -n "Stopping $DAEMON... "<br />
+ start-stop-daemon -K -p $PIDFILE<br />
+ [ $? -eq 0 ] &amp;&amp; echo "OK" || echo "ERROR"<br />
+}<br />
+<br />
+restart() {<br />
+ stop<br />
+ start<br />
+}<br />
+<br />
+case "$1" in<br />
+ start|stop|restart)<br />
+ "$1"<br />
+ ;;<br />
+ *)<br />
+ echo "Usage: $0 {start|stop|restart}"<br />
+ exit 1<br />
+esac<br />
+<br />
+exit $?<br />
<br />
--<br />
2.29.2<br />
<br />
<br />
<br />
<br /></blockquote>
<br />
<br />
<br />
<br /></blockquote>
</div>
</body>
</html>

--5fdc17e9_74b0dc51_12997--
