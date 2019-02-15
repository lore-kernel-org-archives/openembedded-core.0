Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id C61237C708
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 15:02:20 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id p25so10880266qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 07:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eUMxV3b46+R+oDOKPNiAsJOLnwU+lOrq/Hh685bGws8=;
	b=UtYgeEanc3pQlfmVBzJyDpvXFMwjqEpd2PpqEMq3wOlU6Xvi/EiZxr/WF6TjUI1bV+
	I/04l6Z9x21pBQNAud7E+1ExUfPQDBLEnWE9D9C935RVQKpuujoiSRv3t134EUmFP5BD
	50l/2VzOVGAJWrnRObOGPtHSgvrem0uA+lDP8efYPbrnx93pKYj4gIHRCQA/X8z0gYru
	PaC321KWRAAdA3xGVPG4uKQyEJitEgCO1jwpS2m69kYM/Cg3pcz6dcII+YUt4IrT3Pzc
	O5Xx4T+IQ8H/j8A/NtqPN0KbiC1Nl6Jc49XO1OhXLUJod34Ln8BhBJW9FbK+Gg0ka5E8
	Jpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eUMxV3b46+R+oDOKPNiAsJOLnwU+lOrq/Hh685bGws8=;
	b=dfXikQuWWOJ2xlINfYIoE9oLfhdhksnBvt3EXeUV0PONyevg5DaJhj4rv2SNASnzvN
	sx0B6Dwtx1XGHeqQTEoTu/vhj2z146WkaGhMdn2UKWswOGM5m/J6u1HSg+KetJZ6vnwH
	fjeyZVzOF/DKrqJvNLpVKzC+0xZeJIeBoDzJST4RhjuxxcDveHEYdFG/6EutuAIBMWF1
	1cHaSjGh+53+nAgkqoS7c0XGd/1avYfqbZegyKlV01zNMJJg0BlzEYIgDpygJ9DVVJZQ
	0pVlIzhQaJDCrGIDKOiV4Qa07/orW/162VxgMA+trsbtsYwVyz4OslkobMDCpODs9AOg
	KOww==
X-Gm-Message-State: AHQUAuZHi00c3yh5C2c2gjDA2hUQxRmPNtnRjtXwKmDzu+mACMgwPrpd
	T6GY52CHDt/G6UTvAkSxAdzp0mAaWROftm9JOF8=
X-Google-Smtp-Source: AHgI3IbVUsR1yjTDraiS75cHKCnZG1MdsN04Qv1VlMayFLIO+YH9QoGGgmA/PF4Ip1vkodhCg7M1fweHcGBOUhHAkOY=
X-Received: by 2002:ac8:2562:: with SMTP id 31mr8002508qtn.253.1550242941248; 
	Fri, 15 Feb 2019 07:02:21 -0800 (PST)
MIME-Version: 1.0
References: <20190212054754.2801-1-raj.khem@gmail.com>
	<CAJTo0LYDstsDdmO-Y++5nkAuPgk4OFS+bpYTTYKh8edpzW=hkw@mail.gmail.com>
	<CAMKF1srYzGOXxXkHKG04_AB5xcyMKe1KTP6aoYqO3pQJr=jy0A@mail.gmail.com>
In-Reply-To: <CAMKF1srYzGOXxXkHKG04_AB5xcyMKe1KTP6aoYqO3pQJr=jy0A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Feb 2019 07:01:55 -0800
Message-ID: <CAMKF1spu7DXTNqjEV4-oTryBxOnGo0ypcCv9W=A5OdibMcv6tA@mail.gmail.com>
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
X-List-Received-Date: Fri, 15 Feb 2019 15:02:21 -0000
Content-Type: text/plain; charset="UTF-8"

Richard/Ross

Are you able to reproduce the problem and have
alternative solution?

On Tue, Feb 12, 2019 at 11:04 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Feb 12, 2019 at 7:59 AM Burton, Ross <ross.burton@intel.com> wrote:
> >
> > Would a neater solution be to PACKAGES_remove = ${PN}-dev?
> >
>
> That was first thing I tried too. It does not fix the problem
>
> > Ross
> >
> > On Tue, 12 Feb 2019 at 05:48, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > PN-dev is empty and causes dependency loops during SDK build
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-core/busybox/busybox.inc | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> > > index 24c15e4aee..2444afabd5 100644
> > > --- a/meta/recipes-core/busybox/busybox.inc
> > > +++ b/meta/recipes-core/busybox/busybox.inc
> > > @@ -21,6 +21,7 @@ export EXTRA_LDFLAGS = "${LDFLAGS}"
> > >  EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}' HOSTCPP='${BUILD_CPP}'"
> > >
> > >  PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
> > > +RDEPENDS_${PN}-dev = ""
> > >
> > >  FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
> > >  FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
> > > --
> > > 2.20.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

