Return-Path: <jun.nie@linaro.org>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 252ED7C4DB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 09:19:07 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z3so50392338iog.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 02:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LkHlQG4WaVjQ2yWoLH9/tqWCRb9eIKgO/Wuk2xOpPj8=;
	b=vu4LnvGy/l+FbwAw4yHbOzysAaJQMlQMGPr6IoHDGIFuAikVDo3fh9tAcACeMxPwKh
	FXuj2HdYN5PtuVtXmRDR4z98CaeG2DXYOZxz3jNvXIv+7zHSHU+SWLC57qNDbPwkkjRP
	6uDyCDeD71QrUWehGJKRzLAo3ZUcfAincpE2sEAPq1WhN/oKaZmk3fFcce6EY5cTsg0w
	meU17Cxi2qK1efXFMA1ByNLXnT8eMCFE8u3QsO07kh7lTmOgh8lcqSuiMKw9BxOVltbZ
	ACvu4yaepUXSUEuq4PSMeXg1CPGI6m83psG5h2IgVK1JLzhPN54ufmDD5vk5DCzIcO3K
	8pUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LkHlQG4WaVjQ2yWoLH9/tqWCRb9eIKgO/Wuk2xOpPj8=;
	b=e30LPG8YiESIbl0lbwwlgd6Do1GfcRNuZhzvqVzW0OeGFV3/LdBMeBF2LDH+Zx/jsV
	uWbpSnuB8Nq0fc2oU47LvjkF5JV7Qi/RQrWAtncCoH7Ef5l0wkHTxbJCU43KBFby+CAE
	ZLcysaXEB2F1nnFufvM4fGfk7fwjfgFJYuoT6sZB/SGEna+6MrzsV2FuahHC0e92A3kX
	hrSMDIVrU4OqgMzPyffblqdqX7w+kdx8UCFdCGeTo8kiJn/QWUWd8EGeWeQogTO9Jz91
	Pj7sR67P1xUpOm3pTfHPMZqMB23ap5/RtDo4ZbcmrVnDvPEUh2LgGj/tG1/6yVPgzUBn
	nmqQ==
X-Gm-Message-State: APjAAAXf0dcQMaSGRmLNe52gvd4Swg6ZfCDZX+62TaOIOWi0iUcKYp7p
	UrWDwIBorulXdUWdiDMlmrVRxG2BPqyWCxzwhc2aRw==
X-Google-Smtp-Source: APXvYqzhp5ZCGFhHj0pENQ4KtwTRLcPNOB076PW6SfO6vHGbnAD8U5VMXibXRAFObyXyW3Z5z93KSTyVHjAaZ5zuoe0=
X-Received: by 2002:a6b:90c1:: with SMTP id s184mr6973784iod.244.1563441548099;
	Thu, 18 Jul 2019 02:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <1562742656-23568-1-git-send-email-jun.nie@linaro.org>
	<1728686637c0ddb7bfcad08769da97a8705daca7.camel@linuxfoundation.org>
In-Reply-To: <1728686637c0ddb7bfcad08769da97a8705daca7.camel@linuxfoundation.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 18 Jul 2019 17:18:56 +0800
Message-ID: <CABymUCN4Z9mD3zytqA9s5nS-me3-iCU_tAz47KmUibMamtDsFQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 18 Jul 2019 09:19:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<richard.purdie@linuxfoundation.org> =E4=BA=8E2019=E5=B9=B47=E6=9C=8817=E6=
=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=887:41=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 2019-07-10 at 15:10 +0800, Jun Nie wrote:
> > u-boot.bin with dtb & signature should be placed in ${B} so that
> > it can be deployed by u-boot as expected. Otherwise, the version
> > without signature is installed.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  meta/classes/uboot-sign.bbclass | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
>
> I continue to be very worried we have no test coverage in this area of
> the code. Since I don't know it particularly well I'm effectively
> merging patches blindly :(.
>
> Cheers,
>
> Richard
>
>

Then I think you can merge it as long as it pass current test
coverage. Because I already test the FIT signature feature comes back
with this patch :-)

Best Regards.
Jun

