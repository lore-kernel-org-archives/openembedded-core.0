Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 317566C189
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 12:35:42 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id a205-v6so23525235itd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 04:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1lqyPd6ik4IpZarHtyIkAsIrGnksaGfaAR+aWrwzcoQ=;
	b=ZWh9fU3QIExKWdlnASRfmZ+JDXfsh1AsNUNbp6yBP+DX47t8eGI+nx0KbwQtIiDQ+S
	0vElR3CPsaXF4jgHh+7m+W0K9zlYom/REp7ugtgNym+J9LxsYI0OLS/uHQurDrmdswvU
	eTUvqX9u+PrSCQ3X0pcKkn+ZBEVcANmjJZqHNNo65mty40smQQORARU9JpTfBLhg3V1O
	/jkA96HKI9FQt/JnI+IQG65X1WA9NvUzI2ruAJfmePFWI5eKG8P8uvd+R+H6WTdwVm6L
	ai35JdaIbMGt/mx1MBb8GeWHv+a0WIXvjXrqyxEEsVVIwG94tNyGjEAW5gA9ketXFB2t
	C/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1lqyPd6ik4IpZarHtyIkAsIrGnksaGfaAR+aWrwzcoQ=;
	b=M+Bwi24SqWnJ4lLbkXUDrQBSj14NvcE+OBTOx6bJ2jR5DPkRmTqZkr2bGsZWHzDBSG
	WOuu3jaw+6d9Yb4yNJe8RngTNt1zcljCEg9+xdorjmsbk4neWZQMl6DPoAItSdApbsdK
	/ZXLhcTmqtuW5k5sQP82aYV8NY8P667vKrIM8MQXyr+xZo9k+9sq20FXQUZffB7ax+Hv
	xOm1jveDixYkA8HoLqerEBnTk8BSysostTaFvYyrbQ8MLqm0cDeSgDUEuTOdPWx5N/F/
	cyR5z2UBa/vYdX9UxBfucGgDIcueK7P4bPRtYbBOqkCulO9mdXzKY4jJBOZ365dFVTHJ
	cYiA==
X-Gm-Message-State: AGRZ1gIAxU0b78KHii6XSmmuWT+Mx+JA+T5+Jqf3sW3wioKVF1eiZfQv
	GAUov54LPYzbNiVsg7deQl/7X6hciPA3IJLfI9810On4GS8=
X-Google-Smtp-Source: AJdET5cPXS5zmUfv4b4Ugij7eez673rO0jrgp/+mReq5+U6lazDSqhysCkJkncMtRk97EhOfupFSMSXaFOChQFq0RHI=
X-Received: by 2002:a24:ce45:: with SMTP id
	v66-v6mr5352452itg.26.1542285343138; 
	Thu, 15 Nov 2018 04:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20181017004016.7897-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20181017004016.7897-1-hongl.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Nov 2018 12:35:32 +0000
Message-ID: <CAJTo0LZagwhbhSRvmwEb4hK3cQwV03Sd8dKoN=cAZfMF4SAN3A@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] e2fsprogs:1.44.3->1.44.4
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
X-List-Received-Date: Thu, 15 Nov 2018 12:35:42 -0000
Content-Type: text/plain; charset="UTF-8"

This appears to break if musl is being used:

In file included from ../../../git/lib/ext2fs/ext2fs.h:97,
                 from ../../../git/lib/e2p/feature.c:20:
../../../git/lib/ext2fs/hashmap.h:20:19: error: missing binary
operator before token "("
 #if __GNUC_PREREQ (4, 8)
                   ^
../../../git/lib/ext2fs/hashmap.h:25:19: error: missing binary
operator before token "("
 #if __GNUC_PREREQ (4, 8)
                   ^

Ross
On Wed, 17 Oct 2018 at 01:40, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> Upgrade e2fsprogs from 1.44.3 to 1.44.4
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../e2fsprogs/{e2fsprogs_1.44.3.bb => e2fsprogs_1.44.4.bb}              | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.44.3.bb => e2fsprogs_1.44.4.bb} (98%)
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.4.bb
> similarity index 98%
> rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
> rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.4.bb
> index 823d18b..99b4d68 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.4.bb
> @@ -12,7 +12,7 @@ SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permissio
>                                  file://quiet-debugfs.patch \
>  "
>
> -SRCREV = "85e53f42f98d5334914de01e972e9ed44bccd0a5"
> +SRCREV = "40e66e2e8be046f909dfff73b3909f15c9d0f400"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
>
>  EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

