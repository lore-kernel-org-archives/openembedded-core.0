Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 705C56011A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 13:45:57 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id m9so40880530ige.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 06:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2+3gVs/C7wXLzHBMg7qhDqozunrV6MmvfZEpBYOVuy4=;
	b=j9RRXFLnqOy4ms8KV4oRXFxMlBxA+cDmbRTqtGuJky4MhU49+GL45V9Ql5xyIMVLXf
	8tcXhk9Sbq2HeWN4s2+SSa/qu80cQ4bsriXrowMksVjKSWdgqtcmJsi2T9/edFFMZIhb
	gGo4q3nJ39gJI8SViUK4orJwCvbDBClMeCacT0Uu9+LZE2Y9daNBAj49NRvFvG4Azzw3
	rlnZRdphMFG6145d1XCTmoXpYKxu6eCSFVrJFFkhJwU5GKMJ96xWXrI/n1zo79ytVoC0
	F3ZBoH+aEcLwrGKsAeQm2HNdVFWfFWTKgZC+49hLe6JwSyjByW/rwP4ht00aWEhb2qfn
	7B8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2+3gVs/C7wXLzHBMg7qhDqozunrV6MmvfZEpBYOVuy4=;
	b=ThURFzFY4gJc1Lj0UGltJ/oK1XXzr4uj8dphINyTASEWpEzyGiMs3grUbH4NjSDaY7
	fUghguzekas4er0GcJqEeeuuqU+uMU9JBS3CZlLVr2O9YVTrh+CyM5QX8hY2ZVzI9G16
	lwCzhcVCCbJcbeWya+317L8bMACysUXzEKoWR961yS/CqF2X5IG8DtvfC1acqMXHOJtq
	h4OqSGmjncucjggdtJ8q28JiaTsUUwkL9izEOEYrs27raLUKNcx1lRi9OKGSIhxjuRyk
	Srtd0fm1sqZ4Rucb/+rbXuP8cozX0Mb84TEqhIK0Ig9zOZ5i47cd9QMNWkYS1ZZ22/3F
	MFWg==
X-Gm-Message-State: AOPr4FUdx+A9d6Ucx6PFSmal85FH2KGnGwSML0x1mNiWByVPhjDVOJprvtqhwd2a+BdhvjNXQCGu7shg6k96zxCs
X-Received: by 10.50.62.20 with SMTP id u20mr10348737igr.52.1462542357691;
	Fri, 06 May 2016 06:45:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.34.142 with HTTP; Fri, 6 May 2016 06:45:38 -0700 (PDT)
In-Reply-To: <CAFL-KX8ffjqey04OTBCndwyP61i_mzcDY8tnGknRyA1edBTsWQ@mail.gmail.com>
References: <1462507108-17945-1-git-send-email-rwoodsmall@gmail.com>
	<CAMKF1spYLh9=YybuH_aJ9QLhJ1=Ub79VMVgFpBv3QXuD8r2-9Q@mail.gmail.com>
	<CAFL-KX8ffjqey04OTBCndwyP61i_mzcDY8tnGknRyA1edBTsWQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 May 2016 14:45:38 +0100
Message-ID: <CAJTo0LYQ+hwbROgqxY5ts1uq3-DWj3Y4xhq2shPP7qC687x2aw@mail.gmail.com>
To: ryan woodsmall <rwoodsmall@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Make static lib builds (DISABLE_STATIC) configurable from local.conf
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
X-List-Received-Date: Fri, 06 May 2016 13:45:59 -0000
Content-Type: multipart/alternative; boundary=047d7bdca606b3603705322cad6e

--047d7bdca606b3603705322cad6e
Content-Type: text/plain; charset=UTF-8

On 6 May 2016 at 05:38, ryan woodsmall <rwoodsmall@gmail.com> wrote:

> The idea is to build an as-close-to-stock-as-possible Poky (or another)
> distro, but include support for static linking natively in the installed
> OS. Some of the bits I build/ship, including standalone static cross and
> native toolchains, target Poky as the stable reference source OS


Don't consider Poky to be a superior distro over others, or even the
default nodistro, as it's not.  It's simply a vehicle for our QA process
and is a pretty minimal set of changes over the oe-core nodistro.

Ross

--047d7bdca606b3603705322cad6e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 May 2016 at 05:38, ryan woodsmall <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:rwoodsmall@gmail.com" target=3D"_blank">rwoodsmall@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">The idea is to build an as-cl=
ose-to-stock-as-possible Poky (or another) distro, but include support for =
static linking natively in the installed OS. Some of the bits I build/ship,=
 including standalone static cross and native toolchains, target Poky as th=
e stable reference source OS</blockquote></div><br>Don&#39;t consider Poky =
to be a superior distro over others, or even the default nodistro, as it&#3=
9;s not.=C2=A0 It&#39;s simply a vehicle for our QA process and is a pretty=
 minimal set of changes over the oe-core nodistro.</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bdca606b3603705322cad6e--
