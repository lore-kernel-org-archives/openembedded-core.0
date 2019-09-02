Return-Path: <jun.nie@linaro.org>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 25E466C0EB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2019 09:36:26 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id f12so10423758iog.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2019 02:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=SSx5qNf+470Pu2keT8el3SATT4YRdh8uhRzOa+7Pbz8=;
	b=ZYSamssFV54oEIejONIHEru6dnzhJqCUuVvKCsSKsJvnw/p7SUbxUkcYWzMN0mFx8A
	wGez508zGTJLMc27VTqW4lPZ0LvWaRDE0YIyPpkdq9IyuyAzMvldbEL0NwPOwPzw92LR
	Ua26jBnUzBLOzf37FRLUKwXoReDvw2YmT0curnWl9KFpXy8jvTjme3D8oFC+GNWXyKDQ
	Ub5qWcHPhnw/OMrSyMlgKMjWjNPIOImNI68Zspf/MzwVQBZK697YhQ5ljOV0/27+gYrl
	GTFbgVuMjLA2Bz7ndzPjJtJsg6PjVPmI813CcKVCwzh3HlWa5qHEViNE39J5GuTOi4kP
	wrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=SSx5qNf+470Pu2keT8el3SATT4YRdh8uhRzOa+7Pbz8=;
	b=GE6dl3VlxbA/nJKBINBwg0oqUXGyv1z9RxOEnxbj+5MJjaAyolEbLj/o+yqe2HRTe5
	VI42X8kzf0+slx+31dqebTTZjcsChPzlAARTZZBszW6Ubj64g+BI92ZkVdC0mDajwpfE
	UcfI71Ipt2PM7iHlu8LEHokP+xOQnNzJU6tMYsUU4PENDvP3bx+Mt33PqBrUrTpLEKwi
	aXduR4tCTMyLnVTbTyoeTolAlBJVB0SOZ9jNR5Jsnx6LD09NhjDsb0fOIWy1H9unK784
	lgQJzT4OPLtrwXGT5BgF5ATLGPdHD0TJmW3hnyzC1sKSar0usIR0eFeh1wQnX5VXMidf
	QZlw==
X-Gm-Message-State: APjAAAXbxoL6bm3KUXdSueGohbgvJOvzHZ6NnHMl8ClRbof/OCe7UEmP
	pltZ2sh/QHDxyLT8Go3WH48ndabKgqFBntwHeZG6AA==
X-Google-Smtp-Source: APXvYqwoieLiCeXEhK1bIk1xtkVX9mdCiS1et8ishLai6iHo1aMe0kUm5ov1DilliJ10cwGpztH8mVJb8eAdT8RKhWM=
X-Received: by 2002:a02:c00c:: with SMTP id y12mr30421109jai.65.1567416987973; 
	Mon, 02 Sep 2019 02:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <1562742656-23568-1-git-send-email-jun.nie@linaro.org>
	<CABymUCPLLTVttUUPqCaOKY2etK+8BL_bHsC63TH-wYCPE3Pd+g@mail.gmail.com>
	<CABymUCNYpjiSBSb9rupZ80AXiRXMnBiZxMbLgay8sU=S19s8Mg@mail.gmail.com>
In-Reply-To: <CABymUCNYpjiSBSb9rupZ80AXiRXMnBiZxMbLgay8sU=S19s8Mg@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 2 Sep 2019 17:36:16 +0800
Message-ID: <CABymUCPiMy5XQxf81NLdpysNDcjnKo1U6gLqhy0p5G2FF7raeg@mail.gmail.com>
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
X-List-Received-Date: Mon, 02 Sep 2019 09:36:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Any concern on cherry-pick this patch to warrior-dev branch?

Regards,
Jun
>
> Jun Nie <jun.nie@linaro.org> =E4=BA=8E2019=E5=B9=B47=E6=9C=8825=E6=97=A5=
=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=884:26=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Jun Nie <jun.nie@linaro.org> =E4=BA=8E2019=E5=B9=B47=E6=9C=8810=E6=97=
=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=883:11=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > u-boot.bin with dtb & signature should be placed in ${B} so that
> > > it can be deployed by u-boot as expected. Otherwise, the version
> > > without signature is installed.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> >
> > Hi Richard,
> >
> > Could you also help to cherry pick this patch to warrior branch?
> >
> > Thanks!
> > Jun

