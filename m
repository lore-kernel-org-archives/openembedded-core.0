Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id C969E71486
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 09:12:49 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id ft15so1005373pdb.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 02:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=qPP1T7RQUUR4uRKieWEJTZiOT48n6CuqiKY7B3nQkAU=;
	b=TNJX64Xw2xlvjIEGgjOezymNayFdYaT+sWszgmUXmYHPJTywfTbR4Kb6tBSHYJNaWT
	tldkTxkutKVzCwzgtnCXyY9SEhOOsajWYdfRcGRg8s5bhIWA79EwWOwJqqypcG42jott
	5wJUQoH8+bCDdMDZUeg//oqmUFRhqgINKKXe3QRLD4irK2WSjNsMTecFE28scSEF/VZ5
	rUy+OzIo+e0QjQ2VR9SV2d6FNsZXPs8smBP2vHe/U2mTEmKlA3o2QpRkKg+C9CDhX2NR
	BGKLNyGkgROVEdp1PY1wtRSiQ4CATwEsYAGdjIK4zfx5ff5uMjzWg7DT+wlfm11XhUPL
	Pk9Q==
X-Gm-Message-State: ALoCoQlwbGaKMMatQp8ZX/W0L40D4e5UAlZgqouM61KQ70FIIoUEbnn4eGS8hRH8qsee/DmJRIt1
MIME-Version: 1.0
X-Received: by 10.70.30.132 with SMTP id s4mr4117151pdh.96.1411031570594; Thu,
	18 Sep 2014 02:12:50 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.65.69 with HTTP; Thu, 18 Sep 2014 02:12:50 -0700 (PDT)
In-Reply-To: <CAOMwXhNBq9F45HSQj0QuXoxRe_50_9x_F42=yWe22H2_BcPV1Q@mail.gmail.com>
References: <1407438629-13369-1-git-send-email-marex@denx.de>
	<201408081422.19749.marex@denx.de> <1407752794.22187.3.camel@ted>
	<201408112026.32235.marex@denx.de>
	<CAOMwXhNBq9F45HSQj0QuXoxRe_50_9x_F42=yWe22H2_BcPV1Q@mail.gmail.com>
Date: Thu, 18 Sep 2014 10:12:50 +0100
X-Google-Sender-Auth: IQuNSc3J0NHU8UyyOU1lLajuAHw
Message-ID: <CAOMwXhMuU01dEUbFGJybyeG2dSiB3BuVvCdkSHg2tuvd+70ptw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Marek Vasut <marex@denx.de>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Yocto: Install full set of python modules in Qt SDK toolchain
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
X-List-Received-Date: Thu, 18 Sep 2014 09:12:50 -0000
Content-Type: text/plain; charset=UTF-8

I meant to write "Marek". I apologize for the spelling issue.

On Thu, Sep 18, 2014 at 10:11 AM, Laszlo Papp <lpapp@kde.org> wrote:
> Come on, Yocto maintainers, please...
>
> Mark sent this change relatively long ago, and it is still in "new"
> state, sadly. The current SDK shipped _breaks_ any third-party
> software that uses standard python with regards to the libraries and
> all that.
>
> This is is slightly frustrating. We also face the same issue. :(
>
> On Mon, Aug 11, 2014 at 7:26 PM, Marek Vasut <marex@denx.de> wrote:
>> On Monday, August 11, 2014 at 12:26:34 PM, Richard Purdie wrote:
>>> On Fri, 2014-08-08 at 14:22 +0200, Marek Vasut wrote:
>>> > On Friday, August 08, 2014 at 07:22:04 AM, Koen Kooi wrote:
>>> > > Since 'yocto' is a project like freedesktop.org your commit message
>>> > > doesn't make sense, it should be something like:
>>> > >
>>> > > meta-toolchain-qt:  Install full set of python modules
>>> >
>>> > Got it, Saul also told me so. I will wait a bit for some more feedback
>>> > and repost with corrections, OK ? Is this approach I took here even
>>> > correct please ?
>>>
>>> I'd really like to see a packagegroup defined somewhere with this list
>>> of python modules which the various recipes can then reference...
>>
>> I agree, that makes sense. Is this approach I took here the correct one please ?
>>
>> Best regards,
>> Marek Vasut
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

