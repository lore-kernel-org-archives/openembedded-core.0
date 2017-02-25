Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 08BBF71C1F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2017 23:05:46 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id s186so52578787qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2017 15:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=cq5F36S87nDoScnBXFBbQQgNisC/m1EYpUX3fYuOQhw=;
	b=R8Qrl9mpJ6t/aha9r5QdgRyil0yMOaxJr10cInUVU815gvJBr+jSVmRDgVw/LDQKnc
	LiovXOQUjuCCTI9unZdy4L2Xwtfacf0ZUD10lIwu8vlO19FmhAhc99owQKgbOlOeAI64
	j54nGLDT/JSXvMEXbNmsOIFGtl1E55bJ1uRaUhthhK46wdZeeSfiKGD6fWAV1GVMJ24f
	QxT3R/acv48BcMGDv8qGfgu25TE9mpM4BWXl/oD54mE1PAyY+Ac/S0QxFzSuoxfB5WKQ
	R8HSYn394AQMYq9/Pni+SXyfsc5cSQJ+fM2/cmmPC6ANsLJuRXa+YwC9FHWpQn2Z3Nsc
	1unA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=cq5F36S87nDoScnBXFBbQQgNisC/m1EYpUX3fYuOQhw=;
	b=TWKQefXTqtzq7RpAqrkn7UYE1MunZ0rSyM1bNu5PWQMgq+0bWrW/QJzcJ2kD7AXByy
	o4Z38xM8aOfWO58/osMXQt8a93kfAVPgEJa/xMZxrMzhh6PvJzqAJts5GxTEhEzUt1kc
	W6tJClbo8TeXe7dbuFSHQmDRHknJvftw13qLDdMg0FVonhZcRuJzONy0nzqJ5y3WdKiG
	M1sCZ4+4hxi9WLOyxI51Mjq1hxvNYtQA8HEy88dL+DddCxjSJAnTvazSMZbDeEH7VAub
	P8lPv7qdBpbz55EDy6C2+5hHhNcZO4ybuIpWxLLbDYS1k946BCzN1pGZdfABeliPTD8d
	/2wQ==
X-Gm-Message-State: AMke39mj1uPw2LzCz3RimhQumVc8rUtiaAhAH/cncCqmI/arMoxdGP4WXXiJl4D2faZGCto7/Pc762d6PzPKdvM8
X-Received: by 10.200.41.115 with SMTP id z48mr7910401qtz.109.1488063947903;
	Sat, 25 Feb 2017 15:05:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Sat, 25 Feb 2017 15:05:27 -0800 (PST)
In-Reply-To: <CAM_RqkNdN5e2yR1BxYnM1wbdKxYLpk_wVVX3pR6sbKL_na8GpA@mail.gmail.com>
References: <1487961739-4548-1-git-send-email-ankit.tarot@gmail.com>
	<CAJTo0Lak84XUFb8WM1WuZ_w2a1wHtKwoWwDTtZ_wtXK5_x3uFw@mail.gmail.com>
	<CAM_RqkNPgevLyRpP0jcM667btmhqafdhpZ1FRsQzFAV9JrXCtQ@mail.gmail.com>
	<CAJTo0La-ta3F0synwCGkBWMKLbGwfN3wQT1bwehK9oTbyN3VZA@mail.gmail.com>
	<CAM_RqkNfS1T67STnAQESSA_FnrqU_vW0fkdKw8GhyhTZB_hwOg@mail.gmail.com>
	<CAM_RqkNdN5e2yR1BxYnM1wbdKxYLpk_wVVX3pR6sbKL_na8GpA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 25 Feb 2017 23:05:27 +0000
Message-ID: <CAJTo0Lby87tJuux7wrSf=COhuz-_JLXvPYHKyjjm73N9DB=2bA@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ell: Initial recipe for Embedded Linux Library
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
X-List-Received-Date: Sat, 25 Feb 2017 23:05:47 -0000
Content-Type: multipart/alternative; boundary=001a1140699c04a6e6054962e36b

--001a1140699c04a6e6054962e36b
Content-Type: text/plain; charset=UTF-8

On 25 February 2017 at 15:47, Ankit Navik <ankit.tarot@gmail.com> wrote:

> I think, gdbus APIs will be replaced soon with ell APIs, I was the early
> adopter of ell APIs in OMA DM IMEI Sync (ODIS) Implementation.
> When I was implementing ODIS, there was license issue since gdbus uses GPL
> v2. I took help maintainer and they suggested ell. I remember they were
> mentioned that soon gdbus API will changes to ell in other components e.g.
> ofono, bluez, etc.
> I dont know thier exect timelines.
>

In that case ell can be considered for oe-core when a dependency of it
needs it - until then feel free to submit it to meta-oe or similar.

Ross

--001a1140699c04a6e6054962e36b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 February 2017 at 15:47, Ankit Navik <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ankit.tarot@gmail.com" target=3D"_blank">ankit.tarot@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto">I thin=
k, gdbus APIs will be replaced soon with ell APIs, I was the early adopter =
of ell APIs in OMA DM IMEI Sync (ODIS) Implementation.=C2=A0<div dir=3D"aut=
o">When I was implementing ODIS, there was license issue since gdbus uses G=
PL v2. I took help maintainer and they suggested ell. I remember they were =
mentioned that soon gdbus API will changes to ell in other components e.g. =
ofono, bluez, etc.</div><div dir=3D"auto">I dont know thier exect timelines=
.</div><div dir=3D"auto"></div></div></blockquote></div><br>In that case el=
l can be considered for oe-core when a dependency of it needs it - until th=
en feel free to submit it to meta-oe or similar.</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1140699c04a6e6054962e36b--
