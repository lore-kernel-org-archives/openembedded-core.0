Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web08.29946.1606548743097364545
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 23:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H5EJ+hhE;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id u4so6313034qkk.10
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 23:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6NzpeT44tHeiaHldfDQLBpyhh7bKE96ibd5hNupGwkk=;
        b=H5EJ+hhEOL4iP1cUZwn1ljR8FERaz1w9uEqMMsPsqWAGDTKaLSWHS6XeOt6B/jnBBH
         fYM5zxtk+wa6b4nHvC5d1OC8MbFkYwMdZdlDpoygn3tRlCiprsX2lZaRPKZw315srF/X
         xYXPNGlbWTbBwQ0AZA8I5w90CTWAughc8gkVQaol4w74s4CoaKa5MSuTB4PuJEZqQt5B
         S89pZWSZldqMiCOrAMA0t8BG5HZOxtFeC3lq/qLCLt47wvdFN5VyoD+r4AgQyTPyeFiw
         VPHXwpPsOY8CLaER6nUFV/J6TJe3SL4zfXqNBvUMR/5DHb5Y7cmHrhqTI8AhZ5q+LROv
         YRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6NzpeT44tHeiaHldfDQLBpyhh7bKE96ibd5hNupGwkk=;
        b=cbaYv137Jw63qBuR8YaqIasYreLC7tcdiCfnGYRM2SNVgil6Ot2nS733X73rMT7BaS
         bZ8OBUTvSS3lUQyQsb/X5F0mSXwM3oG4vKSP/EosA9w/zsQ5cHPn8uiCqHtE3Oj5ddnT
         qujnsYjwT6V83LMue1PZ/b1FVHF1dnlmYWzEftGB9b4iX13lm06gnYwx5RfipCYzacdf
         zvH1LKt2U6NI89lmU1krA2ZoleOTQUDIJ/MBvT2UMW297NgA3/N42uSF+FjTC951hRLJ
         WFSP4Wa88qNhx8iwtHb0s4vX2yeFM+RcryctqWAxUfx77rsrURMDq5KtBdp+BPaN52Bg
         Gvpw==
X-Gm-Message-State: AOAM532n/vug3Iy/ISTQMW49U6H13+9iXY52wii5JT/4h1MF4XAQYXCa
	B114f3QVvrfseVd4DQGtXj07H94nOXL7xtnyFn8=
X-Google-Smtp-Source: ABdhPJxyuEil2ZeQ08Hfrbxr7qliLE3i/uNawGQMs4blxHBSQ88be0Y+4ZbKuB+jfrPJtlhTwKOc+ICa0YGw82r6CYs=
X-Received: by 2002:ae9:f402:: with SMTP id y2mr11235770qkl.9.1606548742080;
 Fri, 27 Nov 2020 23:32:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 27 Nov 2020 23:31:55 -0800
Message-ID: <CAMKF1sonMMnix5+HLxSAR0629y+V7quUig+=9u=Je85FAm0kow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/18] Move python3-pytest to oe-core
To: Tim Orling <ticotimo@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2020 at 8:24 PM Tim Orling <ticotimo@gmail.com> wrote:
>
> From: Tim Orling <timothy.t.orling@linux.intel.com>
>
> We are increasingly needing pytest in oe-core, so it is time to move it
> from meta-python.
>
> This series first imports the recipes -- as-is -- from meta-python.
> Second, the maintainers.inc is updated to add myself as maintainer for all
> the new recipes.
> Third, the two recipes that have stable updates are updated to their
> latest releases.
> Finally, a fix caught during ptest runs is added for RDEPENDS for
> pytest.
>
> This was built on 'nodistro' with only openembedded-core and tested on
> qemux86-64. All the new recipes that have ptests pass all tests.
>

thanks, this series looks good to me. I think we should also bring in
sortedcontainers and sortedcontainers
while you are here, this will help testing python-numpy and adding
ptests for it.


