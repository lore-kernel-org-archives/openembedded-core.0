Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id F105576E5E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 06:56:34 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id x18-v6so5777487uaj.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 23:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3U2G1vpyukcPUkFWYbOGGXIo2vaiAuhXV4xNARRFc4E=;
	b=MTSiqMCRWK+BeiZ1l1og2unBqZgTthwPGuCP/XsFIFsQvM/gp1QncQ48/hZFj+t5IG
	40fOv7CXMueWTEu37HkR/ustK/z9DNEdA6X/r6/b1x6Ws2lJ94ZtLl9fsTO92D3CulfR
	474Slg/Oo8a0QwItbsRVlREnUS+kBU9KY7twBCcjCG90n5U91mYdyZAxAmNHQeeH/VQR
	r6JvjcTHVqYzTAMkSvdgtt8Q5VJwdzbh0zWpreuV1+sIQ5mNffLtS5YpMCKBzi49I0N0
	BrbXncRm60PKgyQHJBIwjWUXUStzII3OeK4DpjoZlV1SOFdubQhl3gqhGTIsq+mKxdqr
	HC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3U2G1vpyukcPUkFWYbOGGXIo2vaiAuhXV4xNARRFc4E=;
	b=Ch4sZIyXDuEJWEHr2A+PhKt699V34OpXMOdTSnEJ/tHbK6gauAaF7KGZJoKAaJcnXn
	MOQjokZYDVtI7Lw6JR4uuBiHWBdb5tMiF4LaC03F74/wDf9QOP0mhF192+yRXSWAZZE8
	5Fk8cB46rwsyNVCkPLMp8eNylJoBkc4zmbjAT5baZxVV/fea3Xeciecv44iiTS9UN2cV
	gPqIL/bb3K+f3SxbKJyrfONZQ/WVfqGyrNNWMHt/md0B6uy7jRTO+GlW20y+lgqt33HU
	EV156rsmsJFKwIgErnv9uJSz6De8svtdxGumDkH48z5xHWIFFBoFE4jPzKgHjkmKlYJA
	m2kg==
X-Gm-Message-State: APt69E1yW34xCU6iB/x2fnT9k0LARaRp42dpJWx8CD29CPBApaFbxRjr
	9KmfGiXgaA56+ryFjWzg7TCy6VHwBpZYFi7H77w=
X-Google-Smtp-Source: ADUXVKLw4o5YFMfKt0XSs6BGjbZcYlwGodpQjm3x5tJz6jeFQ5CwWX7Kq7cmDLpCTu8UGmfA/2++3tInYMwRwfkhwdE=
X-Received: by 2002:a9f:3352:: with SMTP id a18-v6mr415973uac.38.1528354595739;
	Wed, 06 Jun 2018 23:56:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Wed, 6 Jun 2018 23:56:35 -0700 (PDT)
In-Reply-To: <09084de7-92b5-ae25-06b9-63d97cdd35df@gmail.com>
References: <1528346078-20408-1-git-send-email-armccurdy@gmail.com>
	<09084de7-92b5-ae25-06b9-63d97cdd35df@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 6 Jun 2018 23:56:35 -0700
Message-ID: <CAJ86T=U9J9b1RbT1bW65kv=r9DnVn6OpvKrBHMQr2JjNSh-S1w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-target.inc: configure gcc for armv7ve targets to default to armv7ve
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
X-List-Received-Date: Thu, 07 Jun 2018 06:56:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 6, 2018 at 11:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On 6/6/18 9:34 PM, Andre McCurdy wrote:
>>
>> Originally these ARM specific EXTRA_OECONF options were applied to
>> both gcc for the target and gcc-cross. That lead to a compromise
>> being made: gcc on the target was configured to default to an ARM
>> architecture which was at least compatible with the target (but not
>> necessarily an exact match) and gcc-cross was configured default to
>> armv7a for both armv7a and armv7ve (to avoid gcc-cross rebuilds when
>> switching between the two).
>>
>> However, when these ARM specific EXTRA_OECONF options were moved from
>> gcc-configure-common.inc into gcc-target.inc (ie they were made to
>> apply only to gcc on the target) the compromise no longer needed to
>> be made.
>>
>> http://git.openembedded.org/openembedded-core/commit/?id=851937dde81de2a9ef54c5f19a78fb12fb82afd4
>
> this was done with a purpose so we can avoid gcc complaining about
> incompatible architectures when building programs on device.

Thanks for your reassurance. I know it was done on purpose... because
it was me that did it! :-)

  http://git.openembedded.org/openembedded-core/commit/?id=02c3ac6f066ccd1cbb6e457080bf10db5d6abfe0

> probably testing compiling some c++ apps on device might be good to validate
> this if at all this is working.

