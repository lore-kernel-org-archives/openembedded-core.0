Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 902A76079F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 19:59:03 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3y68xN5t9fz1rL1b;
	Tue,  3 Oct 2017 21:59:04 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3y68xN5FkJz1qrmf;
	Tue,  3 Oct 2017 21:59:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id bL9SZp8s8L5X; Tue,  3 Oct 2017 21:59:03 +0200 (CEST)
X-Auth-Info: Q/CiBTJBaXyoqtjfxSh6GTjifDxmbk+xJsraWEQO2WE=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue,  3 Oct 2017 21:59:03 +0200 (CEST)
To: Juro Bystricky <juro.bystricky@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1507060295-34074-1-git-send-email-juro.bystricky@intel.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <0794973c-f52e-b63f-010e-2bf72b76cb5a@denx.de>
Date: Tue, 3 Oct 2017 21:59:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1507060295-34074-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com, yau.wai.gan@intel.com
Subject: Re: [PATCH] siteinfo: nios2-linux - remove wrong mutex info
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
X-List-Received-Date: Tue, 03 Oct 2017 19:59:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/03/2017 09:51 PM, Juro Bystricky wrote:
> This fixes broken nios2 builds that involve db recipes.

While I understand ARM/ is wrong, why is removing the db_cv_mutex a
correct fix instead of ie. s/ARM/nios2/ ? The patch description does not
explain that.

> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/site/nios2-linux | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/site/nios2-linux b/meta/site/nios2-linux
> index 2f4e570..5bae748 100644
> --- a/meta/site/nios2-linux
> +++ b/meta/site/nios2-linux
> @@ -33,7 +33,6 @@ db_cv_path_sh=${db_cv_path_sh=/bin/sh}
>  db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
>  db_cv_align_t=${db_cv_align_t='unsigned long long'}
>  db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
> -db_cv_mutex=${db_cv_mutex=ARM/gcc-assembly}
>  db_cv_posixmutexes=${db_cv_posixmutexes=no}
>  db_cv_uimutexes=${db_cv_uimutexes=no}
>  
> 


-- 
Best regards,
Marek Vasut

