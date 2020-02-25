Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id EDEE76172D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 21:13:16 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id t129so168483vkg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 13:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=y5vK5RZ5+fO9edO2vs3S102BggZ72JrC3JvXn+T2RwE=;
	b=eXdl0rSU672LQcYj9FNm0rOqSWEmZ/6gVoj4TlDlIqaOSoK9jfDYuMM44KAuCIxTXf
	KZAyH638GqU38O4MCA9eJ/0LlzQor9SURiKnCJH4KE2YgkOcSEvF65OjoUXiOkrZApPA
	ZYypBza7fhmZ3JtSGZUYuNjCTkfPzkux1P/sA7CKlRhSsR7/W70zRO3n0ZnZGcVxZ+ef
	AeuNjPDR/OEqt4Fy6uU0Ufc6im+Jh1RUwhuncVoJgrQnlfdlsnr3Iu1PsE5txItU5e4a
	mxonwZIrjaYP4FY6+OlpBOtZvK4qqkOSxOPVx1GrpBrCSJwEvqq9D7SUGewM8WNMR3xQ
	JX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=y5vK5RZ5+fO9edO2vs3S102BggZ72JrC3JvXn+T2RwE=;
	b=IIvCPnqVELaY/ZpYmDokYpAJ/qIehs+wc/pwPv+6brvMOS7DUGvNso0WlWftgDufBU
	abvie4Wd2VaHFvUfqdwPPELWkE84904ZMW0YtnnakwQNzX2JbayHFgG90tbQzhhSdzPJ
	XRVKp9ffMP9HVkARmSFcYTNewpophj6cu+HjmT2QwiD9SrFBsbWNhyTxbcTDp0vGR9+q
	7uPeenZImZvwqdNfWHd65ZPm49ti/grVnmbAt/8DYBecBfXzNype3qYk4b2Y/tM+30CK
	jR8RkUzNIn6PwnVc/E4H84KYZjPN7+QBK4EebOmfjvwEU7l/OM2kKxi+BZixp1uMaHIK
	DmVA==
X-Gm-Message-State: APjAAAVHwAcgsgfFCXRLbUlqlm93v6cbodk1uxxBGcdcC/H0XAglKb91
	68dv9J6Y1YcgTL86vQ7eN+YbHUl4jBvSPhVgQeM=
X-Google-Smtp-Source: APXvYqyJHnkkihxiEUiekyBypekmK8Mwy75VWnRJms+I0hAXhhpXyf2CisG/CqTmVGrhQFxn3owNctZVn0rwV4XDFQw=
X-Received: by 2002:a1f:ee45:: with SMTP id m66mr903603vkh.75.1582665197824;
	Tue, 25 Feb 2020 13:13:17 -0800 (PST)
MIME-Version: 1.0
References: <20200221224537.4052134-1-raj.khem@gmail.com>
	<20200221224537.4052134-3-raj.khem@gmail.com>
	<CAJ86T=WpKBfD119m1G5jgW4Y1UA---WWSc0UkMfRzi8oEiwPTA@mail.gmail.com>
	<CANNYZj9XLm-OyAzMHCDauggbpUVBfnCLq1VXFZjw1eaWM0YyQg@mail.gmail.com>
	<CAJ86T=W1n2GoOa7wSdKzZ1rPOr1RkMgAH7b+CKZypXBi66HQag@mail.gmail.com>
	<CANNYZj94dRzpG+VcHEOwtgsYjm-wKj67eVmEvDNEUDL+j8gxAw@mail.gmail.com>
	<CAJ86T=WFwAXuH9Q8aK34pFcK_FV5ZCoyh3N8CPpojY3emkADvQ@mail.gmail.com>
	<CANNYZj9Wh9nwqquYq2y1F3e29CsOszkaWhn0ZEabeeN3jU23RA@mail.gmail.com>
In-Reply-To: <CANNYZj9Wh9nwqquYq2y1F3e29CsOszkaWhn0ZEabeeN3jU23RA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 25 Feb 2020 13:13:05 -0800
Message-ID: <CAJ86T=W+Fv6+MTcXBh7SWdqVbm36abPWYWmkK6FFPLhMyeP8qw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] ninja: upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Tue, 25 Feb 2020 21:13:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 25, 2020 at 1:01 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 25 Feb 2020 at 21:57, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> >> Thanks. The maintainers sometimes forgetting to reset the author was
>> >> the part I was missing. Maybe the patch checker could be updated to
>> >> check for that?
>> >
>> > The patch checker already does this too :)
>>
>> So how did this commit get through?
>
> Patch checker sends suggestions to the mailing list and doesn't block commits from getting into master-next, and then master.

OK. I suppose in the end getting this right isn't a high priority so
no need to dissect any further. Thanks!

