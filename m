Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id E336D74A13
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 11:27:54 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id y16so9516979wrw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2018 04:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=aq+sqeRISz0gmPJbeZDm34IY43vbgLbvMTy9zIAIc+U=;
	b=PRsJrDMTayXAEuZnin5iu7P/Dp1VL36yvJunZx08ETy9T4RJMvpWDoaNfkWwKoEdpc
	7Hhh4IhgfW3ub5bCH6RYyoFQ67FAXrFolXp0O9i4y4kLCbSs3B/QgIPcB0bQS0G1JVrh
	bvHvv6Zl2s9Q7SroHcmhNyHsUOTrkUhKvsmKRkp4756hlFW1fxYwABAO9XXi93zzuZyv
	6fO3gWXbWa7wNgMaDEaJlHHCrY/VxRp0WQu7KUmu+iyH0g1gyeyiJjSLTSeaDLFvyJbt
	OCotVO2z+r3EDzQxIYrQLpcbaG/aPvadCztWMEZZF9w4Es3iQZfW/XHOUtIcRuts8iQb
	wQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=aq+sqeRISz0gmPJbeZDm34IY43vbgLbvMTy9zIAIc+U=;
	b=DgpgoWaFtssf17L+aChmUCCXFGhG63/+jspxEf7tBKiRu6DDCGXUs/ZmMM7C0s/ilZ
	rXXJIKHngjxQvky8qbXeeT4Q39N4l4EV7mx3HZn0jNN2WQWQq4HW/v1gmMtpQ7eYyvI6
	LKKQvzjJFiIBZFAipbaKaemHyY8k1ijCwXEZuiAVzhv7EF6U8JnHaLK1qT4RqnsvJvkt
	RlswT3gwYiXhAyu4ulcc0jLCvDQibLApsIojjgHSgfHzktdXIEkpGaJn3ZoOexEZmXjO
	j2V+ttozuqYtAhumkEdyahp0Wg19lurINu7vP+0dy7mPtCd4VA7qpmHBroTXbYxcSt7m
	4PJA==
X-Gm-Message-State: ABuFfoi9RZPG3kPHkwa123Xkamgsv71yHt1WZh/knNU2qccSu2XW6aKg
	jfO7qCFOqS9r8YRmR0eEWo0z/mMV
X-Google-Smtp-Source: ACcGV638YP/IHVhh2mRUgXf8NFxSgE4Woj+bzSyTJUH/5T/Umca5XLaLqUcTfUKWZ6Ph/fX3X7z5CA==
X-Received: by 2002:adf:80c7:: with SMTP id 65-v6mr4434803wrl.57.1538652475441;
	Thu, 04 Oct 2018 04:27:55 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w4-v6sm7628669wra.83.2018.10.04.04.27.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Oct 2018 04:27:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 4 Oct 2018 13:27:55 +0200
To: Andrej Valek <andrej.valek@siemens.com>
Message-ID: <20181004112755.GA1356@jama>
References: <20181004104147.14644-1-andrej.valek@siemens.com>
	<CA+chaQfiSfhTgs2aJhgy3wNF5nMjiy2AsnGjYMepgk5vaaHjEA@mail.gmail.com>
	<976efb5d-cd95-31ae-bad0-b3f5073eab55@siemens.com>
MIME-Version: 1.0
In-Reply-To: <976efb5d-cd95-31ae-bad0-b3f5073eab55@siemens.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: fix conflict with runlevel applet
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
X-List-Received-Date: Thu, 04 Oct 2018 11:27:55 -0000
X-Groupsio-MsgNum: 117000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 04, 2018 at 12:59:37PM +0200, Andrej Valek wrote:
> This init feature was introduced via
> http://lists.openembedded.org/pipermail/openembedded-core/2016-January/11=
6109.html
> which is from 2016. Busybox has this runlevel applet available from 2005.
>=20
> I think, Raj was trying to make this system really tiny. So, I am not
> sure, what would be the impact, if we dropped this runlevel script.

OK, fair enough. I don't use busybox init anyway.

I was just curious, because there is also runlevel from upstart which we we=
re
using (and I have u-a for runlevel in busybox.bbappend because of that).
So I was surprised that there is actually 3rd implementation as OE
specific shell script.

> On 10/4/18 12:48 PM, Martin Jansa wrote:
> > I'm not against this change, but would it make sense to enable runlevel=
 applet in:
