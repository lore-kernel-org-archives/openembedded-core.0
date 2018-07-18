Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 467C878A04
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 12:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id AD60B18542;
	Wed, 18 Jul 2018 14:33:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id hIF3AIG4oEV0; Wed, 18 Jul 2018 14:33:25 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 0C1FE183C4;
	Wed, 18 Jul 2018 14:33:25 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4EA61E079;
	Wed, 18 Jul 2018 14:33:24 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D92021E078;
	Wed, 18 Jul 2018 14:33:24 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed, 18 Jul 2018 14:33:24 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id CC6BBEC8;
	Wed, 18 Jul 2018 14:33:24 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 18 Jul 2018 14:33:24 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 18 Jul 2018 14:33:24 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Wed, 18 Jul 2018 14:33:24 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] sshd: add sshd.service
Thread-Index: AQHUHNk5lLtK6nMLYkqcYHg28jPL/KSU6Kiw
Date: Wed, 18 Jul 2018 12:33:24 +0000
Message-ID: <f38463fd13004c0a962007dda7d34b82@XBOX02.axis.com>
References: <1531727199-24488-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1531727199-24488-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] sshd: add sshd.service
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
X-List-Received-Date: Wed, 18 Jul 2018 12:33:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Zheng Ruoqin
> Sent: den 16 juli 2018 09:47
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] sshd: add sshd.service
>=20
> Add sshd.service for user to start the sshd deamon.

Why would we want this? This will start the sshd server=20
unconditionally, instead of the current solution which only starts=20
it if someone actually connects to port 22.

If there is some technical reason to have the sshd service always=20
running, then that should be optional and enabled using a=20
PACKAGECONFIG (which should be disabled by default).

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-connectivity/openssh/openssh/sshd.service | 16
> ++++++++++++++++
>  meta/recipes-connectivity/openssh/openssh_7.7p1.bb     |  2 ++
>  2 files changed, 18 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/sshd.servic=
e
>=20
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.service b/met=
a/recipes-connectivity/openssh/openssh/sshd.service
> new file mode 100644
> index 0000000..eb87d32
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/sshd.service
> @@ -0,0 +1,16 @@
> +[Unit]
> +Description=3DOpenSSH server daemon
> +Documentation=3Dman:sshd(8) man:sshd_config(5)
> +After=3Dnetwork.target sshd-keygen.service
> +Wants=3Dsshd-keygen.service

Where do you get the sshd-keygen service from? There is a
sshdgenkeys service (as can be seen below)...

> +
> +[Service]
> +EnvironmentFile=3D/etc/sysconfig/sshd

This does not match the current configuration in sshd@.service,=20
which uses /etc/default/ssh.

> +ExecStart=3D/usr/sbin/sshd -D $OPTIONS
> +ExecReload=3D/bin/kill -HUP $MAINPID

Don't use hardcoded paths. See example in sshd@.service how this=20
should be handled.

> +KillMode=3Dprocess
> +Restart=3Don-failure
> +RestartSec=3D42s
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_7.7p1.bb
> index b3da5f6..def4062 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
> @@ -17,6 +17,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH=
/portable/openssh-${PV}.tar
>             file://ssh_config \
>             file://init \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI=
}', '', d)} \
> +           file://sshd.service \
>             file://sshd.socket \
>             file://sshd@.service \
>             file://sshdgenkeys.service \
> @@ -111,6 +112,7 @@ do_install_append () {
>  	echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/s=
sh/sshd_config_readonly
>=20
>  	install -d ${D}${systemd_unitdir}/system
> +	install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_unitdir}/syste=
m
>  	install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/system
>  	install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_unitdir}/syst=
em
>  	install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_unitdir=
}/system
> --
> 2.7.4

//Peter


