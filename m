Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f170.google.com (mail-it1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id E3CA96BBEE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 01:07:22 +0000 (UTC)
Received: by mail-it1-f170.google.com with SMTP id h65so7016098ith.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 17:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=eakFycCbrhfBm/tKxeozCrFviYl03H72A0p3anb5VvM=;
	b=nBFfs0WVxgt3BglpYYt/cvpCKefwOCJluQaZ9Kn/PDi6MuRVwZX8iqbsJpwAGEyxXm
	trm+AWFDhJ+eZtA5D+he8owtzYAsPgggkj9PDeUWHmPd1SjhfEXMgGuP31kXhZcFavHh
	TVWX8nrUKwo1sLX9MRzzzrddyvyiiKyTKtK8PK/9uV2mOXkoiwazB+7caJ/GFfonbDry
	8LLZSwwBTIp4FlecaC3g/qNhHq6gvJaRyGgsRbv2QoF1XuG5tn0H2bIY3Bi6boYMmZfH
	T3FASWKQwfrk5Q3UkmD1ceEj1cuitR0cW6OdAfw+nK2g1KbbRl9vP3c+Njqylw7dhhr5
	vP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=eakFycCbrhfBm/tKxeozCrFviYl03H72A0p3anb5VvM=;
	b=fgLitXFqdCP+kLVA20NWuyYeOpn0dFVB4k0vlHuYPWdsn02uMBTHZwgL3uzQkj5stU
	wZ9bIsafKoOZb4c7WK42QoHVPBXqFRf3vqgonA3aknGOZo+2vkNBAHOo5F1Y4vRO4TPs
	/TEhIwwS8Pvg+jZRSVT22yAxVbkl30ppj+s12Zw0Ro4NizFNQzT6hI5yEiiiwwNqffSc
	NmZp9FgQbYY8W38TGfl/vK/5dPdHbaD2ZBqtBlDRKNCQAib83T9OA5U15Sd/fFYxdWXW
	t2ZrLYWs12RZ1b3fMB0SVywD5tJa+A4wr9qZHoSzTy79apDdZmEHvPFZBeb6Idxa5GWR
	iAeA==
X-Gm-Message-State: AA+aEWZDXmrqbbMAalF90VqUSSWq2bvwCuPZ9mAHfqF3D4EE+wVnNl8r
	KBrnKtuHTw44oP1nCe5rZx14JsS8q33fFEzuJSfCEw==
X-Google-Smtp-Source: AFSGD/UHwSRRCJy8bntnLJi+YR7rR+ZDeZpSMw8wb+EX56Vld1Xm2HcHU0J+hev9fnNevSZdXycCdnelhpi/2f+DDaY=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr4564200itj.62.1545181643995;
	Tue, 18 Dec 2018 17:07:23 -0800 (PST)
MIME-Version: 1.0
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
	<E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
In-Reply-To: <E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Dec 2018 01:07:12 +0000
Message-ID: <CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
To: Bradley Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, james.feist@linux.intel.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: flto automake
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
X-List-Received-Date: Wed, 19 Dec 2018 01:07:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 19 Dec 2018 at 00:42, Brad Bishop <bradleyb@fuzziesquirrel.com> wro=
te:

> I wonder if this is something they would be interested in upstream.  I=E2=
=80=99ve copied
> the oe-core mailing list for possible comment.

Thanks for forwarding this to us.  The class is very simple and just does:

PACKAGECONFIG_CONFARGS +=3D " AR=3D${TARGET_PREFIX}gcc-ar \
RANLIB=3D${TARGET_PREFIX}gcc-ranlib"

That's quite an abuse of PACKAGECONFIG_CONFARGS, I'd recommend just
setting AR and RANLIB directly in the class, they'll override the
defaults in bitbake.conf.

That however leads to the question of should we just change the
defaults? Does anything break if we use gcc-ar instead of ar?

Ross

