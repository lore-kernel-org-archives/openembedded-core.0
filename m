Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id EA9257E28F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 19:26:28 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f204so2428411wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 12:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=/Xwv+uuvfBLkbBb3Xi8Nwctf+lXd7Pf7IJ72nRt1Qnc=;
	b=Wuyu5Tuoo7VLPRv3PUPYhwTW+SgZI8fxe1BIqcFB8m0lR9eBoUMsSO3RGK/TppQ5V1
	fnC4hKVTDgZV1L464L0k1cQzP6dc6+ChezXjz+duGsOtJKW4KIXtOgvhjhreCX7Orvgj
	V4AQ1X0VCo9Kh5rMa8NuhWPCY+QI2GXdsc6og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=/Xwv+uuvfBLkbBb3Xi8Nwctf+lXd7Pf7IJ72nRt1Qnc=;
	b=uGjdwm0mnQROtIn95/dFCvh5ACNLmT8rmixVMDAkwuf0S/1esGGq3cEhXfaHYPGCgC
	xnj/PHN1+wE7XC1NiP1MzmrNroiQdCzw07pgWG5gvw0utqvaFbBVYqOIO67jCOn7St9Z
	lB/R5TPxTKhrgqpBGoKC4Qz+osNG9B7ohPQHOf1FvAE/qSFMFzvYC5B+4u1VGtd3PbZv
	TojDUzdhKaKhYPkMAUytK6+Sr5U3AE30shZRAwJj38cckHETywek18s5kLdp1Y8e3nN3
	2RswjoXp/Va0VCJvBngQvFomL71YQanSX+cH7/fqsvF5MkPTSDMYiMNlU0Qp75jGbqkZ
	DwQw==
X-Gm-Message-State: APjAAAVDOr6EBdXBbCjv+m43Scw5blmQX0vjn9xHLY6tBkYa7bh10FUt
	XnXqpwPmFpntuFwAAkKjw1NEjQ==
X-Google-Smtp-Source: APXvYqzN1ZaJIFNoKgOSUEE3T5jN9mVbzBuu/ClXrRqV7DyXsXTj5JvlFSNS48bJgTxYNleEBgQD8Q==
X-Received: by 2002:a1c:ab42:: with SMTP id u63mr8140112wme.130.1559157989719; 
	Wed, 29 May 2019 12:26:29 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id o6sm215687wmc.15.2019.05.29.12.26.28
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 29 May 2019 12:26:28 -0700 (PDT)
Message-ID: <8798dc0e5d91991953720388b601c9c5b3174c42.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 20:26:27 +0100
In-Reply-To: <4c62af9f-8bff-726e-db35-6f6ed7ebafc2@gmail.com>
References: <20190529184328.28470-1-richard.purdie@linuxfoundation.org>
	<20190529184328.28470-2-richard.purdie@linuxfoundation.org>
	<4c62af9f-8bff-726e-db35-6f6ed7ebafc2@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] uninative: Switch from bz2 to xz
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
X-List-Received-Date: Wed, 29 May 2019 19:26:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-29 at 12:21 -0700, akuster808 wrote:
> 
> On 5/29/19 11:43 AM, Richard Purdie wrote:
> > (From OE-Core rev: 29fc9210b973be68de474e75068e4c72371afe5a)
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> With back port to warrior and Thud too?

Yes, we'll need to do that if we bring fedora 30 workers online on the
autobuilder.

Cheers,

Richard


