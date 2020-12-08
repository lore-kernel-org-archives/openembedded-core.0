Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.9099.1607437401036383519
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 06:23:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=X/+6vPJ7;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.47, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f47.google.com with SMTP id d17so24820753ejy.9
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 06:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dyjrOTkjuAj/QTpsgvkeZcMHcGthMvTSjtIcvPTS5Eo=;
        b=X/+6vPJ7uPgGukTop8S0O7EOUlDSjghKrQf0/qbIFnpO+9JP7o6ZYjDDzR2wagErni
         qD2+ubt3FXJrj3vqSYDUFZFKXFEEHjQPJo2I8nXjGyhaCYbn+/DPJkSAdlfFvbGM8YTj
         AP/jS4fEm0IVP9HIwcIcs6ErQOSc/X59y23/QaXGUeweFjwbd0LAw/C+5e5E97tpre03
         Sh2Wgl4yhU4kNESp7NR4LsnjQOOoyNpLKFH2O1WL4Oo6FTbI9zA/ecxZQ7aCQ2+o+TpE
         Qq959ZkV+y9D/S7EhLoNwDwhVcx+phO6F7/1ve0FLaXZj2/lJEan9w714KGXg4sVUHVJ
         h5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dyjrOTkjuAj/QTpsgvkeZcMHcGthMvTSjtIcvPTS5Eo=;
        b=gWhDyOvvcrP9kjmNp5T5jbXYdIKOWaXbQCtcAcIo/z/LJNhMFEoDaxBjxdikWqwCDg
         SbPrI/dU2wan7fj1xrxs9+3SzlwTrWCeJ1mp83NrObruUn3U2SAWpcuJt7tEGcKeX2Ba
         B7L3pB2goFiSuAyMCO2KlFlZx5mDSJd9ESPhLAAD8qRKVNWpN7w+i9Yk+4FS1uE0GXNy
         l2/Wgj70tkoQHBG80ANXFITLqUXtm5Ylvwym2KBZ1LKNsl2W0gb3f7otuuo6+1sNuJ9W
         2vpO5BnAMD3qlNX397m+rOOb+Sy9cVqn91zBl1/ogLGMj/mo97WAsfQCiwCX7kXz53VM
         POag==
X-Gm-Message-State: AOAM532z4hK3t0WJmUdo58Y9OD2DUK3spxStVEheZb/sQRfUzMMJWZ6J
	otbywiJbdP2gL1QJACvVbmG0yQtJCcxFNPpPxm+lyQ==
X-Google-Smtp-Source: ABdhPJzQcd++Qrv9zU8jR6WhwB+rAdhdP8UL+zjP6pXUg8MwC33W15XSIDgBFO2HBFWuSCIDN2ANMzH8l2Tcn8ZzvOY=
X-Received: by 2002:a17:906:edc8:: with SMTP id sb8mr13563084ejb.247.1607437399459;
 Tue, 08 Dec 2020 06:23:19 -0800 (PST)
MIME-Version: 1.0
References: <20201208083102.3259-1-andrej.valek@siemens.com>
In-Reply-To: <20201208083102.3259-1-andrej.valek@siemens.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 8 Dec 2020 04:23:08 -1000
Message-ID: <CAOSpxdawqv0Wh5dqHnFx2c3Zm+hEuRnE10Sm-AiM1u9gi5r3pg@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] python3: fix CVE-2019-20907
To: Andrej Valek <andrej.valek@siemens.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Thanks Andrej!  I appreciate the help in CVE reduction.

This patch is missing some of the requirements (CVE: tag, sign-off,
references) outlined in the "Patch name convention and commit message"
section of:

https://wiki.yoctoproject.org/wiki/Security

Could you submit a v2?

Thanks again!

Steve

