Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id E4D4E74F12
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 22:07:18 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id 10-v6so20643887vkh.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2018 15:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/QyETu4SDsgFK4YZPHkWKMh90tgrytuSBsIxywrc/xE=;
	b=P6wn2v69bjSGS2LreRmT4xAOUd8BmJ8+XnsDRS88Z+FBvDtnkUu0zUSM63gQTz6tAJ
	80EcMRSGTIZVyGpgH6yLDJMpWSddsu7xGuzeWyPEluSOkZls27zdR2uXquSQLXiElEnV
	AXkQ5OEfxaL9ZO6ZbDTgGiWPyIyD5+9KU1nWoybGDjCWS/Pjya6O7GP8I1bWMKLk7nOt
	Lv8R4BjcHcTQ9aQdPs7mYVzHtgPRkXb5fjjRWW+sSGG593SAToPr6Xi4WyaqQNKa4ok8
	VbUBasfyXTHgFEOSa5OiwH4XcQfEXkfZEh+zZHnVHFkmj0Zk/8PPHC3ZjsziqHnkr5x/
	NJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/QyETu4SDsgFK4YZPHkWKMh90tgrytuSBsIxywrc/xE=;
	b=kd/MAsj/E7JKGLrWURQ2ZnndZq1dFAapZWLiifWn9uwMs0byUDwHZWUUzPLPnVayXh
	16e854+E9lWJf2oexZ9qCIPhr4PaT5ae6MELDng0lgI+V+Aeq0zU0vnGHfIpZhkUR3q6
	3jc3KtU3IYRFYn2PM2OOe7sIBSwB2qpJrmBtxyWZCMXs9di+f5hLmOAwfTkfJaxijfS+
	CMFy4rB9D5TTo0hQg64p+ulwqVcwAxMrgUtZlgLT6/R0HwOKR7/d8FyKze9IV2ENKgXJ
	aq1S/LtYEYt/BNLBN+4Gv51tynrYjoe9ued5B49lzfFyaYn9C7qkAAdvdl2urnxYyXkY
	cmFg==
X-Gm-Message-State: ALQs6tBjwv3JsQ5QilrkSPD3Pt3AuINO7qyTX7phol0N9RlhuKc1zGr4
	3V3E9lCFq7lTEy8pCADoVJcCAiGirR2jJpet7ZE=
X-Google-Smtp-Source: AB8JxZqDnS42TvSghU/qn69P/kOw+tW79Zy/QcRomZ4et0u6f72XKm/MovbvoAcvKwfFG6A88x1XPtsGO37ZgR+jpQc=
X-Received: by 2002:a1f:a7c7:: with SMTP id
	q190-v6mr35347045vke.5.1525817239522; 
	Tue, 08 May 2018 15:07:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Tue, 8 May 2018 15:07:19 -0700 (PDT)
In-Reply-To: <1525770920.3857.109.camel@linuxfoundation.org>
References: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=VK+Um4wa6F2EVzQTNiwa8LC1nhTEQrLqH2GBuSzCkbWw@mail.gmail.com>
	<1525765207.3857.101.camel@linuxfoundation.org>
	<CAJ86T=UJUqrzyutyKf01HR1MDTN1YbYz+ovXkUTj+DARu1XW3w@mail.gmail.com>
	<1525770920.3857.109.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 8 May 2018 15:07:19 -0700
Message-ID: <CAJ86T=WkEuK_760z-Vw0i189j0OKCGY1b=B719UJoKNpmVZqkQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH 0/6] SRC_URI updates and minor build fixes
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
X-List-Received-Date: Tue, 08 May 2018 22:07:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 8, 2018 at 2:15 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2018-05-08 at 02:06 -0700, Andre McCurdy wrote:
>> On Tue, May 8, 2018 at 12:40 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > We've discussed "long term" branches for a while. I suggest that we
>> > collect together people who are will to maintain such things and
>> > let
>> > them push to a namespace in poky-contrib initially, perhaps in
>> > other
>> > repos eventually where we collect these things together.
>> >
>> > Perhaps poky-contrib extended-life/daisy?
>> >
>> > If there is common agreement, a group of people could collaborate
>> > on such a branch too...
>>
>> Although there are multiple groups still actively developing against
>> OE 1.6 I fear I may be the only one who has any interest in doing so
>> in public. Hoping for a "group of people" to show up and collaborate
>> on a branch in poky-contrib may be asking for too much.
>
> Maybe, maybe not. I'd happy enough for you to put these changes there,
> if others want to join in, great, if not I'm not sure we're in any
> worse position. I just wanted to highlight the possibility in the
> future...

Changes pushed to:

  http://git.yoctoproject.org/cgit.cgi/poky-contrib/?h=armcc/extended-life/daisy

What happens next?

