Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id E36A77829E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 17:15:17 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id v104so144086301wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 10:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dLj8rOJaNLSfn/nq6cLesAGQm8CKFpP2qT7GrtEO0Uc=;
	b=Ym5lOQV4mDgOoqDHv76GoMmqO+RkYbAbt3qGkZL3MbRM+T3K1NXc+WUbD4C3l3UhfR
	WScqlU8CvVyq04rydHlJXqmq+jsjnrZ4VQ+hMum1bAaVTuFpHee612ecJ3zKnUcHFBGs
	bMpNaRLUDuw5Pf3i9AqxSB1OUHFHiEklI3NlAMbP4KCZdBNqnnydGYPimi2ZCcGZKm0q
	ITf5ZcD0xQvUDdWBSwviFoIqbvGJR7pzHWm7VPw9aUh6t3uWHIKMp4UXbcLFjRM2MsEs
	k/IY+Mb4PBtJhwnpAlSLjqodVls4nHitLKU6dwbcNVZRJ+Y8jbeNiuW63KCOgVo6IV5Z
	dZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dLj8rOJaNLSfn/nq6cLesAGQm8CKFpP2qT7GrtEO0Uc=;
	b=ipbheA9AtiZUab4IfUhiAAKHE/j8FQknfGU+5I92PNwbQeIAxrEyRj+sro+kPJazAP
	EFFb472xMDgSqoJa/n48ZYfkqOz10LfyM+d14/zEo4mKiUjIQX0757JXB3hicTpBfKia
	AclGetOoWtVlKn4l9VHXHS9+56Qc3mSlW2R58HHsEwDGWIYyg/zS5WeqMLkOeSQ0p5qk
	wE5+zEY/nYXHFivdrz94FEa6ua2Tidafzzj6MbXHvsGcRaygJ2LjvJiw+fHONDtXVHjv
	B/r140tEhKxng1ghzOnekkTG1ICP5cwPWL2YRsxCNQG47QtY1YQhdHQRNh0RhVVBuInd
	W7yA==
X-Gm-Message-State: AKS2vOwLMJ8tJSEne6dJNm/Lii6j1rbOKW9sN2w5LSavM2qHmGnTdRQQ
	yDnsaVPStb44hkATQNcNdCQL/h1IeA==
X-Received: by 10.80.171.197 with SMTP id u63mr697622edc.127.1497374116673;
	Tue, 13 Jun 2017 10:15:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Tue, 13 Jun 2017 10:14:46 -0700 (PDT)
In-Reply-To: <CAMKF1srN+hjKPreaiBHo8v-oJy_0ZgZ2FfzfM3DZU2z4ykNOVA@mail.gmail.com>
References: <cover.1497279306.git.raj.khem@gmail.com>
	<a89c0a82e00721ba4063c9197e0951d1d63c7e40.1497279306.git.raj.khem@gmail.com>
	<CAJTo0LbO4-dU4-=JTc2akzCQ_PqKzB7fTUtwPmA2-P+CaVyxEw@mail.gmail.com>
	<CAMKF1srN+hjKPreaiBHo8v-oJy_0ZgZ2FfzfM3DZU2z4ykNOVA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Jun 2017 10:14:46 -0700
Message-ID: <CAMKF1sp5G_-jSLkujf9hXeb+dT-iTfs+tuu2C=SjLS-sG2sKeA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] ovmf: Update to latest
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
X-List-Received-Date: Tue, 13 Jun 2017 17:15:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 13, 2017 at 10:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jun 13, 2017 at 9:43 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 12 June 2017 at 15:59, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> Fix build with gcc7
>>>
>>> clang can not compile it therefore mark it gcc only recipe
>>
>>
>> This doesn't apply to master, can you rebase?

applied the rebased patch to kraj/pu

>>
>
> ok.
>
>> Ross

