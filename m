Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id E6E676010B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 09:57:47 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id t8so74195531vke.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2017 01:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FThFNsL6CW8xyc3fvDmUX2Il1K1Gt3WqLxxfFrXdObc=;
	b=QbnUda+I7m8T7A06Mlfl/h+IwCSe/fXMOFiqhnmPugbDAiDsxDGcTg4cT0gsOJZ9ga
	QPmET73Rr8nabjjkXexfVVx7bMNCHdTV+xBSWLP2DQINzhz0IfjnA1MG9ZE6kdQ0BxPM
	bEzGcAyLk/O59+2KphOMpxXAwvBRn0bRQzpcQW2Jwo9ueCCMDAIJwAorMQB3tCqg0hka
	s25fyS1NyCc4OZMYSnxpQBrZC/lveIStmy/X0nlncWQaNG8H1GdQM8OLisN1ABGJgaVf
	tJ9dSjgzuUbYPtq1Lu16tvn5IEy7oQWzEpghk2ptNF8kA1tdDjIBEE6NCfcbzV6ek7vl
	E8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FThFNsL6CW8xyc3fvDmUX2Il1K1Gt3WqLxxfFrXdObc=;
	b=KMEfiDwKDgWrcN3N+HVzPmo+eyDklV3kCNX+essvWSX4zhm+gZCUizLiQR+7+LjGCA
	S64sjoGKBkwygFkSJAmEXNoZlXcRZErBLjrbTvb3AyHQH4trRa0SN7tG7/RenSRcmp2N
	549/I+8X+nLIM7cXCNNoz5P1MgcVtjBU0VKJ/a743QeogzXJu8SEctWtzTHH7YlEH1vT
	6lF3O2Hd+cLg4ADcLotgJ94HKr9pD7OtZr4E9YSuKSSiCO510AOnWoWFocMc2Zd+NRWS
	9ZDclEzlr98IvfNC49BjU8J9x4OJU+sKAteAmqgvBY/yG+JfaXKy6cXrCld/f88Ekoa1
	EM2A==
X-Gm-Message-State: AMke39kNJX+xyMJunJ6yEvjKnMUx+czH6sIH5rpWT1n0boaEHp28pokIlfLEiuTTVJ2y2uk3N4hKv+vYMvmB6w==
X-Received: by 10.31.155.75 with SMTP id d72mr6682918vke.55.1486461467610;
	Tue, 07 Feb 2017 01:57:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Tue, 7 Feb 2017 01:57:47 -0800 (PST)
In-Reply-To: <CAJTo0Lb9rbRkTCQbYMDR8kU0TpJFqEGjysOzXhfvMTUjBFd0YA@mail.gmail.com>
References: <1486423594-13790-1-git-send-email-ross.burton@intel.com>
	<CALbNGRRikJJR9HDiT+py43+=45PUtPFaJRuOWAoZbSKoCa-zpQ@mail.gmail.com>
	<CAJTo0Lb9rbRkTCQbYMDR8kU0TpJFqEGjysOzXhfvMTUjBFd0YA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 7 Feb 2017 10:57:47 +0100
Message-ID: <CALbNGRS316C7PTOt_HewyH9A2crZapa5C_vazz_p9g5ZFS6vHw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libepoxy: upgrade to 1.4.0
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
X-List-Received-Date: Tue, 07 Feb 2017 09:57:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 7, 2017 at 10:53 AM, Burton, Ross <ross.burton@intel.com> wrote=
:
>
> On 7 February 2017 at 07:40, Andreas M=C3=BCller <schnitzeltony@googlemai=
l.com>
> wrote:
>>
>> Wow that was fast :))
>
>
> It has Meson support so I wanted to give that a go too.  Good news: it
> works.
>
> Ross
>
And yet another buildsystem - sigh

Andreas

