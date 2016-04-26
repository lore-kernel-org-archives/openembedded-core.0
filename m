Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 05A0D60118
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 14:01:18 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id f89so16543089ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 07:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gOGPGxlTj5FfZLxHbuCoqFOw8iwB4jic79Y/2QtJjeo=;
	b=bnF/g4Z16Wpy72FVjbw1gqQklF9eFQzY4Fa4soy5Ry+olcvMUy9EMHWy4uqZOWo9Ul
	KWM9+veFSfCV3EQiYtczc/rFFMSshbzq75D0cgmzr9f10VAS//V6ZKaPuqH/4rPz2smC
	PFhh2zUuqtc7eQbk/t1d5tNrOLxZXImV8AorgOVJUyM/PrlDnhpT48AVlEX6weclDVsZ
	NO6tIQwP1JuhlEGGDu5XCViF+D+Gna80S2DkzynHLJ59tcukJ9erCxDp0upmEtC2ueWD
	YP6+TutybmbsstcAs9LBx36HVp/o5VirvXiGzVoYUSVguhcOrv49M0qKoUtXMmdThdZ9
	GNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gOGPGxlTj5FfZLxHbuCoqFOw8iwB4jic79Y/2QtJjeo=;
	b=lJrqsvzzQbT5GWcc15WKKJcp8j1dWUCwUX/JVwnPqaup8SDhzsq6ZZqM+fks19dyp9
	AIiebsJRWUvPPDYxNZ0Ahg1EyyHpdQ1eR/QWrAM++5l3lv9gkztR+pecxnxTeksJxo8y
	gYgIZXm3s6AEt8Y+1okH9crjh7anrjSvH4w5ubsY6XBwxQSQJGWYQxWDjSd4CCt3E1Tu
	faYNZ4pPsk9OdYDNYWNGGOATSrLtMM8rIg60JeteuwFOcAX5VeloXzh3F3ZPQT3HsiGO
	cy7lNwmS15axxcf91Vc7XQOKKayK5AjbbRKwqw0IKi3bwgT080e6my+ZD77yJvRLpHW2
	KC0A==
X-Gm-Message-State: AOPr4FWuVXMBOu8q7GrxmdlCYOIxjnDi1y9I682CAd1U4FGYrvRW47wzBW6VLLNuuhT6Sz3BNbnZrxCyu+T+7lFw
X-Received: by 10.107.51.213 with SMTP id z204mr3436561ioz.148.1461679279100; 
	Tue, 26 Apr 2016 07:01:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Tue, 26 Apr 2016 07:00:59 -0700 (PDT)
In-Reply-To: <CAJTo0LZCgoyt8GyvbkhvsK4_Q8v5MgU3O+0FFXGaajyyiDS0Zg@mail.gmail.com>
References: <20160422000519.GR16135@denix.org>
	<CABcZANmiDeW-B13vE3X0gjX_QfxV5iihD9ZnUKAU=wovnEuxBg@mail.gmail.com>
	<20160425165011.GV16135@denix.org>
	<CAJTo0LZCgoyt8GyvbkhvsK4_Q8v5MgU3O+0FFXGaajyyiDS0Zg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Apr 2016 15:00:59 +0100
Message-ID: <CAJTo0Lb3pwi-BewA3kyU+QhgP2_s5uXd=vXH0fXRA8wM-9fMgg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Christopher Larson <clarson@kergoth.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: mesa, libgbm and weston
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
X-List-Received-Date: Tue, 26 Apr 2016 14:01:19 -0000
Content-Type: multipart/alternative; boundary=001a11440cd034f05b053163ba85

--001a11440cd034f05b053163ba85
Content-Type: text/plain; charset=UTF-8

On 26 April 2016 at 12:59, Burton, Ross <ross.burton@intel.com> wrote:

> I added a PACKAGECONFIG for libgbm to mesa.inc, enabled it for mesa and
> disabled it for mesa-gl, and mesa-gl still build fine but didn't ship a
> libgbm.
>
> I've forgotten the details about all of this: does mesa-gl shipping libgbm
> make sense at all?  Or in the real world will BSPs either use mesa or their
> own GLES driver + their own libgbm + mesa-gl if required?
>

I've just sent a couple of mesa patches, can you see if these help?

Ross

--001a11440cd034f05b053163ba85
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 April 2016 at 12:59, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div>I added a PACKAGECONF=
IG for libgbm to mesa.inc, enabled it for mesa and disabled it for mesa-gl,=
 and mesa-gl still build fine but didn&#39;t ship a libgbm.</div><div><br><=
/div><div>I&#39;ve forgotten the details about all of this: does mesa-gl sh=
ipping libgbm make sense at all?=C2=A0 Or in the real world will BSPs eithe=
r use mesa or their own GLES driver + their own libgbm + mesa-gl if require=
d?</div></blockquote><div><br></div><div>I&#39;ve just sent a couple of mes=
a patches, can you see if these help?</div><div><br></div><div>Ross=C2=A0</=
div></div><br></div></div>

--001a11440cd034f05b053163ba85--
