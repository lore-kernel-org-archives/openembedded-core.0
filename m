Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2623D7705D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 20:15:24 +0000 (UTC)
Received: by qgbb65 with SMTP id b65so75775655qgb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 13:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=D53h1VTKqpeBKvrAO23PEnV8G8HBma2caXeOgEz5ZuI=;
	b=Vu1TUL+jCzZNvJJnGtTouSjcuEefkXo3LQbsm4oUUS/SXQbBnZMeI4tMeOdPTzugcS
	rs/Htx5YXO5eMXPp4odzNYIOp66go9BIllhE+h6WTlweP2TSk1R5nwXTD/Bm9skTSFxG
	reRyKtn6eOgbJCgx6hKZn69zSdclnG+pQH58E+4KC3Y0xerrlpt90L50APP77gzZMpRH
	0pAmrO1ozEkYD0kNJyWLnF1KwN/DR5BS4WdO5Fp5yQl0KjvSDCXZYqoJNrrO5Rm/q509
	AF7YHAXEV1K6odwAKXvmeHMrFiE8jpifGLEPbGrlB3FBKwGrNB9g1ymMc0VLUGPsW9tA
	BaEg==
X-Gm-Message-State: ALoCoQmRJx44zHWuToYAAHRwzH9vN9+isMB9s0Q3+/Isty1e505AOagmynhvkoIODxgqpozlDAbs
X-Received: by 10.140.132.11 with SMTP id 11mr29731955qhe.64.1445631324529;
	Fri, 23 Oct 2015 13:15:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Fri, 23 Oct 2015 13:15:05 -0700 (PDT)
In-Reply-To: <1445620987-11004-1-git-send-email-psidhu@gateworks.com>
References: <1445620987-11004-1-git-send-email-psidhu@gateworks.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Oct 2015 21:15:05 +0100
Message-ID: <CAJTo0LYKycvgn4p3J88fjbWgc6Dh24q6dt9MJTr64e8LDByFyQ@mail.gmail.com>
To: Pushpal Sidhu <psidhu@gateworks.com>
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: Add upstream patch to fix build problem
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
X-List-Received-Date: Fri, 23 Oct 2015 20:15:26 -0000
Content-Type: multipart/alternative; boundary=001a113502d093418f0522cb45de

--001a113502d093418f0522cb45de
Content-Type: text/plain; charset=UTF-8

On 23 October 2015 at 18:23, Pushpal Sidhu <psidhu@gateworks.com> wrote:

> +From 6ea42d4fa6f3f6dd18c37cb7b6e1faea6afefba4 Mon Sep 17 00:00:00 2001
> +From: "clopez@igalia.com" <clopez@igalia.com>
> +Date: Tue, 15 Sep 2015 21:50:18 +0000
> +Subject: [PATCH] [GTK] Build failure with ACCELERATED_2D_CANVAS when
> cairo-gl has
> + built with OpenGLESv2 support only.
> + https://bugs.webkit.org/show_bug.cgi?id=149172
> +
> +Reviewed by Martin Robinson.
> +
> +No new tests, no behavior change.
> +
> +* platform/graphics/glx/GLContextGLX.cpp:
> +(WebCore::GLContextGLX::cairoDevice):
> +
> +git-svn-id: http://svn.webkit.org/repository/webkit/trunk@189826
> 268f45cc-cd09-0410-ab3c-d52691b4dbfc
> +---
>

No Upstream-Status or Signed-off-by tags, and please explain at least a
little bit what the problem is in the commit message.

Ross

--001a113502d093418f0522cb45de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 October 2015 at 18:23, Pushpal Sidhu <span dir=3D"ltr">&lt;<a href=3D=
"mailto:psidhu@gateworks.com" target=3D"_blank">psidhu@gateworks.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":rx" class=3D"=
a3s" style=3D"overflow:hidden">+From 6ea42d4fa6f3f6dd18c37cb7b6e1faea6afefb=
a4 Mon Sep 17 00:00:00 2001<br>
+From: &quot;<a href=3D"mailto:clopez@igalia.com">clopez@igalia.com</a>&quo=
t; &lt;<a href=3D"mailto:clopez@igalia.com">clopez@igalia.com</a>&gt;<br>
+Date: Tue, 15 Sep 2015 21:50:18 +0000<br>
+Subject: [PATCH] [GTK] Build failure with ACCELERATED_2D_CANVAS when cairo=
-gl has<br>
+ built with OpenGLESv2 support only.<br>
+ <a href=3D"https://bugs.webkit.org/show_bug.cgi?id=3D149172" rel=3D"noref=
errer" target=3D"_blank">https://bugs.webkit.org/show_bug.cgi?id=3D149172</=
a><br>
+<br>
+Reviewed by Martin Robinson.<br>
+<br>
+No new tests, no behavior change.<br>
+<br>
+* platform/graphics/glx/GLContextGLX.cpp:<br>
+(WebCore::GLContextGLX::cairoDevice):<br>
+<br>
+git-svn-id: <a href=3D"http://svn.webkit.org/repository/webkit/trunk@18982=
6" rel=3D"noreferrer" target=3D"_blank">http://svn.webkit.org/repository/we=
bkit/trunk@189826</a> 268f45cc-cd09-0410-ab3c-d52691b4dbfc<br>
+---</div></blockquote></div><br>No Upstream-Status or Signed-off-by tags, =
and please explain at least a little bit what the problem is in the commit =
message.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a113502d093418f0522cb45de--
