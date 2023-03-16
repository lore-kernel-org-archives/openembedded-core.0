Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108C7C6FD19
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 08:04:46 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.7244.1678953878160589265
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 01:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fHGSmGTn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4442D60008;
	Thu, 16 Mar 2023 08:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678953875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQgkVCko4JUzUaJYoDghSZnfUphbgSajfIK3gzzgc6k=;
	b=fHGSmGTnOq+Y5cU+e3czcbNyPqzO50d25KU3bg+9dVrORwwbyCoCfYgxA2of0ZdDkJyObC
	TemInQzvAQS6VcpanSOXKb1z3Qsi85sQlMSwABlwMkSflVE5Fj2aYDZbLuIvBoWk+dgh/A
	yJRVdUIgeckweTbmu9sRQmdp2gLjlDzgUYOwMwKJ9MqiaVOKNx2zLq20nRcg16OCnQuVNF
	lriaOrClad/gOtl4voEYDdBIFluiwRFo5ZqzZSuZKYtdWUzp2mcZ6PncqDsL1CENbwiQc3
	dnj4OoaD0sEzKA5+FdfotLkEgxR6sbOVzhsumzWjjkqVzcGWFXcf7gbSC3tPPA==
Date: Thu, 16 Mar 2023 09:04:34 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 5/5] python3-wheel: upgrade 0.38.4 -> 0.40.0
Message-ID: <202303160804342faf4f7b@mail.local>
References: <cover.1678928363.git.tim.orling@konsulko.com>
 <de64dd5a8194c9c7e4a99cdc93ddab3841a6d33e.1678928363.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de64dd5a8194c9c7e4a99cdc93ddab3841a6d33e.1678928363.git.tim.orling@konsulko.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 08:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178674

On 15/03/2023 18:03:01-0700, Tim Orling wrote:
> Content-Type: text/plain; charset=y

You replied 'y' to the encoding question where you should have been more
careful and simply press enter ;) (and so the patch doesn't apply
without manually editing it)

> Content-Transfer-Encoding: 8bit

