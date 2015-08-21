Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id EF67960557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 07:13:43 +0000 (UTC)
Received: by obbwr7 with SMTP id wr7so52180539obb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 00:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zpe5xQW8hRqidmpIgjoUXb1u/XBxi2jlDgqs7DPaJWw=;
	b=SrzrKu6stO2Evi92q4cNSRJb/UNQQEoG3gJw4IeAInFUeIZuai6iHnjIPL4XPlbwtv
	titlELrRztqfW4mzWWsihV5TgEqJWnCWRW/J95UcYF3xM/xvG6web8d7t/GUTvLvgOTn
	giDctuBvRoIWuWaBemprDkG5gFBjovV7UbxejnDy8bBe81nD+d8G1Kh0Xz+JjiQf5aad
	yQVZKxrxmdFgaIGZNIAcYhEGaoLwwSxQ8MiB17sbqN35YB5DTdd6XZILUwuwztJcCo70
	2nLUY2N9knhlyCyEM+d4x3NRU9j3nOmT3I7hstODF5ADszZfPoi02I2ZacoqPOtiSm+J
	HfNA==
X-Gm-Message-State: ALoCoQmhBhE1SRumFTk4FKKSd6bYJXrDcd4Ezr27v0OtDTc1lgugNv1BlYnX3z17DN/TKL2n8JOl
X-Received: by 10.60.145.134 with SMTP id su6mr6474874oeb.22.1440141223992;
	Fri, 21 Aug 2015 00:13:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.70 with HTTP; Fri, 21 Aug 2015 00:13:14 -0700 (PDT)
In-Reply-To: <CAHiDW_E2xi68qwAikPy18aQw-r-Ue5qU8v8pApUFiPX37gLMTA@mail.gmail.com>
References: <cover.1440070230.git.jussi.kukkonen@intel.com>
	<53a7964df547908768b1554486603bb4f0d9830e.1440070230.git.jussi.kukkonen@intel.com>
	<CAJTo0LZgiz9jVRwkyZpAVxv50EwEo=BDBUb0U7M4fBxZexkU-g@mail.gmail.com>
	<CAHiDW_E2xi68qwAikPy18aQw-r-Ue5qU8v8pApUFiPX37gLMTA@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 21 Aug 2015 10:13:14 +0300
Message-ID: <CAHiDW_EXD+BsVgfz-7sFUDPfStDiA4eW1FMz1HGqQFiy0v69Zw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libical: Upgrade 1.0.0 -> 1.0.1
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
X-List-Received-Date: Fri, 21 Aug 2015 07:13:47 -0000
Content-Type: text/plain; charset=UTF-8

On 21 August 2015 at 10:08, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
> On 20 August 2015 at 19:11, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 20 August 2015 at 12:39, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>>>
>>> +inherit cmake perlnative
>>
>> Why perlnative considering it doesn't depend on any native perl modules?
>
> It does some fairly simple header autogeneration during build (see
> src/libical/Makefile.am and scripts/). As far as I can tell it does
> not require modules other than core -- but I don't know much about
> perl (especially in OE build) so let me know if there's gotchas I
> should look out for.

Sorry, not Makefile.am but the cmake files under same directory.

