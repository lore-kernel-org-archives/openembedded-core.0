Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C8985771AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 09:17:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAC9HO8g018234
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Nov 2015 01:17:24 -0800 (PST)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 12 Nov 2015 01:17:24 -0800
Message-ID: <5644591B.6090202@windriver.com>
Date: Thu, 12 Nov 2015 17:17:15 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
References: <cover.1447222992.git.hongxu.jia@windriver.com>
	<d1133bcb570672fb61918ac86b05c1ae58544bb7.1447222992.git.hongxu.jia@windriver.com>
In-Reply-To: <d1133bcb570672fb61918ac86b05c1ae58544bb7.1447222992.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 1/1] flex: fix test-bison-yylval and test-bison-yylloc failed
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
X-List-Received-Date: Thu, 12 Nov 2015 09:17:26 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2015 02:58 PM, Hongxu Jia wrote:
> The tests in flex test-bison-yylval and test-bison-yylloc
> failed, so we backport a patch from upstream to fix it.
>
> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
> ---
>   ...fixes-Do-not-use-obsolete-bison-construct.patch | 81 ++++++++++++++++++++++
>   meta/recipes-devtools/flex/flex.inc                |  1 +
>   2 files changed, 82 insertions(+)
>   create mode 100644 meta/recipes-devtools/flex/files/0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch
>
> diff --git a/meta/recipes-devtools/flex/files/0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch b/meta/recipes-devtools/flex/files/0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch
> new file mode 100644
> index 0000000..20c0a7b
> --- /dev/null
> +++ b/meta/recipes-devtools/flex/files/0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch
> @@ -0,0 +1,81 @@
> +From 7fbc074901129ffaff9e18fadacae62d8053ad95 Mon Sep 17 00:00:00 2001
> +From: Manoj Srivastava<srivasta@golden-gryphon.com>
> +Date: Wed, 9 Apr 2014 00:23:07 -0700
> +Subject: [PATCH] Do not use obsolete bison constructs in tests.
> +
> +In Bison 3.0, support for YYLEX_PARAM and YYPARSE_PARAM has been
> +removed (deprecated in Bison 1.875): use %lex-param, %parse-param, or
> +%param. This commit fixes the tests so they still work.
> +
> +Signed-off-by: Manoj Srivastava<srivasta@golden-gryphon.com>
> +
> +Upstream-Status:  Backport from upstream
> +http://sourceforge.net/p/flex/bugs/169/
Use format with 'Upstream-Status [foo]' to instead

+Upstream-Status: Backport[from http://sourceforge.net/p/flex/bugs/169/]

Update git repo

   git://git.pokylinux.org/poky-contrib hongxu/flex
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/flex

//Hongxu



> +
> +Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>


