Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id D3D767833B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 19:19:13 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id g6so2193385pgn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 12:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V8nZGElakC45RkH2/0Nz8nvvLJMVImbgTIxe5s3MuyI=;
	b=RkBeDKZMnIpfh20hvtXjyRt8a6zmycaIFG/2vdsefeVH2hCuNQ1rPop6Lon2KMt0XB
	/B+kwQVgfTyQBG0KziB3sGq17SoQHc2PTx1aU+uLrDAGpi8oeSJAKLocvmP5OZj2SsYi
	RSmSWrokRmYGhxVr+0ntAG5ru2+x65p8xkyp5ZemjFqC6UzAq22cogcdBn7UGCLeVQIA
	YOM7of9/5yBSV7jTud4Lb6GTPc6E2ayRzUOg5tZYogT4u3NekdUSVLqN0j1EP7twhyuk
	PLjzluP1rBA+1wC62rUhB6pl1YO7jK1ibAftkKc7AfELYoU3yabhVCsqllaIsNlmi8lb
	YS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V8nZGElakC45RkH2/0Nz8nvvLJMVImbgTIxe5s3MuyI=;
	b=KpKDl2GMfm+imBNloElou3p9f212gEQEDSrL+ubiKTkvJLeMYROWpgXxt9a94ceZo0
	87OjkrDiuVqwBb+3RL+zWTG8w9tvs1UvpyArn6udsQoLEmUG64XrxT+InhqOddk/ItTL
	kVRxFen+rr4BCKrUq1o+ubRqWlebn1zkaksNpXow2OQ9zweaf0CCJg93aRnelhbbJFGQ
	IBj6grLvDWSVtuoVw1lnJFL/PvTH4Bn9xwHV2LJdx6mHsDZPt0ggi0TNJiQXpeQemeCF
	rREK+pT4JTNlJJHH3XcqQV11LW1LGlSR8bLeYsCYgzTFTBulERVUjfUv+46R5YfWjjPG
	+rfA==
X-Gm-Message-State: AMCzsaWKSbHlXXM6p2NkOmC/+XgLnuzazRR5CeNbkB7LKDIV/uj1wWdD
	xqf97h5XBk/tmXn1TEFPzpJLrzwylMAt2qDCQco=
X-Google-Smtp-Source: AOwi7QB2l1uFkfwshKtmDRcYPggPQz6YDgp1e/Q/OOIuS7bRXnLJ3evh6JAd8xaMbgJ3ta3ogbZxljIbjQDW0HsNutY=
X-Received: by 10.98.150.149 with SMTP id s21mr12510596pfk.151.1508267955021; 
	Tue, 17 Oct 2017 12:19:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 17 Oct 2017 12:18:44 -0700 (PDT)
In-Reply-To: <CAJTo0LZkxMoh3K0xH+HUyUG7=-qiO8odyU7EgxDeM5N4sRZUbg@mail.gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
	<20171014154858.35123-4-raj.khem@gmail.com>
	<CAJTo0LZC2At7Jnni1eLBTXyAdWsNVf-ynAVX8thc1EOujnsRuA@mail.gmail.com>
	<CAMKF1sov3p8viw9h1SjNF9Hyz0X5LuMqbJ4JnyFw-7HHxnKTLA@mail.gmail.com>
	<CAJTo0Lb81WDPU5mFKi+5SJkuqXDgxFEwnD2LLCMk+T24_M7nWg@mail.gmail.com>
	<CAMKF1soaVRfyvgYcZy2TSfjgOT+Er4eB0kCKtWd0_wqbZwH17w@mail.gmail.com>
	<CAJTo0La7zp9_dPd86X87QVuq7cS0SVZz05E==ryzJTXdPWfd=Q@mail.gmail.com>
	<CAJTo0LZkxMoh3K0xH+HUyUG7=-qiO8odyU7EgxDeM5N4sRZUbg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Oct 2017 12:18:44 -0700
Message-ID: <CAMKF1spfUMu1cB4rQ63thmzkh0bCXsH+RbfHq-HEP_vvv=v9Kg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] libevdev: Add dependency on libcheck
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
X-List-Received-Date: Tue, 17 Oct 2017 19:19:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 17, 2017 at 9:46 AM, Burton, Ross <ross.burton@intel.com> wrote:
> I can't replicate with pkgconf and with check installed on the host.  Can
> you actually replicate this?
>
> Ross
>
> On 17 October 2017 at 17:32, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 17 October 2017 at 17:29, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Tue, Oct 17, 2017 at 9:25 AM, Burton, Ross <ross.burton@intel.com>
>>> wrote:
>>> > On 17 October 2017 at 17:24, Khem Raj <raj.khem@gmail.com> wrote:
>>> >>
>>> >> On Tue, Oct 17, 2017 at 5:41 AM, Burton, Ross <ross.burton@intel.com>
>>> >> wrote:
>>> >> > Curious how you hit this with master.  For me:
>>> >> >
>>> >> > checking for check >= 0.9.9... no
>>> >> > configure: WARNING: check not found - skipping building unit tests
>>> >> >
>>> >> > The configure script uses pkg-config so shouldn't be picking up host
>>> >> > binaries.  Can you dig a little?
>>> >>
>>> >> do you have ptests on
>>> >
>>> >
>>> > Yes but libevdev doesn't have any.
>>>
>>> and I am using new pkgconf
>>
>>
>> Ah, let's see if that breaks it.  Do you have libcheck installed on your
>> host?

No I dont, but now, I am unable to reproduce it in configurations I
had. It failed in
one of world builds and logs are overwritten so no way to look back.

I will revert this locally and wait until it happens again.

