Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7382876FC9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 09:29:14 +0000 (UTC)
Received: by qkdw123 with SMTP id w123so39786700qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 02:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=szWKLZvuMPi2g+dLzUbT9S5HxOEl5ir6JRc7DN4G6R4=;
	b=MojhVhxuuXbO4L6YeTlnNRjTovDPZnr2RT6FxoxjrZKXC/2z8xCtXTJkNig+X+Jtgj
	ovyh0pxMz4FLaGaynjy5S8uEtWQBpKQpyFr7DxzcljaJL+9BKJqf/7VWRYY1StrkBV3E
	uUa8bqEIafiCdt2oHoelPojXu3XV1sK0fLCThkCISAyanvHLmN1YalBJFRYa0OiO1sxf
	9ueT8HlRsw2TnJBjFT2Jg33G8UpFZfvArDXKAyKik4mL2cA/xL8V8luenzhR6Bbdz70w
	4jp/3fgx8dayiVp27IC5ZrRVGguKVHjwFPiQpxb5Vj4cfeNC7gd9yHyAGYv8F6eqfn4T
	d8rA==
X-Gm-Message-State: ALoCoQlwQ8a2EFX5mmAxnkkc5veVdkyQSFYqroLnbVYq1sEY/OOlaHaA+QCXiSHnzA7zQ18HHW4J
X-Received: by 10.55.43.132 with SMTP id r4mr2593541qkr.104.1443173354601;
	Fri, 25 Sep 2015 02:29:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 25 Sep 2015 02:28:55 -0700 (PDT)
In-Reply-To: <1443157157-33969-2-git-send-email-raj.khem@gmail.com>
References: <1443157157-33969-1-git-send-email-raj.khem@gmail.com>
	<1443157157-33969-2-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Sep 2015 10:28:55 +0100
Message-ID: <CAJTo0Lb59ABP7tHTFJMd-0m8qsKs6iR11mHna=aah6EQYENGfg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] powertop: Include right headers for timval struct
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
X-List-Received-Date: Fri, 25 Sep 2015 09:29:15 -0000
Content-Type: multipart/alternative; boundary=001a1147af6a26976e05208efb1c

--001a1147af6a26976e05208efb1c
Content-Type: text/plain; charset=UTF-8

On 25 September 2015 at 05:59, Khem Raj <raj.khem@gmail.com> wrote:

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
>

Missing upstream-status.

Ross

--001a1147af6a26976e05208efb1c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 September 2015 at 05:59, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":5z" class=3D"a3s" st=
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
@gmail.com</a>&gt;</div></blockquote></div><br>Missing upstream-status.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a1147af6a26976e05208efb1c--
