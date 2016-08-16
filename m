Return-Path: <ulfalizer@gmail.com>
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id DB6EE7318F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 15:56:09 +0000 (UTC)
Received: by mail-ua0-f171.google.com with SMTP id k90so128630823uak.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 08:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IDE7JtuRgrd1H/CSUzTamDhwxMa9o8ugisojMOggtqA=;
	b=SuMPNkl+GdXbnctTdUaN9Rifd/mZ+gE2CkRp9x+50qs+Jl8NXVop0AyCxNAqVBkTGd
	sIG2S4FIKInGkaZa1SvnScSaHtZ+ReQ1OQmpAKg7kUu4yN13bOxn/nsW2O1hvwn+lJR/
	l5G8WrcauvD6ulkWvxcemrIED5tAQ2VfQs5Pb+E6h/fzemotbLQsHypUye/28srMKm1S
	fSwwOGvijcVZPG19P8iyxbS1Y5yKgC9pXXvNtoj/dvw6FoIGEBQXmobiTkVp8VfIODJ2
	eabepdql+dIhtyj2IT1PD4wxlyAQ/ABtEwRsIOos0vIo7sU27wJwQRRqAiHADCjKPH9o
	FOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IDE7JtuRgrd1H/CSUzTamDhwxMa9o8ugisojMOggtqA=;
	b=IZlVzW+FD3BR6yNCqqFpK/UUZd8iFHV8gjg/5k3RqlRiqlQo66yo2ur6tMSAu0fiX/
	Ue6I3FRefUWrY4Kz1d/ScqOBFqvbK5Eeurf4AwrYKUDYQ3qcV69xTYhLjw72AgnNjl0G
	rsG7ilTDuZhlNtT3na4HfJ/qA/mSriCfRDiq8fLuVHB6w7QmY4LbKrei9BRUNHPwADhT
	Bk2BSQDJ25f5qD7/75TJ7dJFnHfwS6G46DpSL7ZPNRwJ/xyNYGI54NKQpRtKsIIezC3i
	KddsPCiR+0hc0Dc8Ru5aES69R4GwBcjAKNpNzD/gupeHMPX5TGmBTtIaVVnCZFRwPioy
	Mk2Q==
X-Gm-Message-State: AEkooutGzfVsYuaLqYldxzWLiGaCULpon6uc6MmXg02P85Y5PV7s3VwlO1qonZXuj6kIpYKPNe1TLkw7pvexlg==
X-Received: by 10.159.37.106 with SMTP id 97mr5784586uaz.27.1471362969808;
	Tue, 16 Aug 2016 08:56:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.124.70 with HTTP; Tue, 16 Aug 2016 08:56:09 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1608161147270.9338@ca624034.mitel.com>
References: <alpine.LFD.2.20.1608160956340.7804@ca624034.mitel.com>
	<CAFkk2KRY=fWTOSUbxV_gm-np9r=4JBrsQ+Zy0FZb0H4Gbhfd+A@mail.gmail.com>
	<alpine.LFD.2.20.1608161147270.9338@ca624034.mitel.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Tue, 16 Aug 2016 17:56:09 +0200
Message-ID: <CAFkk2KSVc3rqAieBHzkayJQT7YHxJhYoD0PSqp-YFL0CYMLkvg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: subtle weirdness when you combine "_append" with "+="?
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
X-List-Received-Date: Tue, 16 Aug 2016 15:56:11 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 16, 2016 at 5:49 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> On Tue, 16 Aug 2016, Ulf Magnusson wrote:
>
>> On Tue, Aug 16, 2016 at 4:02 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>> >
>> >   was about to submit a small number of patches to clean up redundancy
>> > when people combine "_append" with "+=" (because it offends my
>> > delicate sensibilities), and ran across this in oe-core,
>> > unfs3_0.9.22.r497.bb:
>> >
>> >   DEPENDS_append_class-nativesdk += "flex-nativesdk"
>> >
>> > uh, what?
>> >
>> >   most of the time, i assume the above doesn't hurt, it's just ...
>> > silly. but normally, with "_append", you *need* to add the leading
>> > space explicitly, and that's not being done above. so does that mean
>> > that combining "_append" with "+=" *does* generate a leading space?
>> > that just makes my head hurt -- the possibility that "_append" is
>> > being used in a way that normally makes it fail, only to have "+="
>> > step in and save the day. at which point "_append" saves processing
>> > that until the end of parsing? yeesh.
>> >
>> >   thoughts?
>>
>> By the point the += is handled, the override won't have been interpreted
>> yet. My guess is that += fetches the value of the variable
>> "DEPENDS_append_class-nativesdk", gets back the empty string, and
>> adds a space followed by "flex-nativesdk" to that.
>>
>> The resulting " flex-nativesdk" is then interpreted as usual when the
>> overrides are handled.
>>
>> You might like the note I added to
>> https://www.yoctoproject.org/docs/2.2/bitbake-user-manual/bitbake-user-manual.html#override-style-operation-advantages
>> by the way. :)
>
>   that note is pretty much what i've been whining about for a long
> time. :-) in any event, when one sees something like the above:

The intent of the note was to discourage use of '+=' together with _append,
because it's redundant and potentially confusing. Do you think it fails
(even in context)? :/

>
>   DEPENDS_append_class-nativesdk += "flex-nativesdk"
>
> what is the *proper* cleanup?

I'd say the following:

DEPENDS_append_class-nativesdk = " flex-nativesdk"

Cheers,
Ulf

