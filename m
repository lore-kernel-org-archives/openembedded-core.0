Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1C74E618A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 23:06:36 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id e8so859016wrm.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 15:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=nOFD3EMKNfc7Yh6/NaY6qvD2XgSdepM1TiMJNZm/zQA=;
	b=bXe3tbtS4qosXFrT19cvUN2OTWRJSqoV0+SJVf0jn4p3CyDR5AAEpfYkhsReRaa7Tj
	H+eJ/MTrkTVZTLdyUYqjdV31mW6me2Qh4+Ukk+XNMTrnzHGtLtCi6rpb/ja5b6FuUz9x
	ONcqnlcHF0PIIABBIVKn5Pw9kku0mO521mPmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=nOFD3EMKNfc7Yh6/NaY6qvD2XgSdepM1TiMJNZm/zQA=;
	b=IW6TEETHdVjqx86uVbCJm9jGRjyBymN81ja4vvrdKP8SGFHXFrrQtr9G8a4aGCReai
	j+O2xF4fqQL25H/b5MGHoYM6fd/W2BnmR0CXBjvFvz18LdbEj0ThK9TDHkVCuv6yL3Wu
	b1W4DbWTs8Ch5RbI1B9Rz5py7jBcz6CdtqRvftpCXPDRPSj54mm5O6S8wngiCrgueost
	0zn6dhOIBTxNNJfl8a1qGS1XBGDlZI5cH3ode/rlfA3DzCu9TwDYUsM7p7jxFaf/OJ+q
	4M1bakpC1f6LnsjlqwF8Njv6deOnaa6XLIxOjyzTKbW+37n4tq/UbM5T3dTKRVJKoNtf
	Y13g==
X-Gm-Message-State: APjAAAVnskZ+08oJAaMgRo4W304AkMHzKrIVrGizisKl9QG+sa2F8wJD
	WctAHE1yxkipFlUvgdP9XD3mFA==
X-Google-Smtp-Source: APXvYqw8KygXaS9FwgCnoojHgtlfZuMlggBTu3vTrRIGpHpXOiIL4WvkMjeiWckhUz+fokOG0x0Aeg==
X-Received: by 2002:adf:e542:: with SMTP id z2mr1236387wrm.150.1582844797710; 
	Thu, 27 Feb 2020 15:06:37 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 4sm9172871wmg.22.2020.02.27.15.06.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 15:06:37 -0800 (PST)
Message-ID: <5eb7414b5329974a4e52c39256c65835a1115ac4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 23:06:36 +0000
In-Reply-To: <20200225185335.19326-10-alex.kanavin@gmail.com>
References: <20200225185335.19326-1-alex.kanavin@gmail.com>
	<20200225185335.19326-10-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH 10/12] libgpg-error: upgrade 1.36 -> 1.37
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
X-List-Received-Date: Thu, 27 Feb 2020 23:06:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-02-25 at 19:53 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../libgpg-error-1.36-gawk5-support.patch     | 144 ----------------
> --
>  ...gpg-error_1.36.bb => libgpg-error_1.37.bb} |   7 +-
>  2 files changed, 3 insertions(+), 148 deletions(-)
>  delete mode 100644 meta/recipes-support/libgpg-error/libgpg-
> error/libgpg-error-1.36-gawk5-support.patch
>  rename meta/recipes-support/libgpg-error/{libgpg-error_1.36.bb =>
> libgpg-error_1.37.bb} (92%)

Fails on x32. It did this when proposed last time :/

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/1605

Cheers,

Richard


