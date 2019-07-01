Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id C67327E833
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 09:50:53 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id k20so1010509ios.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 02:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uPe/g0rfZZIbIp6zdAjER+j6OxxMbiHgWs3dZTBBEMk=;
	b=tEUUGG4rkb520fDCzXIkNckouJpJKtUKdYkLrsA17NDpSgXEMSSQLG3FCQ83Z98A30
	HAw76CAjhyZX44XNhdj85nCI0DxRQm4zi3QkICyoT2d1JSWvZS/V0HToMTynSpvwX8hC
	ujZ+fCyP9qlcGEwV9YAhubWw5UdC/UdIL4L2AAMHvhkrP64eHaTwdBLS7Kl0+IDyTl/o
	L8FtqORKjUb/RSzoDGsLe0DaZ6OrXI2jbH5gvdBlxJJn6b0xiCQqYcgpxxc24CiakGju
	/6I848HCe3OUgwrtwGu+tMi1fhWdhKdU5zkNYVuvuMYfP7uHTWdnRQYS3FiWVWEf3E2U
	Hk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uPe/g0rfZZIbIp6zdAjER+j6OxxMbiHgWs3dZTBBEMk=;
	b=uBZ3zMzMJqdby81FgEKD4+vByEblAdgmgNxgrdlZuU7drFBxSv2NfoOFQWcVWkJHjj
	xYHgEHTpT4GNS02LNggvwv7dntfw/afdczxnan0RXZ1OzugE1bfz7yMIgIu9l5egn2MX
	iPMnHM5Zzc0IJHm/rVFO+f5Fq5Lg3mF5jR34lGLTTKEeTXLes6ojLEZyO9YvRW8FQ5Oa
	ft5Y63dzjr2WM+ICrgL9h0vgs/hqv7mQ84kChkJLiPQCbFcACC+xfj7how6jv23ouD0X
	2QoSb/UKmDz4wVuBZjegGxuRDaumwgpaM1so91azd6ItjNL1cu6GK2jmQmH5F82zRnxC
	rXVg==
X-Gm-Message-State: APjAAAWl0XSJXVXnDzWnuYDmt0c9cQBGjQ3E9rM5WXFnd57CB+DGSz6F
	GO24+xP91DZmXzi47FkzK9KgAwl5JG7/bgwuf+YUoV/hhfo=
X-Google-Smtp-Source: APXvYqx+g9BZGikpXj9IZYBQvDoWutlq3F3LUZq4tR/BrTTsOXge7t6BcW+EPeuzO6D9ZkRkMiZhDX8BFQD2yxboSt0=
X-Received: by 2002:a6b:6611:: with SMTP id a17mr20367022ioc.179.1561974654827;
	Mon, 01 Jul 2019 02:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190629192754.101979-1-anatol.oe@belski.net>
	<CAJTo0Lb1o8HVmrYAXAuh3Vkfzjm5rco5A5V-ECQT-j+FycLpMg@mail.gmail.com>
	<836a01d52ec4$ab7cfae0$0276f0a0$@belski.net>
	<CAJTo0LY3Qs8GaRG2bn9mMNhGp8mrYAr_6psOJgPWbZhpmttiZg@mail.gmail.com>
In-Reply-To: <CAJTo0LY3Qs8GaRG2bn9mMNhGp8mrYAr_6psOJgPWbZhpmttiZg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Jul 2019 10:50:43 +0100
Message-ID: <CAJTo0LaH4ZHKNgx+hqO-ycgzPSS3etkDgWLuHDXjPKuZ_q_V0A@mail.gmail.com>
To: anatol.oe@belski.net
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH v2] bzip2: Fix CVE-2019-12900
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
X-List-Received-Date: Mon, 01 Jul 2019 09:50:53 -0000
Content-Type: text/plain; charset="UTF-8"

I just noticed that Oleksandr sent the 1.0.7 upgrade, so the backport
patch is good for all other stable branches.

Ross

