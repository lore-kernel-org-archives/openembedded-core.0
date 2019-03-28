Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 484347CD89
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 13:17:21 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id e24so5923212itl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 06:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YOlunyTaMtH+c/kB3Bod7Zz35UutWtBWtr8rwaB9UMw=;
	b=oRBSKo36fs3XvVLeAGSbNXjkerV0o1hOdi0UxBqTS++Fhzwb3pm8rOZYABvwn/dQKu
	Mhahatpnu7qEfsAOxUEOthf1PcrtzlNrzkZ+adODSIy2IBMfVoXM3WFknLWf5snc2J96
	ePgb6Njh/9XJ7/xw+4WL9bffVfjBNh6xdy/MlKDc+JKyA94JX/9/C/4l4i/M2tg/eMkC
	tqfCoe9jnfYBotZmP09vbWnsYf1oyURMUaaiMMBIdY6Zjgfa9h4rI6ob7zLm5T1Snt5s
	LezGK9xAc0BcLZam4+lDOxDZr+719/WNs6XpGX5oGS92r78+o6OR1qRmhcWuDwktMQsx
	GuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YOlunyTaMtH+c/kB3Bod7Zz35UutWtBWtr8rwaB9UMw=;
	b=da2aUqZXU/WglCU548nh+oPsVKd/pNKZN/7ucU2dvSo8KGmZYnxJKSWpVxTVGEKHq/
	FlTgvTzZVUKIMz5ylcPgkuWwnYdGUamKfh7d0/gCJ1f0nHDQhEsMMCO+vgl5AulyMOEf
	aTY/y3c8iTEdNRBVlk7w+EYMhdYLMpOHcXyQqsIhhOK0IT5yal4xok24Oaz3PUTsR1sL
	cqVXTY6rD8rM5QI2deUbSUonp2z9Ut8HZQWqjAXMF1BuEuzBljusum3Jewf0ArL9O4hU
	S8Op/plvBMzV3M4LhiFLdPdXiqDwTBzuVc8w30D0cdAtbPXqyVOsROB1jvGrC7nXFKhY
	Enhg==
X-Gm-Message-State: APjAAAWPoqpQuN7e6dRnUHSLP1dRwDHNyyXFeFFjorVHkY6eI0cRXEyL
	PLabwCZ9SlDF2+0ynRZVftuj1vRJEB68Z4YQbRRhSA==
X-Google-Smtp-Source: APXvYqwV1Q/sPKdFW4b2QsyA5n9aqmPpvwUp+52NA0oGzFhaMfm7mWtmArZJL//NRkYe2ayZEqB/RgI1ubyqENWUemI=
X-Received: by 2002:a05:660c:111:: with SMTP id
	w17mr7379471itj.62.1553779042049; 
	Thu, 28 Mar 2019 06:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553775186.git.Qi.Chen@windriver.com>
	<a1544536fd186e7326faec46f7e35c6a1d33e45e.1553775186.git.Qi.Chen@windriver.com>
	<CANNYZj_xbMheU=FEenRYkccJwxG10mJPHSqmwekt+EqAV=FumA@mail.gmail.com>
	<CAJTo0La3fza0yn=dcWYWjSh00oJD1NQg8UMDOYSN0w_y4qODXw@mail.gmail.com>
In-Reply-To: <CAJTo0La3fza0yn=dcWYWjSh00oJD1NQg8UMDOYSN0w_y4qODXw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Mar 2019 13:17:11 +0000
Message-ID: <CAJTo0LYwZ0WNNsA0Wm+uzAsuAHHiRzKOE=aGZZOkRfa56Furpg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] binutils: fix PV to respect upstream tag and also cve database
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
X-List-Received-Date: Thu, 28 Mar 2019 13:17:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2019 at 13:15, Burton, Ross <ross.burton@intel.com> wrote:
> On Thu, 28 Mar 2019 at 12:07, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > The problem with setting PV properly, is that 2.32 is less than 2.32.0
> > and will cause the 'version going backwards' problem. But if RP/Khem
> > are fine with it, I would prefer your patch.
>
> I just had a look at the code in bitbake and yes, it actually even
> tests that 1 < 1.0.  I'd say that there's an argument for handling .0
> releases specially and considering 2.32 == 2.32.0.

Of course that test exists for people using feeds, and at least dpkg
thinks 2.32 < 2.32.0, so even if we changed the test the feed would
still be broken.

Ross

