Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 801E46B463
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 09:28:30 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id a190so22313632ite.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 02:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=akZwv5NAfOb4CxpYNL/02lnmULwH31Ya5FbPtKu1De0=;
	b=2MhRxU87Va8XyDpDqa1qIyn42rTU6tapJRVK4b/BsJl2rT6crnGtfnxDKK6XnSSRrd
	NJG0tzXas/iC5WWn94XjTVKQDRvftx0/YOSzaD8dOcHsXP7R1aykP+EFnNbu8fpIsxb4
	zYGaewclaRNjkvrP2dH1o5WX75ifIR1IjKboBe2rlchXGxeUVlWaldS7Qg0BknMxY5O5
	iO9cjis9bxPXmg7jaCyVHDqLmppKg9FEVSAVknO8jIavpWXnYdpKjkOf4kK/AINTEzyT
	wBCw/GNXFqPJQhrPRcUHpc5gPQDgvALzgej//TT1R+gaQNuU24VSfGNJYcWFutXEcUF3
	rLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=akZwv5NAfOb4CxpYNL/02lnmULwH31Ya5FbPtKu1De0=;
	b=E5imN3SCgwAYWJahsmul+jW8XhK5mnmG7li2o+D/n5Zsgtu3e+WgGMTtEVbY9AumPo
	qov4yqPiZ/mfadrH1wJutb0OJFr8dO4IsblZpx1ZWKKZhA3kYCz6N7hkj9akqvQ9XZzz
	6jk3dz1gFi7obNfO805fiHFdZY6VicavwnczBE53hsRYecLPXykdwzoQcRrabp4+d+A/
	B3N8FVoqqWrN1DWMTTZ81iwgZZzFGypeFaXsCTHuHYoqaTelZThHJc9GfE1yCNKe9qCW
	ENqM/OpPxZl/UHyJzNXLifZa8IVhZCN/v9Cox4J+Bzj1qgYwoL2TM+pmrfRc4W6n9NJO
	Bm7g==
X-Gm-Message-State: APjAAAUfQScSJ7ZAhlQ133bLOblcGX/YeMQv+uBYH5veeNbeWpHpj7ej
	uxJ8QYosE/mM0WwYkBws/7K7lej16gY6QET8Uib/DA==
X-Google-Smtp-Source: APXvYqy+4Qs3dsTk1tYo3PS/MlBZiKq3BmZ5Xx3CC/hbhggSJqkBf65YRP9agZKs+nKKnZ6iw2+dFAIN20mj3g22oPs=
X-Received: by 2002:a05:660c:111:: with SMTP id
	w17mr1206933itj.62.1556011710652; 
	Tue, 23 Apr 2019 02:28:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
	<20190415105457.57067-11-alex.kanavin@gmail.com>
In-Reply-To: <20190415105457.57067-11-alex.kanavin@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Apr 2019 10:28:18 +0100
Message-ID: <CAJTo0LZyjrK_fOMAA5hyTv0GMnD-61u7uG4cZF_KBP_-Yb=L5A@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/19] meson: update to 0.50.0
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
X-List-Received-Date: Tue, 23 Apr 2019 09:28:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Apr 2019 at 11:56, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> +++ b/meta/recipes-devtools/meson/meson/load-configs-generalise-search-path.patch
> @@ -0,0 +1,50 @@
> +From d57dd1092e84e08ee15d7063b6c56bd6d864f2e1 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@intel.com>
> +Date: Mon, 18 Mar 2019 16:16:56 +0000
> +Subject: [PATCH] load_configs: generalise the search path
> +
> +Instead of hard-coding the fact that load_configs() searches for files under
> +meson/native, pass in the subdirectory allowing the cross-file code to use the
> +same logic.
> +---
> + mesonbuild/coredata.py    | 6 +++---
> + mesonbuild/environment.py | 2 +-
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/mesonbuild/coredata.py b/mesonbuild/coredata.py
> +index fba90fa369..6e60917d10 100644
> +--- a/mesonbuild/coredata.py
> ++++ b/mesonbuild/coredata.py
> +@@ -211,8 +211,8 @@ def is_auto(self):
> +         return self.value == 'auto'
> +
> +
> +-def load_configs(filenames):
> +-    """Load native files."""
> ++def load_configs(filenames, subdir):
> ++    """Load configuration files from a named subdirectory."""
> +     def gen():
> +         for f in filenames:
> +             f = os.path.expanduser(os.path.expandvars(f))
> +@@ -225,7 +225,7 @@ def gen():
> +                     os.environ.get('XDG_DATA_HOME', os.path.expanduser('~/.local/share')),
> +                 ] + os.environ.get('XDG_DATA_DIRS', '/usr/local/share:/usr/share').split(':')
> +                 for path in paths:
> +-                    path_to_try = os.path.join(path, 'meson', 'native', f)
> ++                    path_to_try = os.path.join(path, 'meson', subdir, f)
> +                     if os.path.isfile(path_to_try):
> +                         yield path_to_try
> +                         break
> +diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
> +index 58adb06960..92a00dd7bf 100644
> +--- a/mesonbuild/environment.py
> ++++ b/mesonbuild/environment.py
> +@@ -408,7 +408,7 @@ def __init__(self, source_dir, build_dir, options):
> +
> +         if self.coredata.config_files is not None:
> +             config = MesonConfigFile.from_config_parser(
> +-                coredata.load_configs(self.coredata.config_files))
> ++                coredata.load_configs(self.coredata.config_files, 'native'))
> +             self.binaries.build = BinaryTable(config.get('binaries', {}))
> +             self.paths.build = Directories(**config.get('paths', {}))
> +

Missing Upstream-Status and Signed-off-by, can you add those please.

Ross

