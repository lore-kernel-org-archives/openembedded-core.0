Return-Path: <djszapi@archlinux.us>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id EAFD560629
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 10:50:58 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kl13so5650542pab.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 03:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=qbOM2Qa06+17kKLLbqJTn09FbqLzpkdTyVC+Kl1x6kw=;
	b=Tgzr74oERGsRZSWqeQADV/aGEJ99D+UdSzF/rN6JusDYj0ZYOGL5GCVFSt8v2zOpKm
	6nIkM96lRAImnxAYk1Gvyze/PpV+EaDL59PQ0E+Cvn2/MhZPE9cihWKQhAj9CdCLG1+7
	D2l1Npb0R9PNqcOruXPrzGwA8jnyr1hOR8nQTzpEWsJb6Yq2PfvQpg2V/hkQ9t/qBdBZ
	c5FnUjhgZc8bJwq1oZYAZRgT3KR6fj2VtTi96WT6AuWzjB6R2/G5dcwFmOvbLZ4T9VoQ
	cj3UjRpC4MyWTQU12N4O5dazqGPW2OHMPAmTvkVhIs+M75W/B1Re+prRNOgXeDji9g3i
	ggNw==
MIME-Version: 1.0
X-Received: by 10.66.155.102 with SMTP id vv6mr32817838pab.89.1375095059848;
	Mon, 29 Jul 2013 03:50:59 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Mon, 29 Jul 2013 03:50:59 -0700 (PDT)
In-Reply-To: <CAJTo0LaG_CZcqXOrRe_fLq-HpQOGfqWeLFq7F8Cs8FTbsEnRPg@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
	<CAOMwXhO6+sJWjKAKVh=y1gymGoSUNVgs+nV9fz8G8eo9WHyAkw@mail.gmail.com>
	<CAOMwXhN556gDMxEGGSaFwYMJ7EU=Pvn+4mZcy0Q4eLyn7ShjqA@mail.gmail.com>
	<1375094306.13247.11.camel@phil-desktop.brightsign>
	<CAOMwXhNsgLaOtmCouNmB3d7wuACAt7iSLfO5zMq-ph0FBi8w0A@mail.gmail.com>
	<CAJTo0LaG_CZcqXOrRe_fLq-HpQOGfqWeLFq7F8Cs8FTbsEnRPg@mail.gmail.com>
Date: Mon, 29 Jul 2013 11:50:59 +0100
X-Google-Sender-Auth: ou6lrZLAIRXZIftyuQKy8gQq56I
Message-ID: <CAOMwXhPzD5wVKB_dB=ucF32Qq5p-rzuUpLHOFJXA-pe7xg1EDw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlPG6CyU7HTP+6l/0URXJ5KWpbMpn0PEEU4yy9z8bwTUSZEXrFz8WVYBHcr2i12ybFpZUwn
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Mon, 29 Jul 2013 10:50:59 -0000
Content-Type: multipart/alternative; boundary=047d7b86e3a893332004e2a44474

--047d7b86e3a893332004e2a44474
Content-Type: text/plain; charset=ISO-8859-1

Why it does not make sense in my opinion is the fact that the many people
would already need to do this right now. Yet, you prefer a few people (if
any?) with only a very limited application set out of the 1000+, as it is
only two which is affected?

I do not understand how the gun can be compared to the cannon. It is
unfortunate you guys introduced regressions for those users, but I just do
not have time to make everyone happy. I am not paid for this as a few in
here. However, I still think making more users happy than less is a nice
thing.


On Mon, Jul 29, 2013 at 11:46 AM, Burton, Ross <ross.burton@intel.com>wrote:

> On 29 July 2013 11:42, Laszlo Papp <lpapp@kde.org> wrote:
> > you would cause a "runtime" issue which is pretty simple to fix
>
> Enabling rfkill would involve writing a bbappend and patching busybox,
> when a PACKAGECONFIG would make everyone happy and configurable from
> the distro.  Even if we disagree on what the default value should be,
> it should be a PACKAGECONFIG.
>
> Ross
>

--047d7b86e3a893332004e2a44474
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why it does not make sense in my opinion is the fact that =
the many people would already need to do this right now. Yet, you prefer a =
few people (if any?) with only a very limited application set out of the 10=
00+, as it is only two which is affected?<div>
<br></div><div>I do not understand how the gun can be compared to the canno=
n. It is unfortunate you guys introduced regressions for those users, but I=
 just do not have time to make everyone happy. I am not paid for this as a =
few in here. However, I still think making more users happy than less is a =
nice thing.</div>
</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mon,=
 Jul 29, 2013 at 11:46 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 29 July 2013 11:42, Las=
zlo Papp &lt;<a href=3D"mailto:lpapp@kde.org">lpapp@kde.org</a>&gt; wrote:<=
br>
&gt; you would cause a &quot;runtime&quot; issue which is pretty simple to =
fix<br>
<br>
</div>Enabling rfkill would involve writing a bbappend and patching busybox=
,<br>
when a PACKAGECONFIG would make everyone happy and configurable from<br>
the distro. =A0Even if we disagree on what the default value should be,<br>
it should be a PACKAGECONFIG.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Ross<br>
</font></span></blockquote></div><br></div>

--047d7b86e3a893332004e2a44474--
