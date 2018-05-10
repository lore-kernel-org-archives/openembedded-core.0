Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5A8A87512A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 04:36:58 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id g9-v6so495773uak.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 21:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YZQ5n9RAMMLjq8KhRB5D0Z6dCzIyRIflx39Z3/u+Dbs=;
	b=QpzUAQkQHNgIFIP0+1hmD9gFZDj44+UzDAqc54AX0dj7XmMVUPyDx6kdUR9b7Y14XK
	7adRS1mZL9o8M76vCO4rRxGKeYtDQtVKhRpgfC8trr52gw+Sc+Fx6/2b4sivevBzaLRu
	PrnpJ7aSFSpLBR8E8FsCdTyFMZPi1Vh0V2Yw3PtEORtT6zmZh22BSme0vPSoJD8OB4Xe
	fMsIS4sn4WCAbC9JSDinQl835+ZjKH3+TMVjw4abLELd90q0snKhMd3wgpUue7u3fslL
	bgqlkg7SkDhL4WjCQa8hemiP7OErMqIgq2/sNvhT9OdKP3+++CVRa85KUAJnHlpOL3xR
	XhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YZQ5n9RAMMLjq8KhRB5D0Z6dCzIyRIflx39Z3/u+Dbs=;
	b=ArNhj4EZqlxBTJbBk4nu1AsK0HMyu2DhuMGKQeMWsbTaxXmOn69JRmSpnQPcQyqlR8
	aSs75ApJScPIgamQjmkunRa6bvbbHaF1QOAPFx/lBBmeytVzJ4Du6srJVaGQy8WLI04n
	uxZNFaQvvsliTXo08oiwIFmRAZr/imOt6Owoyo4lvgcwwzETsukSydSBw3gVx2/Bog49
	6jeAWPISDskFYvjleoQ28qbokDCxI8PX1y7LvRg2zLJjwl+paIs6t7XpWBufU5pGNyH5
	UdihkO1NjULV2TXzdwhqJT6x5sS+Hx7Nuw0d3l1KcTNPa8KI/ANV6J960uJvp+ZMcr2m
	Qs8Q==
X-Gm-Message-State: ALQs6tB1uSA1FiEzympXRy51rbv4cXj80ZqwOyUvKyD/gsHDMgcA4CzQ
	2AS/80Zlrv5yt89b2RjXHkkPqjpnQ/nvf3wK1B0=
X-Google-Smtp-Source: AB8JxZqpD6Qo3TVNMFIlrutou9t6P1lQBsyjAdyPbq/F3jGIJbiLCaUXA28yt2RGoMXw0bLDrVnpxyVuIMHOwnGKu5g=
X-Received: by 10.176.76.68 with SMTP id d4mr39979859uag.128.1525927019963;
	Wed, 09 May 2018 21:36:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Wed, 9 May 2018 21:36:59 -0700 (PDT)
In-Reply-To: <1525864141.3857.121.camel@linuxfoundation.org>
References: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=VK+Um4wa6F2EVzQTNiwa8LC1nhTEQrLqH2GBuSzCkbWw@mail.gmail.com>
	<1525765207.3857.101.camel@linuxfoundation.org>
	<CAJ86T=UJUqrzyutyKf01HR1MDTN1YbYz+ovXkUTj+DARu1XW3w@mail.gmail.com>
	<1525770920.3857.109.camel@linuxfoundation.org>
	<CAJ86T=WkEuK_760z-Vw0i189j0OKCGY1b=B719UJoKNpmVZqkQ@mail.gmail.com>
	<1525864141.3857.121.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 9 May 2018 21:36:59 -0700
Message-ID: <CAJ86T=UdjYfSzC38NJvieXAZj7bkTCZvu2Di9_HX-wcmCXjmrA@mail.gmail.com>
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
X-List-Received-Date: Thu, 10 May 2018 04:36:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 9, 2018 at 4:09 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2018-05-08 at 15:07 -0700, Andre McCurdy wrote:
>> On Tue, May 8, 2018 at 2:15 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > On Tue, 2018-05-08 at 02:06 -0700, Andre McCurdy wrote:
>> > >
>> > > On Tue, May 8, 2018 at 12:40 AM, Richard Purdie
>> > > <richard.purdie@linuxfoundation.org> wrote:
>> > > >
>> > > > We've discussed "long term" branches for a while. I suggest
>> > > > that we
>> > > > collect together people who are will to maintain such things
>> > > > and
>> > > > let
>> > > > them push to a namespace in poky-contrib initially, perhaps in
>> > > > other
>> > > > repos eventually where we collect these things together.
>> > > >
>> > > > Perhaps poky-contrib extended-life/daisy?
>> > > >
>> > > > If there is common agreement, a group of people could
>> > > > collaborate
>> > > > on such a branch too...
>> > > Although there are multiple groups still actively developing
>> > > against
>> > > OE 1.6 I fear I may be the only one who has any interest in doing
>> > > so
>> > > in public. Hoping for a "group of people" to show up and
>> > > collaborate
>> > > on a branch in poky-contrib may be asking for too much.
>> > Maybe, maybe not. I'd happy enough for you to put these changes
>> > there,
>> > if others want to join in, great, if not I'm not sure we're in any
>> > worse position. I just wanted to highlight the possibility in the
>> > future...
>> Changes pushed to:
>>
>>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/?h=armcc/extended
>> -life/daisy
>>
>> What happens next?
>
> Can you push to:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/?h=extended-life/dais
> y

Yes, I can today. Done.

> ? If not, we should give you access to do that (halstead can help),
> then we publise this on the arch list and see who else, if anyone has
> other extended-life branches they want to contribute to or work on
> together with others.
>
> Cheers,
>
> Richard
>

