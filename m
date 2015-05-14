Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 08CC174000
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 10:34:05 +0000 (UTC)
Received: by qkp63 with SMTP id 63so8735071qkp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 03:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VtQJDjkCa3RhabvZiYu+AOiChsPhqq0IVIFcaH4ZUEU=;
	b=Er1GorPCcIJxNJiDiD3tP1siW2ObECm5j7X+9V3oZbINYIZj47LjeLH5UesselgoIl
	vklOnFSd/1MjDKkBcTKZ03y30f4R0Ru2d9ZlNhNY1oSyXX4gAT3u2SvEG2fry046F78A
	eOfb49guW5Cque0P+RvWLG93TWVIPL1Hx3C4A0X0x6o7vL4rgm/Z3GbxIHdHW+rQNBDU
	9f3uxmsKi+fPbkKr78yree2wUEVCYqaab/2TAYlB5THaW3XDy/K/WPlQKP2imjfRsIYL
	1RN4OwAe72SjGODdiKYZ1bCYiwlOeHCYxfsQUete+IevIjZL7SweVyeSrH0dzDhx3U8b
	F7Yg==
X-Gm-Message-State: ALoCoQkqEpjwsJXf4KaG5BUYhgQlOmlyjk9bLgjfE8xz/WPYcqINs5mmU4/P8Y3FwIB2pH4MaTeG
X-Received: by 10.140.43.228 with SMTP id e91mr4255138qga.80.1431599646151;
	Thu, 14 May 2015 03:34:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 14 May 2015 03:33:45 -0700 (PDT)
In-Reply-To: <1431343607-2820-1-git-send-email-otavio@ossystems.com.br>
References: <1431343607-2820-1-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 May 2015 11:33:45 +0100
Message-ID: <CAJTo0Lb8ZD_X-X5mxF9XQ5TROUJh1hYQYQV5xwn1WuZmzTSwMg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: Move EGL requirement for Wayland
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
X-List-Received-Date: Thu, 14 May 2015 10:34:06 -0000
Content-Type: multipart/alternative; boundary=001a113a34bc5ead2f0516084488

--001a113a34bc5ead2f0516084488
Content-Type: text/plain; charset=UTF-8

On 11 May 2015 at 12:26, Otavio Salvador <otavio@ossystems.com.br> wrote:

> The EGL is used by the Wayland backend. When building using Software
> Rendering and without Wayland support the EGL backend is not available
> so we should not require EGL for GLES2 support.
>

I think we should make the PACKAGECONFIG block be more explicit, and add a
separate [egl] that is required to be enabled if you also enable a feature
that depends on it (such as gles or wayland).

Ross

--001a113a34bc5ead2f0516084488
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 May 2015 at 12:26, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6tg" clas=
s=3D"a3s" style=3D"overflow:hidden">The EGL is used by the Wayland backend.=
 When building using Software<br>
Rendering and without Wayland support the EGL backend is not available<br>
so we should not require EGL for GLES2 support.</div></blockquote></div><br=
>I think we should make the PACKAGECONFIG block be more explicit, and add a=
 separate [egl] that is required to be enabled if you also enable a feature=
 that depends on it (such as gles or wayland).</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113a34bc5ead2f0516084488--
