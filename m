Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C2CD860030
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 06:21:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7J6LCuF025704
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Aug 2014 23:21:12 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 18 Aug 2014 23:21:11 -0700
Message-ID: <53F2ECD5.5040606@windriver.com>
Date: Tue, 19 Aug 2014 14:21:09 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1407723356.git.hongxu.jia@windriver.com>
In-Reply-To: <cover.1407723356.git.hongxu.jia@windriver.com>
Cc: saul.wold@intel.com
Subject: Re: [PATCH V2 0/1] guile: workaround ice ssa corruption while DEBUG_BUILD
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
X-List-Received-Date: Tue, 19 Aug 2014 06:21:19 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ping

//Hongxu

On 08/11/2014 10:23 AM, Hongxu Jia wrote:
> Changed in V2:
>
> - Remove the RDEPENDS part to make sure the fix doesn't conflict with
>    Martin's patch
>    http://lists.openembedded.org/pipermail/openembedded-core/2014-August/095585.html
>
> - Tweak the patch to make sure the logic of code is not changed by the
>    workaround.
>
> //Hongxu
>
> The following changes since commit 870bb8d35547b8313b3a487d7e8b914ab9470e64:
>
>    local.conf.sample.extended: fix example for EXTRA_USERS_PARAMS (2014-08-04 17:38:24 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib hongxu/fix-guile-ice
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-guile-ice
>
> Hongxu Jia (1):
>    guile: workaround ice ssa corruption while DEBUG_BUILD
>
>   .../files/workaround-ice-ssa-corruption.patch      | 60 ++++++++++++++++++++++
>   meta/recipes-devtools/guile/guile_2.0.11.bb        |  1 +
>   2 files changed, 61 insertions(+)
>   create mode 100644 meta/recipes-devtools/guile/files/workaround-ice-ssa-corruption.patch
>


