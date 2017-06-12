Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 523DE601A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 12:25:00 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id 201so9362022itu.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 05:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QxPsh0HBZGhLeYL7DBt9pIlYDxa+LPy4sHv00i54CFE=;
	b=WIUt51X68KA85Hy2nch46swo2rHaP/leaXeZyqjg3sKbyf8VtVopT/tho8dduUSxDj
	8bsFjrVFYJx/8t4/5G8KcpaV/NAF+dS8fEEiuzqgqzLutEaewtlRbycTqd2i2Lg432h3
	3Xmi6f2o8639GYl6amRFWMjMhS2vmlZ4eTAuXfpZZ3OulYyQJgA9RVgeShDDMN1LAqhU
	RZTQ0uEXSL/zZGn35wpKiO9jTB7/t0YK9Vrp1J+R5W7Y6ycSKzYVwfe4xmudTBiFTHQO
	cIoPzlW2rwVMn0sjRbmFjGxevzwUsvQ0qlz3fyNzRfS4zri4yzycQweOfM7hnlaRQ26s
	XhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QxPsh0HBZGhLeYL7DBt9pIlYDxa+LPy4sHv00i54CFE=;
	b=bZvodUdyciK1dn6Y9XgVCHyyeuAOA9YHiUgCmbN3OqwqWH0YhOxuw6zJYq8xoMbxuQ
	/g3EnFxdaG+tqWQnEcgEcgSfjP1X8vLv//WqNjbhymLlNl/i97ZGoeeFJjo524fFoDiV
	ufu/KSoWTCP8oI9jNUI5WtL9xfUjimfut3DhNo6SRSybz7DUZ7OU1cXFv+JwdUpCavP7
	1nkaYUnFFkmDJRWn0wAEvnWpHCeIEuNzaQTpBHUFvPhXHp6PAGtyyLOsSHi8p41uIUJM
	eo9fHsQFD4hJd+CmVoibHhW4plc83B7zPpibbdCsYCLZUHx5jnlMQlhw3jDjo6eIjXvl
	3r2g==
X-Gm-Message-State: AODbwcDVxxrk53O3C6KqCmH2w53Pb6rpLSvyqHw6uy52I1D0WRkS+L+q
	wRQ1X5GlWNfYmEu784E=
X-Received: by 10.36.194.71 with SMTP id i68mr11878939itg.106.1497270302011;
	Mon, 12 Jun 2017 05:25:02 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	b70sm4569097ioe.57.2017.06.12.05.25.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Jun 2017 05:25:00 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1497270300.1888.0.camel@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Jun 2017 07:25:00 -0500
In-Reply-To: <CAJdd5GY3pvJY0VvkANRvDkZxWU8AFCcn5sWu=K9-gnMDmRjHrw@mail.gmail.com>
References: <CAJdd5GYuBbqarXs38M91atDyQhz17EcPDE9yKme-oiwDjCtaaA@mail.gmail.com>
	<20170601030557.9337-1-JPEWhacker@gmail.com>
	<CAJdd5GY3pvJY0VvkANRvDkZxWU8AFCcn5sWu=K9-gnMDmRjHrw@mail.gmail.com>
