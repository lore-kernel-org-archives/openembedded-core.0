Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9B36B6FFEC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Dec 2015 02:46:19 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id m11so76631004igk.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 18:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=aOTRtecd/LzxG8w6Y2DXIBQlICmUcXW7Dk15rXlFxrg=;
	b=YXIXb+Ded6QjRxu71x1KPx72mKptqeVC/TExtVB5Z/rKUFCkW5vTWdG0g5qtNrba0E
	b29vylaCV5HqeHb9Ip92h1wfatJY15+6SuLm24p0mJx/o2RvLgLjET06hCStlh7KDpuV
	R6lWZ3GM9Xfr0WncfrF7Yc2zlxBT3++msaQ50dnAnNgfPDpdN1jwD0id/i8ehxXMt5vq
	5wDiCPYqraTzuuVVweYAF9NnLHniOyGD8qeGN/Z2FM9DFiuG3201PSaC36nFB8jS8dCs
	fUepANEr7fX78P8UQk6S6XSdXuIk1eUG0CM0uZCTwLfl+NkZ3mxdzU5R4AF01Wa8B8lD
	motQ==
X-Received: by 10.50.20.138 with SMTP id n10mr34672081ige.11.1450925180242;
	Wed, 23 Dec 2015 18:46:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Wed, 23 Dec 2015 18:45:50 -0800 (PST)
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Dec 2015 18:45:50 -0800
Message-ID: <CAMKF1sr99S3k7ZqHY9jri42dCHgFB_BNs9FWu++9wmhHuxVWvw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/26] devtool/recipetool improvements
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
X-List-Received-Date: Thu, 24 Dec 2015 02:46:20 -0000
Content-Type: text/plain; charset=UTF-8

Paul

Can this series be backported to jethro as well ?
most of them seems to be incremental changes
hopefully not breaking backward compatibility in some
unforseen ways

On Mon, Dec 21, 2015 at 8:02 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Apologies for the flood of patches today, this is the last one.
>
> There are quite a few changes here, but the common theme is making
> devtool (and recipetool) a bit easier to use, as well as making
> "devtool add" and "recipetool create" more effective at picking up
> things from the specified source tree.
>
> I also extended the argparse fix to show the help text on error to all
> of the command-line utilities that use it.
>
>
> The following changes since commit 2a1edfd9cfa16ec334c0758b47677d4fee5e79a8:
>
>   bitbake.conf: Add filename and lineno to BB_SIGNATURE_EXCLUDE_FLAGS (2015-12-22 00:01:31 +0000)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib paule/devtool11
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool11
>
> Paul Eggleton (26):
>   scripts: print usage in argparse-using scripts when a command-line error occurs
>   recipetool: create: handle https://....git URLs
>   recipetool: create: avoid traceback on fetch error
>   recipetool: create: fix do_install handling for makefile-only software
>   recipetool: create: minor fix for potential issue in python handling
>   recipetool: create: prevent attempting to unpack entire DL_DIR
>   recipetool: create: detect when specified URL returns a web page
>   recipetool: create: set up priority system for recipe handlers
>   recipetool: create: support extracting name and version from build scripts
>   recipetool: create: basic extraction of name/version from filename
>   devtool: edit-recipe: add new subcommand
>   devtool: add: tweak help text
>   devtool: split out function for naming bbappend
>   devtool: update-recipe: use correct method to get bbappend filename
>   scripts/lib/argparse_oe: handle intermixing of optional positional arguments
>   devtool: add: allow source tree to be omitted
>   devtool: add: figure out recipe name from recipetool
>   devtool: add: allow specifying URL as positional argument
>   devtool: modify: default source tree path
>   devtool: status: list recipe file within workspace if one exists
>   devtool: reset: print message about leaving source tree behind
>   devtool: sync: tweak help / messages
>   recipetool: create: improve autotools support
>   recipetool: create: fix error when extracting source to a specified directory
>   oe-selftest: add tests for simple devtool add / recipetool create URL case
>   oe-selftest: devtool: add more explicit check for ls output
>
>  meta/lib/oeqa/selftest/devtool.py                |  82 +++++-
>  meta/lib/oeqa/selftest/recipetool.py             |  21 +-
>  scripts/contrib/devtool-stress.py                |   5 +-
>  scripts/devtool                                  |  13 +-
>  scripts/lib/argparse_oe.py                       |  66 +++++
>  scripts/lib/devtool/__init__.py                  |  15 ++
>  scripts/lib/devtool/standard.py                  | 315 +++++++++++++++++------
>  scripts/lib/recipetool/create.py                 | 206 ++++++++++++---
>  scripts/lib/recipetool/create_buildsys.py        | 296 +++++++++++++++++----
>  scripts/lib/recipetool/create_buildsys_python.py |   7 +-
>  scripts/lib/scriptutils.py                       |   5 +
>  scripts/oe-pkgdata-util                          |   5 +-
>  scripts/oe-publish-sdk                           |   5 +-
>  scripts/oe-selftest                              |   3 +-
>  scripts/recipetool                               |   7 +-
>  scripts/send-error-report                        |   6 +-
>  scripts/test-remote-image                        |   3 +-
>  17 files changed, 872 insertions(+), 188 deletions(-)
>  create mode 100644 scripts/lib/argparse_oe.py
>
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

