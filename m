Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f181.google.com (mail-it1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id 23EC578BEE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 10:27:36 +0000 (UTC)
Received: by mail-it1-f181.google.com with SMTP id m15so21988167itl.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Nov 2018 02:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=XsD6IGMKgWjBt5QeoBjsntnmfyHIUnmNPjd7gnIkIz4=;
	b=OVW6h5vNVvzY3z+sSC+NKe+4YgqwdEuRnn2kYsFAXsWoLxTuxTwgLf+/U0w1Vn/bm0
	pP8RvyJgM1haVixnI4kqlMmr1G9I9Km6lBzNXIT91fRpLn5WkgI74Xt/krP6nJwzXA1N
	CwyZ17zwn536kXYdH+Ar1zFiuc9dM/ITrlZ+s5SMb3aVn3WqQWgmlvJ1IGX2QUNKbWBo
	4erF69/qH+j7zMmC3zxirF2rMd7p0WpfANvq2AbtMnLLm49tAXPt4fLHpEiIHBW2Olnz
	OQZ/XuAYKNSDR4jSPINIGQs2VA3wbLZhiH2qF625vlsIR4AFtTf12ME51KMl11Uixdn7
	EIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=XsD6IGMKgWjBt5QeoBjsntnmfyHIUnmNPjd7gnIkIz4=;
	b=i0Xor8BYqdz1vDCDC9NOQZvHcKk8yLV5iqyPH2coXQZgpQV9mQ3b8Gh+8VjixcWTmR
	cJiSPofiWi10o7UalZKHvdcgI2mV0g6KSQlNh/XDLsQk6jqmf1KO0+ZcEK4d8sUwJAxJ
	jD4eOsT2zl1J4YzflODuRGxIGGbBHB+5uGBTU6Xqh2BSuZaWO/S1sfv78I8be4uv43EE
	vtkH8xpJmGACWTEqyqIQRJrtJCHZ99nGYYJRImcBXX48pDUVlBseOv1tc1DgtLwn/zvj
	XX2QaKsyj7dJrFzRb8fkysj8kOTeeb5r/BZmpx7Yzl1lMRQm0UgS1mIgAWQi2DsCciwq
	ypnA==
X-Gm-Message-State: AGRZ1gL1qLpqRl4KKQmBJcAR/smAN9MeAQKiVcKYaajfvhjbEqW+864/
	H+XgBfnsvSLjcQAt3keoRpREHlCl8FpGYLP94PldGg==
X-Google-Smtp-Source: AJdET5e8uiU6STVr3Mw9q4DOcl4NdVpcO+DGtnUmcYPhCIMGJFc3zWDjukONHQ8F4e5UFPoJseeKUsObN2PAvcpQi0Y=
X-Received: by 2002:a02:601c:: with SMTP id
	i28-v6mr1076872jac.105.1541586457171; 
	Wed, 07 Nov 2018 02:27:37 -0800 (PST)
MIME-Version: 1.0
References: <20181106100416.41548-1-martin@geanix.com>
	<58cd5d08-9d24-0e30-7f9c-3bec2c93ba84@gmail.com>
	<45149dda-efa1-2b2f-e598-8b454ab66fa8@geanix.com>
In-Reply-To: <45149dda-efa1-2b2f-e598-8b454ab66fa8@geanix.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Nov 2018 10:27:25 +0000
Message-ID: <CAJTo0LZSJon2rNZ3Bm1QLa+860fZ09Bn56F3gX-TTkDLxbEGtQ@mail.gmail.com>
To: martin@geanix.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] glibc: make ld-2.28.so reproducible on arm
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
X-List-Received-Date: Wed, 07 Nov 2018 10:27:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 7 Nov 2018 at 07:41, Martin Hundeb=C3=B8ll <martin@geanix.com> wrot=
e:
> > Please add Upsteam-Status: and Signed-off-by: in the patch itself.
>
> It was Richard's patch, so I chose the less intrusive approach. I can do
> a refresh of the entire patch?

There's nothing to do, as you're extending an existing patch.  Easy to
miss that fact in the review.

Ross

