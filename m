Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id F1D267C427
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 10:16:24 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id f4so72680774ioh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 03:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Kh9EqE7zvroueBBWPVJHfVXx8O7jJcdEPxrwlqy8Y0U=;
	b=iq2LQKV6kzz7ppNmb49BL/W+7TugkKq29PKrMEr6k8Y6GyQtGiSeMsqnwZjJiJzS5E
	T3jnvOVmvQco/VhAJHh7sXoLHgzjpQFHtUF1CAV+jOy4UNJVaz7DA0mxDD9sgUvfkP2F
	KBcfjj9bVbnHFlJBHPcZ+5C3pHlPxOREsjv0rn6Gq2du0FOWcwPZDhoRPH+LWAkZsr+C
	Sg6WGuOqF6yIzOo5igpRJzft5/T1sSTjYHypXHUT91CAHlJtdf/3gtm17+TcYlYclrbx
	lt/Zxex0MLDWnR1jjsrPR0JZLIJpuynL8sjr8ibOHnTS4f/lYzHfO6ZDwWVzfjCj7sT8
	3ECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Kh9EqE7zvroueBBWPVJHfVXx8O7jJcdEPxrwlqy8Y0U=;
	b=XQJeNtja1kJ9nRJCY0F7e8AJgH/wbUunglPpdhun7lrW3t+TzSjxaoY5y+PK8EnDbn
	jZLIkEojvXMiky879c9HaGgps+1SiJb5Paj7lAwOuERj3Z4WLT1Of/iMphIiltC9UwTf
	drN8dqZ+2PCTdi0Tjz3Y263gg9IN2dso7ASrrWNtuy3zYrl638kYnxYWfjowXJor6oMw
	nY76Ho3MisADYGqMg3y6XbGGBka6ib6Qz1a2+kO7czApLkVAFrO19yUrFqQqXBVg1ulJ
	PRwCmZ6airah5RDhzLxoJKQ/6YExvFPSCKyHxLFLD086cG9fKCuOboI/mVhCIy3AkPms
	4ffw==
X-Gm-Message-State: APjAAAXI6KtkAkn4j1SKMIda/WGbI2/34VTH4+R2avbXON9xqiYzSKL5
	gFR2U5Ryf7FbliR0HqvT8+dGwhC69tbWGndCtSPLm8V8
X-Google-Smtp-Source: APXvYqxfCmH0L6v9M++lIOSZywj22IpsFdfPJN/8V0HcWlVva4qAVVc03kw/6tnzgE2edKtDHPhNMmRbGr4HI9996j8=
X-Received: by 2002:a5e:9747:: with SMTP id h7mr23650960ioq.299.1563790585973; 
	Mon, 22 Jul 2019 03:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190722001812.14947-1-open.source@oleksandr-kravchuk.com>
	<20190722001812.14947-4-open.source@oleksandr-kravchuk.com>
	<CAJTo0LYD8ujue+Ls+oxsE64GNp0P-uXpE7xX_poEkPdb+7cj2g@mail.gmail.com>
In-Reply-To: <CAJTo0LYD8ujue+Ls+oxsE64GNp0P-uXpE7xX_poEkPdb+7cj2g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Jul 2019 11:16:15 +0100
Message-ID: <CAJTo0LZQPPbMyg6UdWc=qv+1sZSMyyusBijM0oZHTHppUbZzLQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 22 Jul 2019 10:16:25 -0000
Content-Type: text/plain; charset="UTF-8"

(The recipe is doing DEPENDS= and overriding the DEPENDS+= in
setuptools3.bbclass)

On Mon, 22 Jul 2019 at 11:15, Burton, Ross <ross.burton@intel.com> wrote:
>
> The upgrade is failing for me:
>
> ERROR: python3-git-2.1.12-r0 do_configure: Function failed:
> do_configure (log file is located at
> /data/poky-tmp/master/work/corei7-64-poky-linux/python3-git/2.1.12-r0/temp/log.do_configure.32072)
> ERROR: Logfile of failure stored in:
> /data/poky-tmp/master/work/corei7-64-poky-linux/python3-git/2.1.12-r0/temp/log.do_configure.32072
> Log data follows:
> | DEBUG: Executing shell function do_configure
> | Traceback (most recent call last):
> |   File "setup.py", line 4, in <module>
> |     from setuptools import setup, find_packages
> | ModuleNotFoundError: No module named 'setuptools'
> |
> | During handling of the above exception, another exception occurred:
> |
> | Traceback (most recent call last):
> |   File "setup.py", line 6, in <module>
> |     from ez_setup import use_setuptools
> | ModuleNotFoundError: No module named 'ez_setup'
>
> Ross
>
> On Mon, 22 Jul 2019 at 01:19, Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
> >
> > Got rid of python-git since there is no python2 version of the package.
> >
> > Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> > ---
> >  meta/recipes-devtools/python/python3-git_2.1.11.bb         | 2 --
> >  .../python/{python-git.inc => python3-git_2.1.12.bb}       | 7 ++++---
> >  2 files changed, 4 insertions(+), 5 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/python/python3-git_2.1.11.bb
> >  rename meta/recipes-devtools/python/{python-git.inc => python3-git_2.1.12.bb} (86%)
> >
> > diff --git a/meta/recipes-devtools/python/python3-git_2.1.11.bb b/meta/recipes-devtools/python/python3-git_2.1.11.bb
> > deleted file mode 100644
> > index ac320fa56b..0000000000
> > --- a/meta/recipes-devtools/python/python3-git_2.1.11.bb
> > +++ /dev/null
> > @@ -1,2 +0,0 @@
> > -require python-git.inc
> > -inherit setuptools3
> > diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python3-git_2.1.12.bb
> > similarity index 86%
> > rename from meta/recipes-devtools/python/python-git.inc
> > rename to meta/recipes-devtools/python/python3-git_2.1.12.bb
> > index f973e9f42c..99e59cbb8a 100644
> > --- a/meta/recipes-devtools/python/python-git.inc
> > +++ b/meta/recipes-devtools/python/python3-git_2.1.12.bb
> > @@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
> >
> >  PYPI_PACKAGE = "GitPython"
> >
> > -inherit pypi
> > +inherit pypi setuptools3
> >
> > -SRC_URI[md5sum] = "cee43a39a1468084d49d1c49fb675204"
> > -SRC_URI[sha256sum] = "8237dc5bfd6f1366abeee5624111b9d6879393d84745a507de0fda86043b65a8"
> > +SRC_URI[md5sum] = "33bfbc89fe616ca22b6336be80d570f4"
> > +SRC_URI[sha256sum] = "7428f1cc5e72d53e65c3259d5cebc22fb2b07f973c49d95b3c3d26c64890a3c3"
> >
> >  DEPENDS = "${PYTHON_PN}-gitdb"
> >
> > @@ -29,4 +29,5 @@ RDEPENDS_${PN} += " \
> >                     ${PYTHON_PN}-unixadmin \
> >                     git \
> >  "
> > +
> >  BBCLASSEXTEND = "native nativesdk"
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

