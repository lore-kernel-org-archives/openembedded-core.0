Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4C01F77042
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 19:02:24 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y134so5301652pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 12:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=0ZQfoTjuQCV3Dv7mxCNSfKvq/WLHB61G4PZDnitKovE=;
	b=wLMclvixvvCXaqaECxf81rTsszlMBh3fUZfd/+iSozYUVLDK7q6OpWM3PrhB9A6leA
	jgCTB1I0PyKtZ9GSXd8zIyefiENHku/QPLd7LdwLxoRzWWu5tIvb+FDQfnQ3u820Sg1C
	q7mbnEXkMOARtL6Ayh4Ni869BQMw3Eeo/lb+qf/Mq1to7B2zii8LYh7UJviCuH4cC/hk
	M6YuEEn9esANVnlzn9lGs8gQ0s5rjrChc8PsVWgpQn+fSwjr/HinPzUz+oSDUJU3oEMl
	UFpHo+yy9vA62Y3CsjZxUsr0RIcM9qouB6UK1t0PmMFnLdV1rGVXkAqgf4tt6W7CY1uO
	UAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=0ZQfoTjuQCV3Dv7mxCNSfKvq/WLHB61G4PZDnitKovE=;
	b=gK0P6rQkm3FPcY+cYEm9NMLlmj4Cuw4cyKGavmSCDT194Nt3/a5rkuNoWYqjP2qwHu
	NygtSsydXDrKaSj6Z9BVMx4vPpqVwo+M9POu2v44ux6dOdU4bGTjNEPmC4tes2flAXzE
	0sIW62hiKQ9EUfLpddzBBWq/75NPXAk20iDux/NiP7zKKENWlPS/mVkGQMCa3MBR9z9m
	4kePLn5AvT0q3kkvyL5yCUITFDb78ZS0ofOXLFHtqiDQFTHcnoAatr1/89m+Vckcug/U
	9m61cJAZ6WqP8u2R7LXjnyTDTyjDD5JH8QKtxJWcF80/34uiMpcAgoNnXtldAzUZqzs7
	0Vkg==
X-Gm-Message-State: AE9vXwN5BCs/rs8arLumkZcyiqAP8I/nL0A8DCRMCk9d9EReWIAEODpt6006l2vE6UXhWw==
X-Received: by 10.98.53.68 with SMTP id c65mr8745908pfa.66.1472238144490;
	Fri, 26 Aug 2016 12:02:24 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:647:4c00:3edf:fd71:b54b:e502:fedc])
	by smtp.gmail.com with ESMTPSA id
	r2sm30603035pal.14.2016.08.26.12.02.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Aug 2016 12:02:23 -0700 (PDT)
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	openembedded-core@lists.openembedded.org
References: <20160826103152.6211-1-git@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <78584d41-d0c2-058c-c048-fb5864e24383@gmail.com>
Date: Fri, 26 Aug 2016 12:02:58 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160826103152.6211-1-git@andred.net>
Subject: Re: [PATCH 1/3] libnl: fix packaging mistakes
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
X-List-Received-Date: Fri, 26 Aug 2016 19:02:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

this series looks ok to me.

On 8/26/16 3:31 AM, André Draszik wrote:
> - *.la files belong into -dev packages
> - the genl-ctrl-list command line utility should go to into the CLI
>   package, so as to prevent the libnl-genl library package from
>   pulling in all of the command line utilities (as genl-ctrl-list
>   is linked against libnl-cli-3.so.200)
> 
> Signed-off-by: André Draszik <git@andred.net>
> ---
>  meta/recipes-support/libnl/libnl_3.2.25.bb | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-support/libnl/libnl_3.2.25.bb b/meta/recipes-support/libnl/libnl_3.2.25.bb
> index cabe841..2624915 100644
> --- a/meta/recipes-support/libnl/libnl_3.2.25.bb
> +++ b/meta/recipes-support/libnl/libnl_3.2.25.bb
> @@ -25,18 +25,18 @@ FILES_${PN} = "${libdir}/libnl-3.so.* \
>                 ${sysconfdir}"
>  RREPLACES_${PN} = "libnl2"
>  RCONFLICTS_${PN} = "libnl2"
> +FILES_${PN}-dev += "${libdir}/libnl/cli/*/*.la"
>  FILES_${PN}-staticdev += "${libdir}/libnl/cli/*/*.a"
>  
> -PACKAGES += "${PN}-cli ${PN}-route ${PN}-nf ${PN}-genl ${PN}-idiag"
> +PACKAGES += "${PN}-cli ${PN}-genl ${PN}-idiag ${PN}-nf ${PN}-route"
>  FILES_${PN}-cli   = "${libdir}/libnl-cli-3.so.* \
>                       ${libdir}/libnl/cli/*/*.so \
> -                     ${libdir}/libnl/cli/*/*.la \
> +                     ${sbindir}/genl-ctrl-list \
>                       ${sbindir}/nl-*"
> -FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
> +FILES_${PN}-genl  = "${libdir}/libnl-genl-3.so.* \
> +                     ${libdir}/libnl-genl.so.*"
>  FILES_${PN}-idiag = "${libdir}/libnl-idiag-3.so.*"
>  FILES_${PN}-nf    = "${libdir}/libnl-nf-3.so.*"
> -FILES_${PN}-genl  = "${libdir}/libnl-genl-3.so.* \
> -                     ${libdir}/libnl-genl.so.* \
> -                     ${sbindir}/genl-ctrl-list"
> +FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
>  RREPLACES_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
>  RCONFLICTS_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
> 

