Return-Path: <twoerner@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 73E3B77CE3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 07:22:51 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id z204so9617064vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 00:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EyY5ao43kPsURmF06DsfyijzXoCQ/FLknnz0crQ+cW8=;
	b=Tv9moJZKewQnFvMuoVTym5qM5zK8J/raaR0PVGmrjIAKBbLXv0gXaMzHr1lnHQztVM
	dWKxsN/Z82fxwCSFpMyOEf4DG28RAh360pEI/T0gYSqfpSXJLOBHWOj+fQNiF1C4n+Yq
	DFukPmEjM55DUeE513FFy1FKrx7/MRg1N1uZO0Oqif5cmhJWBXule1rFU6llDQwreDYF
	ETw7AV3jeIgQeDVmCXeIpgo1y9EiKCMgAdsXcMQNigdNm4fMtPpKtOoTwCijiXO46MaA
	LOxUkRH/CNmx1mOh1FAaRTYt2y7z2YUDsWPRjdJh9pUV7hZvcZQHLCFMO7IshLk4Dyhw
	iJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EyY5ao43kPsURmF06DsfyijzXoCQ/FLknnz0crQ+cW8=;
	b=ZzxkBOsq0X3cd2LDZ0kE/Wz8pstsKuzQZD/7fTrymqK7Cb05dXgPpx4TND3Xvv0NKk
	fRZnWb/xT47y+VSzGhC2y6t9ALmOyTq7HwadSxQS71AeJ0ocAoxDAmFZth/JKzxR+c14
	H6X4j/ePi1kF3gvOlHvDzlqsBMtL5r4SwsmnwiJ/DyT/hiOgxq2OKjYgCZirzF775A96
	PG6s1g+GY+OlfdbszWmqB76YXfnPPxaiYVuYaParNMXaWt77SAK4K1Rkr+O7l71HORlh
	HVCGQ9vzum+K02pAbYnfWPdVHZVOU4d+Xniz6k1NZnhlbTuayrciFD7hFgM60eEh0niQ
	jo0w==
X-Gm-Message-State: AN3rC/77zpY96UrdGXPxgKAmtP/VcpsSamG0wqiaEVu4TdBHK+SGx/vUzxh7248BZhVT6XuGniiEptuy4NojHA==
X-Received: by 10.31.171.88 with SMTP id u85mr709425vke.22.1491981773345; Wed,
	12 Apr 2017 00:22:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.30.70 with HTTP; Wed, 12 Apr 2017 00:22:52 -0700 (PDT)
In-Reply-To: <CA+chaQcT7jApSyB4SqwPhsn+Pn_XTbryPT0FQZ_ST0OKDTH5xA@mail.gmail.com>
References: <20170411013850.GA25337@linux-uys3>
	<CA+chaQcT7jApSyB4SqwPhsn+Pn_XTbryPT0FQZ_ST0OKDTH5xA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 12 Apr 2017 03:22:52 -0400
Message-ID: <CAHUNapQdr_o_F7DbjNkmOYLXiMnntZJEKgw0+HVncMs6kC-Pmg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Drew Moseley <drew_moseley@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: having llvm available for gallium
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
X-List-Received-Date: Wed, 12 Apr 2017 07:22:53 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 11, 2017 at 2:52 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Check this:
>
> http://lists.openembedded.org/pipermail/openembedded-core/2017-April/135050.html

Excellent! That works for me :-)

Is this a fix, or a work-around? Is this something that's going to be
applied, or is a better fix needed?

