Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3CE5074197
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Nov 2015 10:19:39 +0000 (UTC)
Received: by wiby19 with SMTP id y19so2657005wib.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Nov 2015 02:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=DYy80M0YZ7R4k93hbAduP01RIdYtr6I2DDtGT5epu4k=;
	b=BTTQmalj6+wKSResJWsoutDz/e2kUtfIERdSNo6onAyqXf2gNea3RADAwxHlMPLgtq
	xYu09eO1+YLFFXHYJ+qngWu2ikl/TVl+Sc6uJMINT7MLUaptknBpPBoMP5NjBoFlOUGN
	wv1L5nY5NirGlm8kvtF/iSN5d7gn1+CPEo9jVNh4U2dEg73rHPtPISq7Qc7ty4Yqak0n
	KSn6bbxCUsKQv7/36osHFSpzYDAMvlcpcVCFWyzZsC5JlIWjnIF6k/bFXI5Nn3NGP9cA
	Rxlts7sVi7yVN91KFI2s9HzlHU3E4WbfCW9tz3mglDzi0EVL7z7ozoulzN62UTzwdM1H
	H0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DYy80M0YZ7R4k93hbAduP01RIdYtr6I2DDtGT5epu4k=;
	b=ADUrlZmcLXk37txjkerr5xiYPPoDyLKJBo95E7Ufig8chSyMSrDJRuvOdlAceb+eqC
	hVqtkjDDQhFgK4+1DOXYjxuke/2aPNU/ggsr4QfHu6l6mbWXZsuJN1GoeTJobj1OJMom
	thrOZuptNszVFifazot663oRfXTffOIm0IRQ6xBhv9hXwJjwEIlGFKNYLCNzxhv46Uws
	FPLx7+jZTwfhyPVLI0h/R35Uop6rc5sfoUFRkJxOGip6shECb6m9rzx2vhtQQi3bxRwS
	JOkHyY9gp57c6yc88oAOgcHOm6D+d7PAA77u1ZQEB3zEHNX7G3/LGRRc5urvRstlqmz5
	FqJg==
X-Gm-Message-State: ALoCoQmNQJ8tTiB3A8jGM/pgejUcpkfXWrfF0GrcL2asRJpxJIduY1QbKx8XEbHFBpL/lGgXaMN2
X-Received: by 10.194.105.38 with SMTP id gj6mr22870176wjb.130.1446977979146; 
	Sun, 08 Nov 2015 02:19:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.27.216.207 with HTTP; Sun, 8 Nov 2015 02:19:09 -0800 (PST)
In-Reply-To: <CAJTo0LZbx2rXSyvqED6Mi2aJ37tPFXuK2UggiyKCmmk7sAt_8w@mail.gmail.com>
References: <cover.1446729162.git.jussi.kukkonen@intel.com>
	<CAJTo0LZbx2rXSyvqED6Mi2aJ37tPFXuK2UggiyKCmmk7sAt_8w@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Sun, 8 Nov 2015 12:19:09 +0200
Message-ID: <CAHiDW_Hh6ZitOvA8G8i-uZ1VfvYKrKgxsfkKeaU2DXEyBtvnww@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Upgrades: GLib & friends
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
X-List-Received-Date: Sun, 08 Nov 2015 10:19:41 -0000
Content-Type: multipart/alternative; boundary=001a1130cd4671fab1052404d094

--001a1130cd4671fab1052404d094
Content-Type: text/plain; charset=UTF-8

On 6 November 2015 at 22:38, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 5 November 2015 at 13:27, Jussi Kukkonen <jussi.kukkonen@intel.com>
> wrote:
>
>> This should be a cosmetic issue (as custom allocators didn't
>> really work before either) and is already fixed in upstream Qemu.
>>
>
> As this is pretty ugly, can we backport the fix to our qemu?
>

Sure, it looks like a minimal patch. I'll add it to the patch set.

Alternatively, moving to qemu 2.4.1 (that was released this week) will
solve the issue as well.

Jussi

--001a1130cd4671fab1052404d094
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 6=
 November 2015 at 22:38, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mail=
to:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote">On 5 Novem=
ber 2015 at 13:27, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mailto:j=
ussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"overflow:hid=
den"> This should be a cosmetic issue (as custom allocators didn&#39;t<br>
really work before either) and is already fixed in upstream Qemu.<br></div>=
</blockquote></div><br></span>As this is pretty ugly, can we backport the f=
ix to our qemu?</div></div></blockquote><div><br></div><div>Sure, it looks =
like a minimal patch. I&#39;ll add it to the patch set.</div><div><br></div=
><div>Alternatively, moving to qemu 2.4.1 (that was released this week) wil=
l solve the issue as well.</div><div><br></div><div>Jussi=C2=A0</div></div>=
</div></div>

--001a1130cd4671fab1052404d094--
