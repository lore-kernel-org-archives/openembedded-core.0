Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web08.14897.1607455235576622099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 11:20:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dIGemBVD;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.42, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f42.google.com with SMTP id r5so18725843eda.12
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 11:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=443VBnd1ZiSilCdv16SO7xcl74NXUW4bOz9fYsQp7Ro=;
        b=dIGemBVDALDfow0pBu4JhtRoWW1IDWuveAvQ4l86ozDImCGzwOghYXrBW69v9DC6iy
         EKVlyiSB1K+OlBL2ipMsHB1SCgEhCpp9WQqDEEJt51zQJB5ZmPubUTLRoDWg0aWhRq5n
         ey/FzXuiORAbKxYI3uz2AV8S/KoZWuQWTVE/cdxfCqDiDkD0PmhRjPIpJhyUwQI0gHZv
         L6foiufOdJMkZGyFB+jxJOirThPbDF/t8Q+uiCiM0ZdGOZXgRQjpysktjZsmeXcnKUKD
         C5+G/5EyObXsFsXkmUaDBW6qQGWHgR2GSCPA6+ODSQyBErVQW3+wzdcwET4sFdEPOK90
         ylxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=443VBnd1ZiSilCdv16SO7xcl74NXUW4bOz9fYsQp7Ro=;
        b=dNxUwUbpg3MwpMbbwDElMIORJ/V1JPYLEHe2BUp7OouXqYngqAyrjzpyFeTbq4p3Sm
         9Yut5ONEEqN3BkMtOzdRaJ4w7BlQOoW5/iOKTkJ1Kg4yi5ck4pA5lQcniYxn9+udH7VL
         a6N+2w17VihFxPnwK4NldlkhUhmGDepmQhdARgCw1TEx7JbhrlC4nGtJ180KyFmPEDMI
         T/yvIpPz/7YY9iRK0+TrPt+26G+BqU3KwLvWkM9/oIJRoqhiTVSu9WIRIiwxTTCkUrPE
         aO6BCn85BFaeHs4q+T5uCowCh9caHm/mQ+4KE5exm014HVlKy8YBEnXTpX/Q7SKM06Fo
         wttg==
X-Gm-Message-State: AOAM533l75hBHeeFyRbd4v5sAXsq8x3yjZZdXwdLKKljOwLtv95S1+Zz
	zik/c0k2E9nzG5zXq09fe69rTOHXeqVy3VFrKl2mbw==
X-Google-Smtp-Source: ABdhPJwAFWP+pQWYd3KqxfqtoBymcozUaNU41DlN2kXpeuQKTqr8KJSr6xaI7I7IJun7ZlISNcCJqgnAwRCKOw5yERY=
X-Received: by 2002:a50:ee8e:: with SMTP id f14mr18882819edr.176.1607455233961;
 Tue, 08 Dec 2020 11:20:33 -0800 (PST)
MIME-Version: 1.0
References: <20201208083102.3259-1-andrej.valek@siemens.com> <20201208151603.5928-1-andrej.valek@siemens.com>
In-Reply-To: <20201208151603.5928-1-andrej.valek@siemens.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 8 Dec 2020 09:20:22 -1000
Message-ID: <CAOSpxdYFxkvaxB-ECvzVEH4-eCpOKMbdbnNnra+ey94Lpd9B9Q@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH v2] python3: fix CVE-2019-20907
To: Andrej Valek <andrej.valek@siemens.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 8, 2020 at 5:16 AM Andrej Valek <andrej.valek@siemens.com> wrote:
>
> - move fixing patch for CVE-2020-8492 to the right location
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  ...VE-2020-8492-Fix-AbstractBasicAuthHandler.patch |  0
>  .../python/python3/CVE-2019-20907.patch            | 73 ++++++++++++++++++++++
>  meta/recipes-devtools/python/python3_3.8.2.bb      |  1 +
>  3 files changed, 74 insertions(+)
>  rename meta/recipes-devtools/python/{files => python3}/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch (100%)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2019-20907.patch
>
> diff --git a/meta/recipes-devtools/python/files/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch b/meta/recipes-devtools/python/python3/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
> similarity index 100%
> rename from meta/recipes-devtools/python/files/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
> rename to meta/recipes-devtools/python/python3/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
> diff --git a/meta/recipes-devtools/python/python3/CVE-2019-20907.patch b/meta/recipes-devtools/python/python3/CVE-2019-20907.patch
> new file mode 100644
> index 0000000000..135196f964
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2019-20907.patch
> @@ -0,0 +1,73 @@
> +From a06a6bf4e67a50561f6d6fb33534df1d3035ea34 Mon Sep 17 00:00:00 2001
> +From: Rishi <rishi_devan@mail.com>
> +Date: Wed, 15 Jul 2020 13:51:00 +0200
> +Subject: [PATCH] bpo-39017: Avoid infinite loop in the tarfile module
> + (GH-21454)
> +
> +Avoid infinite loop when reading specially crafted TAR files using the tarfile module
> +(CVE-2019-20907).
> +(cherry picked from commit 5a8d121a1f3ef5ad7c105ee378cc79a3eac0c7d4)
> +
> +Co-authored-by: Rishi <rishi_devan@mail.com>
> +
> +Upstream-Status: Backport [https://github.com/python/cpython/commit/c55479556db015f48fc8bbca17f64d3e65598559]
> +CVE: CVE-2019-20907
> +Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> +---
> + Lib/tarfile.py                                    |   2 ++
> + Lib/test/recursion.tar                            | Bin 0 -> 516 bytes
> + Lib/test/test_tarfile.py                          |   7 +++++++
> + .../2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst      |   1 +
> + 4 files changed, 10 insertions(+)
> + create mode 100644 Lib/test/recursion.tar
> + create mode 100644 Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst
> +
> +diff --git a/Lib/tarfile.py b/Lib/tarfile.py
> +index d31b9cbb51d65..7a69e1b1aa544 100755
> +--- a/Lib/tarfile.py
> ++++ b/Lib/tarfile.py
> +@@ -1241,6 +1241,8 @@ def _proc_pax(self, tarfile):
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

This binary patch section is causing autobuilder failures:

https://errors.yoctoproject.org/Errors/Details/539135/

Steve

> +literal 516
> +zcmYdFPRz+kEn=W0Fn}74P8%Xw3X=l~85kIuo0>8xq$A1Gm}!7)KUsFc41m#O8A5+e
> +I1_}|j06>QaCIA2c
> +
> +literal 0
> +HcmV?d00001
> +
> +diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
> +index 15324a4e48819..b512168d6ea87 100644
> +--- a/Lib/test/test_tarfile.py
> ++++ b/Lib/test/test_tarfile.py
> +@@ -397,6 +397,13 @@ def test_premature_end_of_archive(self):
> +                 with self.assertRaisesRegex(tarfile.ReadError, "unexpected end of data"):
> +                     tar.extractfile(t).read()
> +
> ++    def test_length_zero_header(self):
> ++        # bpo-39017 (CVE-2019-20907): reading a zero-length header should fail
> ++        # with an exception
> ++        with self.assertRaisesRegex(tarfile.ReadError, "file could not be opened successfully"):
> ++            with tarfile.open(support.findfile('recursion.tar')) as tar:
> ++                pass
> ++
> + class MiscReadTestBase(CommonReadTest):
> +     def requires_name_attribute(self):
> +         pass
> +diff --git a/Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst b/Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst
> +new file mode 100644
> +index 0000000000000..ad26676f8b856
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst
> +@@ -0,0 +1 @@
> ++Avoid infinite loop when reading specially crafted TAR files using the tarfile module (CVE-2019-20907).
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
