Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id DDC256116C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 18:52:55 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id j107so6802538qga.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 10:52:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0T94qvmEOGJYM68UHQAaGgTb4fGfwFKRWXkIHgFqpNI=;
	b=JLnE4ck83wPIG7asQedCZtYP1ecPCEcEgkwNb2Xq4pZIu5ww+K2pj0h5nIt2qfKHSt
	w01/Wo9QpfXUdpBGUF/pb5R0G1PWpoHjEbg1EFK1TN0YEHXwHQ0SdQfpS/BqMcbSqkX3
	BqLI5E6PdEMxeB9mFZqrNKaGa1clyvc78/43lZmWgwgMWoIF//+l7eBClSVQBa7reW6/
	nRNG9voitG+qAiwxBnWJPiiPNtlkPdPGcIhoOfX5kGB35ckRBVLdPI13Pd/RJ/AkCwg1
	Pow3qo7Giewm23F1QMMTsgW7ZjhMADJGaYMORTSR47cC12a2+c2jhFn+xdsPQndqJ3Gp
	b5Dg==
X-Gm-Message-State: ALoCoQl7Byq3D+AsVoBrxQeIvV+wky+m021Bwwv7AQhpf2riHFIRhCBRwkCkSTg3i7IQ0v1BCdI5
X-Received: by 10.224.98.139 with SMTP id q11mr19166144qan.64.1393527176048;
	Thu, 27 Feb 2014 10:52:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Thu, 27 Feb 2014 10:52:35 -0800 (PST)
In-Reply-To: <1393524104.31769.148.camel@ted>
References: <1393524104.31769.148.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 27 Feb 2014 18:52:35 +0000
Message-ID: <CAJTo0LaG9SeGd2Pi3-dksPd_FHH4TEWK2MGJU-d=2kte6aTg7Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools-brokensep: Mark recipes with broken separate build dir support
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
X-List-Received-Date: Thu, 27 Feb 2014 18:52:57 -0000
Content-Type: text/plain; charset=UTF-8

On 27 February 2014 18:01, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> +inherit autotools
> +B = "${S}"

Why is this preferable to directly setting B in the recipe, which
seems more obvious to me.

Ross

