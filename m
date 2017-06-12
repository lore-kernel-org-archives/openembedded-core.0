Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 10BFE7826D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 12:25:40 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id l6so11153864iti.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 05:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=bbW8zrJ1glizkZxpPeEMeH2xqm5Wg3LAcWYlu/61rsE=;
	b=b7zI0phgsPhu/rrJFpzcdLr2xhn9LBvkriiHIrv0+R3W/kCczrNqMzHLOpwNxsxy3z
	tB+iLJOf2bobpc2xLjmKlMC9TN3cuosHtlKW/MLm9KeZLVfOd3iEf7c9RayzJsZ25m0Q
	gLNBhd9X1mJyzK7Gdy7i4PHylzg2dhCPpvhmkY4bd9geave4U0pyG2Uq/mQwtwxtpk/5
	zWfSPCrKYx0IwoPxYOKUk13Cd2brG5aeoMw6nkzCGqgGPb855Nayopd5PZdzKlwfWdmK
	H6bI0Y7c4YspttwXZ6T/J6Yycn0HdOmN9CmYd2mCKtPnLZ/Kh0e8YSUe/28mQE5VcFMo
	h51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bbW8zrJ1glizkZxpPeEMeH2xqm5Wg3LAcWYlu/61rsE=;
	b=VschKd8B0DlQ5sQRcuZlzjwbnef2YJu3aqObwecg33kaNP7JVzax+9uT0UHsLebBZq
	SorKRTR6nuEAAlMeWghjpdc28MyR+4RnlbT5qMBrgHqTHFC0UM0SsD1sfhTTIRUrfhRr
	xoDvuSnNIFb4Gi4PRDwZv9eavfi7gr+OOTLEIVpcS4ql5XFtNE4GYTzHK2Q4wnwRfn/C
	zKo0Mn7ekelZrKO2YsBN12cz85sCLMIKnRlJrv0tdQSn/M5t/XaqBoBEL2rvLgeve8Ai
	4JRWd4tvp2HaTssYcSzUxNNahxIubzM0phDJCcjdQcNg6E1T2evJ5TDUSDq3KBPu48TU
	Tm+Q==
X-Gm-Message-State: AODbwcAULvwFKhLay0rqpoziHKQ2DO9BBeWOSKIOCXpmWb1wm0Q2ieMD
	KVd2sXBpURoNUDvDyH4=
X-Received: by 10.36.99.14 with SMTP id j14mr11296669itc.121.1497270341720;
	Mon, 12 Jun 2017 05:25:41 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	q8sm4132ioe.69.2017.06.12.05.25.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Jun 2017 05:25:40 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1497270340.1888.1.camel@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Jun 2017 07:25:40 -0500
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
X-List-Received-Date: Mon, 12 Jun 2017 12:25:41 -0000
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

Ping? Am I missing something to get this merged?


