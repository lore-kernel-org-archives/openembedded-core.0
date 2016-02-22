Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id F04F873218
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 21:19:50 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id 9so193640734iom.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=8n4tYNzCbE4JBrrxqlq/ux2tv7sH8jYegMcpWL7Bi4A=;
	b=FB039F6darQTfb1IX+v7jiIUuwS3wfcX9puSoxOMtloi0U+3fZdYEt08DIAY9Nh6L1
	+uypMTFxgZwysnwdn3hHZmP/Qn33dse4p/e4MRP4VsmsqIPGNCbRjGSxzQky+BnMCwK4
	7ITZ13CSjdydQspmTi6GspyvfGeFe6LXMcnBDD8lCnPVtXWNWNKCThJVn/3DU/7AwRbe
	daeMy36+wJAeZZfWaYyaSrymC3bGP30SMVklcBqBG9mKtK0iUr182cFv4he4Lw8asm7i
	60ZNpKFLckgrPuf/iQWWq1lQu1hgTzH+glWPN//yDyjxHcvsmm8nW2Q7cgRXNbenizab
	22HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=8n4tYNzCbE4JBrrxqlq/ux2tv7sH8jYegMcpWL7Bi4A=;
	b=kQLtO3wYpEdPmBHn1HKQyRxiH7oE6PdlorTbX2oDIZn5eOl3wXODu186NWSTIJjGLp
	fUMbY5nDctT3dAKqcvheu12/nnfabRd6unl4LkNsCeuQ5OQfJC6wGvnw8dr13lPDa7ku
	c5SxNShDTSqBpxsbmlHHnmmnqAo9rT+I0dYIE6kbjZMxdNz3jHhQvfqQ2sZo86sch5T2
	ric1qczo2gLIPRiS13pYOF/pwR1swCatKF/De61FJImuYmleUY6Ux6GV0HaIsojeTwbC
	WxmN8VUoJZN2fO+tUH8n9toMjnzzR+mfjZELkM27Y+mS38ayBKC7PNfgHb0Rl8V/SIze
	0lVA==
X-Gm-Message-State: AG10YOQXNAt+PBaV5wLXnH2iOz6sOOddPFxWXvk3vWYPzl/gWwJxIr5lOUMg9M3a2Kq85asJMbNbGyuUIiETrQ==
MIME-Version: 1.0
X-Received: by 10.107.3.220 with SMTP id e89mr28587054ioi.99.1456175991499;
	Mon, 22 Feb 2016 13:19:51 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Mon, 22 Feb 2016 13:19:51 -0800 (PST)
In-Reply-To: <20160222211740.GG6329@jama>
References: <CALbNGRTeReXBitXWMQJ=ZbY-C2wayOaJJdDA4KSxQcRv8Kpnkw@mail.gmail.com>
	<20160222211740.GG6329@jama>
Date: Mon, 22 Feb 2016 22:19:51 +0100
Message-ID: <CALbNGRQSdagG5HZ7c5uxGLo5z64SrA4RRKW6gu62ypXuAxHXSA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Fetcher broken?
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
X-List-Received-Date: Mon, 22 Feb 2016 21:19:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2016 at 10:17 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Mon, Feb 22, 2016 at 10:06:10PM +0100, Andreas M=C3=BCller wrote:
>> Hi,
>>
>> after all these scary changes in master oe-core I wanted to see what's
>> left over working since jethro for my images.
>>
>> On thing noticed immediately: I see
>>
>> WARNING: flex-native-2.6.0-r0 do_fetch: Checksum failure encountered
>> with download of
>> http://downloads.sourceforge.net/flex/flex-2.6.0.tar.bz2 - will
>> attempt other sources if available
>> WARNING: flex-native-2.6.0-r0 do_fetch: Renaming
>> /home/superandy/data/download/flex-2.6.0.tar.bz2 to
>> /home/superandy/data/download/flex-2.6.0.tar.bz2_bad-checksum_0103b909e1=
9ca9c6497a7ae696c16480
>>
>> but flex-native is build happily. Same for freetype-2.6.3. Are the
>> messages wrong positives or does oe build sources with wrong
>> checksums?
>
> Did the following re-try download it with different (correct)
> checksum? Then it would be correct behavior if you had some
> e.g. incomplete flex-2.6.0.tar.bz2 tarball laying around in downloads
> directory.
>
I did a -ccleanall and repeated -> same behaviour

Andreas

