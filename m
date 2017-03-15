Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 60CB373075
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 03:13:32 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id n11so77708326wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 20:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tti6Zh90CI4vL8zp0eaM6jcJf0KBBeanmYcj8l/LKIg=;
	b=ssxHGUICPvJ47BR7d/L5PsQgBTMhl0dc93qYVbgWXwLP/JbOfBTesA6qKp3emEy+5Z
	fugz+daPx9ofhyjCpOQBN/u95QrvRoX48t0D2XA+NfFqRQJGxfdsilZtKGI4/domKA6k
	uNviWjc0UL08EbaNHmSgUqf8xxLOwBn1kq2vpr+s5vGJ6Kqk7/H5h8OIEWOBdgEHk5KS
	yz5DnEMqBXQplQDV8DNeur8/Rph//4TTNTfRLkID9ygRnMycitcnhV9o8mFqL8duVdw3
	F7Z7DvrWUFpXk/aSiULwIzWNhLvjqsqui3HU4d2PlZHyXKeVpKpfTa1JkGChHeqve6cp
	TW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tti6Zh90CI4vL8zp0eaM6jcJf0KBBeanmYcj8l/LKIg=;
	b=XBg5z8OQ9FaTIH8eEpuIf7W650iuo+xgP5MfxAkTrmioyr+HCDZT6BFgMcEmRKESBl
	3BsySh5gnRMm+feF+TzW67wa//VvzhV7SBEquRLFNmaxuYHMpR1q4+S7mwT1C/J2hZyQ
	52xFlvCBWhxlFEEejjeIzIyf6WMzofo0+XXZlWk+ezIFUNuXJJ9OZSihWIHpV68xZVU5
	SIfrxSnFMqY4y/W4Zv8qddsAS2Na4qdxAhdEqF6Jsfw/+byUBQKo1ukX/IeueveptTkp
	IoRXmyPydrT00lEA0Yy7qSjeNXa4Ez/K4dDgtJ+U4YhLRgF1wpfljR6PN5XDRHSHev5U
	0b5w==
X-Gm-Message-State: AFeK/H3sTwIj6wyyFGl346lVh8OhWEE+wXghJIs8pYcdzadPCRSQjdYRBuUsSbZKY+NdRGaK9I4jOnV4KtzR2Q==
X-Received: by 10.28.151.142 with SMTP id z136mr19201988wmd.20.1489547613552; 
	Tue, 14 Mar 2017 20:13:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.174.82 with HTTP; Tue, 14 Mar 2017 20:13:33 -0700 (PDT)
In-Reply-To: <42b3cca7-a268-ea8c-2e35-02c1624bf290@gmail.com>
References: <1487700290-3110-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=Vji6+uo25xxB0rir_HcCo2UzEcrmsa_q-3kdUJJUF5rg@mail.gmail.com>
	<42b3cca7-a268-ea8c-2e35-02c1624bf290@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 14 Mar 2017 20:13:33 -0700
Message-ID: <CAJ86T=Ubzmt=qDickvWDCvUwpf1T9iGTTiSVQAZcqvpCsPN15A@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2][morty] Backport image dependency chain fixes
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
X-List-Received-Date: Wed, 15 Mar 2017 03:13:34 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 14, 2017 at 8:08 PM, akuster808 <akuster808@gmail.com> wrote:
> On 03/14/2017 07:14 PM, Andre McCurdy wrote:
>>
>> On Tue, Feb 21, 2017 at 10:04 AM, Andre McCurdy <armccurdy@gmail.com>
>> wrote:
>>>
>>> Andre McCurdy (1):
>>>    image_types.bbclass: fix image dependency chain collection
>>>
>>> Randy Witt (1):
>>>    image_types.bbclass: IMAGE_TYPEDEP_ now adds deps for conversion types
>
> I tried applying these changes and they fail. maybe I can grabbing the wrong
> changes.

You can't cherry-pick the original commits directly from master due to
missing getVar() True's. The patches sent to the list were manually
fixed up to apply correctly though.

> - armin
>
>
>
>> Ping (and CC'ing Armin this time...)
>
>
>>
>>>   meta/classes/image_types.bbclass | 16 ++++++++++++----
>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>> --
>>> 1.9.1
>>>
>

