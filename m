Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 62344789BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 20:18:42 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id b5-v6so5762730qkg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 13:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VdZ3nZkWz6vEov1SuOPcU7Jp69Y4CXrR6abKgdOEg/E=;
	b=pI6dYLehwAXS33QDWB1nsImNVKFT1Qvzeiwk+ofAjfUbJ6S/CESbeUo0PznkNEtV7H
	qOT1BgJbKiZCug8LsgM+m1Eps3l2NacUD5GQpQ/67Tb/6NUyuAbrK+Njl90jz2pNsHAa
	ULvRNiFXNGUhu7ah6ae9vYZVRSe2g+CtAtAKFHTrJZPH8h/KaO5y+vbB8he5y0DI9q6W
	g5AeMAPICId4amqBUjNJEixFmnqmeDqvVzz48H/+C8r3q4GSfZgJK//+M324Cxyn0Omm
	GP17s/6xRkt/nskVubEqZL+H9Q1Vq5Bi+6r+VBYSPvwwPEz3vIbjo67Bak+qilzYhx+Y
	RtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VdZ3nZkWz6vEov1SuOPcU7Jp69Y4CXrR6abKgdOEg/E=;
	b=WY24Dr72/syTr279gBqByqY7nrUWwqmXJBFGXMJTGU+vkf2eoBplYSUudXlQca21yd
	ZWzFa2t/ZDVfNOAMawK9trW2MsSJCcIN8SakgP2yJ0HXEEEeQeDiv9sNYXlWGkPSuRiQ
	g0VcytQzjZEA3CDf9KzmxJHkEQA4f5SYwx+VK1h09mC2rnQQtY93ptKV3eI41OsMNDYp
	xut4xNVFH1Pl9zyPhTGnukh4spFjwqQfq/9a3tWCwx8HmiheNlQlXrLqvOJdHThBdLGE
	gpW3Z+LJQET9v4IuQR5aGFa4Zt/lTpDgMRb215c0NBDO8WzSl1kJrJepXpKR6+iChCwM
	rYjQ==
X-Gm-Message-State: AOUpUlE3VPfisWvNR4zqYyfqHij9JZEKv0IzwWND3x6a2MWZSrR+vQsY
	Qfb+vaZU3v+Zzry/CAmVBqz6dA1c3XfE6zicun97SQ==
X-Google-Smtp-Source: AAOMgpeUK5MzZokBcI6lRdAMvtVM25QfIDe2o052y8ZNI+REXwDiv8SXl/ytXPMj7+2tLJFGttMvRxFTqcShE0x0a5A=
X-Received: by 2002:ae9:c00d:: with SMTP id
	u13-v6mr20521634qkk.290.1532549923017; 
	Wed, 25 Jul 2018 13:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20180721162715.12611-1-raj.khem@gmail.com>
	<20180721162715.12611-3-raj.khem@gmail.com>
	<CAJTo0LbU0UhP6OzHJwJQBcFXw+y3+9f+1BxFiQX3FCbotxOtFQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbU0UhP6OzHJwJQBcFXw+y3+9f+1BxFiQX3FCbotxOtFQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jul 2018 13:18:16 -0700
Message-ID: <CAMKF1soP0u3xLKb=tjxNrojvQQ2PFx3O6N-aS_W4huuzJBMiFQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] libsdl2: Find wayland-protocol files in proper location during cross compile
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
X-List-Received-Date: Wed, 25 Jul 2018 20:18:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 25, 2018 at 1:08 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> On 21 July 2018 at 17:27, Khem Raj <raj.khem@gmail.com> wrote:
> > +pkgconfig would return an absolute path in /usr/share/wayland-protocols
> > +for the pkgdatadir value, which is not suitable for cross-compiling.
>
> For reference this is due to pkgconf (not pkgconfig) having different
> behaviour compared to pkgconfig, which is breaking recipes.
> Personally I consider this a bug in pkgconf and there are bugs
> upstream (and new releases) which may solve it directly instead of
> having to fix every user of Weston (which isn't the only user of this
> pattern).
>

while I agree its due to a different behavior from pkgconf, the
solution is not relying on pkgconfig features
in itself is an improvement IMO unless you say its regressing builds
when not using pkgconfig
> Ross

