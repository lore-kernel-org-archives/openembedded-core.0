Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 14CDA6FF97
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 12:11:31 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id 186so154264595iow.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 04:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=pBHRuw/JfkFjuZLjfE8HrHALTMm3MHOjzRXWwF/kfCU=;
	b=DMvNckMsFsQ5Yzm9F4VETlSUJSdvNxTXCvXm+3WSWvA2TG0FtQS05fqrwdzEz7+viQ
	QuoBzuEgWS98zwG4MS0XToy7nPKZgwoZ9/otx0Qbp+RHIP7XaDDIubT+DOJCdA6Gzd/r
	w0kgf6d9GCUWMHMTLcaTq9Gnp9DkdfVINCsJoS1PPhIBncYy3LKnLppWYZieaw/xBjDx
	GgGTlFLxCTF0N9p8dbaBu/e13kg8ouOiQnOctCdKcA7PuxsP4Hj+QXCaZZ/nl4HelYHq
	JRz562Ada2tinZrEfaeV3JYrc5JYiilgvpMY5tTdvzWqB/gA+CMrt0EJIMAfitu7DAlt
	5sng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pBHRuw/JfkFjuZLjfE8HrHALTMm3MHOjzRXWwF/kfCU=;
	b=JtQjEKy22XDcaB4qk1/zJ3ul7KN2qF/pgHxbnk9by9P99cq3usfjXndywYqJOEujK8
	HWZMJDOP1seMWClWFi85zxr4XNOiAtGqW68S7vLyvz7mgypCveVGSdmDnmWhapHGwQZz
	a9n+lToE+SG43/nBnyinmpi+4TUK1r4KoS90Xz9c7HhPXhGEmRyANEdM8pI1BeoHnyQ+
	oYAVtegF5gdIIs++HExaXEtXdbMLdfi1Xfg02kS/6+EGtYauq021Uittzg7eeqquUvVh
	8RsJkmqmLJV/0YBsL8mVF7IYOm8lOPvM1c7p4PlTXm7TYbiVr5EMkXr9GLOHA0WXynTH
	4U4g==
X-Gm-Message-State: ALoCoQmFWwHAvHnzro6LX7gBmUNSvqSQDnFmG6U9RmxxGCTunbSz+HfeL99ScocFY+7XqiYF/Mhp+RefxYXgXQvXbhSRk3hwMp2ew49n0KXkHctdNMe7i08=
X-Received: by 10.107.3.154 with SMTP id e26mr17562662ioi.99.1450699892014;
	Mon, 21 Dec 2015 04:11:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 21 Dec 2015 04:11:12 -0800 (PST)
In-Reply-To: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
	<81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Dec 2015 12:11:12 +0000
Message-ID: <CAJTo0LZ=zOcdYk7xGZwXKgLbBynMnCEjQaMWdhB27Vpgs8wGOQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] powertop: Include right headers for timval struct
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
X-List-Received-Date: Mon, 21 Dec 2015 12:11:34 -0000
Content-Type: multipart/alternative; boundary=001a113ec10abd5e170527676310

--001a113ec10abd5e170527676310
Content-Type: text/plain; charset=UTF-8

On 19 December 2015 at 23:52, Khem Raj <raj.khem@gmail.com> wrote:

> +From 0856d8145d187a7e5a49625247abe43a13f95acc Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 15 Sep 2015 19:36:28 +0000
> +Subject: [PATCH] include rquired headers for typedefs
> +
> +timeval struct needs to include sys/time.h and sprintf() usage requires
> +to include stdio.h headers from system
> +
> +Fixes
> +src/perf/perf_bundle.cpp:141:2: error: use of undeclared identifier
> 'sprintf'; did you mean 'vswprintf'?
> +src/devices/devfreq.h:35:18: error: field has incomplete type 'struct
> timeval'
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
>

Missing upstream-status.

Ross

--001a113ec10abd5e170527676310
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2015 at 23:52, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":6j9" class=3D"a3s" st=
yle=3D"overflow:hidden">+From 0856d8145d187a7e5a49625247abe43a13f95acc Mon =
Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
+Date: Tue, 15 Sep 2015 19:36:28 +0000<br>
+Subject: [PATCH] include rquired headers for typedefs<br>
+<br>
+timeval struct needs to include sys/time.h and sprintf() usage requires<br=
>
+to include stdio.h headers from system<br>
+<br>
+Fixes<br>
+src/perf/perf_bundle.cpp:141:2: error: use of undeclared identifier &#39;s=
printf&#39;; did you mean &#39;vswprintf&#39;?<br>
+src/devices/devfreq.h:35:18: error: field has incomplete type &#39;struct =
timeval&#39;<br>
+<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
+---</div></blockquote></div><br>Missing upstream-status.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ec10abd5e170527676310--
