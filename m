Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 774A977B6B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 19:26:27 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id u1so20197672wra.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 12:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=poVIKtMOFvi+E1nGIKhVNdvSO9ZLKaRX2dQQmm8ok7c=;
	b=iqjXzEqb+dMDjaEwhb6h9LeoPhklM7UHSGlwaU88gFdiGW7UY4m/dSWBuJ87VODbF3
	AQgDM+7etpdLCIR2CLUtu1I9H1avTDv9GxOmP4caYTqfigjMUTYfVW2tfiWu1wbj5vQm
	gPiEd7rEkQxHuszp0twBEaWnYCuBKMwuGBFawDUZl1Ayaf700Or7X8Yb96lZgvgv2cx9
	KW1sKW8nduh1MWbj0MWCIg4f1HH4bFhNge/+Zn1hQWdurdASRUfH5Z4Cb1MJr3W6czPH
	gBBks5MRuiQNUextyybFGR5yg0eYhb4PzuvVo2Mmlo8thwhtccGd8qOjEqlTzja+1W1v
	E7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=poVIKtMOFvi+E1nGIKhVNdvSO9ZLKaRX2dQQmm8ok7c=;
	b=bKJLEVN6SZUB77MiI4zgQZCUWBfL2t7ny28h+EETbxxUIB457ipwLXrCGstglMjmOO
	Q+sJxh6BWwAGVqsBPPo3sb9Lsk33mSX9hQVD8nW+3Myi37qHsesVlREWjgXMpZIA2ngP
	8tdPogCGLlkpHF4n5IYI+kkTP1TUKjJuj1IgDYHCbTRH+QYjLJd/ElpbVotzFGKK1D3W
	8oXDgp4gdBqtld3dterWJBGNE4x+UFQFFI3IDW+JjGtCnS2rHSc6M13ANfJVWoEIc/fX
	AOzGTCQ6ITvv30zJDN0k9haMpPJcjUDFC2zQjCp0ZsMcX3CG7G1GFwV1KeBPcItmJJnK
	T0Sg==
X-Gm-Message-State: AFeK/H3FJNe718FUEIhyCGBmP9k81FGnRHf512U3m9v9NLdgSJ4P8KvI4KAxJ9a5HwgPRpDT1MHHJy8rgvS7cA==
X-Received: by 10.223.152.215 with SMTP id w81mr4513917wrb.151.1490297188109; 
	Thu, 23 Mar 2017 12:26:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.152.55 with HTTP; Thu, 23 Mar 2017 12:26:27 -0700 (PDT)
In-Reply-To: <1490296143.6396.253.camel@intel.com>
References: <1490222875-16219-1-git-send-email-armccurdy@gmail.com>
	<bca89655-d4fd-d6ea-74c7-9f6050473b89@topic.nl>
	<CAJ86T=USCOn32KPsH1TURbJL671wPwGXLBeajkL06wyvs4Q0wA@mail.gmail.com>
	<1490296143.6396.253.camel@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 23 Mar 2017 12:26:27 -0700
Message-ID: <CAJ86T=XroAvBkQScEm80TT0Nc8tjkHs6dEw5PSae3NEP5C=fMg@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] native.bbclass: clear MACHINE_FEATURES
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
X-List-Received-Date: Thu, 23 Mar 2017 19:26:28 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 23, 2017 at 12:09 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Thu, 2017-03-23 at 11:59 -0700, Andre McCurdy wrote:
>> On Thu, Mar 23, 2017 at 2:06 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>> > On 22-03-17 23:47, Andre McCurdy wrote:
>> >>
>> >> Try to avoid native recipes accidentally being dependent on
>> >> MACHINE_FEATURES. This simple change doesn't prevent MACHINE_FEATURES
>> >> set via MACHINE_FEATURES_BACKFILL sneaking through, but it's better
>> >> than nothing.
>> >
>> > Maybe this would work:
>> >
>> > MACHINE_FEATURES_BACKFILL_CONSIDERED = "${MACHINE_FEATURES_BACKFILL}"
>>
>> I guess it doesn't work if MACHINE_FEATURES_BACKFILL_CONSIDERED is set
>> elsewhere using _append.
>>
>> The real solution would probably be to skip backfilling
>> MACHINE_FEATURES entirely for class-native?
>
> Perhaps set MACHINE_FEATURES_forcevariable = "" in native.bbclass?

Over-riding MACHINE_FEATURES doesn't work, presumably because the
ConfigParsed event handler which does the backfilling runs after
over-rides have been applied?

> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>

