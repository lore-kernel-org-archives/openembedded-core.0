Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id BA3597E9AE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 12:42:23 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f17so13066081wme.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 05:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ZtqPxEcM22ScNKOjHHB4YIXDcx1RJ39NqJktpSaWOXg=;
	b=SzE+MUEUSF0kog0De0b+sNEmM5Gnjb8OgwST32iPgp6E+HUsJ6GhRygrz8Twg6px4M
	T/1vdZPFqyodsK7awkCYCgIfju5EL0AVLaywgOofDq4+ux7BtmfCRyhvCMxgeTFQHIV+
	PtRcVMu+VSfslD0onJ51TwLcYykZDl+3eQGI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ZtqPxEcM22ScNKOjHHB4YIXDcx1RJ39NqJktpSaWOXg=;
	b=RMfgiTcmCHa5kYI+Qz5PA7ceSiAEHM3wJXm5hRsEFQlWwB3+dU/KMCn0CUg841vU1d
	aXkCLwPEilz/Gg1SpkR4PfW2utSPp9E7GqbvsYBCfRzgGtnxIOUzM8Wk1kUKzf/8aJoR
	HB8XvAErYbh+lDDQ5eqjlsqOaWkLOU5Q/y+/wQPT1chcVGpekddO5BG65o+mz+GZBTqt
	9wy+iMFgXOClcia9DIsQjLhtpoaImHePHWMGOoNzgzg8LF45Xo2zrl7VLHAjjf4j5odb
	gHLa2aNIpZFI44zTg8co0Si6Lbiimtv56ML0cGELxFZx+arJMP7fY8ehT1bEzjRQFyrv
	OTgg==
X-Gm-Message-State: APjAAAXM665tpZkepl+WI1HkAtSaNXesUaU42kffenhLIRAXj7oOXNdq
	AUpzN9h4hpyZXnDig5TTrLgWmg==
X-Google-Smtp-Source: APXvYqzXM9al+kwWLM/KgTXm5tyy+Mw8HO/jPWoFTBQ++qrSBldB7OOcu0JiUyNikw0N5K9jvQu2RA==
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr12847704wmc.34.1561898544544;
	Sun, 30 Jun 2019 05:42:24 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z126sm13409690wmb.32.2019.06.30.05.42.23
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 30 Jun 2019 05:42:24 -0700 (PDT)
Message-ID: <3f3cf17274fba19615f0b344433501a48c57cd96.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 30 Jun 2019 13:42:23 +0100
In-Reply-To: <20190628132457.39465-3-alex.kanavin@gmail.com>
References: <20190628132457.39465-1-alex.kanavin@gmail.com>
	<20190628132457.39465-3-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/6] meson: update 0.50.1 -> 0.51.0
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
X-List-Received-Date: Sun, 30 Jun 2019 12:42:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-28 at 15:24 +0200, Alexander Kanavin wrote:
> Drop backports.
> 
> Rebase other patches.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

Something in one of the meson changes is resulting in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/766

(mingw failure in nativesdk-glib-2.0, I bisected it locally to one of
the meson changes)

Cheers,

Richard


