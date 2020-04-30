Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2105.1588275899383643482
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 12:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BACB240C0F
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 19:44:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O_dlLTk6Jc44
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2020 19:44:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A735140A9E
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 19:44:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6918F172BDF; Thu, 30 Apr 2020 15:44:58 -0400 (EDT)
Date: Thu, 30 Apr 2020 15:44:58 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][dunfell 02/16] bzip2/pbzip2: Correct license information
Message-ID: <20200430194458.GU11927@denix.org>
References: <cover.1588175775.git.steve@sakoman.com>
 <f03ee1a2a697394f3c4168350089526ef6b87de6.1588175775.git.steve@sakoman.com>
 <CAJ86T=WRV+Uny9-4J--0sS2cr5CAtA=D4gFXHgm=-pXsX=BjKg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WRV+Uny9-4J--0sS2cr5CAtA=D4gFXHgm=-pXsX=BjKg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2020 at 12:13:20PM -0700, Andre McCurdy wrote:
> On Wed, Apr 29, 2020 at 9:11 AM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > The license of pbzip2 looks slightly BSD like but is in fact the bzip2
> > license. The SPDX identifier for this is "bzip-1.0.6" since there is
> > another version of the bzip license out there.
> >
> > To clear up all the confusion, use the SPDX license name and update
> > both recipes to refer to it. The copyright information is slightly
> > different between the codebases but the license looks the same.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/files/common-licenses/{bzip2 => bzip2-1.0.6} | 0
> >  meta/recipes-extended/bzip2/bzip2_1.0.8.bb        | 2 +-
> >  meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb     | 2 +-
> >  3 files changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/files/common-licenses/{bzip2 => bzip2-1.0.6} (100%)
> >
> > diff --git a/meta/files/common-licenses/bzip2 b/meta/files/common-licenses/bzip2-1.0.6
> > similarity index 100%
> > rename from meta/files/common-licenses/bzip2
> > rename to meta/files/common-licenses/bzip2-1.0.6
> 
> The corresponding update to the busybox recipe should be merged too.
> 
> 
> > diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> > index 8e9b779e67..d58f553a49 100644
> > --- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> > +++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> > @@ -4,7 +4,7 @@ Huffman coding. Compression is generally considerably better than that achieved
> >  LZ77/LZ78-based compressors, and approaches the performance of the PPM family of statistical compressors."
> >  HOMEPAGE = "https://sourceware.org/bzip2/"
> >  SECTION = "console/utils"
> > -LICENSE = "bzip2"
> > +LICENSE = "bzip2-1.0.6"
> >  LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664"
> >
> >  SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
> > diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
> > index 1275cc0097..d7450c73c1 100644
> > --- a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
> > +++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
> > @@ -5,7 +5,7 @@ machines. The output of this version is fully compatible with bzip2 v1.0.2 or \
> >  newer (ie: anything compressed with pbzip2 can be decompressed with bzip2)."
> >  HOMEPAGE = "http://compression.ca/pbzip2/"
> >  SECTION = "console/utils"
> > -LICENSE = "BSD-4-Clause"
> > +LICENSE = "bzip-1.0.6"

And this is also incorrect - should be bzip2-1.0.6. There's a patch on the 
list for this...


> >  LIC_FILES_CHKSUM = "file://COPYING;md5=398b8832c6f840cfebd20ab2be6a3743"
> >
> >  DEPENDS = "bzip2"
> > --
> > 2.17.1
> >
> > 

> 

