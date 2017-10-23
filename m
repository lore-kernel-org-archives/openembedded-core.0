Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9620960557
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 16:32:56 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id x7so17504343pfa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 09:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oTr94M0UXiLXUKZJ+RqIADplMBc2C79S8vajusOsW1M=;
	b=hAGfRRy0z5/OgiLRD946WpQUp80VaPg3bQ5iFpZ3DrTOtDVoVD5Whefbbegc2ML78t
	G9zqc+gUN0JoG7+ZnZH4O7gapzVUvZ75mLzajuex1bKqFxB+yLPnAFb9fNapwBU/eToX
	Ppxiixs7sG4S0jVSV7FDEw2kQWZHWa0K3F0kJXQ6TEtTk7S5HTFyNaiDDhT+NNfVRPjM
	7N983Vm1aYcskBvB/lShNs8DqAAMAyZRoC0enNIUShgxZ8WZDVwp+L2OtBo46yIiQWib
	JNCdok6/3iqRYiQUabFMTaPzj5zVVHR7BSnmyyogu06p5rhJrTzXreWFjjh8dSC4aR8f
	wjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oTr94M0UXiLXUKZJ+RqIADplMBc2C79S8vajusOsW1M=;
	b=Lb7GSJtzQtbxJ4dkOa375eI9KmTRL1g3H22sbJ9k7mMg8p1IKLy/C5YmvThCZKOday
	52uzzAZaaaTDmyk22K/nlDg3IddbsXqLV8ErhdnAlsPyBze4Md0AEIIgeovmlatmK2UZ
	5crdTIqZ+psv1RqbeTVhgUp6OzCdWIpZcusxS92LjOfuIl+lR5pzzSEI86HoXKyg+fcf
	K2UN7Jul4paEeltdFHUv/NIPqNFr0TIC9wJgErt4GDT/phboEUG3k3PdHqmKj80V2kbI
	Sjo7q40Jm1lsyCxmAswqNNDsdbwhM842uPgkAZQ+ghCyqYQDQAD/RLRCP9S8lkC5I1/v
	XtXA==
X-Gm-Message-State: AMCzsaVolQzPWpEfFDz6tyk7+s6FvmnME522BWROKm6DL0ruE40r5vhX
	uR1ZeIPLEB2wnbjSgEzVp2Z6y9YOKdyZrWel6zw=
X-Google-Smtp-Source: ABhQp+Th8CumLqzSiMm2SWFNRRFP0OEVWPCvVCh3oP2tTz0AKOk/Orw8gQDdM5QQiJrUdCZYKszzY8JD5H/oBV9MEDE=
X-Received: by 10.98.150.149 with SMTP id s21mr13513854pfk.151.1508776377576; 
	Mon, 23 Oct 2017 09:32:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Mon, 23 Oct 2017 09:32:27 -0700 (PDT)
In-Reply-To: <CAJTo0LaHVjE+C9mv7h8c1LQ-Sx-u5PsbxQEeDjp-2e9itvqYkQ@mail.gmail.com>
References: <CAMKF1srGH8tNmFMvqRmV0jXQz+HAVwrXYw1v6EoZQZrb_poDrg@mail.gmail.com>
	<CAJTo0LaHVjE+C9mv7h8c1LQ-Sx-u5PsbxQEeDjp-2e9itvqYkQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Oct 2017 09:32:27 -0700
Message-ID: <CAMKF1soAg8N10P-xPpdffvUoqHQjR7__j3ssxsfRik-69=bmXQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: devtool modify errors on second recipe
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
X-List-Received-Date: Mon, 23 Oct 2017 16:32:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 23, 2017 at 2:26 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 23 October 2017 at 06:03, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> I am seeing this errors message consistently since few weeks on master
>> when using
>> devtool modify
>
>
> <waves hand like a psychic>You're running Python 3.6.
>
> There's a patch on the bitbake list for this, and I believe it will be in
> rocko before it releases.

ok cool. point me if you can before I find, I will cherry-pick and try

>
> Ross

