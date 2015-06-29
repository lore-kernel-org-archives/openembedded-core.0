Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id B6EB86FA45
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 20:25:52 +0000 (UTC)
Received: by oigx81 with SMTP id x81so126475783oig.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 13:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=RWpsZ7RmPqN4Gk575FdajwASvfsi2cqOrmSJ/cGStDA=;
	b=cTbQIWclMMu7djX0n7zfc1MM4UbBV4QekofxNxcEbQD3h4ubAi45PfaFZ5KVx20MX7
	VVCBMeqjapkAyINl7gEgHDgxS2c/bztsUPzTV0gK+iQeBDctIaKy/inIswx4TU6mRgQ/
	ysGtCqMnpbABVus7ENzXZ5kHX8hk1TtFfvPsghylzkmCCpIl14W/xrcFDQalNWVbmidp
	a+jeOTl+4Z4DEW+71ukcETwsuQ5md0S526q50RGfSkoKOK9Zah67PpoJk3SJXoRccgxo
	OXOzpymVfxhPCb+EG9R3UNM0JHbHYfz3Xdg7m0AB13V2a2By3bEHqRGEaZ1I4Ee0YMuU
	mZCA==
MIME-Version: 1.0
X-Received: by 10.182.87.36 with SMTP id u4mr13355026obz.50.1435609553174;
	Mon, 29 Jun 2015 13:25:53 -0700 (PDT)
Received: by 10.202.64.130 with HTTP; Mon, 29 Jun 2015 13:25:53 -0700 (PDT)
In-Reply-To: <1435573194.3287.13.camel@collabora.co.uk>
References: <1435486480.10583.85.camel@linuxfoundation.org>
	<1435573194.3287.13.camel@collabora.co.uk>
Date: Mon, 29 Jun 2015 13:25:53 -0700
Message-ID: <CAJ86T=WvDKfhK_DTcZmBEZkuTJ-bQWTKqmR8bCak6tr9vkKwuw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: fido status
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
X-List-Received-Date: Mon, 29 Jun 2015 20:25:55 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 29, 2015 at 3:19 AM, Joshua Lock
<joshua.lock@collabora.co.uk> wrote:
> On Sun, 2015-06-28 at 11:14 +0100, Richard Purdie wrote:
>> I just wanted to let people know what is going on with Fido.
>>
>> Joshua has had a branch in testing for a while. The autobuilder gave
>> mixed feedback for it. Partly, there was a problem since we'd
>> introduced
>> a new autobuilder (Fedora 22) and this introduced some problems with
>> subversion-native and gcc5. Partly there were also networking issues
>> on
>> the autobuilders related to runqemu.
>>
>> Thanks to some help from Michael, we've tracked down and sorted the
>> networking issue (we hope!). I therefore took the decision to merge
>> Joshua's fido-next branch myself, now, with the addition of the
>> subversion fixes to the fido branch.
>
> Thanks for merging Richard, the number of patches was starting to get
> unwieldy so I'm pleased to see this happen.
>
>>
>> I've triggered another build which is underway at the moment and I'm
>> confident the result should be reasonable. What I am expecting is
>> failures for oe-selftest and for nightly-aarm64 and nightly-mips64.
>> There are fixes just merged into master which resolve issues in all
>> three areas, I'm hoping we can queue up a fido-next with those in and
>> get fido building green quickly. Those issues are less of an issue
>> given
>> we know what the issues are and they are testing issues, not 'real'
>> bugs.
>
> Your prediction was very accurate. I've merged a bunch of fixes for the
> issues you highlighted (and a couple of others) into my fido-next
> branch[1]. I shall endeavour to get this tested on the autobuilder and
> submitted for merge over the next couple of days.

One minor comment on the patches already merged. This change:

  http://git.openembedded.org/openembedded-core/commit/?h=fido&id=f46c2ac0fd05f0e10258d8f03bfb2ebd0c2bcbe3

was reported to cause problems for multilib [1]. It needs this follow-on fix:

  http://git.openembedded.org/openembedded-core/commit/?h=master-next&id=78a0e916882a747c267808c08ab8bc615198b5a8

[1] http://lists.openembedded.org/pipermail/openembedded-core/2015-May/105351.html


> Thanks again,
>
> Joshua
>
> 1. http://cgit.openembedded.org/openembedded-core
> -contrib/log/?h=joshuagl/fido-next
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

