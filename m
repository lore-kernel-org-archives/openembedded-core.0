Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 71F6F60034
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 23:56:46 +0000 (UTC)
Received: by obbgp5 with SMTP id gp5so27581374obb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jul 2015 16:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jCtSoxyoWZzjUDvGArauswUUIhS0m3Re4HFSYLWQifE=;
	b=rqdInI53GucgQL3H78tVBX8e9ChqErBFh8yFedhtGKdHYBGTYp9Ssva6n76lro4gE3
	0hYJzr1jPNhEtnLB/6ToCghqwxrnO2R8czdomzWCh+fzj8UjnsUFJgM39grM8tV9tlFh
	lOSSIiOlqLmpftjB/ph6Hikzlj82uAMP1C3+agTru0WSO/OF5n2TfRfE+HL5vwh3M9eL
	WLzDZERrbwOf2Tc/wij2GDnKB3Hum/lvY2xOiEGCqUIREKZhhBJyuVxl/DUKKQF1PLhH
	7Ev0Cn5s4ryq4gex7teL9hQkUAtOZ4TndpAPoefjuLPGKpDywZV63s5Zm7uGtyktpx7I
	htTA==
MIME-Version: 1.0
X-Received: by 10.202.94.215 with SMTP id s206mr6396321oib.15.1436313407063;
	Tue, 07 Jul 2015 16:56:47 -0700 (PDT)
Received: by 10.202.64.130 with HTTP; Tue, 7 Jul 2015 16:56:46 -0700 (PDT)
In-Reply-To: <1436310276.27597.198.camel@linuxfoundation.org>
References: <cover.1435497302.git.akuster808@gmail.com>
	<6769ffd59132415288582211bed1c32739a52430.1435497302.git.akuster808@gmail.com>
	<CAJTo0LZ58Ojrb=9ctie+VvB7F9BQJHSKsVghsSgedSn0EbnRQg@mail.gmail.com>
	<55956F2C.2040301@gmail.com>
	<20150707053411.GA17548@ad.chargestorm.se>
	<CAJTo0Lb87w=NO5o-0_vcz29UO0JrVTahEg5c1VhQnVDNCma2wQ@mail.gmail.com>
	<559C320F.4020707@gmail.com>
	<CAJTo0LYLzjMAWYJQH3g0sGzZgdPtPXjthJCAgVuh=ux1mgm5Kw@mail.gmail.com>
	<CAJ86T=Vb889E6fcJJyN93MRwUfbShLrSa1S-79sQyoSHChYnYg@mail.gmail.com>
	<1436310276.27597.198.camel@linuxfoundation.org>
Date: Tue, 7 Jul 2015 16:56:46 -0700
Message-ID: <CAJ86T=WDOYytxxtGDgTRj2wOTp4JqtcymC1bH9q69qyAfmDU9Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Tue, 07 Jul 2015 23:56:48 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 7, 2015 at 4:04 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2015-07-07 at 14:03 -0700, Andre McCurdy wrote:
>> On Tue, Jul 7, 2015 at 1:30 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> > On 7 July 2015 at 21:09, akuster808 <akuster808@gmail.com> wrote:
>> >>
>> >> which recipe? 2.7.1 / 3.1 or both?
>> >>
>> >> - armin
>> >> ( sucks at this licensing stuff)
>> >
>> >
>> > So: 2.7.1 is "LGPL" (v2).
>> >
>> > 3.1.1 is GPLv2+ or LGPLv3+.
>> >
>> > An "interesting" choice to say the least. Because the v2 bit is not L, I'm
>> > wondering if we will need to keep both versions.  But a 3.1.1 recipe with
>> > GPLv2+ *or* LGPLv3+ would be a good start.
>>
>> I'd vote YES to keeping the LGPLv2 version available.
>>
>> GPL libraries are normally off limits for closed source apps, so the
>> new licensing options would be a problem for anyone with a proprietary
>> application using nettle in a distro which can't use [L]GPLv3. (I'm in
>> that category...).
>
> Surely if you can't use [L]GPLv3, you want the 3.1.1 version which is
> GPLv2 (or other things)?

There are two separate issues.

Both GPLv3 and LGPLv3 block 'Tivoization', which rules out [L]GPLv3
for anyone needing to create signed firmware images which can not be
modified by the end user.

  http://www.gnu.org/licenses/rms-why-gplv3.en.html

Quite separate from that, linking an application with a GPL library
(any version of the GPL) requires that the application be released
under a GPL or GPL compatible license, so GPL libraries are generally
considered to be incompatible with closed source applications.
(Dynamically linking with an LGPL library is generally OK since the
LGPL license doesn't transfer to the application).

  http://www.gnu.org/licenses/gpl-faq.en.html#IfLibraryIsGPL
  http://www.gnu.org/licenses/gpl-faq.en.html#GPLStaticVsDynamic

So for someone with a proprietary application which links dynamically
with nettle in a distro which can't use [L]GPLv3, the older version of
nettle with an LGPLv2 license would be the only option.


> Cheers,
>
> Richard
>
>
>

