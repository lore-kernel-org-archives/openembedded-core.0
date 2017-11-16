Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA4F60777
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 22:46:10 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id r128so439459oig.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 14:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hyLgaEdoCSW1hfDLaFa/zWlE05lxlWn/phpcEbiYeTs=;
	b=SmRJ/1G3ly5WE64GU6BEnBbeq/HJnTGBOxp6iyr5X0nU57KP+hegEEIdEYK9TkoowM
	IBPRgGQvciwaqt/Xsj90iF1zGR306UGhVPBJfWJ9iZKmsyiFVo9bvldjBYXJO3zaFvqp
	aI1Jty2Yxt+WoQXIWOghdnKY5/Bg1onTw7lkaqfJe2jS37/JY0Rvo7iw0XvEgZp0+naM
	gqvNqE1D2p1BEiOKqKyFMSpvP8rn526P6+4MDkAQXVLCRfeoTsJuTKZN1xSwcNGL55tl
	IKCdEfRBSTbelGzJBpCqKanD0HOzXP2cboFr/bXVHGA0DaHh1J7LlDeg+Xpwp4jBU3K2
	VOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hyLgaEdoCSW1hfDLaFa/zWlE05lxlWn/phpcEbiYeTs=;
	b=OQe7f7E6ofcJQJjY/1Qu6Q24uq+AQPHbw865/xRy7xRO7xtNhUL0gAxeM7cFmWbkle
	sMEqs8vWB1uKtdUsE8pdqzvTJeCCwOlofelRow6aOkkr08fj1CRE+UY1HM+qQfNOCpVH
	/59qrDkDw0KMa2BuNGUASoGRokHFF/aUPFoAiS1bu+nOJl1AItrk3EcbpKnPsymOnF0v
	2cIBC5bgjGm4pSo0viIdFFiS/7+6Lnve0ry0RfFAx7DJ7noeMqJ9N4u/qsl3xP0hZxBU
	RPS9lieqIqvWLLvu6jUaueQdFvx9tiXKaJJxiuZ97RGo69oogtWkTCymE50RALey5/as
	Ylgw==
X-Gm-Message-State: AJaThX6+hUYTpZqqCHwCq8+7cVdusDkOTUH1DH6soM/F0NWQKe8eVM5Z
	mcTGWf+T3VnQkAPnvtqgfXupijEduyuV2ejFUQ==
X-Google-Smtp-Source: AGs4zMa+KJsPA3oXVyOB2ffSe+Dj3hX9s1+uiOqMBhLhjeeHkEOxdHEoNLdIh+JbRey/3TutJyW5z1GVZcKlH7eOtgU=
X-Received: by 10.202.69.5 with SMTP id s5mr2242043oia.269.1510872371292; Thu,
	16 Nov 2017 14:46:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.74.194.14 with HTTP; Thu, 16 Nov 2017 14:46:10 -0800 (PST)
In-Reply-To: <896364ab-7d3e-45a7-cbfd-621079b79724@gmail.com>
References: <20171115203605.19088-1-george.mccollister@gmail.com>
	<896364ab-7d3e-45a7-cbfd-621079b79724@gmail.com>
From: George McCollister <george.mccollister@gmail.com>
Date: Thu, 16 Nov 2017 16:46:10 -0600
Message-ID: <CAFSKS=MR0Kd_8J+BCf63fYe0-U9h7QtNzuamhXhksByHOTx5uA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH v2 1/2] glibc: Fix CVE-2015-5180
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
X-List-Received-Date: Thu, 16 Nov 2017 22:46:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 16, 2017 at 12:45 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 11/15/2017 12:36 PM, George McCollister wrote:
>> Add backported patch to fix CVE-2015-5180 from the upstream
>> release/2.24/master branch.
>>
>> Signed-off-by: George McCollister <george.mccollister@gmail.com>
>
> Thanks for this series. I will have to wait until I address this in Pyro.

CVE-2015-5180 should not be an issue in glibc 2.25.

The CVE-2017-1000366 commits backported to glibc 2.25 are here:
https://sourceware.org/git/?p=glibc.git;a=commit;h=3c7cd21290cabdadd72984fb69bc51e64ff1002d
https://sourceware.org/git/?p=glibc.git;a=commit;h=46703a3995aa3ca2b816814aa4ad05ed524194dd
https://sourceware.org/git/?p=glibc.git;a=commit;h=c69d4a0f680a24fdbe323764a50382ad324041e9

Would it help if I sent Pyro patches for these?

>
> - armin