On Mon, Dec 7, 2020 at 10:32 PM Andrej Valek <andrej.valek@siemens.com> wrote:
>
> - move fixing patch for CVE-2020-8492 to the right location
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  ...VE-2020-8492-Fix-AbstractBasicAuthHandler.patch |   0
>  .../python/python3/CVE-2019-20907.patch            | 135 +++++++++++++++++++++
>  meta/recipes-devtools/python/python3_3.8.2.bb      |   1 +
>  3 files changed, 136 insertions(+)
>  rename meta/recipes-devtools/python/{files => python3}/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch (100%)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2019-20907.patch
>
> diff --git a/meta/recipes-devtools/python/files/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch b/meta/recipes-devtools/python/python3/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
> similarity index 100%
> rename from meta/recipes-devtools/python/files/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
> rename to meta/recipes-devtools/python/python3/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
> diff --git a/meta/recipes-devtools/python/python3/CVE-2019-20907.patch b/meta/recipes-devtools/python/python3/CVE-2019-20907.patch
> new file mode 100644
> index 0000000000..5ac145333b
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2019-20907.patch
> @@ -0,0 +1,135 @@
> +From 1fa6ef2bc7cee1c8e088dd8b397d9b2d54036dbc Mon Sep 17 00:00:00 2001
> +From: Rajarishi Devarajan <rishi93dev@gmail.com>
> +Date: Sun, 12 Jul 2020 23:47:42 +0200
> +Subject: [PATCH 1/4] bpo-39017 Fix infinite loop in the tarfile module
> +
> +Add a check for length = 0 in the _proc_pax function to avoid running into an infinite loop
> +---
> + Lib/tarfile.py           |   2 ++
> + Lib/test/recursion.tar   | Bin 0 -> 516 bytes
> + Lib/test/test_tarfile.py |   5 +++++
> + 3 files changed, 7 insertions(+)
> + create mode 100644 Lib/test/recursion.tar
> +
> +diff --git a/Lib/tarfile.py b/Lib/tarfile.py
> +index e2b60532f693d..6769066cabd6f 100755
> +--- a/Lib/tarfile.py
> ++++ b/Lib/tarfile.py
> +@@ -1249,6 +1249,8 @@ def _proc_pax(self, tarfile):
> +
> +             length, keyword = match.groups()
> +             length = int(length)
> ++            if length == 0:
> ++                raise InvalidHeaderError("invalid header")
> +             value = buf[match.end(2) + 1:match.start(1) + length - 1]
> +
> +             # Normally, we could just use "utf-8" as the encoding and "strict"
> +diff --git a/Lib/test/recursion.tar b/Lib/test/recursion.tar
> +new file mode 100644
> +index 0000000000000000000000000000000000000000..b8237251964983f54ed1966297e887636cd0c5f4
> +GIT binary patch
> +literal 516
> +zcmYdFPRz+kEn=W0Fn}74P8%Xw3X=l~85kIuo0>8xq$A1Gm}!7)KUsFc41m#O8A5+e
> +I1_}|j06>QaCIA2c
> +
> +literal 0
> +HcmV?d00001
> +
> +diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
> +index d60d35b5be04a..1f31a8f700766 100644
> +--- a/Lib/test/test_tarfile.py
> ++++ b/Lib/test/test_tarfile.py
> +@@ -429,6 +429,11 @@ def test_premature_end_of_archive(self):
> +                 with self.assertRaisesRegex(tarfile.ReadError, "unexpected end of data"):
> +                     tar.extractfile(t).read()
> +
> ++    def test_length_zero_header(self):
> ++        with self.assertRaisesRegex(tarfile.ReadError, "file could not be opened successfully"):
> ++            with tarfile.open(support.findfile('recursion.tar')) as tar:
> ++                tar.getmembers()
> ++
> + class MiscReadTestBase(CommonReadTest):
> +     def requires_name_attribute(self):
> +         pass
> +
> +From c43a5afcf9cc2dab2410c35632f66e055a938c02 Mon Sep 17 00:00:00 2001
> +From: "blurb-it[bot]" <43283697+blurb-it[bot]@users.noreply.github.com>
> +Date: Sun, 12 Jul 2020 22:16:59 +0000
> +Subject: [PATCH 2/4] =?UTF-8?q?=F0=9F=93=9C=F0=9F=A4=96=20Added=20by=20blu?=
> + =?UTF-8?q?rb=5Fit.?=
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +---
> + .../NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst | 1 +
> + 1 file changed, 1 insertion(+)
> + create mode 100644 Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst
> +
> +diff --git a/Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst b/Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst
> +new file mode 100644
> +index 0000000000000..10d98f759ac87
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst
> +@@ -0,0 +1 @@
> ++Add check for length = 0 to avoid infinite loop inside _proc_pax function in tarfile module
> +\ No newline at end of file
> +
> +From 5f7b94574db21086dc2693210a975def7cc058e3 Mon Sep 17 00:00:00 2001
> +From: Rishi <rishi_devan@mail.com>
> +Date: Tue, 14 Jul 2020 12:39:14 +0200
> +Subject: [PATCH 3/4] Apply suggestions from code review
> +
> +Add relevant CVE number in inline comments
> +
> +Co-authored-by: Petr Viktorin <encukou@gmail.com>
> +---
> + Lib/test/test_tarfile.py                                        | 2 ++
> + .../next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst       | 2 +-
> + 2 files changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
> +index 1f31a8f700766..827ffaf3273b3 100644
> +--- a/Lib/test/test_tarfile.py
> ++++ b/Lib/test/test_tarfile.py
> +@@ -430,6 +430,8 @@ def test_premature_end_of_archive(self):
> +                     tar.extractfile(t).read()
> +
> +     def test_length_zero_header(self):
> ++        # bpo-39017 (CVE-2019-20907): reading a zero-length header should fail
> ++        # with an exception
> +         with self.assertRaisesRegex(tarfile.ReadError, "file could not be opened successfully"):
> +             with tarfile.open(support.findfile('recursion.tar')) as tar:
> +                 tar.getmembers()
> +diff --git a/Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst b/Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst
> +index 10d98f759ac87..ad26676f8b856 100644
> +--- a/Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst
> ++++ b/Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst
> +@@ -1 +1 @@
> +-Add check for length = 0 to avoid infinite loop inside _proc_pax function in tarfile module
> +\ No newline at end of file
> ++Avoid infinite loop when reading specially crafted TAR files using the tarfile module (CVE-2019-20907).
> +
> +From 54084a8beef62fa0ac443618be2352f67f2bb8c3 Mon Sep 17 00:00:00 2001
> +From: rishi93 <rishi_devan@mail.com>
> +Date: Tue, 14 Jul 2020 12:45:48 +0200
> +Subject: [PATCH 4/4] bpo-39017: Fix infinite loop in the tarfile module
> +
> +Replace code that is never called with pass in tarfile testcase
> +---
> + Lib/test/test_tarfile.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
> +index 827ffaf3273b3..3ddeb97f5268f 100644
> +--- a/Lib/test/test_tarfile.py
> ++++ b/Lib/test/test_tarfile.py
> +@@ -434,7 +434,7 @@ def test_length_zero_header(self):
> +         # with an exception
> +         with self.assertRaisesRegex(tarfile.ReadError, "file could not be opened successfully"):
> +             with tarfile.open(support.findfile('recursion.tar')) as tar:
> +-                tar.getmembers()
> ++                pass
> +
> + class MiscReadTestBase(CommonReadTest):
> +     def requires_name_attribute(self):
> diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
> index b4cce88e87..9eddad4ad4 100644
> --- a/meta/recipes-devtools/python/python3_3.8.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.8.2.bb
> @@ -33,6 +33,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>             file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
>             file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
>             file://0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch \
> +           file://CVE-2019-20907.patch \
>             file://CVE-2020-14422.patch \
>             file://CVE-2020-26116.patch \
>             file://CVE-2020-27619.patch \
> --
> 2.11.0
>
