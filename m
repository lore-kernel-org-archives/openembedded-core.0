Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f47.google.com (mail-vb0-f47.google.com
	[209.85.212.47])
	by mail.openembedded.org (Postfix) with ESMTP id 545CB6B4BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 13:13:56 +0000 (UTC)
Received: by mail-vb0-f47.google.com with SMTP id h10so3136710vbh.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 06:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1DDyd+fhT93Jvv6rHQWXeUdxrSJW+gne4pzueRsxhlI=;
	b=ovKXOA8MetWId9rtfj6lh3alvfcq1WNpMfUlxxFaSwLj9pnvAQsijX7RGsCVLfOjPJ
	63teEcLY4s2yeGnCTMjfwJ06i2iYglZLwzOlZ9NOSzCQFvjVO+jsrl9Uaryf2uUJyJ3m
	FrFgDBsi9UBmDTrYSKQ0Gar8X8PGKNMumczwwmMKnaldqLLIS9yC9QzS7eMDOYgUEZmF
	C5qMIdkx5KzSGL+JzUxxQv6sOhj/sUvx7U+zDQ9lJj5zNaa/A419bovFczVD1xVNynG7
	BgLO0bNr35QGkiZ/YBr+zOKALitt8oA5sh++VLn04T5/lQ8k0JYQOcooAOZQc05vYsYt
	Jgqg==
X-Gm-Message-State: ALoCoQnG2eYypSTii5jKcX6F3KuDI12vMV2Drl1oLMpoQFGuNN3+5uxONIFGBHg8PIkIj7M4zHyd
X-Received: by 10.220.145.4 with SMTP id b4mr3917015vcv.94.1375967636355; Thu,
	08 Aug 2013 06:13:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 8 Aug 2013 06:13:36 -0700 (PDT)
In-Reply-To: <20130808130838.GC12638@axis.com>
References: <cover.1375952210.git.hongxu.jia@windriver.com>
	<9facc9593dc27237a07ebd620b9d7c9d9541f20a.1375952210.git.hongxu.jia@windriver.com>
	<CAJTo0LZgSV7RRPE6qjNp9fkRD9abiWoW6teRdYq2zBXEWdcmew@mail.gmail.com>
	<52037BBF.1030600@windriver.com>
	<CAJTo0LbxpTyZCn7wCmynEPT9n5o=iSbZcn7HMooe=mewV_fE3w@mail.gmail.com>
	<5203828E.2040705@windriver.com> <20130808130838.GC12638@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Aug 2013 14:13:36 +0100
Message-ID: <CAJTo0LbWcFaLyvDOrdrFOm7ovs2CnfJc-OeENkid=b_Z31hLbg@mail.gmail.com>
To: Olof Johansson <olof.johansson@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libdbm-sqlite-perl: add version 1.40
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
X-List-Received-Date: Thu, 08 Aug 2013 13:13:56 -0000
Content-Type: text/plain; charset=UTF-8

On 8 August 2013 14:08, Olof Johansson <olof.johansson@axis.com> wrote:
> I assume perl module recipes already in oecore are there for a
> reason, and we should perhaps avoid moving them, and just let
> meta-perl depend on oecore. Right?

Yeah.  It's worth reviewing them, but generally perl modules in
oe-core are there before other parts of oe-core depend on them.

Ross

