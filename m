Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2B61F7EEB8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 16:03:26 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k8so75133220iot.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 09:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aA05iTUysUkPzA8rVhwTWn0F4mF/0GCryQOjg8TjOD4=;
	b=dDgC7+LdaHL5wG6PZ4IIBjoI/3t6wh9fs5j8dnamvAn27HkMiNvaMQ2S2Pt0NmiBK3
	Cy1JUPnD9pzPd1Y/8IrK8vCAOgerlRVf53QEBRt0x2m3uXhqWJujlFRxw1S+HFB3w0oA
	qY+El/S/t9AhCEUWIDxb62wVOUYXxCVpqTU12DpOCYATU5UKpa8oqlO22Bscip7KTsYz
	67qircX19GD0OP9qI6KksNY6/7zqpXHD4Wz7HOW1MUNWQvZjH6qnUXrq9LicW0r3Pe0n
	8Frm9mtr3VUujS06nv7f+gz5BLFLCwwOtocwEklmlumHnyATYD/tf/RAnQyQehzjmBhJ
	F4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aA05iTUysUkPzA8rVhwTWn0F4mF/0GCryQOjg8TjOD4=;
	b=HULISxQII+ToPKb4i4AH4ySZ7BQvBusXs4NJiG1ivC3VJVVCUwvPmsvaqLhmu0iL5d
	cUQS5ysy4YGRDzS5HyGMYKGsPH7LFjql04igSkkm+vSodCzJ/XBIy0gv8kQtaGlH23CB
	CaEy9C6BIf6dWw2Q/fcudqnN9AZjVwxQOAB6M+6LIVGzyTAK7KytbN1ENwXa03VxKCyu
	Esj++U+AezR/dQo7pOlMyqMoHNx/H8LMKSQysKdgMMqlLG+F9JhWPPDowSP9jIWHtlPf
	0jktMJoAsHoe14Ooh6LjkQg8vDGsAscCOrvczquCiVOkbPb7qF6rU+Neek8pKGoFAbUC
	lXrQ==
X-Gm-Message-State: APjAAAUGz5Svw2td6uq76DVhW+xlbXm9sY5s2CrzIsRe0lqqUuBWIHOg
	mdNnAdJa0lsJyE+Z58KXUGw78knU7+RHOsudSYPU4yWn
X-Google-Smtp-Source: APXvYqwHhgT01xyAMJ7id/Z4nKlelyW/MrS0dWRWCBVakjxHNZPPJDgznHUaUxp5J7bLwpcvTFHI9u2qgqM403Br3tI=
X-Received: by 2002:a02:c7c9:: with SMTP id s9mr16003755jao.82.1563811408005; 
	Mon, 22 Jul 2019 09:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190722001812.14947-1-open.source@oleksandr-kravchuk.com>
	<20190722001812.14947-4-open.source@oleksandr-kravchuk.com>
	<CAJTo0LYD8ujue+Ls+oxsE64GNp0P-uXpE7xX_poEkPdb+7cj2g@mail.gmail.com>
	<CAJTo0LZQPPbMyg6UdWc=qv+1sZSMyyusBijM0oZHTHppUbZzLQ@mail.gmail.com>
	<38126da9-c383-84ea-bef2-44aae479d8ce@oleksandr-kravchuk.com>
In-Reply-To: <38126da9-c383-84ea-bef2-44aae479d8ce@oleksandr-kravchuk.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Jul 2019 17:03:17 +0100
Message-ID: <CAJTo0Laqti9S2Fq_bbVtW6ty1Ge2TGMqjiMAMMTJdCpUWax3tQ@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] python3-git: update to 2.1.12
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
X-List-Received-Date: Mon, 22 Jul 2019 16:03:27 -0000
Content-Type: text/plain; charset="UTF-8"

Just send this patch as a v2 (git send-email -v2 ... if you didn't
know the handy shortcut).