> > meta/recipes-core/busybox/busybox/init.cfg
> > and drop the runlevel shell script completely?
> >=20
> > On Thu, Oct 4, 2018 at 12:42 PM Andrej Valek <andrej.valek@siemens.com=
=20
> > <mailto:andrej.valek@siemens.com>> wrote:
> >=20
> >     When CONFIG_RUNLEVEL is enabled, it conflicts with installed OE's s=
cript.
> >     Make grep quite for prevent to write information into logs.
> >=20
> >     Signed-off-by: Andrej Valek <andrej.valek@siemens.com
> >     <mailto:andrej.valek@siemens.com>>
> >     ---
> >       meta/recipes-core/busybox/busybox.inc | 20 +++++++++++---------
> >       1 file changed, 11 insertions(+), 9 deletions(-)
> >=20
> >     diff --git a/meta/recipes-core/busybox/busybox.inc
> >     b/meta/recipes-core/busybox/busybox.inc
> >     index e1fba4243a..9c546927ab 100644
> >     --- a/meta/recipes-core/busybox/busybox.inc
> >     +++ b/meta/recipes-core/busybox/busybox.inc
> >     @@ -279,32 +279,32 @@ do_install () {
> >                      install -m 644 ${WORKDIR}/syslog-startup.conf
> >     ${D}${sysconfdir}/syslog-startup.conf
> >                      install -m 644 ${WORKDIR}/syslog.conf
> >     ${D}${sysconfdir}/syslog.conf
> >              fi
> >     -       if grep "CONFIG_CROND=3Dy" ${B}/.config; then
> >     +       if grep -q "CONFIG_CROND=3Dy" ${B}/.config; then
> >                      install -m 0755 ${WORKDIR}/busybox-cron
> >     ${D}${sysconfdir}/init.d/
> >              fi
> >     -       if grep "CONFIG_HTTPD=3Dy" ${B}/.config; then
> >     +       if grep -q "CONFIG_HTTPD=3Dy" ${B}/.config; then
> >                      install -m 0755 ${WORKDIR}/busybox-httpd
> >     ${D}${sysconfdir}/init.d/
> >                      install -d ${D}/srv/www
> >              fi
> >     -       if grep "CONFIG_UDHCPD=3Dy" ${B}/.config; then
> >     +       if grep -q "CONFIG_UDHCPD=3Dy" ${B}/.config; then
> >                      install -m 0755 ${WORKDIR}/busybox-udhcpd
> >     ${D}${sysconfdir}/init.d/
> >              fi
> >     -       if grep "CONFIG_HWCLOCK=3Dy" ${B}/.config; then
> >     +       if grep -q "CONFIG_HWCLOCK=3Dy" ${B}/.config; then
> >                      install -m 0755 ${WORKDIR}/hwclock.sh ${D}${syscon=
fdir}/init.d/
> >              fi
> >     -       if grep "CONFIG_UDHCPC=3Dy" ${B}/.config; then
> >     +       if grep -q "CONFIG_UDHCPC=3Dy" ${B}/.config; then
> >                      install -d ${D}${sysconfdir}/udhcpc.d
> >                      install -d ${D}${datadir}/udhcpc
> >                      install -m 0755 ${WORKDIR}/simple.script
> >     ${D}${sysconfdir}/udhcpc.d/50default
> >                      sed -i "s:/SBIN_DIR/:${base_sbindir}/:"
> >     ${D}${sysconfdir}/udhcpc.d/50default
> >                      install -m 0755 ${WORKDIR}/default.script
> >     ${D}${datadir}/udhcpc/default.script
> >              fi
> >     -       if grep "CONFIG_INETD=3Dy" ${B}/.config; then
> >     +       if grep -q "CONFIG_INETD=3Dy" ${B}/.config; then
> >                      install -m 0755 ${WORKDIR}/inetd
> >     ${D}${sysconfdir}/init.d/inetd.${BPN}
> >                      sed -i "s:/usr/sbin/:${sbindir}/:"
> >     ${D}${sysconfdir}/init.d/inetd.${BPN}
> >                      install -m 0644 ${WORKDIR}/inetd.conf ${D}${syscon=
fdir}/
> >              fi
> >     -        if grep "CONFIG_MDEV=3Dy" ${B}/.config; then
> >     +        if grep -q "CONFIG_MDEV=3Dy" ${B}/.config; then
> >                      install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/=
init.d/mdev
> >                      if grep "CONFIG_FEATURE_MDEV_CONF=3Dy" ${B}/.confi=
g; then
> >                              install -m 644 ${WORKDIR}/mdev.conf
> >     ${D}${sysconfdir}/mdev.conf
> >     @@ -313,10 +313,12 @@ do_install () {
> >                              install -m 0755 ${WORKDIR}/mdev-mount.sh
> >     ${D}${sysconfdir}/mdev
> >                      fi
> >              fi
> >     -        if grep "CONFIG_INIT=3Dy" ${B}/.config; then
> >     +        if grep -q "CONFIG_INIT=3Dy" ${B}/.config; then
> >                       install -D -m 0777 ${WORKDIR}/rcS ${D}${sysconfdi=
r}/init.d/rcS
> >                       install -D -m 0777 ${WORKDIR}/rcK ${D}${sysconfdi=
r}/init.d/rcK
> >     -                install -D -m 0755 ${WORKDIR}/runlevel
> >     ${D}${base_sbindir}/runlevel
> >     +                if ! grep -q "CONFIG_RUNLEVEL=3Dy" ${B}/.config; t=
hen
> >     +                        install -D -m 0755 ${WORKDIR}/runlevel
> >     ${D}${base_sbindir}/runlevel
> >     +                fi
> >               fi
> >=20
> >           if
> >     ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}=
; then
> >     --=20
> >     2.11.0
> >=20
> >     --=20
> >     _______________________________________________
> >     Openembedded-core mailing list
> >     Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW7X5OgAKCRA3VSO3ZXaA
HAJ6AKChRRxUivHjaf1kwZ/j2KBiDKHjSgCgkk4r4fPjmO0auRlVFB9/ObSaNFM=
=p0Qx
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
