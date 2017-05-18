Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 91FE077EA0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 09:27:24 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id c13so29379291qtc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 02:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nwP5d8Bwx1HE9dZ2OD4FZV02HwM3sJucvLojI9j6dkQ=;
	b=qiRHw3bA8VTLwwKZ9hIS1Gcxdzr70ugH64I6493+PV7AuYQkOY+Il1JQMot9C5Tcz2
	oxDvrK12onrw/MZqHg5D6ADkW2u2Eucbnc0JSK8T70Mbn40KDrs14uLKvS5ZJqkoz8me
	1ttPnV6RmB7a14LEOOK5YeG0Vfsqm1JSHuZQ2csWEZzBA9ggjztDcVdlvdMLBQAWKDir
	ZzoWEaCqrQYsSKmz90sCTFCTSrNQ6HSQya9uXvJRbNAIkTXkXmeeQ8XtGn6ox3ImCIn6
	SLiAN21L02i3rma7kfZBXSmfvGgD+RWaAoR6iR8mOhqa3uebrwBL/4P1CiWvkbP7s6Rn
	3XIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nwP5d8Bwx1HE9dZ2OD4FZV02HwM3sJucvLojI9j6dkQ=;
	b=PPNBfGN769NSKl4P8fqV96mwRgKhUKoKNirZcllTII/emoK26TI8P4eTRSbFWv7+6I
	nU8uOUtb8x835yWjXTwdKcBUyTLhg35EJr49Jo1+XieNa30F7N70eYKrxYLudZFWZAXk
	HSXpJ25dGxm6IH5vswf2N0QchH9zsaHjd/+kAubpnJMI7Het1+ozgSlJb1nk06VXaQeB
	jjqx7um0gtAZbKkKZC9la1KqlhMNaP57pVehwuNTbcuubJEI2ujou9jfR6RCJLql/wxd
	wMDsbJkSevPa+IHwKINcZggmcQnaNs8TxVpwTaZ0LG+njsXZJy8IToIpPzWPcQ4sbLe+
	/hGg==
X-Gm-Message-State: AODbwcDjxkB09k8VtI5UznomcPOaO7HgDwPSGGY7nD8tEZ0s4j23TVzq
	KOoEH/sGIJsOj2h1sqLO4CoJt6Zbjksf
X-Received: by 10.200.50.49 with SMTP id x46mr3131979qta.105.1495099645436;
	Thu, 18 May 2017 02:27:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Thu, 18 May 2017 02:27:05 -0700 (PDT)
In-Reply-To: <1495098950-18824-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1495098950-18824-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 May 2017 10:27:05 +0100
Message-ID: <CAJTo0LbAX6DHYZUNUH1bzJF3a7xaK0o5RPX4jXBzTXDhAvUZXg@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] libnl: 3.2.29 -> 3.3.0
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
X-List-Received-Date: Thu, 18 May 2017 09:27:25 -0000
Content-Type: multipart/alternative; boundary="001a113577a24548c6054fc90338"

--001a113577a24548c6054fc90338
Content-Type: text/plain; charset="UTF-8"

On 18 May 2017 at 10:15, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:

> +++ b/meta/recipes-support/libnl/libnl/musl-header-conflict.patch
> @@ -0,0 +1,59 @@
> +From e1f2827673d9d45fe69ca912628bbb90d4003f49 Mon Sep 17 00:00:00 2001
> +From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> +Date: Mon, 15 May 2017 02:09:08 +0900
> +Subject: [PATCH] Fix musl compile error like:
> +
> +In file included from ../libnl-3.3.0/include/linux-
> private/linux/ipv6.h:5:0,
> +                 from ../libnl-3.3.0/include/
> netlink-private/netlink.h:54,
> +                 from ../libnl-3.3.0/lib/nl.c:28:
> +../libnl-3.3.0/include/linux-private/linux/in6.h:32:8: error:
> +redefinition of 'struct in6_addr'
> + struct in6_addr {
> +        ^~~~~~~~
> +
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>

This patch needs an Upstream-Status tag.

Ross

--001a113577a24548c6054fc90338
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 May 2017 at 10:15, Huang Qiyu <span dir=3D"ltr">&lt;<a href=3D"mailto=
:huangqy.fnst@cn.fujitsu.com" target=3D"_blank">huangqy.fnst@cn.fujitsu.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":160" c=
lass=3D"a3s aXjCH m15c1ad85ebe0f5a9">+++ b/meta/recipes-support/libnl/<wbr>=
libnl/musl-header-conflict.<wbr>patch<br>
@@ -0,0 +1,59 @@<br>
+From e1f2827673d9d45fe69ca912628bbb<wbr>90d4003f49 Mon Sep 17 00:00:00 200=
1<br>
+From: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com">zhen=
grq.fnst@cn.fujitsu.com</a>&gt;<br>
+Date: Mon, 15 May 2017 02:09:08 +0900<br>
+Subject: [PATCH] Fix musl compile error like:<br>
+<br>
+In file included from ../libnl-3.3.0/include/linux-<wbr>private/linux/ipv6=
.h:5:0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../libn=
l-3.3.0/include/<wbr>netlink-private/netlink.h:54,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../libn=
l-3.3.0/lib/nl.c:28:<br>
+../libnl-3.3.0/include/linux-<wbr>private/linux/in6.h:32:8: error:<br>
+redefinition of &#39;struct in6_addr&#39;<br>
+ struct in6_addr {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~<br>
+<br>
+Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.=
com">zhengrq.fnst@cn.fujitsu.com</a>&gt;</div></blockquote></div><br>This p=
atch needs an Upstream-Status tag.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a113577a24548c6054fc90338--
