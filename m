Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 433C477E66
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Oct 2017 19:06:39 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id k4so30474187wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Oct 2017 12:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+zpFFC7PROrPhLH1ka+ZRD0ydarEhBXn0KJyOPfTrdo=;
	b=VLJJxjmnxqKVlBM6iPDkToi1v9oq+di9qo1L8IPhAYK6DYRvM8XnL9s7fz6HYVWET1
	PztHtkHuDvDGpcqlc4RTKADhVgk6m4VNotokwc2I5o88r3iQq6/7U1janb56UjTDVF29
	3k4qhKPCElvCNg0zug+opnZbpNujkSfzCVvi1LM+Jwpp9uAb3sCfC4PMfQP3SVToivqn
	7HYY9HnMWvDo1Qcbowq5sox/Ziv1K0BL5cFJ8RLbbfpYWqqAKm7mh7z1leyGA79/NCki
	r7V39LU3Ht+r9AWfaf1vuEmb1YEhMTQCiAMHusSdfCPZyOjnYkBHY7zslDGwl9QFP1uh
	edBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+zpFFC7PROrPhLH1ka+ZRD0ydarEhBXn0KJyOPfTrdo=;
	b=Y+U0/gcfN2GRNZ/+3E7GLoWr9IJCmrymnFxFMaVUN6PzoOVjgIQOg62ioot3InSbVv
	77FJRYEfGZFlcfgkI1qOCBunksc/wTWG77Xb1GnW7NQVHPr9h7j4Os+sIatDiZYbqg1W
	MCl0MQireJW0fjVqulBaqAHQbk49ZMTNUgrtLRBNUyXnDDJEyuum1iJvsCmSCGlKaXKV
	mBXG8vBJp63a4fxRM9SAa/MNyJ6Lt4Gj7aX3jb+m5ffePlxniPzvasaeuNnKQZjHRLtR
	rGcExhdWZ9j1efozYzvFSD79pURqyYiPROI0MVsOb9+W3/XYc5JmXYL9dshIUT3LGzbG
	NBuw==
X-Gm-Message-State: AMCzsaVab0ppY2Rl+OGZXFESKy0p96WLMBygNfPjbiOihpPjsy9VEyXz
	Uxm3kovwWgvErK3sVky8z6EEyjZ6BAe2KybE8h8=
X-Google-Smtp-Source: ABhQp+THfGar5qvSGET26pNkxObkK3IHNt9z8HyvymLZrujYD7JoKAzJQgDnX7s08WYfwOPG5BtRRK8d4pk38CNwgSs=
X-Received: by 10.28.19.73 with SMTP id 70mr5640392wmt.87.1508094400099; Sun,
	15 Oct 2017 12:06:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Sun, 15 Oct 2017 12:06:39 -0700 (PDT)
In-Reply-To: <06c9bf77-9781-f521-c450-c46f985c7dd3@gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
	<20171014154858.35123-6-raj.khem@gmail.com>
	<06c9bf77-9781-f521-c450-c46f985c7dd3@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Sun, 15 Oct 2017 12:06:39 -0700
Message-ID: <CAJ86T=Wr_u_x8Zn2n5SX2C8dyO1vbpMFX=3ufZA8X_gtG53p6w@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] gcc6: Upgrade to 6.4
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
X-List-Received-Date: Sun, 15 Oct 2017 19:06:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 14, 2017 at 10:21 PM, akuster808 <akuster808@gmail.com> wrote:
> why do we continue to maintain 2 versions of gcc?

Probably the same reason why Buildroot continues to maintain 4
versions of gcc, it's useful for end users.

  https://git.buildroot.net/buildroot/tree/package/gcc

