Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id C25546FF80
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 20:46:37 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id av4so71945242igc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 13:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gePih0dAiCSS49BUsz2caxNgwuw7MNI3XY4oRY+gUWo=;
	b=q6CesZQ0ZiTts9oSgyR1IAAGlQMGZ8kbQXkbvKoJQrgqsvf7hhcXhFcgflIK7byC3z
	IT5K5B/BVFDQVeJX3vaJ9zhksLMN0nZg8yvfakOSdhVBY3TB8fV7g4YgoU7oYRbFmJ5m
	wDUoYlB1eFBtQdG//IsO34PIk4RLBKU4ZPydH9+z8ANQKdQUkqnSIF5G9I9d0CBD7Rpd
	u0DX4tzzjt8ZNqW1r1Xar+uq3QnlHTshN0uaG+1oHnAzDEYiF2wMHhB+Wecy0wXL2r7F
	AvwVKtbVb2mwPwUTZcwqWVDuojEp5H1xc/+9M9D+9CuUUURrbMWnFXR84cUMuO/OTnP6
	Wolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gePih0dAiCSS49BUsz2caxNgwuw7MNI3XY4oRY+gUWo=;
	b=ioxghQMjQwxxZi7fr3CYfsNa0059LjwGzTf5R+L8funO/Xh/WrnUAqBS6nSK88T6d7
	Sp3hTV7Hmyyf8N3ohNxAAQ8JF8uZQrJvXl8HC7cqpOFSjJw7FcRIAvJWrVan77BgK+Na
	kA+SegP0P/EHmlLJXD6W0DUObzXhhu7LzlJHfaoRVHCCefvYzH/VkOwxv9Zj4UwVpMP+
	XLgr24a4migpjt/RShf8f5UtYB59U64Z+IKPBAFNPDkSqBAgtJnZ0eNhlAUa4+UtgNva
	lCDJJqnkX+Q1pHNXB/9+MsBC+xkNngpqDOnFywKaLLb32Q6wUCJXFSIJoUy9ydaNJXqN
	bPAg==
X-Gm-Message-State: AD7BkJLbeB5GWwoFy/LipHn51smnHwL7WxIoTxiIC6EnQuButvthK1xK4WnNheE2ql/B4IBeCZyrABoCrwcvsIEE
X-Received: by 10.50.126.8 with SMTP id mu8mr18845556igb.52.1457988398081;
	Mon, 14 Mar 2016 13:46:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 14 Mar 2016 13:46:18 -0700 (PDT)
In-Reply-To: <CAP9ODKopJb0SusuYNubJz9oEMjJUDLyRBjNWDjeFD+tw0iYS3g@mail.gmail.com>
References: <1457981210-23532-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKpGfXsyzE91Nxak39npYTZ-yLw0NkVw91z75=vuVo1UyQ@mail.gmail.com>
	<CAJTo0LaVVaY9gmtzp7tq=77GBj+rCzGBC+2K1CnOoXEk8XCwBw@mail.gmail.com>
	<CAP9ODKq2CDKAxXijkEQH75vV6QKakt2HCSXHOU-HhZ0tCCnzwg@mail.gmail.com>
	<CAJTo0LYfwrc+wteB+ez6gqZbXgM8dJO6PKrB+vf0S6+ANC7ggQ@mail.gmail.com>
	<CAP9ODKopJb0SusuYNubJz9oEMjJUDLyRBjNWDjeFD+tw0iYS3g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Mar 2016 20:46:18 +0000
Message-ID: <CAJTo0Lbx5YajNU5fcRkn1sk43LW1tCLm7p1WxCM=fQqTYo=zWA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl: Only enable X11 support when the DISTRO supports it
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
X-List-Received-Date: Mon, 14 Mar 2016 20:46:38 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf8e01e2052e086076

--047d7b1635bf8e01e2052e086076
Content-Type: text/plain; charset=UTF-8

On 14 March 2016 at 20:43, Otavio Salvador <otavio.salvador@ossystems.com.br
> wrote:

> Well, with this it is harder to know if what works on native will work
> on nativesdk. I don't like this behavior.
>

Again, native and nativesdk *are* different.  Just because a native recipe
builds doesn't mean a nativesdk one will, and their intended uses are
entirely different.

Ross

--047d7b1635bf8e01e2052e086076
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 March 2016 at 20:43, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D=
"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador=
@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div id=3D":1or" class=3D"a3s" style=3D"overflow:hidden">Well, with this it =
is harder to know if what works on native will work<br>
on nativesdk. I don&#39;t like this behavior.<br></div></blockquote><div><b=
r></div><div>Again, native and nativesdk *are* different.=C2=A0 Just becaus=
e a native recipe builds doesn&#39;t mean a nativesdk one will, and their i=
ntended uses are entirely different.</div><div><br></div><div>Ross</div></d=
iv></div></div>

--047d7b1635bf8e01e2052e086076--
