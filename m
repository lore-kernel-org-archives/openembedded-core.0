Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 124BC6B6D1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 16:50:05 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id uq10so4518193igb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2014 08:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zAcgpPUCUsRZ705j9AKXiePdOZFtIGzWWkKheConpPQ=;
	b=Ome//wWw4GTzoXw/WJiYxZ7C+XMeXR5PGQT2Dyp4+uq8KpKXzQHm+dj3BX1BDQshBU
	32XVs82THA8LzKCpifdRTzc9LLLEsNyTXNSAU0DZdgYkKtUNFE1kZ526VE18NubFnstb
	UniANJaZpN4FrAE4EIfBi+PoZavnR6msYn6ithcF8UJ2ICCcD38pMPXgZvCIxNbZH/hL
	FY922za6oIQ4U9Xllgjor+MFyklFMsyDS1w6EYZTtpqqIeLroES/srivpNSojHRmXqrj
	xZXa7r3srAln39uqb3DwjZ8GMS5svdm9O61woT8DKZEKDuhd32WL969uFpZQ1aB+WkKX
	RD7g==
X-Received: by 10.50.79.138 with SMTP id j10mr13051705igx.2.1391446206163;
	Mon, 03 Feb 2014 08:50:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Mon, 3 Feb 2014 08:49:36 -0800 (PST)
In-Reply-To: <5994492.lfGcDNr6jJ@peggleto-mobl5.ger.corp.intel.com>
References: <cover.1391054829.git.raj.khem@gmail.com>
	<5994492.lfGcDNr6jJ@peggleto-mobl5.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Feb 2014 08:49:36 -0800
Message-ID: <CAMKF1srJGVP2jDMCFOybHyzjX8XqBFe5Gmh-piSFr9z2nwoqCQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Scott Rifenbark <srifenbark@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/15] Add python 3 support
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
X-List-Received-Date: Mon, 03 Feb 2014 16:50:05 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 3, 2014 at 4:03 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Khem,
>
> On Wednesday 29 January 2014 20:12:24 Khem Raj wrote:
>> Post V5
>>
>> Upgrade to 3.3.3
>
> I see this series has been merged at last - great! Could you also send Scott
> some information about documentation changes that we should have for this?

I will send another patch to define a python3 packagegroup and I think
it would be then
good to document how to include python3 feature in images.

>
> Thanks,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

