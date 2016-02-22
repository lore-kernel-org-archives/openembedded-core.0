Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id A4895771E7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 21:25:42 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id xg9so86281551igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=5VqdX8EAkfFPVWTkNxgMEcupw1ptclF/6iYIrx2KJS4=;
	b=GjigjVGNTrmW+7VdB+BI8f2x8noypxZbLD05eXVctGEWBLHe85Eyq5YgI4w3TksZ6r
	mdaEH/M0SZNYeqic7zNk0zZVSaBJpJWTPr71CcOu3/Q8du8Mj7Jdrz57OGcW79co68mz
	d2UM1KvVsBNQs5Vbj784fgYoblZozWoOsG81YVlw50AG/sYcgUq/JHrOdVWJczrqS6HE
	ENzhJpQtqwRCB3TBV3EVqkcAn17Jw4Fu/v2RQASDtGUJptBB8FcKD7Hid2epFnVLiaK8
	c4ILC6chfGvK77Pc6+8y0AAXk1hNm6zovQcTwLav3nhjSzzhxHyzFPr0Q51yu9hfJQh9
	FNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=5VqdX8EAkfFPVWTkNxgMEcupw1ptclF/6iYIrx2KJS4=;
	b=gx8HC2QM/4gDV53F7nYx4uPf4U3p8Vi2sRZnVYmeGTH+Di9a7LEgjcmlH7eVw1SRJs
	otTcnqqPS3qxDBuQ8vB00bwU6fmHn/aOzhVHPq1yiyLTTkhkfSojOPZ+huJvIU3HR63b
	ZSdTl8292PriJlyKy5uIFEu9Dt4vWwLHsV3NkZDi8uooU/qp9B3iLLl1yVWJPmt9+WpT
	pPYHXJo7h0/mk6BUvv3DU30qhTlyO8lAO1y2X36mDuqyeqVCS7L1/7rXxOjxWwvwARkd
	/2XF9DlhXayIaVrJ98wsMdFp9PX2XqXCzKmVx/EWQ6xQCiaZHYwgU0EMdaHbyw/P/vyL
	WXqQ==
X-Gm-Message-State: AG10YOS1RLD6J4Z37Pfa1aCaSjyUEM5lTDVbfdvy+1oSdvt+rboirKQw0XvU49abbWclYnW3k64qGca7yKlXrg==
MIME-Version: 1.0
X-Received: by 10.50.160.7 with SMTP id xg7mr12727677igb.64.1456176343552;
	Mon, 22 Feb 2016 13:25:43 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Mon, 22 Feb 2016 13:25:43 -0800 (PST)
In-Reply-To: <20160222211740.GG6329@jama>
References: <CALbNGRTeReXBitXWMQJ=ZbY-C2wayOaJJdDA4KSxQcRv8Kpnkw@mail.gmail.com>
	<20160222211740.GG6329@jama>
Date: Mon, 22 Feb 2016 22:25:43 +0100
Message-ID: <CALbNGRR61E+cW7osn=5bfYVuZ90vah5sqK1A-=93AZ7SKMDC6Q@mail.gmail.com>
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
X-List-Received-Date: Mon, 22 Feb 2016 21:25:43 -0000
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
I don't see the SRC_URI hints with new checksums anymore.

Andreas

