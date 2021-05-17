Subject: Re: cml1.bbclass: Return sorted list of cfg files
To: openembedded-core@lists.openembedded.org
From: "Volker Vogelhuber" <v.vogelhuber@digitalendoscopy.de>
X-Originating-Location: Friedberg, Bavaria, DE (84.160.118.210)
X-Originating-Platform: Linux Firefox 88
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 17 May 2021 03:22:41 -0700
Message-ID: <necP.1621246961431634424.VVq4@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="F4Hy4TjDb2MGyYwHdE3d"

--F4Hy4TjDb2MGyYwHdE3d
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The commit dee41e92f0efac7e453597bed4b4c02f867e3aa9 has introduced a behavi=
or change when adding different cfg files configuring the same configs.

So e.g. when configuring busybox, the default recipe adds a syslog.cfg whi=
ch enables CONFIG_SYSLOGD=3Dy.
So far we had a .bbappend file that adds another .cfg file "disable_syslog=
.cfg" that changes this to "# CONFIG_SYSLOGD is not set".

As the SRC_URI files are now sorted alphabetically, this results in the di=
sable_syslog.cfg being passed to merge_config.sh before syslog.cfg which in=
 the end is not what we intended.
We solved it now by doing a SRC_URI_remove in the bbappend, but I'm not su=
re, if that sorting is causing side effects in other places as well.

--F4Hy4TjDb2MGyYwHdE3d
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The commit dee41e92f0efac7e453597bed4b4c02f867e3aa9 has introduced a behavi=
or change when adding different cfg files configuring the same configs.<br =
/><br />So e.g. when configuring busybox, the default recipe adds a syslog.=
cfg which enables CONFIG_SYSLOGD=3Dy. <br />So far we had a .bbappend file =
that adds another .cfg file "disable_syslog.cfg" that changes this to "# CO=
NFIG_SYSLOGD is not set". <br /><br />As the SRC_URI files are now sorted a=
lphabetically, this results in the disable_syslog.cfg being passed to merge=
_config.sh before syslog.cfg which in the end is not what we intended.<br /=
>We solved it now by doing a SRC_URI_remove in the bbappend, but I'm not su=
re, if that sorting is causing side effects in other places as well.

--F4Hy4TjDb2MGyYwHdE3d--
