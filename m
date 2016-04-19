Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id EA21A60116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 18:24:50 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id u206so44085030wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 11:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=OXX0GqcyGa4kqsJx9yuuIbmqyuLpXqpoWFC08o441yk=;
	b=zd3F6MGbqWTlPeYUAFn7e+X2fXR/2LwQ/VvAFeG44ePsR8uAR+F5idZWGJk76w2VTG
	DazdOwVXY+3OxsPKtkm+BO1WwXDfZTEZwuaZIzsaI2ZWuE+nPRLHZDZJQJwh4FySnlLP
	oPCgxl8LgVRqwbryGuSDC+YbKrDfzSyRDzbpz4NdEIbAKgWdQMgUFCG0WYVB31EkRK/C
	SfWzQrUufLE5Dgcxd8YHpcCSoaiEA1Kdo5ry3miJEop9ZG5A6/FvmmjdIOC3Lx8KLtmz
	xdomv85A3NJtOhnymIyvlLXdSiOKH73C3h3abOCD+bbmmfaRU0XA8fjadGqelXxojmrh
	842g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=OXX0GqcyGa4kqsJx9yuuIbmqyuLpXqpoWFC08o441yk=;
	b=BZHhQRQ0Tr0d9N7IXLJkFP3zFf/vaF1d+LdB/2dzc1rKpcLslEEh+yTUpQehDWPOAB
	XgKevJdBOjCFuxT0ueWh+oMTo9gDFDg9YxJFz0+ibK1lO6cL+vmj2Xt55B9dyiqAHbCQ
	JPb1RbphyA5PcXXWHAzz2mnCMCJRJw+KRJgmkf4knYbqOi0TGbpnYBLTjOwe/U5nWT3o
	lqEaZNpipTzL6yOLls92sj146upKTNM050qwu3Z1JHh9bOm8k41j0KtlhdcheBKYOuBu
	C0Js1rs/e03MelmfHyiP4BuOj+GNFRj9p7qYn9Dyk8U+hyEziKX43Jv6D4GqFdJ4DHXu
	aDSQ==
X-Gm-Message-State: AOPr4FXyp+dlvH5SHfQ9bji4E3DZNA2pupgbg1uO3vI7mQRqSDezk0zD7I+xZtFc5+itTw==
X-Received: by 10.194.94.231 with SMTP id df7mr4878070wjb.10.1461090291383;
	Tue, 19 Apr 2016 11:24:51 -0700 (PDT)
Received: from ?IPv6:2001:610:612::85a3:f2d1:fa4a:f06d?
	([2001:610:612:0:85a3:f2d1:fa4a:f06d])
	by smtp.gmail.com with ESMTPSA id
	wa1sm1492710wjc.45.2016.04.19.11.24.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Apr 2016 11:24:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAHiDW_FCskCiuL0bf0UwRWyR=nr0GYzGhf5fRuxMrkHz_j=kSQ@mail.gmail.com>
Date: Tue, 19 Apr 2016 20:24:49 +0200
Message-Id: <49E8A3AC-D4EF-4CCB-9CEA-1CA8E0A6425D@dominion.thruhere.net>
References: <CAHiDW_FCskCiuL0bf0UwRWyR=nr0GYzGhf5fRuxMrkHz_j=kSQ@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: xinput-calibrator startup question
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
X-List-Received-Date: Tue, 19 Apr 2016 18:24:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 19 apr. 2016, om 17:12 heeft Jussi Kukkonen =
<jussi.kukkonen@intel.com> het volgende geschreven:
>=20
> Hi Koen,
>=20
> I was looking at xinput-calibrator in preparation for bug 9365 "Remove
> xtscal in preference of xinput-calibrator", and I'm wondering if you
> remember the logic behind this commit:
>=20
> commit 6464bcd67d10ab9967ac83c27c413c1014be707e
> Author: Koen Kooi <koen@dominion.thruhere.net>
> Date:   Wed Apr 30 11:33:23 2014 +0200
>=20
>    xinput-calibrator: fix XDG launch
>=20
>    In the move from meta-oe to OE-core XDG based launched was dropped
>    without noting it in the commit message, so fix that regression.
>=20
>    Gnome-session will now launch the calibrator again.
>=20
> The commit installs the app desktop file in the XDG autostart
> directory. But we already have a XSession script for a similar purpose
> -- the result in Sato is that xinput-calibrator runs twice (and I
> would expect that to happen in gnome as well)?
>=20
> I'd like to either not install the desktop file or install it in
> applications directory, so please let me know if the reasons for the
> above commit might still be valid.

They are still valid, XDG is still the right place to launch it.=

