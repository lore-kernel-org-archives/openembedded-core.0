Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.47507.1617573559169756286
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Apr 2021 14:59:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3164D40C1E;
	Sun,  4 Apr 2021 21:59:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N7D0Hd4f__YQ; Sun,  4 Apr 2021 21:59:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0F26040BE9;
	Sun,  4 Apr 2021 21:59:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 57A55174579; Sun,  4 Apr 2021 17:59:15 -0400 (EDT)
Date: Sun, 4 Apr 2021 17:59:15 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] ell: update to 0.39
Message-ID: <20210404215915.GA15937@denix.org>
References: <20210404200513.581466-1-open.source@oleksandr-kravchuk.com>
 <CAMKF1srjDhhqY5FqxmvNBweYNER7WKdGR93fWXjxxy3pJDpYsw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srjDhhqY5FqxmvNBweYNER7WKdGR93fWXjxxy3pJDpYsw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 04, 2021 at 02:19:18PM -0700, Khem Raj wrote:
> This fails to compile with clang, I have notified upstream dev about it.

Moreover:

https://lists.openembedded.org/g/openembedded-core/message/150107
https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=3fa6d625dc5e55c5e255376da38be06e3c5f4047


> On Sun, Apr 4, 2021 at 1:05 PM Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
> >
> > Changelog:
> > - Add support for serialized test execution framework.
> >
> > Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> > ---
> >  meta/recipes-core/ell/{ell_0.38.bb => ell_0.39.bb} | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-core/ell/{ell_0.38.bb => ell_0.39.bb} (90%)
> >
> > diff --git a/meta/recipes-core/ell/ell_0.38.bb b/meta/recipes-core/ell/ell_0.39.bb
> > similarity index 90%
> > rename from meta/recipes-core/ell/ell_0.38.bb
> > rename to meta/recipes-core/ell/ell_0.39.bb
> > index 7d3a339978..68ec4cb4a4 100644
> > --- a/meta/recipes-core/ell/ell_0.38.bb
> > +++ b/meta/recipes-core/ell/ell_0.39.bb
> > @@ -17,7 +17,7 @@ inherit autotools pkgconfig
> >  SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
> >             file://0001-pem.c-do-not-use-rawmemchr.patch \
> >             "
> > -SRC_URI[sha256sum] = "c1b7ae5676eec310f08757b3d8652b8e818776be1897fb5deb59e55f02a012a7"
> > +SRC_URI[sha256sum] = "653e2e139e23ed31e03c56c05f15321a9e818e2dca00a315c18d2c7b72f15d08"
> >
> >  do_configure_prepend () {
> >      mkdir -p ${S}/build-aux
> > --
> > 2.25.1

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
