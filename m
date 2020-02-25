Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 901F86183B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 22:39:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Feb 2020 14:39:29 -0800
X-IronPort-AV: E=Sophos;i="5.70,485,1574150400"; d="scan'208";a="231180104"
Received: from anmitta2-mobl.gar.corp.intel.com (HELO [10.255.173.208])
	([10.255.173.208])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	25 Feb 2020 14:39:28 -0800
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20200225185335.19326-1-alex.kanavin@gmail.com>
	<20200225185335.19326-4-alex.kanavin@gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <5a077658-77ab-c3db-1845-469eaf7bfa5a@intel.com>
Date: Wed, 26 Feb 2020 06:39:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200225185335.19326-4-alex.kanavin@gmail.com>
Subject: Re: [PATCH 04/12] ncurses: upgrade 6.1+20191019 -> 6.2
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
X-List-Received-Date: Tue, 25 Feb 2020 22:39:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26-Feb-20 02:53 AM, Alexander Kanavin wrote:
> License-Update: copyright years and holders
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   meta/recipes-core/ncurses/ncurses.inc                           | 2 +-
>   .../ncurses/{ncurses_6.1+20191019.bb => ncurses_6.2.bb}         | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-core/ncurses/{ncurses_6.1+20191019.bb => ncurses_6.2.bb} (89%)
> 
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
> index b7bf4c0d81..4156bf4f7d 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -2,7 +2,7 @@ SUMMARY = "The New Curses library"
>   DESCRIPTION = "SVr4 and XSI-Curses compatible curses library and terminfo tools including tic, infocmp, captoinfo. Supports color, multiple highlights, forms-drawing characters, and automatic recognition of keypad and function-key sequences. Extensions include resizable windows and mouse support on both xterm and Linux console using the gpm library."
>   HOMEPAGE = "http://www.gnu.org/software/ncurses/ncurses.html"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc180a8c44ca642e97c35452fab5f66"
> +LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=5526f2f3a29edc95538b368a4771edda"
>   SECTION = "libs"
>   DEPENDS = "ncurses-native"
>   DEPENDS_class-native = ""
> diff --git a/meta/recipes-core/ncurses/ncurses_6.1+20191019.bb b/meta/recipes-core/ncurses/ncurses_6.2.bb
> similarity index 89%
> rename from meta/recipes-core/ncurses/ncurses_6.1+20191019.bb
> rename to meta/recipes-core/ncurses/ncurses_6.2.bb
> index 187777f6ef..b6d899c878 100644
> --- a/meta/recipes-core/ncurses/ncurses_6.1+20191019.bb
> +++ b/meta/recipes-core/ncurses/ncurses_6.2.bb
> @@ -5,7 +5,7 @@ SRC_URI += "file://0001-tic-hang.patch \
>              file://config.cache \
>              "
>   # commit id corresponds to the revision in package version
> -SRCREV = "ea70ec815b362f5bbad7a827a2edf50fd2b459cc"
> +SRCREV = "a669013cd5e9d6434e5301348ea51baf306c93c4"
>   S = "${WORKDIR}/git"
>   EXTRA_OECONF += "--with-abi-version=5 --cache-file=${B}/config.cache"
>   UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
> 

I think the CVE_VERSION added earlier should no longer be necessary and 
can be removed too.

Thanks,

Anuj

