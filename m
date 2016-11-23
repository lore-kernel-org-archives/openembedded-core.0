Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5C6B4607A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 11:39:45 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id f82so19818859wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 03:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5/S+PLg5z4o30prQagjugzN0jEL3SfL4ySknDyT9ukc=;
	b=Z+ou3lo3Q2sf4ZUvBLny2+jAKbzYJIXadRaX/xKe92uDWLGo9cqx2vwmL38YBeOQcK
	LHo3G0btjbsUyOww5+OTHTqlpy5m4uapSV56fA9NV8PDA5zHgVSU05G6xjhlmUtDzpBY
	ZennlKKv7NNH85V/JKAnmURhs+eqw4UlaDLUELTL3iZnbqVNz06QLybj703/k9KIqI/E
	vTOY7A9OlzEOV6xxXj/un66CfJIIC4nRloeaANAZHDBnEXNsLpFj4dHgSgtRI0eQ9RQ9
	0nMyQ/ENyZd9jY3WwTR4ybN8aQviQvVcoeB3jZoLaIlItVgmzeD8aytayf63UTKI+/BO
	sFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5/S+PLg5z4o30prQagjugzN0jEL3SfL4ySknDyT9ukc=;
	b=aItsixlG42eoyZuYG3UJS5bD+YYPOj6xYeb35Boyv4k+IRkYx9Rsx7jQRgLZp1D0Pv
	OgYGSyxR+tu4n0lGsbhHnGKsmFxZn/EvIRMt62ffyK8kKfJ9GtS4ytEafDKQx9ZAO8cN
	49UQ0yaEdOM2ebWrhrh6OQpNFGE1Lxc1jtULI72lGb/vaY4FCs8y/OK948JZ4onptHEi
	moy3d23CzvZXiyBcRQuvM/Yo7hB8NyWgXicTooaxwO2EqZbAB4HeLUI6hT+v3z9jNFGO
	hwGy3WanzE8b6zz5zC2A44j0QFk6nOmykGLA7T7mBxlrgN6by1+qxv41tqIl6oUiEHog
	mBZw==
X-Gm-Message-State: AKaTC00hsaZpLDLA6k9rX8YBiuXnsAmeGNtZDYNE+ouvwGuSf2JSAAs4Cim8d8msFX9DbzdvHEzbvkW/pS3KxQ==
X-Received: by 10.194.148.4 with SMTP id to4mr2843904wjb.194.1479901186769;
	Wed, 23 Nov 2016 03:39:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.15.9 with HTTP; Wed, 23 Nov 2016 03:39:26 -0800 (PST)
In-Reply-To: <20161123112356.GA12545@linux.intel.com>
References: <cover.1479887010.git.maciej.borzecki@rndity.com>
	<fd75ccfd4bbd3420f72b32c815feb92b06b2b9fb.1479887010.git.maciej.borzecki@rndity.com>
	<20161123112356.GA12545@linux.intel.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Wed, 23 Nov 2016 12:39:26 +0100
Message-ID: <CAD4b0_JG7ApGTZ7BxHtfv53Z-T_jKQxN9fYrEBpcHvWaiRFsKg@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 5/7] wic: selftest: do not repeat core-image-minimal
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
X-List-Received-Date: Wed, 23 Nov 2016 11:39:46 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 23, 2016 at 12:23 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> On Wed, Nov 23, 2016 at 08:46:31AM +0100, Maciej Borzecki wrote:
>> Replace repeated core-image-minimal with Wic class field.
>>
>> Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
>> ---
>>  meta/lib/oeqa/selftest/wic.py | 111 +++++++++++++++++++++++++++---------------
>>  1 file changed, 73 insertions(+), 38 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
>> index 2db14445956bc5adcf1e755844bbdb69edcb468f..37ed2c6de5a7f22f982f921476fa392304995b2e 100644
>> --- a/meta/lib/oeqa/selftest/wic.py
>> +++ b/meta/lib/oeqa/selftest/wic.py
>> @@ -57,6 +57,8 @@ class Wic(oeSelfTest):
>>      resultdir = "/var/tmp/wic/build/"
>>      image_is_ready = False
>>
>> +    OE_IMAGE = "core-image-minimal"
>> +
>>      def setUpLocal(self):
>>          """This code is executed before each test method."""
>>          arch = get_bb_var('HOST_ARCH', 'core-image-minimal')
>> @@ -75,7 +77,7 @@ class Wic(oeSelfTest):
>>                  tools += ' syslinux syslinux-native'
>>              bitbake(tools)
>>
>> -            bitbake('core-image-minimal')
>> +            bitbake(self.OE_IMAGE)
>>              Wic.image_is_ready = True
> I'd agree with Ross here - it looks less readable.
> How it would look if we decide to add test case for another image?
>

The usual way would be to:

class WicSatoImage(Wic):
    OE_IMAGE = "core-image-sato"

But I think you make a fair point. The patch introduces unnecessary
complexity, and is not really needed right now. I'll drop this patch if next
version will be necessary.

Can you take a look at the rest of the patchset as well?

Thanks,
-- 
Maciej Borzecki
RnDity

