Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B84BA77E76
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 09:36:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3E9aEvj017891
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Apr 2017 02:36:14 -0700 (PDT)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 14 Apr 2017 02:36:13 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1492077359.git.liezhi.yang@windriver.com>
	<8dda2297e14acc1d586c4e5f1195846f14eb4a52.1492077359.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <443ecb8b-6a1d-9d98-7633-25ae7404fd27@windriver.com>
Date: Fri, 14 Apr 2017 17:36:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <8dda2297e14acc1d586c4e5f1195846f14eb4a52.1492077359.git.liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] autogen: update libopts.m4's patch
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
X-List-Received-Date: Fri, 14 Apr 2017 09:36:14 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi RP,

I found that others are merged except this one, do you have any
comments on it, please ?

// Robert

On 04/13/2017 05:57 PM, Robert Yang wrote:
> Use 'test -n "$POSIX_SHELL"' rather than 'test -x "$POSIX_SHELL"' so
> that 'POSIX_SHELL = "/usr/bin/env sh"' can work.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../0001-config-libopts.m4-regenerate-it-from-config-libopts..patch     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/autogen/autogen/0001-config-libopts.m4-regenerate-it-from-config-libopts..patch b/meta/recipes-devtools/autogen/autogen/0001-config-libopts.m4-regenerate-it-from-config-libopts..patch
> index a14018e..e247594 100644
> --- a/meta/recipes-devtools/autogen/autogen/0001-config-libopts.m4-regenerate-it-from-config-libopts..patch
> +++ b/meta/recipes-devtools/autogen/autogen/0001-config-libopts.m4-regenerate-it-from-config-libopts..patch
> @@ -30,7 +30,7 @@ index c7ba4f3..51e6a39 100644
>     AC_PROG_SED
>     [while :
>     do
> -+      test -x "$POSIX_SHELL" && break
> ++      test -n "$POSIX_SHELL" && break
>         POSIX_SHELL=`which bash`
>         test -x "$POSIX_SHELL" && break
>         POSIX_SHELL=`which dash`
>

