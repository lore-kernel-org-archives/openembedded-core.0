Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id D613C7CBAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 14:57:52 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id w66so1600117oia.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 06:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yK5V4D4FjSluf4WcYy64ZPdxFfYTEXafB6O4Jy4Gw3o=;
	b=u/nOBeMcqWZGxJMvr7AUWb51yRg/aRL1Y1leMdgg3CC4P/y+Tc8eEzYHqz+cs4V1Ig
	2+7Cv+fg2rsffzlAe77Vj3yMcKBbED0m4ORTw37pSy7W/Y2pJEdFJxUh4CU243jAQQsk
	OJNLNxn+hjrRti/1ZLfxye4z7VPCRVCDiZAQxW/yLdQ7iM5enuNolCUy6nuc4ZmVKtyc
	k0oKXoG0XezYXNqlcYJb7L83T+dDV0BvxW6GScKGIP/r7Rc2kqaa+EODDiQlXTHtl0ZU
	OiNEXoXLSkD4qLyuLYTO48sz/3SJZNsSr5IBWVFLGfgcUUAP2r04fB+befs+cMB5/lRf
	oTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yK5V4D4FjSluf4WcYy64ZPdxFfYTEXafB6O4Jy4Gw3o=;
	b=BotdIU+At114YuLJQoTBo1Sw9CqU5xo+D3p1QVlWgZRYlQVewBzHVDcFvQy5PZJ2st
	VO3loldXAfxTHfWJZjN0mryrqNKz0hzf83917IMAuvXDGsybXyK1Ev6aHaU7qvlxFyEc
	U9cVnACAHaiMwm9f6ccU+SYtpgUKc+QxDM4wnEyOblNGCWVqmA2BU73fY/3kIQhvsRoi
	e6mPFxoS/XsgcQ9pf8OD7mZdFpHYeAWnYd4QVFWYcGVU+8yJWbnTbNNuTmBBe6ah3vRJ
	bzuMInBCvlCRKNjggpWhCHABjQ6RqROXIRlYATFh4dPLNqKtjX0/pLzJ8Y5/fMAGJM/O
	eslA==
X-Gm-Message-State: AHQUAuZRvndrvhVkU8JGi2dOewV75NkKdNOiZwoB6QopklQqygwRxjdC
	QNp0Q5eMH1A3m3ne63ynUHsowp5ZOfOqiixe2ow=
X-Google-Smtp-Source: AHgI3IbZBb8Zw3CWFFHFXYeVw/PVoF9cqmRkg4uy34ztkVNvMW5dILIElOLaZxnCyTPHdxneEEv4M7yxSh8ceHVb/3w=
X-Received: by 2002:aca:4c58:: with SMTP id z85mr9291614oia.140.1550761073814; 
	Thu, 21 Feb 2019 06:57:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1550755109.git.tanuk@iki.fi>
	<CANNYZj8f0SMDZd3wryCZ0A2=RjLfOAR6q5=bLsV+QgWDakJ_7g@mail.gmail.com>
In-Reply-To: <CANNYZj8f0SMDZd3wryCZ0A2=RjLfOAR6q5=bLsV+QgWDakJ_7g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Feb 2019 15:57:42 +0100
Message-ID: <CANNYZj-8euMhvqpAwHoZfofAm=FdCtJSb9i7QOMiTGMhv=322w@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] alsa recipe updates
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
X-List-Received-Date: Thu, 21 Feb 2019 14:57:53 -0000
Content-Type: text/plain; charset="UTF-8"

(Also sbc needs an update, I think)

Alex


On Thu, 21 Feb 2019 at 15:56, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Thanks! Will you be also sending an update to alsa-tools?
>
> Alex
>
> On Thu, 21 Feb 2019 at 14:34, Tanu Kaskinen <tanuk@iki.fi> wrote:
> >
> > The following changes since commit f15ceac287c094abdeda64b03628455d92e0ce74:
> >
> >   libdrm: Upgrade 2.4.96 -> 2.4.97 (2019-02-20 21:22:28 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://git.openembedded.org/openembedded-core-contrib tanuk/updates
> >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=tanuk/updates
> >
> >
> > The alsa-tools update is missing, because the recipe upgrade deadline is
> > near and the changes in alsa-tools look like a potential rabbit hole.
> > I'll send the alsa-tools update separately when it's ready. The main
> > change in alsa-tools is that the hwmixvolume program got ported from
> > PyGTK to gobject-introspection, and from GTK2 to GTK3. I doubt anyone
> > actually is using that program, it's not even built by default.
> >
> >
> > Tanu Kaskinen (3):
> >   alsa-lib: 1.1.6 -> 1.1.8
> >   alsa-plugins: 1.1.6 -> 1.1.8
> >   alsa-utils: 1.1.6 -> 1.1.8
> >
> >  .../{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb}  |  4 +-
> >  ...plugins_1.1.6.bb => alsa-plugins_1.1.8.bb} | 84 +++++++++++++++++--
> >  ...s_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} |  0
> >  ...lsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb} | 10 +--
> >  .../recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb |  2 +-
> >  5 files changed, 85 insertions(+), 15 deletions(-)
> >  rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb} (88%)
> >  rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.6.bb => alsa-plugins_1.1.8.bb} (51%)
> >  rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} (100%)
> >  rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb} (92%)
> >
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

