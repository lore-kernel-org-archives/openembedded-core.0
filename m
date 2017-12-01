Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2E0DE71AD1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 14:51:54 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id y89so4746074pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 06:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oCaYguOAg99Jdx2ZPdLReC3kQ4C3NPJ9QxowpLuIYPs=;
	b=qpmemQC1i3OZWWFi4MQNWN2vj/q5H4n2cR9NjUv83ODuXjwawWBpsiEBLVeFyt4pIN
	wO+aUs5D4Jk0xY33hu4TwdccGrKB2iqqdJjenUao4QYKBM1Yoyed/SCzXgKqXJqyOh2p
	uEb7fF2Jp4jSufamdOxMUROxLBlsZVdnRaJMFjmKQlMTf9biHLlm1HRUt8WdzULzHjkk
	8n40+YtxAgvmZygLrLODLvd/snB06U4XBPEfBI8z2q+UU3v77cxh1dfkfReEwDMGqT2D
	qLIP+XGkJcY4IvbTpMW37jnKJg9LZR/F/vPSjRdJcYwf3SpSrDdxf0jXGgTfZTXz9yBB
	dGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oCaYguOAg99Jdx2ZPdLReC3kQ4C3NPJ9QxowpLuIYPs=;
	b=dUjFefNDhPwOEyFtZCTTfzkWYntyk6S6NRtwcm+MvTnmLbe/BTJJNzMDO0ZyYUazvP
	6W/pNRJETfQjq8IET5AHiukrKEERsRGPYnVoSPs9jCuBMRon/pqAJ0J75BezehrsO7dw
	LUdfrTPMZkFQHw99q56aUOPolo7422Qolqea2Rq5+a4RCxKw2Wgtyk4eAwH3V2EE1/Kh
	FbDP7dl9rFDosczV9VZ2kRGVTeUqjJWHJLdjh/rQw8xFjmmVeEPihDvuZsetAfUCVpoO
	16I27UNwPj/NroUAKNXjDNjjw00L4a5umGIhhDIK3mn+piKnJcEjQD7VeMbmezcjMGk3
	MjSw==
X-Gm-Message-State: AJaThX79+KCd1DYPMdfdnqlHx+nJB2+o0jwErqJOp9IUhrx4bFyBU0d3
	DwMSlPfeyDMxiA32b7NjYg2u7aoHSPyibYjFypk=
X-Google-Smtp-Source: AGs4zMaYV/bkiipdSrKimSdNqU/KMnMaOFK1V3ndhjMhMR42ZpGSEDIyPnkfTafb1JwdISRd1APKIxHz0iVCvpwsKyg=
X-Received: by 10.99.109.2 with SMTP id i2mr6213037pgc.269.1512139916374; Fri,
	01 Dec 2017 06:51:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Fri, 1 Dec 2017 06:51:25 -0800 (PST)
In-Reply-To: <43d0b786bf6dc1ae091ddb6c5c590880cadcc6fe.1512111404.git.dengke.du@windriver.com>
References: <cover.1512111404.git.dengke.du@windriver.com>
	<43d0b786bf6dc1ae091ddb6c5c590880cadcc6fe.1512111404.git.dengke.du@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Dec 2017 06:51:25 -0800
Message-ID: <CAMKF1sq-VPxdRuKcpbvfK74GRnTk5mNwthuYj6S92bXCdPuF3Q@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ltp: add runtime depends ltp-staticdev
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
X-List-Received-Date: Fri, 01 Dec 2017 14:51:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2017 at 10:58 PM, Dengke Du <dengke.du@windriver.com> wrote=
:
> The test case nm01 depends on /opt/ltp/testcases/data/nm01/lib.a in
> ltp-staticdev package.
>

perhaps its better to create a packaging exception to include this static
library to be packaged into ${PN}

> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  meta/recipes-extended/ltp/ltp_20170929.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-extended/ltp/ltp_20170929.bb b/meta/recipes-ext=
ended/ltp/ltp_20170929.bb
> index 93a59b3..6fd280c 100644
> --- a/meta/recipes-extended/ltp/ltp_20170929.bb
> +++ b/meta/recipes-extended/ltp/ltp_20170929.bb
> @@ -108,6 +108,7 @@ RDEPENDS_${PN} =3D "\
>  FILES_${PN}-staticdev +=3D "/opt/ltp/lib/libmem.a /opt/ltp/testcases/dat=
a/nm01/lib.a"
>
>  FILES_${PN} +=3D "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups=
/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testscr=
ipts/* /opt/ltp/testcases/open_posix_testsuite/* /opt/ltp/testcases/open_po=
six_testsuite/conformance/* /opt/ltp/testcases/open_posix_testsuite/Documen=
tation/* /opt/ltp/testcases/open_posix_testsuite/functional/* /opt/ltp/test=
cases/open_posix_testsuite/include/* /opt/ltp/testcases/open_posix_testsuit=
e/scripts/* /opt/ltp/testcases/open_posix_testsuite/stress/* /opt/ltp/testc=
ases/open_posix_testsuite/tools/*"
> +RDEPENDES_${PN} +=3D "${PN}-staticdev"
>
>  # Avoid generated binaries stripping. Otherwise some of the ltp tests su=
ch as ldd01 & nm01 fails
>  INHIBIT_PACKAGE_STRIP =3D "1"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

