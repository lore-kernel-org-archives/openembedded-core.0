Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4E8757E322
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 21:29:32 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 7so2502245wmo.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 14:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=HQ+Xrwbs+TPjf59yZXReHAktAABW6erI0J8ETFqbEos=;
	b=B2KC5mlFRH3GH+1IiTiHenurWfBSCjxywNkAPgWnvr0riavY+1NXItKVjmEdumxmFz
	WFSxpiutdbyaWdzHstgoJqG1Srja15eTIR4ejZxtJ09KGJ67b8NlTrY4KB/TUTOunyHu
	sM4eTeFMh0cm5Lt6Eq9mBSm7rG36gREunzx9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=HQ+Xrwbs+TPjf59yZXReHAktAABW6erI0J8ETFqbEos=;
	b=ZEJnpKCTpxI9XwOsfVgVoPK+1nHPfcY1WzxjO63biHWPxLS7hXXavxWisYNLKfk6jH
	a68yCLJAJxdj9f30GAFMZvXbRKZRVgEGeDmtxWuFw2SwhaZ1o2Ev2E+V+iwaNPr9NqUy
	d/TvpVnhxa0oInT/Z4c9RmgLtDcXrVpZmDRjrFtiN9GDgqXP3lwPZqmLGzKnXGI63lzA
	nGyIND+YaIpD4pGjCfyw1mghXXarmb0UXKSXhGsCpidD1sls2hq89K4wB4YMfFsKZrZn
	EMZlg7HSCADkXDFfRbu23Ws/as7Yi8ON8uD5trKy2HJi4iIyiMRfLtM9NNZJTbcP13ra
	6l0A==
X-Gm-Message-State: APjAAAUlprCLzxDUlFFuzvthjP1pMR/1qGHwFCHoxXDHc6SM4bDRsKOy
	Yxamfy9TP+cmezp88jzDwuehpg==
X-Google-Smtp-Source: APXvYqziR0Kxng9C/Xx+PTjwFWWaa0WAV99K+dwUXDTXF/lAjEJQy6w88p/gscMWEvbLREH2gJGLtA==
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr84759wmj.153.1559165373095;
	Wed, 29 May 2019 14:29:33 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n10sm1683919wrr.11.2019.05.29.14.29.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 29 May 2019 14:29:32 -0700 (PDT)
Message-ID: <4571b3c03fb83ee01492dd1891e410becb72b0e5.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Tom Rini <trini@konsulko.com>
Date: Wed, 29 May 2019 22:29:31 +0100
In-Reply-To: <20190529212556.GO20781@bill-the-cat>
References: <20190529184328.28470-1-richard.purdie@linuxfoundation.org>
	<20190529184328.28470-2-richard.purdie@linuxfoundation.org>
	<4c62af9f-8bff-726e-db35-6f6ed7ebafc2@gmail.com>
	<8798dc0e5d91991953720388b601c9c5b3174c42.camel@linuxfoundation.org>
	<321f3cb8-a101-49ad-07c4-64fc82d2c7f8@gmail.com>
	<d5b41b11583c78cd16d6393736fafd8e733c48a9.camel@linuxfoundation.org>
	<20190529212556.GO20781@bill-the-cat>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 29 May 2019 21:29:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-29 at 17:25 -0400, Tom Rini wrote:
> On Wed, May 29, 2019 at 09:50:22PM +0100, 
> richard.purdie@linuxfoundation.org wrote:
> > On Wed, 2019-05-29 at 13:39 -0700, akuster808 wrote:
> > > On 5/29/19 12:26 PM, richard.purdie@linuxfoundation.org wrote:
> > > > On Wed, 2019-05-29 at 12:21 -0700, akuster808 wrote:
> > > > > On 5/29/19 11:43 AM, Richard Purdie wrote:
> > > > > > (From OE-Core rev:
> > > > > > 29fc9210b973be68de474e75068e4c72371afe5a)
> > > > > > 
> > > > > > Signed-off-by: Richard Purdie <
> > > > > > richard.purdie@linuxfoundation.org>
> > > > > With back port to warrior and Thud too?
> > > > Yes, we'll need to do that if we bring fedora 30 workers online
> > > > on
> > > > the
> > > > autobuilder.
> > > I know the uninative update is required for FC30 but changing the
> > > compression does not.
> > > 
> > > This question is about the compression extension question.
> > > 
> > > Does this mean YP will no longer be providing bz2 uninatives?
> > 
> > Correct, the patch should be straight forward to include with the
> > upgrade.
> 
> Does that in turn mean we must have host xz-utils?

It will mean you need a tar which supports the -J option. The tests
I've see so far suggest all our oldest supported distros do...

Cheers,

Richard


