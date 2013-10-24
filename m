Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 1DCAC6D3C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 10:00:39 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Oct 2013 03:00:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="379257675"
Received: from unknown (HELO [10.255.14.244]) ([10.255.14.244])
	by azsmga001.ch.intel.com with ESMTP; 24 Oct 2013 03:00:39 -0700
Message-ID: <5268EFC6.2010007@linux.intel.com>
Date: Thu, 24 Oct 2013 03:00:38 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, "maxin.john@enea.com" <maxin.john@enea.com>
References: <1382360321-37920-1-git-send-email-maxin.john@enea.com>
	<CAMKF1sqtbX9iKkKHv8gZu9zqZzKjbFvadpFSro4JB9k+_CAzcg@mail.gmail.com>
In-Reply-To: <CAMKF1sqtbX9iKkKHv8gZu9zqZzKjbFvadpFSro4JB9k+_CAzcg@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pigz: bump to 2.3.1
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
X-List-Received-Date: Thu, 24 Oct 2013 10:00:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 10/21/2013 03:52 PM, Khem Raj wrote:
>
>
> On Monday, October 21, 2013,  <maxin.john@enea.com
> <mailto:maxin.john@enea.com>> wrote:
>  > From: "Maxin B. John" <maxin.john@enea.com <mailto:maxin.john@enea.com>>
>  >
>  > Update pigz to latest release - 2.3.1
>  > Drop ldflags.patch as it has been merged upstream
>  >
>  > Signed-off-by: Maxin B. John <maxin.john@enea.com
> <mailto:maxin.john@enea.com>>
>  > ---
> looks ok althouh
> git format-patch -M would have detected renaming a bit better inturn
> making it easier to review it
>
>  >  meta/recipes-extended/pigz/files/ldflags.patch |   19
> -------------------
>  >  meta/recipes-extended/pigz/pigz.inc            |    5 ++---
>  >  meta/recipes-extended/pigz/pigz_2.3.1.bb <http://pigz_2.3.1.bb>
>    |   10 ++++++++++
>  >  meta/recipes-extended/pigz/pigz_2.3.bb <http://pigz_2.3.bb>
> |   10 ----------
>  >  4 files changed, 12 insertions(+), 32 deletions(-)
>  >  delete mode 100644 meta/recipes-extended/pigz/files/ldflags.patch
>  >  create mode 100644 meta/recipes-extended/pigz/pigz_2.3.1.bb
> <http://pigz_2.3.1.bb>
>  >  delete mode 100644 meta/recipes-extended/pigz/pigz_2.3.bb
> <http://pigz_2.3.bb>
>  >
>  > diff --git a/meta/recipes-extended/pigz/files/ldflags.patch
> b/meta/recipes-extended/pigz/files/ldflags.patch
>  > deleted file mode 100644
>  > index 8e531cc..0000000
>  > --- a/meta/recipes-extended/pigz/files/ldflags.patch
>  > +++ /dev/null
>  > @@ -1,19 +0,0 @@
>  > -Link using the bitbake LDFLAGS.
>  > -
>  > -Signed-off-by: Björn Stenberg <bjst@enea.com <mailto:bjst@enea.com>>
>  > -
>  > -Upstream-Status: Pending
>  > -
>  > -Index: pigz-2.3/Makefile
>  > -===================================================================
>  > ---- pigz-2.3.orig/Makefile
>  > -+++ pigz-2.3/Makefile
>  > -@@ -3,7 +3,7 @@ CFLAGS=-O3 -Wall -Wextra
>  > -
>  > -
>  > - pigz: pigz.o yarn.o zopfli/deflate.o zopfli/blocksplitter.o
> zopfli/tree.o zopfli/lz77.o zopfli/cache.o zopfli/hash.o zopfli/util.o
> zopfli/squeeze.o zopfli/katajainen.o
>  > --      $(CC) -o pigz $^ -lpthread -lz
>  > -+      $(CC) ${LDFLAGS} -o pigz $^ -lpthread -lz -lm
>  > -       ln -f pigz unpigz
>  > -
>  > - pigz.o: pigz.c yarn.h zopfli/deflate.h zopfli/util.h
>  > diff --git a/meta/recipes-extended/pigz/pigz.inc
> b/meta/recipes-extended/pigz/pigz.inc
>  > index 5ceaef2..984f9ea 100644
>  > --- a/meta/recipes-extended/pigz/pigz.inc
>  > +++ b/meta/recipes-extended/pigz/pigz.inc
>  > @@ -7,10 +7,9 @@ HOMEPAGE = "http://zlib.net/pigz/"
>  >  SECTION = "console/utils"
>  >  LICENSE = "Zlib"
>  >
>  > -PR = "r1"
>  > +PR = "r0"
>  >
Beyond Khem's comment above, the PR field is not required anymore so it 
can just be removed.

Thanks
	Sau!

>  > -SRC_URI = "http://zlib.net/pigz/pigz-${PV}.tar.gz \
>  > -           file://ldflags.patch"
>  > +SRC_URI = "http://zlib.net/pigz/pigz-${PV}.tar.gz"
>  >
>  >  PROVIDES_class-native += "gzip-native"
>  >
>  > diff --git a/meta/recipes-extended/pigz/pigz_2.3.1.bb
> <http://pigz_2.3.1.bb> b/meta/recipes-extended/pigz/pigz_2.3.1.bb
> <http://pigz_2.3.1.bb>
>  > new file mode 100644
>  > index 0000000..6e7c7f1
>  > --- /dev/null
>  > +++ b/meta/recipes-extended/pigz/pigz_2.3.1.bb <http://pigz_2.3.1.bb>
>  > @@ -0,0 +1,10 @@
>  > +require pigz.inc
>  > +LIC_FILES_CHKSUM =
> "file://pigz.c;beginline=7;endline=21;md5=a21d4075cb00ab4ca17fce5e7534ca95"
>  > +
>  > +SRC_URI[md5sum] = "e803f8bc0770c7a5e96dccb1d2dd2aab"
>  > +SRC_URI[sha256sum] =
> "629b0ce5422a3978f31742bf8275d0be2f84987140d18f390f1e3b4e46e0af54"
>  > +
>  > +NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
>  > +
>  > +BBCLASSEXTEND = "native"
>  > +
>  > diff --git a/meta/recipes-extended/pigz/pigz_2.3.bb
> <http://pigz_2.3.bb> b/meta/recipes-extended/pigz/pigz_2.3.bb
> <http://pigz_2.3.bb>
>  > deleted file mode 100644
>  > index 724d00b..0000000
>  > --- a/meta/recipes-extended/pigz/pigz_2.3.bb <http://pigz_2.3.bb>
>  > +++ /dev/null
>  > @@ -1,10 +0,0 @@
>  > -require pigz.inc
>  > -LIC_FILES_CHKSUM =
> "file://pigz.c;beginline=7;endline=21;md5=a21d4075cb00ab4ca17fce5e7534ca95"
>  > -
>  > -SRC_URI[md5sum] = "042e3322534f2c3d761736350cac303f"
>  > -SRC_URI[sha256sum] =
> "74bbd5962f9420549fc987ddd1ccda692ec2b29d2d612fbbe26edf3fa348ff21"
>  > -
>  > -NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
>  > -
>  > -BBCLASSEXTEND = "native"
>  > -
>  > --
>  > 1.7.10.4
>  >
>  > _______________________________________________
>  > Openembedded-core mailing list
>  > Openembedded-core@lists.openembedded.org
> <mailto:Openembedded-core@lists.openembedded.org>
>  > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>  >
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

