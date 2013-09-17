Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1AF0160F86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 11:13:33 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id jw12so4172570veb.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 04:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5h5wkqD6oA/O2gQDV2C2h4ow/zg12kz8Arcw3GG8sG0=;
	b=CGjZM4b0JLczL3M7PY4TofI+UE8RML1BHENhXGXLo/vlr32+/06FNp4PTHrnhTh2Xt
	bC/0DdXUnvN+88FmTaUaM7PNOjgUQ9NfAJ++RaaxnzGYUQNDn8sgb34o0LGSOQj8+PR+
	mUHz5vj+rC8MBmrrpghg/TAD5dYY+z1pgsYZIfs36myuhNy2un61k6mXfRoebRoHwAvo
	JHgO3VLcaELI2JGLnNVC4eLx5QLA/Qz012Rv+rnc3VTPhAPwKfT6Eolx4C4FH/DrtDwq
	BY0wNb78I5HyVoxSOFuZZg1LnwGME775PHmP/RYMs+GZ8Xf4PuLrmMm1z32OKDDnU4Wy
	NF5w==
X-Gm-Message-State: ALoCoQnF989ZLwRRUyXJfFzRcdiDDhBDVSLB/9Cpq4/P+FpLA33I0UvNcVSh49G11K7xGHFNxPpL
X-Received: by 10.58.198.13 with SMTP id iy13mr32033797vec.11.1379416415021;
	Tue, 17 Sep 2013 04:13:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 17 Sep 2013 04:13:14 -0700 (PDT)
In-Reply-To: <5238389F.1080201@windriver.com>
References: <cover.1379329974.git.hongxu.jia@windriver.com>
	<dd0104c4f2811038c1ee78605e6b81a50045f5f6.1379329974.git.hongxu.jia@windriver.com>
	<C187B0ED-19E6-47C1-AD22-CF80F1EC19B3@gmail.com>
	<5237C039.4080001@windriver.com>
	<CAJTo0LaL_rxVQRdd8r1dkG5zV5FFLk5xBnWP34ME4P2oxu=Gnw@mail.gmail.com>
	<5238389F.1080201@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Sep 2013 12:13:14 +0100
Message-ID: <CAJTo0LYBX61vhMN81bk_A-_ahWB8kutrq2xifYVd0ezuK4LWSQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libxml2: fix LSB desktop-xml tests failure
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
X-List-Received-Date: Tue, 17 Sep 2013 11:13:33 -0000
Content-Type: text/plain; charset=UTF-8

On 17 September 2013 12:10, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> So, NAK to this patch, and a revert incoming.
>
> Great, the libxml2-CVE-2012-2871.patch is obsolete, abandon it could fix the
> LSB desktop-xml tests failure. I wll resend the patch to do this.

As I said above, a revert was incoming (and is now on the list).

Ross

