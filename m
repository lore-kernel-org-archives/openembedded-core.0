Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id A7EA96E9AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 18:46:19 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id p10so3320574pdj.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 10:46:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=HSFYHJN4zwKnD35un6KRw/UJFoDbNP/XdAbUcgf/aV4=;
	b=LxkxLvADtP3yyNoS4zeUs9o/NCy8ABsAbnMoeBWPX+Mw7FspH1p6KbwBTqOokR2dWf
	lIA+EUcKIo9Po311imsk/gATaiFrw27eVhS5jsjVYZeVHNer9iJ6DSmSJ1xwstXKGr8/
	+HFOCgF49OtxNSnW6IyKK88a+4zfKGBmv0BnpHnVLH65nTycwVeg5GDtpUMgWma1R5Oj
	1UX3XZAXOpuW2bYojx2/lbUEXIcxHhArQ300Of58C84juo76n0ytJ+/+2smLez3UEtst
	P3iP08pYsT4N7rhI/DremMLn6lZWmVtWkXenLKBwM51DGcBYmZX98H22YL3sf0K1nrYn
	2MsQ==
X-Gm-Message-State: ALoCoQmlcZOG1/S2ex6z6Ptwr6P/njmfnqt37Fc1emQXD3LovR4NmiT+7Q3Uhms87rTaXrJJ1wZm
MIME-Version: 1.0
X-Received: by 10.66.139.100 with SMTP id qx4mr16023905pab.141.1391107580441; 
	Thu, 30 Jan 2014 10:46:20 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.21.228 with HTTP; Thu, 30 Jan 2014 10:46:19 -0800 (PST)
In-Reply-To: <CAOMwXhPNi357C8BvFjvVYtQUDepu5VK-c1phR=5UseZg79uJ6Q@mail.gmail.com>
References: <CAOMwXhPNi357C8BvFjvVYtQUDepu5VK-c1phR=5UseZg79uJ6Q@mail.gmail.com>
Date: Thu, 30 Jan 2014 18:46:19 +0000
X-Google-Sender-Auth: Gu3i4gBxEWpFdKw_xrr_7uCiJ5E
Message-ID: <CAOMwXhOH0m9PNL10c6gBNhCK+iMoiVtujX1_N3i2KaBAYBgFeQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Putting fltk into oe-core (recipes-graphics)
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
X-List-Received-Date: Thu, 30 Jan 2014 18:46:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

Ping?

I asked this a bit more than five months ago. Shall I take it as "No"?

On Tue, Aug 27, 2013 at 7:59 AM, Laszlo Papp <lpapp@kde.org> wrote:
> Hi all,
>
> was this thoroughly discussed before? I think the 'fltk' graphics library is
> quite lightweight. We still use that instead of qt and gtk on limited
> embedded platforms simply because it takes 1.2 MB or a bit more rather than
> a full blown Qt with 10-12+ MB.
>
> If I understand correctly there were discussions that gtk should not be
> inside openembedded core which I agree about. However, I think it would be
> useful to have some lightweight library like this in. Of course, this is
> lacking some features that Qt has, but that is why it is lightweight after
> all. :-)
>
> It is currently in the openembedded layer. It has a couple of minor
> dependencies which should probably be moved, but I do not see anything
> major. I think it is a more "core" option for ui building than the
> alternatives. This also supports opengl to a certain extent.
>
> Cheers,
> Laszlo

