Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8D79C6121A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 11:22:12 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z193so20476724iof.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 03:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8i4m026VnTxb5kmiafJxlKQPLNRAjUnH2RRUO8Gbohs=;
	b=axyB5MynHoLK69IrTERBqD4NYBACz0PAd5EeW2lkmZlFVyfXr3rabAcQT2LbrZwV2P
	+0h5QXXISZniLDRYXzDoyxVXQj4GGjYnuPMxYIjDf4vfLpPcki4hPSdcU8IlFJ1WFq+M
	uc3vnNJ1q9HV6eWfF/VPygYoaQorQ7B6wAtnH3vLH3dFZsQH3YFk0S0PYNDyH9X4G+nN
	w9hjnc4XhQNytnuIrow1FQOi26laSpvvYNeJwG2TZh5z5jwqnPxgxV9gQh+l/PY7AF7v
	EUM5A6pLuYffQiNMkCJ2RUSgqd5e0NTOsb/GDWIUyEUA3RHSHHgpMaZGS8f6yuU0gTyw
	DAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8i4m026VnTxb5kmiafJxlKQPLNRAjUnH2RRUO8Gbohs=;
	b=XkMus+iijAkhPbLnq6ylmeL4DM9KaSebH6u+kUn7tBgCDrJi2e5k423EHnpuCF/P2A
	VQwIWKkyxu2Lbge81WplXfDiQLECb3zZz/WYK6mxiL5QtNUlQmmY07wWTmANjoNB9vF8
	wqeghxpk81DP7DiHy7hNvl2MWy19UFBlRaDGvnIM1Dt2k7Ms8kPzSws591rSQhzmcSNm
	yTDxApIm8NIeEAAS7egQpN1hpQNU3dcnyqQPyInsHLQKpTKu14LNNZyfMSIduy6LH2Qu
	ElVLXrK2QOC7TZthxL5kycjSJCwN+TJBGNfgQ404nwjwFReA1Fk+vYmACseHQuKk+Goo
	Q6yA==
X-Gm-Message-State: APjAAAWrUFpSj6TZtrZIAJaXiDMD+fU/3TgnU7b3lsiAqY6aGpdQRuC6
	yEaZ0CPl1McfHAd3a/BZm1hXVgdcXwGAB5ScqtcMMR9OQwk=
X-Google-Smtp-Source: APXvYqxzKCobF9W+aQS/MY+Lim19KhPgluhOji2qJUC7HWcTkShSbrG2UlY+OFc1+H2BGuIdsP3tQHku4p8Nb/HZ0Pw=
X-Received: by 2002:a6b:6e18:: with SMTP id d24mr23709541ioh.301.1580815333441;
	Tue, 04 Feb 2020 03:22:13 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
	Tue, 4 Feb 2020 03:22:13 -0800 (PST)
In-Reply-To: <CAAfyv36q3v0jLJU7yi-9Jjnx_hfNkH-+z9X+B9ebN87rYcqEzA@mail.gmail.com>
References: <CAA=hcWQVh1JoDSL7f2yXbpWBkGZkwDU=dqPxRF8Ojq_YnRoOfw@mail.gmail.com>
	<CAAfyv36q3v0jLJU7yi-9Jjnx_hfNkH-+z9X+B9ebN87rYcqEzA@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Tue, 4 Feb 2020 22:22:13 +1100
Message-ID: <CAA=hcWR6iDJ-fZrVtfiuQsM1U5q9VCW4b62qj-AJoRfp2Qo92Q@mail.gmail.com>
To: Belisko Marek <marek.belisko@gmail.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Which package for nandbiterrs?
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
X-List-Received-Date: Tue, 04 Feb 2020 11:22:12 -0000
Content-Type: text/plain; charset="UTF-8"

On 2/4/20, Belisko Marek <marek.belisko@gmail.com> wrote:
> On Tue, Feb 4, 2020 at 12:09 PM JH <jupiter.hce@gmail.com> wrote:
>>
>> Hi,
>>
>> I built the image in thud to include following MTD receipts:
>>
>> mtd-utils
>> mtd-utils-ubifs
>> mtd-utils-tests
>>
>> But the nandbiterrs is still missing, which package for nandbiterrs?
> Are you referring to this one:
> https://elixir.bootlin.com/linux/latest/source/drivers/mtd/tests/nandbiterrs.c
> Then it's in kernel (not sure if tests are build though).

I think so, I have enabled CONFIG_MTD_TESTS=y, it still does not have
nandbiterrs. I built it with kernel 4.19.75, did you mean the that
build could not include that test file?

Thanks marek,

- jh

