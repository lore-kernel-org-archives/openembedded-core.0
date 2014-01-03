Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A9C3860CF1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 09:41:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s039f5G0018029
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jan 2014 01:41:05 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 3 Jan 2014 01:41:04 -0800
Message-ID: <52C685AF.7080003@windriver.com>
Date: Fri, 3 Jan 2014 17:41:03 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1388397582.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1388397582.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/6] upgrade automake/autogen-native/make/git
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
X-List-Received-Date: Fri, 03 Jan 2014 09:41:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/30/2013 06:02 PM, Robert Yang wrote:
> I have tested these upgrades on the local autobuilder.
>
> // Robert
>
> The following changes since commit 5c95cc221aa55df7c25e3254d30a7a4b70ff5359:
>
>    maintainers.inc: reassign tzcode-native (2013-12-27 19:35:02 +0800)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib robert/upgrade
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/upgrade
>
> Robert Yang (6):
>    automake: upgrade to 1.14

The automake has a conflict with Paul's patch, and two of the commits
have been merged, so I rebased them and pushed to git contrib agagin:

   git://git.pokylinux.org/poky-contrib robert/upgrade
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/upgrade

Robert Yang (4):
   automake: upgrade to 1.14
   autoconf: remove path_prog_fixes.patch
   autogen-native: upgrade to 5.18.2
   make: upgrade to 4.0

// Robert

>    autoconf: remove path_prog_fixes.patch
>    autogen-native: upgrade to 5.18.2
>    make: remove the obsolete SCCS.patch
>    make: upgrade to 4.0
>    git: upgrade to 1.8.5.2
>
>   .../autoconf/autoconf/path_prog_fixes.patch        | 128 --------------
>   meta/recipes-devtools/autoconf/autoconf_2.69.bb    |   1 -
>   ...n-native_5.17.4.bb => autogen-native_5.18.2.bb} |   6 +-
>   .../autogen/{files => autogen}/guile.patch         |  48 +++---
>   .../increase-timeout-limit.patch                   |   0
>   .../automake/automake/path_prog_fixes.patch        |  41 -----
>   .../prefer-cpio-over-pax-for-ustar-archives.patch  |  48 ------
>   .../{automake_1.13.4.bb => automake_1.14.bb}       |  14 +-
>   meta/recipes-devtools/git/git.inc                  |   1 -
>   .../git/{git_1.8.4.4.bb => git_1.8.5.2.bb}         |   5 +-
>   meta/recipes-devtools/make/files/SCCS.patch        |  17 --
>   .../make/make-3.82/expand_MAKEFLAGS.patch          |  39 -----
>   .../make-3.82/intermediate-target-bugfix.patch     |  23 ---
>   .../make-savannah-bug30612-fix_white_space.patch   |  58 -------
>   ...ke-savannah-bug30612-handling_of_archives.patch | 188 ---------------------
>   meta/recipes-devtools/make/make.inc                |   3 +-
>   .../make/{make_3.82.bb => make_4.0.bb}             |  10 +-
>   17 files changed, 41 insertions(+), 589 deletions(-)
>   delete mode 100644 meta/recipes-devtools/autoconf/autoconf/path_prog_fixes.patch
>   rename meta/recipes-devtools/autogen/{autogen-native_5.17.4.bb => autogen-native_5.18.2.bb} (88%)
>   rename meta/recipes-devtools/autogen/{files => autogen}/guile.patch (89%)
>   rename meta/recipes-devtools/autogen/{files => autogen}/increase-timeout-limit.patch (100%)
>   delete mode 100644 meta/recipes-devtools/automake/automake/path_prog_fixes.patch
>   delete mode 100644 meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
>   rename meta/recipes-devtools/automake/{automake_1.13.4.bb => automake_1.14.bb} (75%)
>   rename meta/recipes-devtools/git/{git_1.8.4.4.bb => git_1.8.5.2.bb} (67%)
>   delete mode 100644 meta/recipes-devtools/make/files/SCCS.patch
>   delete mode 100644 meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch
>   delete mode 100644 meta/recipes-devtools/make/make-3.82/intermediate-target-bugfix.patch
>   delete mode 100644 meta/recipes-devtools/make/make-3.82/make-savannah-bug30612-fix_white_space.patch
>   delete mode 100644 meta/recipes-devtools/make/make-3.82/make-savannah-bug30612-handling_of_archives.patch
>   rename meta/recipes-devtools/make/{make_3.82.bb => make_4.0.bb} (44%)
>

