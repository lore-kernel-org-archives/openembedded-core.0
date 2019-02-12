Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1DB666C1CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 19:05:19 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id p15so7726905qkl.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 11:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hTKx+GlNXTse03mQ5gJC59XMKGWctIfGOOPvfXI9Dsg=;
	b=Gd7sOS+NWwaoCCAfNsKx7GdWAwxoGF/dKWGKs3jzvnFC8rjXsPVUBff4aimdBYzafw
	Z5po5Mne7gzDy1FSZU0Il2nFaMi0K+yCmlPr/hWS2Vc51TNxFSa2Pjdaan0TvFtm1CnB
	NYi5B/FqlHKCeNfMotOd3wIC44VGa/806SYYkTr+TkwVI54fM091EGDLHgUMczfhJfvF
	6RXzlIs5PeGMomvfy6qkXcJ45OCXikU8ishf4w3U84Jg9lZPNIAMmO1TsFLQdbJMH7Z7
	3u92IV/Z8zI3EGhyWMqWkqx9/oNq+UzwztgTTYoVUEV5iW3ypze1jxNI14s/3nrTalXM
	Bxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hTKx+GlNXTse03mQ5gJC59XMKGWctIfGOOPvfXI9Dsg=;
	b=gj1HeTTkKZKUi7hR8G1Cge7SaoXvlDwAHyjR8L7yfA6JtrVBI0FCznNiNf3SwUiyM8
	iXVqNUcOnJEmDiXzNkenhgfBf4nOqziRBJiGhXa4HTVeQAqnhRaN8e6IxXt95K0Z80XG
	k8BHohYK4ckYLeabpRK264VQc4GS5A2RDzAVMJ+8et6E7vL5T4c2BxllWd02obDS/Eal
	dMYLJqJbat6GdQt9W2bckEoIGNROvuWjh5wb0dJPN4MzjZMSsRAge49xWwwRztByU1TC
	9w4sa4CuwS13QBzrAJVIcEjL0uTYpFmDN9h3gasvHJTrJY/TEbckjCc5iw4dD12CMLwW
	DARg==
X-Gm-Message-State: AHQUAuZwzv4NeI2/12qsP/QAWj8WS8t9Ug2h62SPmsbwYNUyDhh+Fd7p
	rOC40Gz1meoQMuTolRW0NWgjMcOIEj3m6+/O26A=
X-Google-Smtp-Source: AHgI3IYMJehPq8N1QHKAwE4lQ4xewk4byidHEJ25RxGaFyCKVAQnxmr+8Plx0FSXnJTIf2Vhqm3iD98V/tXhEXHcsY8=
X-Received: by 2002:a37:9585:: with SMTP id x127mr3797091qkd.315.1549998320583;
	Tue, 12 Feb 2019 11:05:20 -0800 (PST)
MIME-Version: 1.0
References: <20190212054754.2801-1-raj.khem@gmail.com>
	<CAJTo0LYDstsDdmO-Y++5nkAuPgk4OFS+bpYTTYKh8edpzW=hkw@mail.gmail.com>
In-Reply-To: <CAJTo0LYDstsDdmO-Y++5nkAuPgk4OFS+bpYTTYKh8edpzW=hkw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Feb 2019 11:04:53 -0800
Message-ID: <CAMKF1srYzGOXxXkHKG04_AB5xcyMKe1KTP6aoYqO3pQJr=jy0A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] busybox: Remove PN from rdeps of PN-dev
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
X-List-Received-Date: Tue, 12 Feb 2019 19:05:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 12, 2019 at 7:59 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> Would a neater solution be to PACKAGES_remove = ${PN}-dev?
>

That was first thing I tried too. It does not fix the problem

> Ross
>
> On Tue, 12 Feb 2019 at 05:48, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > PN-dev is empty and causes dependency loops during SDK build
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/busybox/busybox.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> > index 24c15e4aee..2444afabd5 100644
> > --- a/meta/recipes-core/busybox/busybox.inc
> > +++ b/meta/recipes-core/busybox/busybox.inc
> > @@ -21,6 +21,7 @@ export EXTRA_LDFLAGS = "${LDFLAGS}"
> >  EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}' HOSTCPP='${BUILD_CPP}'"
> >
> >  PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
> > +RDEPENDS_${PN}-dev = ""
> >
> >  FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
> >  FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

