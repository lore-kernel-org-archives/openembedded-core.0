Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1E7116104D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 03:28:19 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id g6so397217plt.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 19:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=7xTYVEMXAvFaiK6+A+yZGxPTvMlUkrhnrSD3dooOisA=;
	b=HQPf131r4px71Nny7vbBo5EWJcId5iEqcX3v0fbiv304s53awPNCsfIpW2dGubKGUY
	/dNxNcOGdp8ILZkPx/0/YYqyFipN5UQOxtAsC13mHU4NE4vf0LNFxGD+ePSz051Z3mgk
	EvqaUG4MJm/K8TY6kedTazCWiCWWOxoA1OzQkrMukmdw7YrVBOUwHJVjNBcnv5ojB+MY
	DtfdcSf3515Bb/L0cfv0BwXDxLnbTFtSS7tSnzgOqQk/ke/LTEIoD1rYNVfnULszOUcn
	14YfJpv4zcMeSB5Qylwvx1e6ei5X/V77grE87EWlGCashToF+la6GqqEnr4zXEv7gphO
	/hIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=7xTYVEMXAvFaiK6+A+yZGxPTvMlUkrhnrSD3dooOisA=;
	b=PoKjYtA1fLTPJWUBB4ED6gKWfuDbgC0ckRUTwzOUZwc7Zl3PnYD2DeVGSAQCBaDyK0
	8ppgZvIoP/NMV8DljJAADEaden+HLIxpTDIV0FQl4aRDf9xmBqnerTULAquQGCLYO9Gb
	R4bKuuJ24GDxdHjY8fX70S+ozDRcHLaE2jLj4WKC0J//4IMkUUSxM3UKfiKUx9XCCqlT
	3w12zZcgrUY0iTDMwpqBjR45y8GXY1AMWFA5evgya+UtWv2dJyhrhM5/zM6Ou6qSi+yG
	uFFky7cRWG45Inz9ozWgyjWd2OiuZniFNCqGchBanMn9YVR+DYldJSzwMw//tf6tpiEN
	QtEQ==
X-Gm-Message-State: APjAAAWCl/amSelWfucEnp/Lk+vJEhDdY/D3bdkGK4Kt4TCfiNXRWRBt
	RB7Yol/CbxTX9SGcs2hERp0NNLqv
X-Google-Smtp-Source: APXvYqxe9bFKIc9jm2c2x3c/sq+/Zxzm/B9t2UTzrHdP2Y1x8c/pMYDheB5qQSuL/Kno/4M9biccsQ==
X-Received: by 2002:a17:90a:fb4f:: with SMTP id
	iq15mr7580739pjb.86.1581478100815; 
	Tue, 11 Feb 2020 19:28:20 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:8943:d24d:d5b0:e1fb?
	([2601:202:4180:a5c0:8943:d24d:d5b0:e1fb])
	by smtp.gmail.com with ESMTPSA id
	133sm5948668pfy.14.2020.02.11.19.28.20
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 11 Feb 2020 19:28:20 -0800 (PST)
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20200212031435.792802-1-JPEWhacker@gmail.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <4c205c3c-51b5-06e2-c918-98991af43e5b@gmail.com>
Date: Tue, 11 Feb 2020 19:28:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200212031435.792802-1-JPEWhacker@gmail.com>
Subject: Re: [PATCH 0/4] oeqa: Run diffoscop on saved output
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
X-List-Received-Date: Wed, 12 Feb 2020 03:28:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/11/20 7:14 PM, Joshua Watt wrote:
> Adds recipes to build the diffoscope tool and run it when the OEQA
> reproducible build test saves output to a local path. This should make
> it much easier to debug reproducible build issues from the autobuilder,
> since the published output can be easily viewed on the website.\

Thanks
>
> Joshua Watt (4):
>   python: Add libarchive-c recipe
>   python: Add magic recipe
>   recipes-support: Add diffoscope recipe
>   oeqa: reproducible: Run diffoscope on saved output
>
>  meta/conf/distro/include/maintainers.inc      |  3 +++
>  meta/lib/oeqa/selftest/cases/reproducible.py  | 24 +++++++++++++------
>  .../python/python3-libarchive-c_2.9.bb        | 17 +++++++++++++
>  .../python/python3-magic_0.4.15.bb            | 19 +++++++++++++++
>  .../diffoscope/diffoscope_136.bb              | 15 ++++++++++++
>  5 files changed, 71 insertions(+), 7 deletions(-)
>  create mode 100644 meta/recipes-devtools/python/python3-libarchive-c_2.9.bb
>  create mode 100644 meta/recipes-devtools/python/python3-magic_0.4.15.bb
>  create mode 100644 meta/recipes-support/diffoscope/diffoscope_136.bb
>