X-Mailer: Evolution 3.22.6 (3.22.6-2.fc25) 
Mime-Version: 1.0
Subject: Re: [PATCH v7] openssh: Atomically generate host keys
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
X-List-Received-Date: Mon, 12 Jun 2017 12:25:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-06-06 at 22:30 -0500, Joshua Watt wrote:
> On Wed, May 31, 2017 at 10:05 PM, Joshua Watt <jpewhacker@gmail.com>
> wrote:
> > Generating the host keys atomically prevents power interruptions
> > during
> > the first boot from leaving the key files incomplete, which often
> > prevents users from being able to ssh into the device.
> > 
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/recipes-connectivity/openssh/openssh/init     | 22 ++++----
> > ------
> >  .../openssh/openssh/sshd-check-key                 | 35
> > ++++++++++++++++++++++
> >  .../openssh/openssh/sshdgenkeys.service            | 25 ++++++++
> > --------
> >  meta/recipes-connectivity/openssh/openssh_7.5p1.bb |  8 +++++
> >  4 files changed, 61 insertions(+), 29 deletions(-)
> >  create mode 100644 meta/recipes-connectivity/openssh/openssh/sshd-
> > check-key
> > 
> > diff --git a/meta/recipes-connectivity/openssh/openssh/init
> > b/meta/recipes-connectivity/openssh/openssh/init
> > index 1f63725..e02c479 100644
> > --- a/meta/recipes-connectivity/openssh/openssh/init
> > +++ b/meta/recipes-connectivity/openssh/openssh/init
> > @@ -45,23 +45,11 @@ check_config() {
> >  }
> > 
> >  check_keys() {
> > -       # create keys if necessary
> > -       if [ ! -f $HOST_KEY_RSA ]; then
> > -               echo "  generating ssh RSA key..."
> > -               ssh-keygen -q -f $HOST_KEY_RSA -N '' -t rsa
> > -       fi
> > -       if [ ! -f $HOST_KEY_ECDSA ]; then
> > -               echo "  generating ssh ECDSA key..."
> > -               ssh-keygen -q -f $HOST_KEY_ECDSA -N '' -t ecdsa
> > -       fi
> > -       if [ ! -f $HOST_KEY_DSA ]; then
> > -               echo "  generating ssh DSA key..."
> > -               ssh-keygen -q -f $HOST_KEY_DSA -N '' -t dsa
> > -       fi
> > -       if [ ! -f $HOST_KEY_ED25519 ]; then
> > -               echo "  generating ssh ED25519 key..."
> > -               ssh-keygen -q -f $HOST_KEY_ED25519 -N '' -t ed25519
> > -       fi
> > +    @LIBEXECDIR@/sshd-check-key $HOST_KEY_RSA rsa
> > +    @LIBEXECDIR@/sshd-check-key $HOST_KEY_ECDSA ecdsa
> > +    @LIBEXECDIR@/sshd-check-key $HOST_KEY_DSA dsa
> > +    @LIBEXECDIR@/sshd-check-key $HOST_KEY_ED25519 ed25519
> > +    @BASE_BINDIR@/sync
> >  }
> > 
> >  export PATH="${PATH:+$PATH:}/usr/sbin:/sbin"
> > diff --git a/meta/recipes-connectivity/openssh/openssh/sshd-check-
> > key b/meta/recipes-connectivity/openssh/openssh/sshd-check-key
> > new file mode 100644
> > index 0000000..3afdb8b
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/openssh/openssh/sshd-check-key
> > @@ -0,0 +1,35 @@
> > +#! /bin/sh
> > +NAME="$1"
> > +TYPE="$2"
> > +
> > +if [ -z "$NAME" ] || [ -z "$TYPE" ]; then
> > +    echo "Usage: $0 NAME TYPE"
> > +    exit 1
> > +fi
> > +
> > +
> > +if [ ! -f "$NAME" ]; then
> > +    DIR="$(dirname "$NAME")"
> > +
> > +    echo "  generating ssh $TYPE key..."
> > +    ssh-keygen -q -f "${NAME}.tmp" -N '' -t $TYPE
> > +
> > +    # Move (Atomically rename) files
> > +    mv -f "${NAME}.tmp.pub" "${NAME}.pub"
> > +
> > +    # This sync does double duty: Ensuring that the data in the
> > temporary
> > +    # private key file is on disk before the rename, and ensuring
> > that the
> > +    # public key rename is completed before the private key
> > rename, since we
> > +    # switch on the existence of the private key to trigger key
> > generation.
> > +    # This does mean it is possible for the public key to exist,
> > but be garbage
> > +    # but this is OK because in that case the private key won't
> > exist and the
> > +    # keys will be regenerated.
> > +    #
> > +    # In the event that sync understands arguments that limit what
> > it tries to
> > +    # fsync(), we provided them. If it does not, it will simply
> > call sync()
> > +    # which is just as well
> > +    sync "${NAME}.pub" "$DIR" "${NAME}.tmp"
> > +
> > +    mv "${NAME}.tmp" "$NAME"
> > +fi
> > +
> > diff --git a/meta/recipes-
> > connectivity/openssh/openssh/sshdgenkeys.service b/meta/recipes-
> > connectivity/openssh/openssh/sshdgenkeys.service
> > index 148e6ad..23fd351 100644
> > --- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> > +++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> > @@ -1,22 +1,23 @@
> >  [Unit]
> >  Description=OpenSSH Key Generation
> >  RequiresMountsFor=/var /run
> > -ConditionPathExists=!/var/run/ssh/ssh_host_rsa_key
> > -ConditionPathExists=!/var/run/ssh/ssh_host_dsa_key
> > -ConditionPathExists=!/var/run/ssh/ssh_host_ecdsa_key
> > -ConditionPathExists=!/var/run/ssh/ssh_host_ed25519_key
> > -ConditionPathExists=!/etc/ssh/ssh_host_rsa_key
> > -ConditionPathExists=!/etc/ssh/ssh_host_dsa_key
> > -ConditionPathExists=!/etc/ssh/ssh_host_ecdsa_key
> > -ConditionPathExists=!/etc/ssh/ssh_host_ed25519_key
> > +ConditionPathExists=|!/var/run/ssh/ssh_host_rsa_key
> > +ConditionPathExists=|!/var/run/ssh/ssh_host_dsa_key
> > +ConditionPathExists=|!/var/run/ssh/ssh_host_ecdsa_key
> > +ConditionPathExists=|!/var/run/ssh/ssh_host_ed25519_key
> > +ConditionPathExists=|!/etc/ssh/ssh_host_rsa_key
> > +ConditionPathExists=|!/etc/ssh/ssh_host_dsa_key
> > +ConditionPathExists=|!/etc/ssh/ssh_host_ecdsa_key
> > +ConditionPathExists=|!/etc/ssh/ssh_host_ed25519_key
> > 
> >  [Service]
> >  Environment="SYSCONFDIR=/etc/ssh"
> >  EnvironmentFile=-/etc/default/ssh
> >  ExecStart=@BASE_BINDIR@/mkdir -p $SYSCONFDIR
> > -ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_rsa_key
> > -N '' -t rsa
> > -ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_dsa_key
> > -N '' -t dsa
> > -ExecStart=@BINDIR@/ssh-keygen -q -f
> > ${SYSCONFDIR}/ssh_host_ecdsa_key -N '' -t ecdsa
> > -ExecStart=@BINDIR@/ssh-keygen -q -f
> > ${SYSCONFDIR}/ssh_host_ed25519_key -N '' -t ed25519
> > +ExecStart=@LIBEXECDIR@/sshd-check-key
> > ${SYSCONFDIR}/ssh_host_rsa_key rsa
> > +ExecStart=@LIBEXECDIR@/sshd-check-key
> > ${SYSCONFDIR}/ssh_host_dsa_key dsa
> > +ExecStart=@LIBEXECDIR@/sshd-check-key
> > ${SYSCONFDIR}/ssh_host_ecdsa_key ecdsa
> > +ExecStart=@LIBEXECDIR@/sshd-check-key
> > ${SYSCONFDIR}/ssh_host_ed25519_key ed25519
> > +ExecStart=@BASE_BINDIR@/sync
> >  Type=oneshot
> >  RemainAfterExit=yes
> > diff --git a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> > b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> > index 5b96745..ec4b55f 100644
> > --- a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> > +++ b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> > @@ -25,6 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/Ope
> > nSSH/portable/openssh-${PV}.tar
> >             file://openssh-7.1p1-conditional-compile-des-in-
> > cipher.patch \
> >             file://openssh-7.1p1-conditional-compile-des-in-
> > pkcs11.patch \
> >             file://fix-potential-signed-overflow-in-pointer-
> > arithmatic.patch \
> > +           file://sshd-check-key \
> >             "
> > 
> >  PAM_SRC_URI = "file://sshd"
> > @@ -124,7 +125,14 @@ do_install_append () {
> >         sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
> >                 -e 's,@SBINDIR@,${sbindir},g' \
> >                 -e 's,@BINDIR@,${bindir},g' \
> > +               -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
> >                 ${D}${systemd_unitdir}/system/sshd.socket
> > ${D}${systemd_unitdir}/system/*.service
> > +
> > +       sed -i -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
> > +               -e 's,@BASE_BINDIR@,${base_bindir},g' \
> > +               ${D}${sysconfdir}/init.d/sshd
> > +
> > +       install -D -m 0755 ${WORKDIR}/sshd-check-key
> > ${D}${libexecdir}/${BPN}
> >  }
> > 
> >  do_install_ptest () {
> > --
> > 2.9.4
> > 
> 
> Ping?


