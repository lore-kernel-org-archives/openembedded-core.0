Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B070265E38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 09:25:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBF9PIRk026122
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 15 Dec 2014 01:25:18 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 15 Dec 2014 01:25:17 -0800
Message-ID: <548EA8F4.2040104@windriver.com>
Date: Mon, 15 Dec 2014 17:25:08 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
References: <cover.1418634986.git.hongxu.jia@windriver.com>
In-Reply-To: <cover.1418634986.git.hongxu.jia@windriver.com>
Cc: jeffrey.honig@windriver.com
Subject: Re: [PATCH 0/3] fix whitelist processing does not play well with wildcards in INCOMPATIBLE_LICENSES
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
X-List-Received-Date: Mon, 15 Dec 2014 09:25:21 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/2014 05:23 PM, Hongxu Jia wrote:
> Test Steps:
>
> mpfr is "GPLv3 & LGPLv3", less is "GPLv3+ | BSD-2-Clause" but listed in WHITELIST_GPL-3.0
> So while INCOMPATIBLE_LICENSE = "*GPL-3", we could build less, but skip mpfr.
>
> $ bitbake less
> ...
> NOTE: Tasks Summary: Attempted 587 tasks of which 440 didn't need to be rerun and all succeeded.
> ...
>
> $ bitbake libiconv

s/libiconv/mpfr/

//Hongxu

> ...
> ERROR: Nothing PROVIDES 'mpfr'
> ERROR: mpfr was skipped: incompatible with license GPLv3 & LGPLv3
> ...
>
> //Hongxu
>
> The following changes since commit ec6377bcf52d105cd23ac6bbbeddd38fee9337e4:
>
>    bitbake: bitbake-user-manual-metadata.xml: Updated do_package_write example (2014-12-09 22:25:36 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib hongxu/fix-incompatible_license
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-incompatible_license
>
> Hongxu Jia (3):
>    base/license.bbclass: expand wildcards in INCOMPATIBLE_LICENSE
>    default-versions.inc: let INCOMPATIBLE_LICENSE supports wildcard
>    libproxy: let INCOMPATIBLE_LICENSE supports wildcard
>
>   meta/classes/base.bbclass                        |  2 +-
>   meta/classes/license.bbclass                     | 25 ++++++++++++++++++++++++
>   meta/conf/distro/include/default-versions.inc    |  2 +-
>   meta/conf/documentation.conf                     |  2 +-
>   meta/recipes-support/libproxy/libproxy_0.4.11.bb |  2 +-
>   5 files changed, 29 insertions(+), 4 deletions(-)
>