On Mon, 22 Jul 2019 at 16:53, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Would it work if I resend this patch only or should I resend the entire
> sequence of patches?
>
> On 22/07/2019 12:16, Burton, Ross wrote:
> > (The recipe is doing DEPENDS= and overriding the DEPENDS+= in
> > setuptools3.bbclass)
> >
> > On Mon, 22 Jul 2019 at 11:15, Burton, Ross <ross.burton@intel.com> wrote:
> >> The upgrade is failing for me:
> >>
> >> ERROR: python3-git-2.1.12-r0 do_configure: Function failed:
> >> do_configure (log file is located at
> >> /data/poky-tmp/master/work/corei7-64-poky-linux/python3-git/2.1.12-r0/temp/log.do_configure.32072)
> >> ERROR: Logfile of failure stored in:
> >> /data/poky-tmp/master/work/corei7-64-poky-linux/python3-git/2.1.12-r0/temp/log.do_configure.32072
> >> Log data follows:
> >> | DEBUG: Executing shell function do_configure
> >> | Traceback (most recent call last):
> >> |   File "setup.py", line 4, in <module>
> >> |     from setuptools import setup, find_packages
> >> | ModuleNotFoundError: No module named 'setuptools'
> >> |
> >> | During handling of the above exception, another exception occurred:
> >> |
> >> | Traceback (most recent call last):
> >> |   File "setup.py", line 6, in <module>
> >> |     from ez_setup import use_setuptools
> >> | ModuleNotFoundError: No module named 'ez_setup'
> >>
> >> Ross
> >>
> >> On Mon, 22 Jul 2019 at 01:19, Oleksandr Kravchuk
> >> <open.source@oleksandr-kravchuk.com> wrote:
> >>> Got rid of python-git since there is no python2 version of the package.
> >>>
> >>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> >>> ---
> >>>  meta/recipes-devtools/python/python3-git_2.1.11.bb         | 2 --
> >>>  .../python/{python-git.inc => python3-git_2.1.12.bb}       | 7 ++++---
> >>>  2 files changed, 4 insertions(+), 5 deletions(-)
> >>>  delete mode 100644 meta/recipes-devtools/python/python3-git_2.1.11.bb
> >>>  rename meta/recipes-devtools/python/{python-git.inc => python3-git_2.1.12.bb} (86%)
> >>>
> >>> diff --git a/meta/recipes-devtools/python/python3-git_2.1.11.bb b/meta/recipes-devtools/python/python3-git_2.1.11.bb
> >>> deleted file mode 100644
> >>> index ac320fa56b..0000000000
> >>> --- a/meta/recipes-devtools/python/python3-git_2.1.11.bb
> >>> +++ /dev/null
> >>> @@ -1,2 +0,0 @@
> >>> -require python-git.inc
> >>> -inherit setuptools3
> >>> diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python3-git_2.1.12.bb
> >>> similarity index 86%
> >>> rename from meta/recipes-devtools/python/python-git.inc
> >>> rename to meta/recipes-devtools/python/python3-git_2.1.12.bb
> >>> index f973e9f42c..99e59cbb8a 100644
> >>> --- a/meta/recipes-devtools/python/python-git.inc
> >>> +++ b/meta/recipes-devtools/python/python3-git_2.1.12.bb
> >>> @@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
> >>>
> >>>  PYPI_PACKAGE = "GitPython"
> >>>
> >>> -inherit pypi
> >>> +inherit pypi setuptools3
> >>>
> >>> -SRC_URI[md5sum] = "cee43a39a1468084d49d1c49fb675204"
> >>> -SRC_URI[sha256sum] = "8237dc5bfd6f1366abeee5624111b9d6879393d84745a507de0fda86043b65a8"
> >>> +SRC_URI[md5sum] = "33bfbc89fe616ca22b6336be80d570f4"
> >>> +SRC_URI[sha256sum] = "7428f1cc5e72d53e65c3259d5cebc22fb2b07f973c49d95b3c3d26c64890a3c3"
> >>>
> >>>  DEPENDS = "${PYTHON_PN}-gitdb"
> >>>
> >>> @@ -29,4 +29,5 @@ RDEPENDS_${PN} += " \
> >>>                     ${PYTHON_PN}-unixadmin \
> >>>                     git \
> >>>  "
> >>> +
> >>>  BBCLASSEXTEND = "native nativesdk"
> >>> --
> >>> 2.17.1
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

