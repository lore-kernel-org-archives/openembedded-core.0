Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8FE7D7E168
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 06:44:18 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z19so19167519qtz.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 23:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pbRKAN/UyZGm2HLOYz9zz2pbUEY1lH5lhwnr63ZFl6I=;
	b=XnSaE9A2AVSRh1I5WU5oMRD867f1GyXcNrnVlrd5fpkibi2pifFTVavtB6YMAVjtcz
	7GGeG3WV7Jp1fmHwYlG07rto3IIqjx6Td8aGv/rqywlSNdbzRuHDNOsnl8JXLlkCD9Y0
	dr8W9mUSTQVvW3IVtcdJo/qjXTpCptGdvTMF8+nxf+4YNI5VxQYYf3Uaw6tRO3MUbnVT
	nKMUsa1qRuIVWadAXr+Qhy0b85thfcegjZezSFlVa0olzazTq3mqSUB03IWaqie2pAA5
	KfIkkG1MDeb4q9ZrR6GID8BdlxYdPieJYw2LFyUXvq9E8HJbqVtuT7UDqmA0U723bsZx
	gBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pbRKAN/UyZGm2HLOYz9zz2pbUEY1lH5lhwnr63ZFl6I=;
	b=iwV6VYDaqAg6TMlI2sSLisckuhlBnP3NPHApserAJiiFV+lnUNbJ/3BXCpOphpVUcI
	ahloIjsnLdjBCZwGqACei1n+S0ijoiFVnQjXyjMljLnn/h9wA3YTRAiYBgJAKB4FuRyp
	ymGQzQx1CvhWo2FcihzSNaCnUDnIpHwJ19AY5EgD9nKv2cK0cmqDknDN96RlqUrM+Nix
	FPyHDiaivk+SdNSV83rX6bAIGF3pASj6eA8XMCZBDnGHxn/DJxgWedVFRHDHa3pYk3uI
	lfTCH/zZ1b6WxzdiJUxNYsJPXH14t2wiAfFWAc1SAfrzq3RoNsa40LqbA92dPuuWPcpt
	bG6g==
X-Gm-Message-State: APjAAAXv6LqCVgrOYqWePWm1sMlkmy2Us2ePKsQC6/y5moorQjKN/F99
	2bv7ZmPSbSGEnzLWYfbna/nUp2NL9gtS2ZVuBGZ2udgVx5Y=
X-Google-Smtp-Source: APXvYqzK7sfSE5mi1pJsi3Xbeuwa0r/Ecro5tA1u3lb0R2IONYFNiQ8gDhGmF8mYVXq93ImIIspY1iPlk9WvUCOGkAY=
X-Received: by 2002:a0c:be87:: with SMTP id n7mr26764966qvi.65.1558421059250; 
	Mon, 20 May 2019 23:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <1557974500-224120-1-git-send-email-liwei.song@windriver.com>
	<9ad65fe0-8a88-9413-7f2d-0cc855395721@gmail.com>
	<5CE360A2.10907@windriver.com>
In-Reply-To: <5CE360A2.10907@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 May 2019 23:43:53 -0700
Message-ID: <CAMKF1srS9Dh2D+ufQhgNKkEV5zP7=moVe1R83B811bTQHe4A+A@mail.gmail.com>
To: Liwei Song <liwei.song@windriver.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mdadm: install the systemd service through Makefile
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
X-List-Received-Date: Tue, 21 May 2019 06:44:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 20, 2019 at 7:21 PM Liwei Song <liwei.song@windriver.com> wrote:
>
>
>
> On 05/21/2019 05:18 AM, Khem Raj wrote:
> >
> >
> > On 5/15/19 7:41 PM, Liwei Song wrote:
> >> The original mdadm service may include variable like BINDIR,
> >> It should use the real value of it, since the install method
> >> "install-systemd" in Makefile can easily do such work, so don't
> >> install it in bb file manually, use "make install-systemd" to
> >> install all the service of mdadm.
> >>
> >> Signed-off-by: Liwei Song <liwei.song@windriver.com>
> >> ---
> >>   meta/recipes-extended/mdadm/mdadm_4.1.bb | 10 +++++++---
> >>   1 file changed, 7 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
> >> index 4168ce4d0cb8..a4b9ef94799f 100644
> >> --- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
> >> +++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
> >> @@ -55,13 +55,15 @@ do_install() {
> >>   do_install_append() {
> >>           install -d ${D}/${sysconfdir}/
> >>           install -m 644 ${S}/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
> >> -        install -d ${D}/${systemd_unitdir}/system
> >> -        install -m 644 ${WORKDIR}/mdmonitor.service ${D}/${systemd_unitdir}/system
> >> -        install -m 644 ${S}/systemd/mdmon@.service ${D}/${systemd_unitdir}/system
> >>           install -d ${D}/${sysconfdir}/init.d
> >>           install -m 755 ${WORKDIR}/mdadm.init ${D}${sysconfdir}/init.d/mdmonitor
> >>   }
> >>   +do_install_append() {
> >> +        oe_runmake install-systemd DESTDIR=${D}
> >> +}
> >
> > perhaps this should be guarded with systemd being in DISTRO_FEATURES check.
>
> Hi Khem,
>
> Do you mean all the service file need to be added to SYSTEMD_SERVICE_${PN} ?
>

I mean to check for systemd in DISTRO_FEATURE like
if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
...
else
...
fi

> Thanks,
> Liwei.
>
>
> >
> >> +
> >> +
> >>   do_compile_ptest() {
> >>       oe_runmake test
> >>   }
> >> @@ -88,3 +90,5 @@ RRECOMMENDS_${PN}-ptest += " \
> >>       kernel-module-raid10 \
> >>       kernel-module-raid456 \
> >>   "
> >> +
> >> +FILES_${PN} += "/lib/systemd/*"
> >>
> >
> >

