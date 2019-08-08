Return-Path: <jun.nie@linaro.org>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7C59974769
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 04:01:28 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id l15so113228454otn.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2019 21:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=x/JjRlGwzXXdt+imSTK/k0T78ZdIs8nxODNM342DPOA=;
	b=P+REDKVCg5S7LcSEMF1zfIfKfhzIbtz0K4Xw1KvAzy+MhqmcCSiNN8FePoB38knYZA
	cfNW3deSxmcvx/MXYPq9n0VFUJDRUg5m5hNlbyG9/qLT+uPLEXzQ8LyWqAmYlW7ebpal
	8TxUoQny74oPprfCu6rlc00VlRdeOzFIR3A64VyrAyz90mqAwiGUZVnykdGcFWoWu1MZ
	cTg0oJk5lkBSjVWHl9OF56puPixDY2aNmoTDPVJSc7V1VnOFQ1NjFrebA2WAmXvDYQ5E
	xheMmosEVfqLzvA5B2ZkEZKkqyDsq2OU7QlLnqtIxnqKtaeNf8sHnLU4nyvw0q2sqLEt
	BO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=x/JjRlGwzXXdt+imSTK/k0T78ZdIs8nxODNM342DPOA=;
	b=f3mMNdnUpOSoN8SNmy+pIwCzgY6G8nRRKWATthRctY7bCEi8x/W4tlMczbRYKLM01+
	+YXhkObCcs62R90F6+cXsdHOZHxLdikcawHp9UbNoXNn42IBr8YMdjygBWr/Cf98ZwcD
	PcRnrl17lt7qUAbn2GBU+FUyMMjhLXWhU7USe1JtM3y7eS9IOAe5l/NZtkv1hblHBnZP
	yCwddoBuFPD/x60dJQ/EpY7kzixghPUn35zNQaMdCfWrvpxjSgLHp/jwi+mh9IWIXm6X
	x325zpd6vuPXXJJi4VOpDY3GRKhTa4+mcHUnwPUxZKdfqF1BuEGFvTIWDfIV3gI20biP
	vkxg==
X-Gm-Message-State: APjAAAXY/u+MRzQ3sElOdneMD6UG/HTH5nCTUR040CJicUFF0mdFhaux
	371+0s/yVk0LZDb+nGqv9IDigF81o5IIgxchB8EPow==
X-Google-Smtp-Source: APXvYqwp05WSy4dxgcLgn7Gqzrn/woyNuFknldchYcGcHexEd1W43i9c0tLtUTeccZdSB949j0kuFAn2mXm0Q7LG2qc=
X-Received: by 2002:a02:c7c7:: with SMTP id s7mr4894551jao.37.1565236889404;
	Wed, 07 Aug 2019 21:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <1562742656-23568-1-git-send-email-jun.nie@linaro.org>
	<CABymUCPLLTVttUUPqCaOKY2etK+8BL_bHsC63TH-wYCPE3Pd+g@mail.gmail.com>
In-Reply-To: <CABymUCPLLTVttUUPqCaOKY2etK+8BL_bHsC63TH-wYCPE3Pd+g@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 8 Aug 2019 12:01:18 +0800
Message-ID: <CABymUCNYpjiSBSb9rupZ80AXiRXMnBiZxMbLgay8sU=S19s8Mg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	liezhi.yang@windriver.com, andreas.obergschwandtner@skidata.com, 
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-fitimage: uboot-sign: fix missing signature
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
X-List-Received-Date: Thu, 08 Aug 2019 04:01:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Any thoughts on cherry-pick this patch to warrior-dev branch?

Jun

Jun Nie <jun.nie@linaro.org> =E4=BA=8E2019=E5=B9=B47=E6=9C=8825=E6=97=A5=E5=
=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=884:26=E5=86=99=E9=81=93=EF=BC=9A
>
> Jun Nie <jun.nie@linaro.org> =E4=BA=8E2019=E5=B9=B47=E6=9C=8810=E6=97=A5=
=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=883:11=E5=86=99=E9=81=93=EF=BC=9A
> >
> > u-boot.bin with dtb & signature should be placed in ${B} so that
> > it can be deployed by u-boot as expected. Otherwise, the version
> > without signature is installed.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
>
> Hi Richard,
>
> Could you also help to cherry pick this patch to warrior branch?
>
> Thanks!
> Jun

