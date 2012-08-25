Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T5Ndy-00082w-7D
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 23:11:46 +0200
Received: by lagv3 with SMTP id v3so1735378lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 13:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=R9RX7k7aFnwDgHvPinwc8j5IY6n2y9Nbv9GqmMmlkgk=;
	b=qZh/BnQEIaHm7MtwwTOEwbx1X9IkrM6h+N4KxSOwmRVvf7eVVLb0l+73eo0OwMKYAT
	RtxCBG9/pif1AX5EHDMi+gSxHHORVHPPeh/Qs6dsGcfoPnv3BPvDM9bsYn9P6Q6SBc9W
	eaobPNv0rS43Qu65VqIvqYGxP8BZPDzK91+txNW1hq8YcrfYOE1ZPXYl6LHHHMMvQxhX
	gjPJ0fEPaW8zsoNOBC8C1UIegu8ShuZ7xZSWO2JNB123hl7SzbKTzqfnYWOKLFaJiGed
	hHfEG8d0Ry/enmZs95HxiwEDCfmYgdwA69K5PKQLYo2FIQ/v5/leUqA1nPG3/55cvjOq
	zg4g==
Received: by 10.112.100.65 with SMTP id ew1mr4384752lbb.16.1345928376812; Sat,
	25 Aug 2012 13:59:36 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.19.2 with HTTP; Sat, 25 Aug 2012 13:59:16 -0700 (PDT)
In-Reply-To: <CAMKF1sqsvRFa0iC0p4RCaCkQ+swt6E1YiSc5UYXEZT8tBN2FDw@mail.gmail.com>
References: <1345913213.14369.131.camel@ted>
	<CAMKF1sqsvRFa0iC0p4RCaCkQ+swt6E1YiSc5UYXEZT8tBN2FDw@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 25 Aug 2012 13:59:16 -0700
X-Google-Sender-Auth: WMuBbi2CEvaPl9By5EU3ZYthEp8
Message-ID: <CABcZAN=D_+VE2H_P6Bgs5BoWcfOXrENeXfxirMa-kBsGH9yRZA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Heads up: xxx-nativesdk -> nativesdk-xxx change
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 25 Aug 2012 21:11:46 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 25, 2012 at 1:25 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sat, Aug 25, 2012 at 9:46 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> As was previous discussed on the list a while ago, we have a problem
>> with nativesdk where the code is getting complex and convoluted as its
>> simply not possible to automatically "extend" using a suffix.
>>
>> Extension using a prefix works comparatively well be comparison as shown
>> by the multilib code. Its for this reason I'd like to switch the
>> meta-toolchain nativesdk recipes to become a prefix rather than a
>> suffix.
>>
>> I'm going to propose some patches soon that do this. The patches are
>> fairly nasty to write and maintain so will need to merge fairly quickly.
>>
>> If anyone does have a strong objection to this change, now is the time
>> to raise it. I'd prefer not to have to do this but having considered all
>> the options, its the best thing to do for the future and will result in
>> cleaner metadata (look at PKGSUFFIX in eglibc for an example of how
>> messy this gets).
>
> I think we should then also remove prefixing others too for consistency
>
> its hard enough to get the OE terminology to users for gcc and
> gcc-cross and gcc-crosssdk and so on and now we are creating an
> anomaly here. I am ok
> if call it cross-gcc and crosssdk-gcc and native-gcc and so on. That
> will make it consistent to prefix everything then

I agree, I think it'd be nice to just bite the bullet and change them
all, if we can manage it.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


