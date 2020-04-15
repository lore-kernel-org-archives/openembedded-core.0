Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.21286.1586975708810662241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2020 11:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: matthew.zeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 03FIZ5oD001755
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 15 Apr 2020 11:35:06 -0700 (PDT)
Received: from mt-manjaro (147.11.117.27) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 15 Apr
 2020 11:35:05 -0700
References: <20200324213647.20829-1-alex.kanavin@gmail.com>
User-agent: mu4e 1.2.0; emacs 28.0.50
From: "Matthew" <matthew.zeng@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] quilt: do not test patch-wrapper as it is not enabled
In-Reply-To: <20200324213647.20829-1-alex.kanavin@gmail.com>
Date: Wed, 15 Apr 2020 14:35:03 -0400
Message-ID: <87y2qwfvhk.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [147.11.117.27]
Content-Type: text/plain


Can we get an update regarding the status of this patch? It is to fix https://bugzilla.yoctoproject.org/show_bug.cgi?id=13841 which the target milestone is set to 3.1 M4.

Thanks,
Matthew

Alexander Kanavin <alex.kanavin@gmail.com> writes:

> Upstream only enables the test if --with-patch-wrapper
> was supplied to ./configure, and so should we.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/quilt/quilt.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
> index d6d06c049c..d2db079e0b 100644
> --- a/meta/recipes-devtools/quilt/quilt.inc
> +++ b/meta/recipes-devtools/quilt/quilt.inc
> @@ -71,6 +71,9 @@ do_install_ptest() {
>  	tar -c --exclude=mail.test --exclude=delete.test test/ | ( cd ${D}${PTEST_PATH} && tar -xf - && chmod 777 test)
>  	cp ${WORKDIR}/Makefile ${D}${PTEST_PATH}
>  	cp ${WORKDIR}/test.sh ${D}${PTEST_PATH}
> +
> +	# This is specifically excluded when --with-patch-wrapper is absent during ./configure
> +	rm ${D}${PTEST_PATH}/test/patch-wrapper.test
>  }
>
>  PACKAGES += "guards guards-doc"


--
Mingde (Matthew) Zeng
