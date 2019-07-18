Return-Path: <jun.nie@linaro.org>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id C829A7EF67
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 15:31:16 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id h6so52065185iom.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 08:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fbksE+8cdPmtDowAxbEFxSPqfvIey3nB1MNeHMlq+UU=;
	b=HaFAIwVNCsimZN1a/dRFN39i+dJtqB8TJH+cD53YdVd0Qh+cMPnj06TjmJMhfEVGjJ
	RbG7i/upOVDGId7PB10sZCI/V3huzm9BLPONhgZKQt3PWWt2ylfH08IjkBu1iqfFaUVB
	D5NAdgn9wofvRnfEF0NKwmtC4Jo7Y2ZBDXoL9pO8/QsDfIYoUK1vyp8OSH6TPerLZWXl
	4Os/QUHLh+xYQSH0xlvxbrMGAwvUKJtFz2RLALq/wAO1idbL2OPXLcOcI9li29Ed0Fic
	WR9uk56T4v7pIWmG79vQyXp0I8ckcE1OEZJhwU6s9hmsDeDIpP9varBMB+K0J+4eYITb
	MOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fbksE+8cdPmtDowAxbEFxSPqfvIey3nB1MNeHMlq+UU=;
	b=BNojP4ISCobXYnA+VDgsBu6Ad2PvFZv4CPOu4rYqaAgkqYnq7dLP5pvtQMDoOQCTxh
	91gxRI11dvB5i1DCJmmZ9LtOdo/0e5kiq7j9z1uPmoZiQwdfYva2FLhtyVvxpk9fCg3g
	/VCmieZT14XikRAm4p+b+ykEI33weKBUmvKpO1m0z+zvEchCydiMVubOfMjypwlzMACT
	Zmwp29UcrRBaeQ2QMsf2VQa0+aOGFRDxuf+3tW6bx1PJ+BJnjZoY64Go3kvCfS+WD8wm
	EYqTAmbGQT/XFSLvjdS6rAqg747Ryq7SOmizAOTgDTha3kajPIK5a4rUcKyaJ1RoaR3E
	D/yg==
X-Gm-Message-State: APjAAAW5n/p70i4j+pEOOUgaRy70tVvZwqLpzaXYUhiXt/KIII+VCDQc
	/rQVlataMJx+TpJSuhUU6+BDwI6BIX2rX1ZuzZLS/A==
X-Google-Smtp-Source: APXvYqxbASN4j1mJMXosBeG+Zo+Xg0oHRtcqd5KbnwjTpvFRiRMdlgyOrD6L+oYge2LTevcyLlHXP6r6jmWTUpm1q6o=
X-Received: by 2002:a5d:97d8:: with SMTP id k24mr44975021ios.84.1563463877823; 
	Thu, 18 Jul 2019 08:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <1562742656-23568-1-git-send-email-jun.nie@linaro.org>
	<1728686637c0ddb7bfcad08769da97a8705daca7.camel@linuxfoundation.org>
	<CABymUCN4Z9mD3zytqA9s5nS-me3-iCU_tAz47KmUibMamtDsFQ@mail.gmail.com>
	<8ffc227244161cf4735427ed794ba569e41cd0ce.camel@linuxfoundation.org>
In-Reply-To: <8ffc227244161cf4735427ed794ba569e41cd0ce.camel@linuxfoundation.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 18 Jul 2019 23:31:06 +0800
Message-ID: <CABymUCNKzBRNS33yCha_VEnvL9JVV-hYi-ff+b29rvfMtsX9Rg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 18 Jul 2019 15:31:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<richard.purdie@linuxfoundation.org> =E4=BA=8E2019=E5=B9=B47=E6=9C=8818=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=888:33=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 2019-07-18 at 17:18 +0800, Jun Nie wrote:
> > <richard.purdie@linuxfoundation.org> =E4=BA=8E2019=E5=B9=B47=E6=9C=8817=
=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=887:41=E5=86=99=E9=81=93=EF=BC=
=9A
> > > On Wed, 2019-07-10 at 15:10 +0800, Jun Nie wrote:
> > > > u-boot.bin with dtb & signature should be placed in ${B} so that
> > > > it can be deployed by u-boot as expected. Otherwise, the version
> > > > without signature is installed.
> > > >
> > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > ---
> > > >  meta/classes/uboot-sign.bbclass | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > I continue to be very worried we have no test coverage in this area
> > > of
> > > the code. Since I don't know it particularly well I'm effectively
> > > merging patches blindly :(.
> >
> > Then I think you can merge it as long as it pass current test
> > coverage. Because I already test the FIT signature feature comes back
> > with this patch :-)
>
> It has merged but my point is we really need better test coverage of
> these areas of the code.
>
> What I'd really like is for people to help write tests which showed the
> broken behaviour the patch is fixing.
>
> Cheers,
>
> Richard
>

Just find that there are runqemu script and some qemu test in
openembedded-core/script. But it seems that u-boot is not enabled in
qemu test yet and current test case is only for kernel feature. So
there is huge gap in u-boot test side. I can have a try later, but
cannot make any promise.

Best Regards.
Jun

