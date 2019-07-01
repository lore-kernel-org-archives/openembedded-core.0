Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1ED347E7D1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 09:48:28 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id u13so27396763iop.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 02:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cJ6uhqxOuaqcLtK6PoCg72DvAmPKrkf8ailEsbYC7as=;
	b=fKAn1v1XpdK8/O9kfobaJOaiyg+F7u7PVan7KlHodWBX0JfBiyMV174CiBMqv62VOK
	Mci8t7VP+qJekF5UF1rwuottPTQ8fyzyPbJF7Oi67nnlB0m3ITN0xFHcDf8ATgqmNHdh
	LVQ5UJWaQ6LYOq+xZQgFCFg4hAEGgCj7OYz/5xRLxXVuvAhstWnGEEie9mSBLtgYL6Vv
	mtXSqCkJaSbihEH+Kyf5z40ZOru34TSBJWmvX23I1kUPQlYT6OYtoEqTIrxXi6Qj4jHj
	qy+2ufMlhCNisTEImXEUrh1WLXWJSWRetyv0xd/aV5fGOqMuVn4QaPgTR+wDSOBrfktC
	nVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cJ6uhqxOuaqcLtK6PoCg72DvAmPKrkf8ailEsbYC7as=;
	b=clA5eOT3cUhRzVFCO0hd4hz70RzHlTT5+OCg/qejCI+Oe86winWfyH4X+3ZRtPHSvI
	ap+veEiI3cB499aNGu+cFfcizred9tpIGjZ8+JamZdVX+JZZobqM5yqsRMpvlfBa8QLv
	x0EasqVzU7oHirvacKd5eajF0Ckhe5MlwMgjozIn3FPvzZvOSP1MH9QJkYCIEr8+PWYa
	wTNtJeZI8hkVYbmdDkofu3LwQ2Lm4JnSLR5TTrwRpB0Z4R/kZPYsRFDydXBg37iiaf6U
	DBRfXxcZX3fqBftqeyvYmayum83CXguJ/idGJ15lPjslKBJM+EZ6Jt1qsnuZfrcKTbPv
	iQiQ==
X-Gm-Message-State: APjAAAVo5BxeOzVwWklLyKvhqNdzIbW9+BMVCNEZsZIh/4RFpp5MfcID
	D6r8mXmUir5kXxDed5HtjxnN3W6QRhqJNhoVbfmvLQK3
X-Google-Smtp-Source: APXvYqyz4BOy6kBd3Pa/nPQAsvHPZClJOu/jgRUCIAbBnkGHDP8ud4kF8t5wWPVpeIP6JdFWqrc0X12LsrAL1PpxMU8=
X-Received: by 2002:a5e:a708:: with SMTP id b8mr16813028iod.25.1561974509110; 
	Mon, 01 Jul 2019 02:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190629192754.101979-1-anatol.oe@belski.net>
	<CAJTo0Lb1o8HVmrYAXAuh3Vkfzjm5rco5A5V-ECQT-j+FycLpMg@mail.gmail.com>
	<836a01d52ec4$ab7cfae0$0276f0a0$@belski.net>
In-Reply-To: <836a01d52ec4$ab7cfae0$0276f0a0$@belski.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Jul 2019 10:48:17 +0100
Message-ID: <CAJTo0LY3Qs8GaRG2bn9mMNhGp8mrYAr_6psOJgPWbZhpmttiZg@mail.gmail.com>
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
X-List-Received-Date: Mon, 01 Jul 2019 09:48:28 -0000
Content-Type: text/plain; charset="UTF-8"

*All* security issues are fixed in master first and then bubble down
the stable branches.  Otherwise, if you just fix thud we may end up
with the next release not having the fix.

So, ideally, we upgrade master to 1.07 and then apply the backport to
the stable branches.

Ross

