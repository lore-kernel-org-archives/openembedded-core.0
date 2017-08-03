Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7F9F871C0F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Aug 2017 11:04:32 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id o9so5645031iod.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Aug 2017 04:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kcX+KGQMfN9Gq5OArjXY7X4Q7VR5Ej0baN8MfRzp9L8=;
	b=D+cXuYyg5eLLMNuROCfybMB3m1Dn0ik/FBBwiVmCIXyqqu0c8xgMZCAoL0gA+Hg8e2
	DOZ8BiaFoYSH2gG0CG8bNWW9jHs8rUvvgnq6oL5TACiHZYaTJR4xjzwygLqWaNaiOaap
	mAfMCPD6JqqBob9VBb0ubeiPfcmsVPIBELIYghOZX5ZzduEZIEztWGs36UvRz8JtlZZW
	D7ElRUHUYBelSRjKpZT5F1MjzqIl2neVqlD6q5t54rc1N3dEBlWp+Xf86l+fH/hvoBS/
	Yi18EK/G0PpEN9zeOCiair1P5T52vT8IJGcX5pOQjDZJAevbe8v5MqXcpSC5viKSg1mP
	R9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kcX+KGQMfN9Gq5OArjXY7X4Q7VR5Ej0baN8MfRzp9L8=;
	b=FXawUhO8yf7ADlEPx53nDjYjo8vaQWDHIUXrPvd5n5U7Tcsn5GNTaRvRWH87vHPVfQ
	lFjUGUQQO5JCx70USy2RntLif5f3x7CudpFbC2beP1YJeSE9TAE9XjMdiHrYDj1dbddg
	T51d/LSKv8vFaf1x9JRGMxfYsQsi7o3Orj9Sd5WKRzwG3vPVr6OzqeUc+GT9gXoWv8Ln
	a7XMsZL6bvn9A6/m1t2IR5vkOfagprAjFs6XTI2FD8E1QmNG3g2KwLwIUr7GyGWu2DrF
	M6REiEIahiv3d0zhxZZkf5Z/Q1YhKZqpWqm57wSrOPcYLOdyWp2+5jLJ7yjPwGAkCna9
	qdbQ==
X-Gm-Message-State: AIVw110gZzZQP+Rn8hnBTpE2UlP36sbL0ahWG7NDgCxr8D6u+U+CWjHf
	mY6R1jFq+B+CxbY1riJclD586hH9wypT2zA=
X-Received: by 10.107.171.70 with SMTP id u67mr1326702ioe.231.1501758273540;
	Thu, 03 Aug 2017 04:04:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Thu, 3 Aug 2017 04:04:12 -0700 (PDT)
In-Reply-To: <CAJTo0LbzivYA=X5=n6FnbJ2jJpuymrcp+YEvRwmEk1t6O85vaw@mail.gmail.com>
References: <20170801163443.10899-1-raj.khem@gmail.com>
	<CAJTo0LYexDbJbkWb0=v1L4cjpEMyw5gL8NmcSTQd9QXjnF4_aA@mail.gmail.com>
	<CAMKF1sossdZYGd9QFunkAHKBxUUikus8N18MKa-fNckLpWerdw@mail.gmail.com>
	<CAJTo0LbzivYA=X5=n6FnbJ2jJpuymrcp+YEvRwmEk1t6O85vaw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Aug 2017 12:04:12 +0100
Message-ID: <CAJTo0LbMdiJHrzHSZ4ONtBeso1zCkR+vDZuYeuZvBSD+zF4pPg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Update to latest on 2.26 pre-release
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
X-List-Received-Date: Thu, 03 Aug 2017 11:04:32 -0000
Content-Type: multipart/alternative; boundary="001a1148bd7a6ef5c70555d758ec"

--001a1148bd7a6ef5c70555d758ec
Content-Type: text/plain; charset="UTF-8"

On 2 August 2017 at 23:03, Burton, Ross <ross.burton@intel.com> wrote:

> Build almost anything because it will need glibc-locale.  Sorry.
>
> I can throw it on the AB to see what fails/works.
>

The autobuilder, for once, is on my side.

https://autobuilder.yocto.io/tgrid, the ross/glibc row at 4cb48130d80a.

Ross

--001a1148bd7a6ef5c70555d758ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 2 August 2017 at 23:03, Burton, Ross <span dir=3D"ltr">=
&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@=
intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(=
204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra">=
<div class=3D"gmail_quote"><div>Build almost anything because it will need =
glibc-locale.=C2=A0 Sorry.</div><div><br></div><div>I can throw it on the A=
B to see what fails/works.</div></div></div></div></blockquote><div><br></d=
iv><div>The autobuilder, for once, is on my side.</div><br><a href=3D"https=
://autobuilder.yocto.io/tgrid">https://autobuilder.yocto.io/tgrid</a>, the =
ross/glibc row at 4cb48130d80a.</div><div class=3D"gmail_quote"><br></div><=
div class=3D"gmail_quote">Ross</div></div></div>

--001a1148bd7a6ef5c70555d758ec--