> * Drop pyproject.toml patch, merged upstream
> 
> https://wheel.readthedocs.io/en/stable/news.html#release-notes
> 
> 0.40.0 (2023-03-14)
> * Added a wheel tags command to modify tags on an existing wheel (PR by
>   Henry Schreiner)
> * Updated vendored packaging to 23.0
> * wheel unpack now preserves the executable attribute of extracted files
> * Fixed spaces in platform names not being converted to underscores (PR
>   by David Tucker)
> * Fixed RECORD files in generated wheels missing the regular file attribute
> * Fixed DeprecationWarning about the use of the deprecated pkg_resources
>   API (PR by Thomas Grainger)
> * Wheel now uses flit-core as a build backend (PR by Henry Schreiner)
> 
> License-Update: use LICENSE.txt for LIC_FILES_CHKSUM instead of PKG-INFO
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  ...roject.toml-from-flit-backend-branch.patch | 100 ------------------
>  ...heel_0.38.4.bb => python3-wheel_0.40.0.bb} |   6 +-
>  2 files changed, 2 insertions(+), 104 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3-wheel/0001-Backport-pyproject.toml-from-flit-backend-branch.patch
>  rename meta/recipes-devtools/python/{python3-wheel_0.38.4.bb => python3-wheel_0.40.0.bb} (62%)
> 
> diff --git a/meta/recipes-devtools/python/python3-wheel/0001-Backport-pyproject.toml-from-flit-backend-branch.patch b/meta/recipes-devtools/python/python3-wheel/0001-Backport-pyproject.toml-from-flit-backend-branch.patch
> deleted file mode 100644
> index 023de0e6a88..00000000000
> --- a/meta/recipes-devtools/python/python3-wheel/0001-Backport-pyproject.toml-from-flit-backend-branch.patch
> +++ /dev/null
> @@ -1,100 +0,0 @@
> -From f00dd220346773bc088d403847ee7f06f2b4c30a Mon Sep 17 00:00:00 2001
> -From: Tim Orling <tim.orling@konsulko.com>
> -Date: Fri, 18 Feb 2022 11:09:16 -0800
> -Subject: [PATCH] Backport pyproject.toml from flit-backend branch
> -
> -This allows us to bootstrap wheels and PEP-517 packaging.
> -
> -Upstream-Status: Backport from flit-backend branch
> -https://raw.githubusercontent.com/pypa/wheel/4f6ba78fede38a8d9e35a14e38377a121033afb3/pyproject.toml
> -
> -Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ----
> - pyproject.toml | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++
> - 1 file changed, 78 insertions(+)
> - create mode 100644 pyproject.toml
> -
> -diff --git a/pyproject.toml b/pyproject.toml
> -new file mode 100644
> -index 0000000..749b8de
> ---- /dev/null
> -+++ b/pyproject.toml
> -@@ -0,0 +1,78 @@
> -+[build-system]
> -+requires = ["flit_core >=3.2,<4"]
> -+build-backend = "flit_core.buildapi"
> -+
> -+[project]
> -+name = "wheel"
> -+description = "A built-package format for Python"
> -+readme = "README.rst"
> -+classifiers = [
> -+    "Development Status :: 5 - Production/Stable",
> -+    "Intended Audience :: Developers",
> -+    "Topic :: System :: Archiving :: Packaging",
> -+    "License :: OSI Approved :: MIT License",
> -+    "Programming Language :: Python",
> -+    "Programming Language :: Python :: 3 :: Only",
> -+    "Programming Language :: Python :: 3.7",
> -+    "Programming Language :: Python :: 3.8",
> -+    "Programming Language :: Python :: 3.9",
> -+    "Programming Language :: Python :: 3.10"
> -+]
> -+authors = [{name = "Daniel Holth", email = "dholth@fastmail.fm"}]
> -+maintainers = [{name = "Alex Gr�nholm", email = "alex.gronholm@nextday.fi"}]
> -+keywords = ["wheel", "packaging"]
> -+license = {file = "LICENSE.txt"}
> -+requires-python = ">=3.7"
> -+dependencies = [
> -+    "setuptools >= 45.2.0"
> -+]
> -+dynamic = ["version"]
> -+
> -+[project.urls]
> -+Documentation = "https://wheel.readthedocs.io/"
> -+Changelog = "https://wheel.readthedocs.io/en/stable/news.html"
> -+"Issue Tracker" = "https://github.com/pypa/wheel/issues"
> -+
> -+[project.scripts]
> -+wheel = "wheel.cli:main"
> -+
> -+[project.entry-points."distutils.commands"]
> -+bdist_wheel = "wheel.bdist_wheel:bdist_wheel"
> -+
> -+[project.optional-dependencies]
> -+test = [
> -+    "pytest >= 3.0.0"
> -+]
> -+
> -+[tool.flit.sdist]
> -+exclude = [
> -+    ".cirrus.yml",
> -+    ".github/*",
> -+    ".gitignore",
> -+    ".pre-commit-config.yaml",
> -+    ".readthedocs.yml"
> -+]
> -+
> -+[tool.black]
> -+target-version = ['py37']
> -+extend-exclude = '''
> -+^/src/wheel/vendored/
> -+'''
> -+
> -+[tool.isort]
> -+src_paths = ["src"]
> -+profile = "black"
> -+skip_gitignore = true
> -+
> -+[tool.flake8]
> -+max-line-length = 88
> -+
> -+[tool.pytest.ini_options]
> -+testpaths = "tests"
> -+
> -+[tool.coverage.run]
> -+source = ["wheel"]
> -+omit = ["*/vendored/*"]
> -+
> -+[tool.coverage.report]
> -+show_missing = true
> diff --git a/meta/recipes-devtools/python/python3-wheel_0.38.4.bb b/meta/recipes-devtools/python/python3-wheel_0.40.0.bb
> similarity index 62%
> rename from meta/recipes-devtools/python/python3-wheel_0.38.4.bb
> rename to meta/recipes-devtools/python/python3-wheel_0.40.0.bb
> index 6263cbc45c7..2b8111d544b 100644
> --- a/meta/recipes-devtools/python/python3-wheel_0.38.4.bb
> +++ b/meta/recipes-devtools/python/python3-wheel_0.40.0.bb
> @@ -2,14 +2,12 @@ SUMMARY = "The official binary distribution format for Python "
>  HOMEPAGE = "https://github.com/pypa/wheel"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a0148f94f483f3e1489"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
>  
> -SRC_URI[sha256sum] = "965f5259b566725405b05e7cf774052044b1ed30119b5d586b2703aafe8719ac"
> +SRC_URI[sha256sum] = "cd1196f3faee2b31968d626e1731c94f99cbdb67cf5a46e4f5656cbee7738873"
>  
>  inherit python_flit_core pypi
>  
> -SRC_URI += " file://0001-Backport-pyproject.toml-from-flit-backend-branch.patch"
> -
>  BBCLASSEXTEND = "native nativesdk"
>  
>  # This used to use the bootstrap install which didn't compile. Until we bump the
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178670): https://lists.openembedded.org/g/openembedded-core/message/178670
> Mute This Topic: https://lists.openembedded.org/mt/97641809/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

