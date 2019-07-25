Return-Path: <jun.nie@linaro.org>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8777674598
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 08:26:43 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id m24so95529866ioo.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 01:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=GTRjqL4ltL7yu4lVtUzOA9kLUoztXJox/uISL8Yl/yY=;
	b=V+52uI5IVgsmPQJVn9OXxGRH0Ec402ggY/veI5+4Ot1B9ribX1XODuRisNM9CHsCE1
	qADk2jWFMdrEWybmHzBF9oAWZY5DXs0QpGWZo2Y5/qk1ch2USRM1bxsfMfMZtNoL4GcY
	1wFU1xpv7SXvLceReMGG5BFpgxLYzUfGulsvZXaWD//RrRx3IWlxE/aUGbViuFHSzMZG
	Ucs4DpcoRlXljeU8Yvw1uhyooAPwJvmviej60OCZzaoCv+jSced8hQlJosN0e5Q96jV0
	09rQkOsRltwmBokXMQaTfNPCcPYUPHinVO/zBe5sP88kegT9vA7rxNXD6QIqIRZ2zgzm
	hU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=GTRjqL4ltL7yu4lVtUzOA9kLUoztXJox/uISL8Yl/yY=;
	b=XSfBvokLILk1WvemDvWV+OGbmk1OcW27I0LDJsNh6OGlCaGFzPGHPDGkuKRRyQC8Zm
	sG3LBC5xyCubDvsDQyiYK99OzwSPXpYVaCM+0cJNKEeC27JZqOo8Fr5ErGjV9mzFq0jP
	HVgq3BaLEqzktSPwKBUZBzG/SuIGODVZThHKELd2WY1IShHi35VEwoAbjRMC+7K/HYJp
	g6T4OA1t0sZ+AUWy0FWPMmAoYq3RZJ8rFSSGcb/RC8y28dKroa3i/18QcAXT/d2gCKQj
	h1oD1me5Yy3BZVtHAGKbMOnB0cbcZc7hWlCkK0nEp5KhjeI4S8BgHJMAGPqUezyooPit
	B00A==
X-Gm-Message-State: APjAAAWpds3atsvo4ynZDwqQhPOZlXGLFjZy6u8MoDEnZftTprt9qPuV
	6bg/LG6ALKBz2PfUGaX8QC0E9hon6ki+SkI2eTlsHg==
X-Google-Smtp-Source: APXvYqx1xe9PezEmehCkptN/THnMRKNd7Ushveh4KxbGjCoCFjjdabz6gjCa98RsNefPj2Rg6yncBJAOUOjrTXjWEX0=
X-Received: by 2002:a6b:f80e:: with SMTP id o14mr11286553ioh.1.1564043204333; 
	Thu, 25 Jul 2019 01:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <1562742656-23568-1-git-send-email-jun.nie@linaro.org>
In-Reply-To: <1562742656-23568-1-git-send-email-jun.nie@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 25 Jul 2019 16:26:33 +0800
Message-ID: <CABymUCPLLTVttUUPqCaOKY2etK+8BL_bHsC63TH-wYCPE3Pd+g@mail.gmail.com>
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
X-List-Received-Date: Thu, 25 Jul 2019 08:26:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jun Nie <jun.nie@linaro.org> =E4=BA=8E2019=E5=B9=B47=E6=9C=8810=E6=97=A5=E5=
=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=883:11=E5=86=99=E9=81=93=EF=BC=9A
>
> u-boot.bin with dtb & signature should be placed in ${B} so that
> it can be deployed by u-boot as expected. Otherwise, the version
> without signature is installed.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

Hi Richard,

Could you also help to cherry pick this patch to warrior branch?

Thanks!
Jun

