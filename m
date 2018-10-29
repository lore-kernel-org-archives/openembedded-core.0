Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id D670E60191
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 17:12:59 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p2-v6so8714978wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 10:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vSUX1yvuV3EzlmvSaGsBH5oY7B6LS4HcQ2AIlDCMokc=;
	b=Z0HiaEWA9BgnDAI0YSy+69O39RGO1Qtad0EY7aghU+1ggXdJCNA7WPvxSTftYAitnN
	eLOdNToay2Uyii2dFkyS7IWBUBGn8YUj9B8vh2LQg4R1OC+QJN8P+bvI4zwRK29G/g3b
	tf9X4zu8F0BnC3D4v3KwqA3dFDLptwusPT2Cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vSUX1yvuV3EzlmvSaGsBH5oY7B6LS4HcQ2AIlDCMokc=;
	b=e5Qwfn3xTgdr7bzfWZSCkOT2gvB8WmC0t71q7Cteru7Aj/YNbPdVadq2/uSgIrwhe+
	wAnTDiZapFlgIIboA9LuqgBMPXIneEuUeN2lKT27KBjzSqyGqrkKkHubhESV9weabFhz
	yKf3w+Npaab/4qitFzNRZToldv070ZgWMMtHV0LNl6IyNGm1v5iWnhUA71vdbzykYDk5
	XhitxI/h9fvibgn2OQ1oc10Hkh2KP2X9/3JWQj5icI8+ycavirdVB8RznKTd8ZSl7YBF
	XIV4NLB8UGrqRBmB1wTYP3GMqeg7PY39/6irJd0IiJU+1/nQnQyM9IudNOxwj+1Gqm8U
	jpGQ==
X-Gm-Message-State: AGRZ1gJ6opmfwExxCC6fkDmEX30p5isWAC8Znu9FHAj/5f52w8EUttQe
	Js19D55CRgoQXC/L2fztn0Jz7A==
X-Google-Smtp-Source: AJdET5dxgr9QMisLF8a99WpQJEz56NxqCvylSZsPZhZ3kkD61wFP7VanSaBebUvBbU5TRO9TxqAHiw==
X-Received: by 2002:a1c:af07:: with SMTP id
	y7-v6mr15088929wme.33.1540833180118; 
	Mon, 29 Oct 2018 10:13:00 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l125-v6sm16385267wmb.1.2018.10.29.10.12.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 29 Oct 2018 10:12:59 -0700 (PDT)
Message-ID: <1528f5f1b89f065ed67487b9a35b750e908cf64b.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 29 Oct 2018 17:12:57 +0000
In-Reply-To: <a6650d3c-d356-22c7-5efe-8ebcf980e9fb@gmail.com>
References: <1540452055-22743-1-git-send-email-akuster808@gmail.com>
	<b2dd231dcb644b0c97082d64abc7dfd703ef6d95.camel@linuxfoundation.org>
	<a6650d3c-d356-22c7-5efe-8ebcf980e9fb@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH] os-release: add more variables to list
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
X-List-Received-Date: Mon, 29 Oct 2018 17:13:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-10-28 at 18:24 +0000, akuster808 wrote:
> On 10/25/18 10:25 AM, Richard Purdie wrote:
> > On Thu, 2018-10-25 at 08:20 +0100, Armin Kuster wrote:
> > > If someone extends the OS_RELEASE_FIELDS in a bbappend, it will
> > > cause
> > > the hash to change which is
> > > caught by the yocto-check-layer
> > > 
> > > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > > ---
> > >  meta/recipes-core/os-release/os-release.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/recipes-core/os-release/os-release.bb
> > > b/meta/recipes-core/os-release/os-release.bb
> > > index 7f3d9cb..88bf8f8 100644
> > > --- a/meta/recipes-core/os-release/os-release.bb
> > > +++ b/meta/recipes-core/os-release/os-release.bb
> > > @@ -12,7 +12,7 @@ do_configure[noexec] = "1"
> > >  
> > >  # Other valid fields: BUILD_ID ID_LIKE ANSI_COLOR CPE_NAME
> > >  #                     HOME_URL SUPPORT_URL BUG_REPORT_URL
> > > -OS_RELEASE_FIELDS = "ID ID_LIKE NAME VERSION VERSION_ID
> > > PRETTY_NAME"
> > > +OS_RELEASE_FIELDS = "ID ID_LIKE NAME VERSION VERSION_ID
> > > PRETTY_NAME BUILD_ID HOME_URL BUG_REPORT_URL SUPPORT_URL
> > > CPE_NAME"
> > 
> > I'm not sure I agree with this. It would usually be a policy
> > decision, e.g. a ditro config which would change this and you'd not
> > be doing this with a bbappend?
> 
> Yeah,  its the feedback I was looking for. Isn't OE  core "NoDistro"
> and I will be wanting to have the CPE_NAME available with out having
> to define DISTRO. I am jet lagged so I am not seeing how to fix this
> for meta-secruity.

This sounds very much like "I want to be a distro but I don't want to
be a distro".

Changing os-release just because a layer was included is a really bad
idea. Its distro policy what would be included there, including what
the cpe name might be.

Whether the nodistro defaults are right is a different question but
meta-security should not be poking there.

Cheers,

Richard




