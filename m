Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 27E3C775AC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Mar 2017 18:59:23 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id q7so104167399uaf.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Mar 2017 10:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pPv/FnaFBexugExsKtwGEdZbZ5MWG6Xs2WGaQOQvZrc=;
	b=FJ86xCOHnDMHF7TB20lUF81ZCXs4+ONcRBWetg52b2aGwMXp6Jde5WU+GpeLhx9UbW
	qgHLg4Z43Tei7k9PbPFFIpc1xMhZfkNyWs9zPljuE6ThUmHQtDKRbBu8IXr6vUWajvT+
	5Qror6Xu3r2OSgkGWttA53XX2QMntdP7+BeTB7x5RkwwEwCgdull30UL3sLIp7dFMr7Z
	+15IWAKZr3i10Ry5/frpGRRvH6/qhlTMrh8TlGN+AHAzRr4lC4qtcwckpf7c59GNqOpU
	DVz4LO3aa1YIL8qoiBW0JMTNyxTgAbtJOhFZMAb8/E4Mqk+qhB35rzkk9Rtc0PkTfweB
	5DPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pPv/FnaFBexugExsKtwGEdZbZ5MWG6Xs2WGaQOQvZrc=;
	b=E9Hxu3czs/w3APHlncUWl1/JXvirFUdCroCz4kKrkJWpoxV4c5Asz1w3opOXWyYOwc
	JDNjiPwZ3JxaNuoaTXTFRg/A/f7CSvwpkoaOW+rfzyzpjm6fjqPRdJJwwQZy1Uq5wncd
	ZBvXdYo21uW8ADSTbdWYXRECSJHhXBOQC13PWUqL+VWySiqfTf03UNB6HFqy3ewsHZHf
	Bt0dRtG4OLOCjl6idXtv7vwQrxvOhLSPvi+BB1EQqOvOBGH0zWXFwxTsgmC/9S/2O0yX
	Ixci0ORx67vQq2bsezcOTkPiF9NRoRzwfZi/DEskNez9e4AjrAX+xi4E1l4B3zSUhhvM
	EAIQ==
X-Gm-Message-State: AMke39lhuLhexwVDRVjTJPbGN/uSgNfvAlsUjtPl0gCEekckR3fycT3Zb3MHei0Fv6CA405+tdXJ+LmJ0Tdtyg==
X-Received: by 10.176.83.79 with SMTP id y15mr3299980uay.141.1488653965145;
	Sat, 04 Mar 2017 10:59:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.39.37 with HTTP; Sat, 4 Mar 2017 10:58:54 -0800 (PST)
In-Reply-To: <1488624869.22968.8.camel@linuxfoundation.org>
References: <1488542096-23389-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAMKF1soCXsibCK37Az9MV1HMUpAK2dtWoijOxoBW25RoMhU+8g@mail.gmail.com>
	<CAJTo0LYPwxx18CtjJ_Rng28UhQAmJbMCw5=ebW2WkZmcALznUQ@mail.gmail.com>
	<CAMKF1sqB7A9m2osnv9bwywRF5hT4-oNgKU+rLNyA8SD70n8Mbg@mail.gmail.com>
	<1488624869.22968.8.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 4 Mar 2017 10:58:54 -0800
Message-ID: <CAMKF1sqth8gmzS6k13EA2Sz6r-mfextxWXxB=2rfCHw6-gfFQQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-runtime: Add libmpx supprt for x86
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
X-List-Received-Date: Sat, 04 Mar 2017 18:59:24 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Mar 4, 2017 at 2:54 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2017-03-03 at 14:58 -0800, Khem Raj wrote:
>> On Fri, Mar 3, 2017 at 2:54 PM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>> >
>> >
>> > On 3 March 2017 at 21:39, Khem Raj <raj.khem@gmail.com> wrote:
>> > >
>> > >
>> > > >
>> > > > Enabling building the Intel Memory Protection Extension library
>> > > > for x86.
>> > > >
>> > > hope this works on amd chips as well ?
>> >
>> > https://en.wikipedia.org/wiki/Intel_MPX
>> >
>> > It depends on new instructions, so you'll have to ask AMD. :)
>> OK if its not so then perhaps a bbappend in meta-intel is more
>> appropriate.
>
> Well, its part of gcc, not something meta-intel is patching in and its
> a standard which other arches can implement, maybe in their own library
> so I believe the recipe is the better place for this to live. I just
> copied the description from the code iirc.
>

I think its ok on second thought if its the case where it will be used
more often then probably a provision to be able to remove it from a
soc layer
would be enough

> Incidentally, this fails to build on musl so I've just disabled it on
> musl for now.
>

OK

> Cheers,
>
> Richard