On Sat, 29 Jun 2019 at 22:50, <anatol.oe@belski.net> wrote:
>
> Hi,
>
>
> > -----Original Message-----
> > From: Burton, Ross <ross.burton@intel.com>
> > Sent: Saturday, June 29, 2019 9:30 PM
> > To: anatol.oe@belski.net
> > Cc: OE-core <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [thud][PATCH v2] bzip2: Fix CVE-2019-12900
> >
> > For master, lets upgrade to 1.0.7 instead.
> >
> Thanks for checking. Probably makes sense, yep. Whereby it's released just two days ago, after all the years :) Probably have time to expect some newer version.
>
> In general, should I have posted this patch against master? As seems I've targeted thud only, according to the policies below
>
> https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance
>
> Or it's going to be merged up, if accepted?
>
> Thanks
>
> Anatol
>
> > Ross
> >
> > On Sat, 29 Jun 2019 at 20:28, <anatol.oe@belski.net> wrote:
> > >
> > > From: Anatol Belski <anatol.belski@microsoft.com>
> > >
> > > Affects bzip2 <= 1.0.6
> > >
> > > Signed-off-by: Anatol Belski <anatol.belski@microsoft.com>
> > > ---
> > >  .../bzip2/bzip2-1.0.6/CVE-2019-12900.patch    | 37
> > +++++++++++++++++++
> > >  meta/recipes-extended/bzip2/bzip2_1.0.6.bb    |  3 +-
> > >  2 files changed, 39 insertions(+), 1 deletion(-)  create mode 100644
> > > meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> > >
> > > diff --git
> > > a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> > > b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> > > new file mode 100644
> > > index 0000000000..8313fdcfcc
> > > --- /dev/null
> > > +++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> > > @@ -0,0 +1,37 @@
> > > +bzip2: Fix CVE-2019-12900
> > > +Upstream-Status: Accepted
> > >
> > +[https://gitlab.com/federicomenaquintero/bzip2/commit/74de1e2e6ffc9d5
> > > +1ef9824db71a8ffee5962cdbc]
> > > +CVE: CVE-2019-12900
> > > +Signed-off-by: Albert Astals Cid <aacid@kde.org>
> > > +
> > > +From 74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc Mon Sep 17
> > 00:00:00
> > > +2001
> > > +From: Albert Astals Cid <aacid@kde.org>
> > > +Date: Tue, 28 May 2019 19:35:18 +0200
> > > +Subject: [PATCH] Make sure nSelectors is not out of range
> > > +
> > > +nSelectors is used in a loop from 0 to nSelectors to access
> > > +selectorMtf which is
> > > +       UChar    selectorMtf[BZ_MAX_SELECTORS];
> > > +so if nSelectors is bigger than BZ_MAX_SELECTORS it'll do an invalid
> > > +memory access
> > > +
> > > +Fixes out of bounds access discovered while fuzzying karchive
> > > +---
> > > + decompress.c | 2 +-
> > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > +
> > > +diff --git a/decompress.c b/decompress.c index ab6a624..f3db91d
> > > +100644
> > > +--- a/decompress.c
> > > ++++ b/decompress.c
> > > +@@ -287,7 +287,7 @@ Int32 BZ2_decompress ( DState* s )
> > > +       GET_BITS(BZ_X_SELECTOR_1, nGroups, 3);
> > > +       if (nGroups < 2 || nGroups > 6) RETURN(BZ_DATA_ERROR);
> > > +       GET_BITS(BZ_X_SELECTOR_2, nSelectors, 15);
> > > +-      if (nSelectors < 1) RETURN(BZ_DATA_ERROR);
> > > ++      if (nSelectors < 1 || nSelectors > BZ_MAX_SELECTORS)
> > > ++ RETURN(BZ_DATA_ERROR);
> > > +       for (i = 0; i < nSelectors; i++) {
> > > +          j = 0;
> > > +          while (True) {
> > > +--
> > > +2.21.0
> > > +
> > > diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> > > b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> > > index 025f45c472..6791020d05 100644
> > > --- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> > > +++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> > > @@ -6,7 +6,7 @@ HOMEPAGE = "https://sourceware.org/bzip2/"
> > >  SECTION = "console/utils"
> > >  LICENSE = "bzip2"
> > >  LIC_FILES_CHKSUM =
> > "file://LICENSE;beginline=4;endline=37;md5=39406315f540c69bd05b1531da
> > edd2ae"
> > > -PR = "r5"
> > > +PR = "r6"
> > >
> > >  SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz
> > \
> > >             file://fix-bunzip2-qt-returns-0-for-corrupt-archives.patch
> > > \ @@ -14,6 +14,7 @@ SRC_URI =
> > "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz \
> > >             file://Makefile.am;subdir=${BP} \
> > >             file://run-ptest \
> > >             file://CVE-2016-3189.patch \
> > > +           file://CVE-2019-12900.patch \
> > >             "
> > >
> > >  SRC_URI[md5sum] = "00b516f4704d4a7cb50a1d97e6e8e15b"
> > > --
> > > 2.17.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