On Mon, 1 Jul 2019 at 10:48, Burton, Ross <ross.burton@intel.com> wrote:
>
> *All* security issues are fixed in master first and then bubble down
> the stable branches.  Otherwise, if you just fix thud we may end up
> with the next release not having the fix.
>
> So, ideally, we upgrade master to 1.07 and then apply the backport to
> the stable branches.
>
> Ross
>
> On Sat, 29 Jun 2019 at 22:50, <anatol.oe@belski.net> wrote:
> >
> > Hi,
> >
> >
> > > -----Original Message-----
> > > From: Burton, Ross <ross.burton@intel.com>
> > > Sent: Saturday, June 29, 2019 9:30 PM
> > > To: anatol.oe@belski.net
> > > Cc: OE-core <openembedded-core@lists.openembedded.org>
> > > Subject: Re: [OE-core] [thud][PATCH v2] bzip2: Fix CVE-2019-12900
> > >
> > > For master, lets upgrade to 1.0.7 instead.
> > >
> > Thanks for checking. Probably makes sense, yep. Whereby it's released just two days ago, after all the years :) Probably have time to expect some newer version.
> >
> > In general, should I have posted this patch against master? As seems I've targeted thud only, according to the policies below
> >
> > https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance
> >
> > Or it's going to be merged up, if accepted?
> >
> > Thanks
> >
> > Anatol
> >
> > > Ross
> > >
> > > On Sat, 29 Jun 2019 at 20:28, <anatol.oe@belski.net> wrote:
> > > >
> > > > From: Anatol Belski <anatol.belski@microsoft.com>
> > > >
> > > > Affects bzip2 <= 1.0.6
> > > >
> > > > Signed-off-by: Anatol Belski <anatol.belski@microsoft.com>
> > > > ---
> > > >  .../bzip2/bzip2-1.0.6/CVE-2019-12900.patch    | 37
> > > +++++++++++++++++++
> > > >  meta/recipes-extended/bzip2/bzip2_1.0.6.bb    |  3 +-
> > > >  2 files changed, 39 insertions(+), 1 deletion(-)  create mode 100644
> > > > meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> > > >
> > > > diff --git
> > > > a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> > > > b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> > > > new file mode 100644
> > > > index 0000000000..8313fdcfcc
> > > > --- /dev/null
> > > > +++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> > > > @@ -0,0 +1,37 @@
> > > > +bzip2: Fix CVE-2019-12900
> > > > +Upstream-Status: Accepted
> > > >
> > > +[https://gitlab.com/federicomenaquintero/bzip2/commit/74de1e2e6ffc9d5
> > > > +1ef9824db71a8ffee5962cdbc]
> > > > +CVE: CVE-2019-12900
> > > > +Signed-off-by: Albert Astals Cid <aacid@kde.org>
> > > > +
> > > > +From 74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc Mon Sep 17
> > > 00:00:00
> > > > +2001
> > > > +From: Albert Astals Cid <aacid@kde.org>
> > > > +Date: Tue, 28 May 2019 19:35:18 +0200
> > > > +Subject: [PATCH] Make sure nSelectors is not out of range
> > > > +
> > > > +nSelectors is used in a loop from 0 to nSelectors to access
> > > > +selectorMtf which is
> > > > +       UChar    selectorMtf[BZ_MAX_SELECTORS];
> > > > +so if nSelectors is bigger than BZ_MAX_SELECTORS it'll do an invalid
> > > > +memory access
> > > > +
> > > > +Fixes out of bounds access discovered while fuzzying karchive
> > > > +---
> > > > + decompress.c | 2 +-
> > > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/decompress.c b/decompress.c index ab6a624..f3db91d
> > > > +100644
> > > > +--- a/decompress.c
> > > > ++++ b/decompress.c
> > > > +@@ -287,7 +287,7 @@ Int32 BZ2_decompress ( DState* s )
> > > > +       GET_BITS(BZ_X_SELECTOR_1, nGroups, 3);
> > > > +       if (nGroups < 2 || nGroups > 6) RETURN(BZ_DATA_ERROR);
> > > > +       GET_BITS(BZ_X_SELECTOR_2, nSelectors, 15);
> > > > +-      if (nSelectors < 1) RETURN(BZ_DATA_ERROR);
> > > > ++      if (nSelectors < 1 || nSelectors > BZ_MAX_SELECTORS)
> > > > ++ RETURN(BZ_DATA_ERROR);
> > > > +       for (i = 0; i < nSelectors; i++) {
> > > > +          j = 0;
> > > > +          while (True) {
> > > > +--
> > > > +2.21.0
> > > > +
> > > > diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> > > > b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> > > > index 025f45c472..6791020d05 100644
> > > > --- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> > > > +++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> > > > @@ -6,7 +6,7 @@ HOMEPAGE = "https://sourceware.org/bzip2/"
> > > >  SECTION = "console/utils"
> > > >  LICENSE = "bzip2"
> > > >  LIC_FILES_CHKSUM =
> > > "file://LICENSE;beginline=4;endline=37;md5=39406315f540c69bd05b1531da
> > > edd2ae"
> > > > -PR = "r5"
> > > > +PR = "r6"
> > > >
> > > >  SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz
> > > \
> > > >             file://fix-bunzip2-qt-returns-0-for-corrupt-archives.patch
> > > > \ @@ -14,6 +14,7 @@ SRC_URI =
> > > "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz \
> > > >             file://Makefile.am;subdir=${BP} \
> > > >             file://run-ptest \
> > > >             file://CVE-2016-3189.patch \
> > > > +           file://CVE-2019-12900.patch \
> > > >             "
> > > >
> > > >  SRC_URI[md5sum] = "00b516f4704d4a7cb50a1d97e6e8e15b"
> > > > --
> > > > 2.17.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

