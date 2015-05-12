Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5917173F4E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 18:00:01 +0000 (UTC)
Received: by oiko83 with SMTP id o83so12469200oik.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 11:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ONv+xxZkBWmb7Fx/luEn0r9scSczL/qDxhh6Fak7yHI=;
	b=R3uKerGTqRzmQmfo/9O0HhC2IYxfCmzA2/wAPR/5I32Ed4Rlzpx4BhKLbXwv2KEnos
	IiWTCbVIQ+XDMl//CAN1SyR0PnijzcNIJOH1kBBIILqf+ZiplU09qGQythG4+UrbY0s6
	ZUPzQeJlE1jX8FWGVKoalgs1+0CGt9pyNeZlFrAHlI1Faz0p2o4AavvpcFo1xBBCXlhl
	MVBSBIkIF9F/lYK7oupdxAmt89eP/Zg5km3WtT6VFEKSz6tsKl/pSpqqrJ/zVEh8Jchm
	L95SF9l6mDQfLRyZ2GmJ5AlobbflrQMGWivFPe7X+uSuzE11LhEGkbSwEWj+alwU3cL0
	bfMw==
MIME-Version: 1.0
X-Received: by 10.202.94.215 with SMTP id s206mr12331952oib.15.1431453602339; 
	Tue, 12 May 2015 11:00:02 -0700 (PDT)
Received: by 10.202.102.13 with HTTP; Tue, 12 May 2015 11:00:02 -0700 (PDT)
In-Reply-To: <2300208.Wa25vWO7Bf@peggleto-mobl.ger.corp.intel.com>
References: <cover.1424877305.git.cristian.iorga@intel.com>
	<84f2bc2ad049dd54b4bc62f8810de014ff223f6b.1424877305.git.cristian.iorga@intel.com>
	<CAJ86T=VeT9qXjvPJo0Gb+HefkMZhaD7C6PQxUBoZoZbBy6NUmw@mail.gmail.com>
	<2300208.Wa25vWO7Bf@peggleto-mobl.ger.corp.intel.com>
Date: Tue, 12 May 2015 11:00:02 -0700
Message-ID: <CAJ86T=WZXQfxGuuAfovUfuUegAZyOGuHaoTe3SORzxxkTvV4zA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] meta/lib/oe/utils.py: properly implement both_contain()
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
X-List-Received-Date: Tue, 12 May 2015 18:00:02 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 12, 2015 at 1:40 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Andre,
>
> On Monday 11 May 2015 17:34:45 Andre McCurdy wrote:
>> On Wed, Feb 25, 2015 at 7:15 AM, Cristian Iorga
>>
>> <cristian.iorga@intel.com> wrote:
>> > oe.utils.both_contain() just does a find() on the value
>> > rather than splitting the value and then looking in the
>> > list of split items. The result is that if you add a
>> > feature to MACHINE_FEATURES that itself has a substring
>> > that matches one of the values looked for when building
>> > COMBINED_FEATURES, you end up with an incomprehensible
>> > error (here with "ext2i" in MACHINE_FEATURES):
>> >
>> > ERROR: Nothing RPROVIDES 'packagegroup-base-ext2'
>> > (but /home/balister/src/oe-core/oe-core/meta/recipes-core/
>> > /packagegroups/packagegroup-base.bb RDEPENDS on or otherwise requires it)
>>
>> This change seems to break COMBINED_FEATURES.
>>
>> $ bitbake -e packagegroup-base | grep '^COMBINED_FEATURES='
>>
>> dizzy:
>>   COMBINED_FEATURES="alsa         "
>>
>> fido:
>>   COMBINED_FEATURES="set(['alsa'])         "
>
> Yes it did, unfortunately. There was a follow-up fix in master:
>
>   http://cgit.openembedded.org/openembedded-core/commit/?id=c4ca9dbd4191fcff08e75035e3d276490ed80b05
>
> This is included in Joshua's pending backport changeset for fido.

I see it now. Thanks Paul.

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

