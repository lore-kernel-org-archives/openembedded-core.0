Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id A08E560144
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 18:27:31 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id jt11so1537075pbb.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 10:27:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=0q7+M8baTYUJVJAisq2IldOQKk6ul3qsrIX37w/iJ1Q=;
	b=j5bvoIL5dVJuDtrW1j5s6Lw8L+kFmj3pgo8FjqHHtrkz1HZhIyFIdQ6gwn4hBrfKIc
	bDx+K4jZeaW2LMgRy8wOXawZc0YSAKhbHnC5wWYpdmpIrQmN+CcG0sUMk7aYNHoqQvZy
	AWgPAFOIYNSvaykBe8fuqY0Ac5doUjilNIcr+fD8/ZAZoQrYgfWyHT580i4d5V3CXu/Z
	JS4Lt88yBSbvgB9pxxg/jD4RCj7mf/Hf70T07g/X/gE4/4OhRdvVep9OX86WHLiZjbrA
	GqxYh+Xv+IRk/kOc5hxlSoQy9EQc0aG9QuzP98w8tKRV9egpH2PI2slQuz1RzdF7qFya
	wSOA==
X-Gm-Message-State: ALoCoQlMVkjfDNQoSnLHhHakJGYDIIAv7HtXtiN1W0g7okqpIB2ncH0QcK0Tl3v1nZGI3H44eL8N
MIME-Version: 1.0
X-Received: by 10.66.49.74 with SMTP id s10mr27153275pan.0.1393266452627; Mon,
	24 Feb 2014 10:27:32 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.26.195 with HTTP; Mon, 24 Feb 2014 10:27:32 -0800 (PST)
In-Reply-To: <CAOMwXhPouMY3twDeLYTAj8PXZVnRwBqfTNHt952aeqN-8+qfAg@mail.gmail.com>
References: <CAOMwXhNMs7top-CBCDf8Hgsxxz7=oBocF6YjbC_PhH1PDgYG0Q@mail.gmail.com>
	<CAP71Wjy4kX15uoz=_42+zRKS7i91TYnGM=2u35+tNXf7CFoaww@mail.gmail.com>
	<CAOMwXhMxcr_EVZx4uVnnpGvcq2MrMchHVUL5ApBdC+4bH7q_Yg@mail.gmail.com>
	<CAP71WjwR9Lrb1QeHPEXLGnPe+vcEnYtgMDoQZW-eNayOMubbKQ@mail.gmail.com>
	<CAOMwXhMz+_KcMzY1Stwi2g8EyFg+8BVajqrrvAX7Xd02qVNG9g@mail.gmail.com>
	<CAP71WjxHc6+9DDGeQsuAc3Cv7qN+bfPgNT-ju01z6pje3Q2qEg@mail.gmail.com>
	<530B4609.7070307@mlbassoc.com>
	<CAP71Wjx=6Ux7CWmr4FJcLPyp0xah3jFO=7v6izNi2dfNNcWWYQ@mail.gmail.com>
	<CAOMwXhPiWGre5UiVtyVvVc2L7G3yf79LKF55VKwuLtTd6ZRBiw@mail.gmail.com>
	<CAP71WjyOcDowMb_nv9+-pHsnMYhXoYmRi1tJOveZJ7V30otQOA@mail.gmail.com>
	<CAOMwXhPouMY3twDeLYTAj8PXZVnRwBqfTNHt952aeqN-8+qfAg@mail.gmail.com>
Date: Mon, 24 Feb 2014 18:27:32 +0000
X-Google-Sender-Auth: xp0_hxQe1PaIXBSeo7PAtlqvHgM
Message-ID: <CAOMwXhMgAoWY_EoqAw1rdLcRusc3rVUbQCUi7j18vHEvXjZ4=A@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Gary Thomas <gary@mlbassoc.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Conf notes
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
X-List-Received-Date: Mon, 24 Feb 2014 18:27:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hmm, I think something bizarre happened on my end. It seems that my
file is lacking the `OECORENOTESCONF="$TEMPLATECONF/conf-notes.txt"`
line. That would explain all this, however this is present in dylan,
even in 9.0.0.

It seems to be that it was not present in denzil though. It is
possible that some corruption occurred during the migration from
denzil to dylan for us. I cannot possibly explain it for the moment
because I just decompressed the poky tarball, and I think that was it.
I mean, I would probably recall something silly, but not in this
case... So, my memory is either very bad, or it is something else. I
will let you know if I figure this out.

Thank you for your time and patience.

