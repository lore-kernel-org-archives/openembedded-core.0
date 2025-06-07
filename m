Return-Path: <oe@myspectrum.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD9DC61CE8
	for <webhook@archiver.kernel.org>; Sat,  7 Jun 2025 21:09:33 +0000 (UTC)
Received: from outbound1.mail.transip.nl (outbound1.mail.transip.nl [149.210.149.72])
 by mx.groups.io with SMTP id smtpd.web11.26317.1749330566107195453
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Jun 2025 14:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@myspectrum.nl header.s=transip-a header.b=sOG/fjXu;
 spf=pass (domain: myspectrum.nl, ip: 149.210.149.72, mailfrom: oe@myspectrum.nl)
Received: from submission4.mail.transip.nl (unknown [10.103.8.155])
	by outbound1.mail.transip.nl (Postfix) with ESMTP id 4bF9mM487PzRj1C;
	Sat,  7 Jun 2025 23:09:23 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission4.mail.transip.nl (Postfix) with ESMTPSA id 4bF9mL2VQ4z2pRDkJ;
	Sat,  7 Jun 2025 23:09:22 +0200 (CEST)
Received: from [192.168.178.17] (82-75-103-118.cable.dynamic.v4.ziggo.nl [82.75.103.118])
	(Authenticated sender: oe@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id C322E2001F;
	Sat,  7 Jun 2025 21:09:21 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=oe@myspectrum.nl smtp.mailfrom=oe@myspectrum.nl
Message-ID: <130b0c34-6e3a-40fd-b889-1253388cc601@myspectrum.nl>
Date: Sat, 7 Jun 2025 23:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] findutils: remove tabs
To: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
References: <20250607143512.484259-1-ecordonnier@snap.com>
Content-Language: en-US
From: Jeroen Hofstee <oe@myspectrum.nl>
In-Reply-To: <20250607143512.484259-1-ecordonnier@snap.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: ClueGetter at submission4.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1749330562; h=from:subject:to:
 references:in-reply-to:date:mime-version:content-type;
 bh=Qp1ieRZjfuzMpcXklEQgLED9IQMmAs2es+sI5BoF/0Y=;
 b=sOG/fjXuy2kC9W+YqkG3xciIdSNJPN6uvlN11nucNXf9TQy3D9OaUYFhJjuAhOPwrQNFYH
 KEQieneH2i/WOgfSgGAMT4T1GIobdEf9n8A7s5OMUmvaYV578HErHxfgfU9Io6X9IeUlfj
 A7vWgLPOe+9oWiRTgR5fWxSGo6NkdP3BFA8gJFVId8wHfXDD5w6LRtqZ05HUaOkBeTY3V/
 OJNyTVvfNiwwJpGa7iG0kqdKkB5qZLnUt0sGOjMJghYhr0FidJ2vrGJti/yyvQGEZMoTX6
 qaf7tsqtul+7AYhLNuJMFQnMOViEwC6qaAoN64EYnmMCnlY1nPW1RmxRXfGnvw==
X-Report-Abuse-To: abuse@transip.nl
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jun 2025 21:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218204

Hello Etienne,

On 6/7/25 16:35, Etienne Cordonnier via lists.openembedded.org wrote:
> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>   meta/recipes-extended/findutils/findutils_4.10.0.bb | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-extended/findutils/findutils_4.10.0.bb b/meta/recipes-extended/findutils/findutils_4.10.0.bb
> index 57f77de16f..508485bcd3 100644
> --- a/meta/recipes-extended/findutils/findutils_4.10.0.bb
> +++ b/meta/recipes-extended/findutils/findutils_4.10.0.bb
> @@ -18,10 +18,10 @@ EXTRA_OECONF += "ac_cv_path_SORT=${bindir}/sort"
>   RDEPENDS:${PN}-ptest += "bash sed grep coreutils coreutils-getlimits"
>   
>   do_install_ptest:class-target() {
> -	mkdir -p ${D}${PTEST_PATH}/tests/
> -	cp ${S}/init.cfg ${D}${PTEST_PATH}
> -	cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +    mkdir -p ${D}${PTEST_PATH}/tests/
> +    cp ${S}/init.cfg ${D}${PTEST_PATH}
> +    cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/
>   
> -	# substitute value in run-ptest with actual version
> -	sed -i -e 's/__run_ptest_version__/${PV}/' ${D}${PTEST_PATH}/run-ptest
> +    # substitute value in run-ptest with actual version
> +    sed -i -e 's/__run_ptest_version__/${PV}/' ${D}${PTEST_PATH}/run-ptest
>   }
>

This is a shell script, they should have tabs in openembedded-core.

With kind regards,

Jeroen

