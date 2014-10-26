Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2CA68601F5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 22:28:49 +0000 (UTC)
Received: by mail-qa0-f41.google.com with SMTP id k15so754827qaq.28
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 15:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=k1lZcq/6wFwEZqC4e75nEmfgu0u49locS4okcYoof08=;
	b=PdzTDQS2WzHN17FIFf//x9Z0oI9yyaPnIqGPD1F7bDCNWTTjTLlpDaY/bHkSeWbofl
	vZA3aBefAGpiaB/+64r4RoJfXacXQnMWpx843o17I3+sRpYdlQbvk3DVuRVIzMJzFkV0
	GfK9xQFp1AuWntRRGTe9LPDZpj7FT7JJKnk83SL/ErjftSrStGCB5KRc55Hx5b9ROcb9
	cjo+L4AI0CSvLPqEe6uDm2R5ezYXdaJhWarghhIaYXeyxMyy0PQBgyIju6xm9O5nmZqe
	l+zCZYXhofmQwVqD8me/RnA37cDBllqtTtgokEiW1seydXTaOe6ldv+fc5vOzB8hBQJ4
	B5dg==
X-Gm-Message-State: ALoCoQmvLZ+YV5VQ+hInsDwgZM2nzo5LuH4QtqJMT1LzB004xWIFZ2IHh85tVSAcLKxyqphGAiEL
X-Received: by 10.224.160.83 with SMTP id m19mr9070778qax.17.1414362529853;
	Sun, 26 Oct 2014 15:28:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.92.179 with HTTP; Sun, 26 Oct 2014 15:28:29 -0700 (PDT)
In-Reply-To: <1412737047-7936-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
References: <1412737047-7936-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 26 Oct 2014 22:28:29 +0000
Message-ID: <CAJTo0LZHWcebdc7qNqb=-17+06wVLKsGPmQtZouis2XSudmV9g@mail.gmail.com>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gstreamer1.0-plugins-bad: Add patch for disable pkg-check of wayland-scanner
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
X-List-Received-Date: Sun, 26 Oct 2014 22:28:51 -0000
Content-Type: multipart/alternative; boundary=047d7bacb2aa2d382c05065af0ae

--047d7bacb2aa2d382c05065af0ae
Content-Type: text/plain; charset=UTF-8

On 8 October 2014 03:57, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com
> wrote:

> +-AC_PATH_PROG([wayland_scanner], [wayland-scanner])
>

This check actually works fine and by removing it you're potentially
breaking the build if it ever does need to invoke it, so don't remove this
line.

Ross

--047d7bacb2aa2d382c05065af0ae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 October 2014 03:57, Nobuhiro Iwamatsu <span dir=3D"ltr">&lt;<a href=3D=
"mailto:nobuhiro.iwamatsu.yj@renesas.com" target=3D"_blank">nobuhiro.iwamat=
su.yj@renesas.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div class=3D"">+-AC_PATH_PROG([wayland_scanner], [wayland-scanner])<br></di=
v></blockquote></div><br>This check actually works fine and by removing it =
you&#39;re potentially breaking the build if it ever does need to invoke it=
, so don&#39;t remove this line.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--047d7bacb2aa2d382c05065af0ae--