> The following changes since commit 6e3785a3f1f3cf68f5fe101cd6bebe91db165973:
>
>   uninative: Don't use single sstate for pseudo-native (2020-11-24 15:53:04 +0000)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib timo/add-pytest-to-oe-core
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=timo/add-pytest-to-oe-core
>
> For convenience, the same series is also available at the Git repository
> at:
>
>  git://git.yoctoproject.org/poky-contrib timo/move-pytest-to-core
>  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=timo/move-pytest-to-core
>
> Tim Orling (18):
>   python3-atomicwrites: move from meta-python
>   python3-attrs: move from meta-python
>   python3-iniconfig: move from meta-python
>   python3-more-itertools: move from meta-python
>   python3-pathlib2: move from meta-python
>   python3-toml: move from meta-python
>   python3-py: move from meta-python
>   python3-setuptools-scm: move from meta-python
>   python3-packaging: move from meta-python
>   python3-wcwidth: move from meta-python
>   python3-zipp: move from meta-python
>   python3-importlib-metadata: move from meta-python
>   python3-pluggy: move from meta-python
>   python3-pytest: move from meta-python
>   maintainers.inc: add self for new pytest packages
>   python3-more-itertools: upgrade 8.5.0 -> 8.6.0
>   python3-importlib-metadata: upgrade 2.0.0 to 3.1.0
>   python3-pytest: RDEPENDS on python3-toml
>
>  meta/conf/distro/include/maintainers.inc      | 14 +++++++
>  .../python/python3-atomicwrites/run-ptest     |  3 ++
>  .../python/python3-atomicwrites_1.4.0.bb      | 25 ++++++++++++
>  .../python/python3-attrs_20.3.0.bb            | 20 ++++++++++
>  .../python3-importlib-metadata_3.1.0.bb       | 18 +++++++++
>  .../python/python3-iniconfig_1.1.1.bb         |  9 +++++
>  .../python/python3-more-itertools/run-ptest   |  3 ++
>  .../python/python3-more-itertools_8.6.0.bb    | 23 +++++++++++
>  .../python/python3-packaging_20.4.bb          | 14 +++++++
>  .../python/python3-pathlib2_2.3.5.bb          | 13 +++++++
>  .../python/python3-pluggy/run-ptest           |  3 ++
>  .../python/python3-pluggy_0.13.1.bb           | 27 +++++++++++++
>  .../python/python3-py_1.9.0.bb                | 15 +++++++
>  ...he-setup_requires-for-setuptools-scm.patch | 39 +++++++++++++++++++
>  .../python/python3-pytest_6.1.2.bb            | 39 +++++++++++++++++++
>  .../python/python3-setuptools-scm_4.1.2.bb    | 21 ++++++++++
>  .../python/python3-toml_0.10.2.bb             | 15 +++++++
>  .../python/python3-wcwidth/run-ptest          |  3 ++
>  .../python/python3-wcwidth_0.2.5.bb           | 25 ++++++++++++
>  .../python/python3-zipp_3.4.0.bb              | 19 +++++++++
>  20 files changed, 348 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-atomicwrites/run-ptest
>  create mode 100644 meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
>  create mode 100644 meta/recipes-devtools/python/python3-attrs_20.3.0.bb
>  create mode 100644 meta/recipes-devtools/python/python3-importlib-metadata_3.1.0.bb
>  create mode 100644 meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
>  create mode 100644 meta/recipes-devtools/python/python3-more-itertools/run-ptest
>  create mode 100644 meta/recipes-devtools/python/python3-more-itertools_8.6.0.bb
>  create mode 100644 meta/recipes-devtools/python/python3-packaging_20.4.bb
>  create mode 100644 meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb
>  create mode 100644 meta/recipes-devtools/python/python3-pluggy/run-ptest
>  create mode 100644 meta/recipes-devtools/python/python3-pluggy_0.13.1.bb
>  create mode 100644 meta/recipes-devtools/python/python3-py_1.9.0.bb
>  create mode 100644 meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
>  create mode 100644 meta/recipes-devtools/python/python3-pytest_6.1.2.bb
>  create mode 100644 meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
>  create mode 100644 meta/recipes-devtools/python/python3-toml_0.10.2.bb
>  create mode 100644 meta/recipes-devtools/python/python3-wcwidth/run-ptest
>  create mode 100644 meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb
>  create mode 100644 meta/recipes-devtools/python/python3-zipp_3.4.0.bb
>
> --
> 2.25.0
>
>
> 
>
