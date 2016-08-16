Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 891EA75C61
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 10:15:42 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id n128so29150153ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 03:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RWENezatzh12s9g5m7hNt1o3cDBR3eKuG3J6PxNqLZE=;
	b=MiQ8idNxXuZJ1I5zj9pInydj6b3wrZ/oAALx4Rhvp46PwbnWXQJEqggLtwefOnQMrv
	KGovB7nsmfs3ksLEle+tO66BvVzOmsaJrgmQyz3m9PSYuGf27y0QXjXXgWSfi9LrgqUV
	84qSCaE3r2HvtjCB0rnj5SSuf/MzyXsMKNO2Ab8XM62KZaoOQjTg+vUjnlUdPUA7DF/A
	oxs73a4i/Q+9JInZuvQuMYOi2SMwUIQ2ggiwP3L1bf2SddFWe6Q+hPFooBrsrXOorQPd
	GoplGHCkfG82itMPQlJDeFnVpwFsCH2TgjylpQlGA2x/jgxCjp1acL1Kzl8u8zPA4YRs
	ICwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RWENezatzh12s9g5m7hNt1o3cDBR3eKuG3J6PxNqLZE=;
	b=PzyCNdFQMzthZ2IWVyN7i6RnmyRNmt52qMvTQu3gsPdaz10iV27vJlN2dJJuA/BEX2
	n1OVv4Zq0Y2wGaYuJ6GAhofnpLGxS6WWsJE7MWn2twFksNP+5YSIR+CsHs5qpJIWTR3u
	V13n2+7GG16IDqVMa+/vkFeJVmXuj+X9IgkUYpCD6HqIlvzvq7qKFeEXGC+R4LQ8zaAa
	3qWcr5p1LkEOIw6kZhL//UNFhixgolqonf+xtX/EZH88uqWQXl8OhAckshbRvxc/nY4b
	DTIOy0UDRr0WdbaRJv9rj3rTBR+Od8KnAxwzgSmxTWGEbCzjLoYQ0v99cFnREI2E20fx
	0HNw==
X-Gm-Message-State: AEkoouuAcgCbC7Mrmi3HF99PyX34OToWcaLebrL8nA87H/4C4fGtwC6nErsnhu0EXV9sY/CWCVKkeFGCxxYZxHQn
X-Received: by 10.36.20.75 with SMTP id 72mr19639986itg.83.1471342542752; Tue,
	16 Aug 2016 03:15:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 16 Aug 2016 03:15:22 -0700 (PDT)
In-Reply-To: <1471330908-26345-1-git-send-email-liu.ming50@gmail.com>
References: <1471330908-26345-1-git-send-email-liu.ming50@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Aug 2016 11:15:22 +0100
Message-ID: <CAJTo0LbR3kaNqLAeprDgEW5F4MA9fWXOhkxXxHn4eRAzXVmt-w@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: Yue Tao <yue.tao@windriver.com>,
	Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] bootchart2: fixes a BOOTLOG_DEST typo
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
X-List-Received-Date: Tue, 16 Aug 2016 10:15:44 -0000
Content-Type: multipart/alternative; boundary=001a114469429ab133053a2da1cf

--001a114469429ab133053a2da1cf
Content-Type: text/plain; charset=UTF-8

On 16 August 2016 at 08:01, Ming Liu <liu.ming50@gmail.com> wrote:

> +++ b/meta/recipes-devtools/bootchart2/bootchart2/0001-
> Fixed-Missing-default-value-for-BOOTLOG_DEST.patch
> @@ -0,0 +1,30 @@
> +From 2225ab2038bfe50f16f972e39d89bcd0bd7767f5 Mon Sep 17 00:00:00 2001
> +From: Steffen Pankratz <kratz00@gmx.de>
> +Date: Tue, 9 Feb 2016 13:49:42 +0100
> +Subject: [PATCH] Fixed: Missing default value for BOOTLOG_DEST
> +
> +Upstream-Status: Backport
> +
> +BUILDLOG_DEST seems to be a typo or mix-up which was introduced with
> 281d1df80884bf2969c509ec60ee8a6593524fe8
> +
> +Signed-off-by: Steffen Pankratz <kratz00@gmx.de>
>

Steffen didn't sign this off for oe-core, you did, so the patch should have
*your* s-o-b.

Ross

--001a114469429ab133053a2da1cf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 August 2016 at 08:01, Ming Liu <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":cx" class=3D"a3s aX=
jCH m15692290fd9ae972">+++ b/meta/recipes-devtools/<wbr>bootchart2/bootchar=
t2/0001-<wbr>Fixed-Missing-default-value-<wbr>for-BOOTLOG_DEST.patch<br>
@@ -0,0 +1,30 @@<br>
+From 2225ab2038bfe50f16f972e39d89bc<wbr>d0bd7767f5 Mon Sep 17 00:00:00 200=
1<br>
+From: Steffen Pankratz &lt;<a href=3D"mailto:kratz00@gmx.de">kratz00@gmx.d=
e</a>&gt;<br>
+Date: Tue, 9 Feb 2016 13:49:42 +0100<br>
+Subject: [PATCH] Fixed: Missing default value for BOOTLOG_DEST<br>
+<br>
+Upstream-Status: Backport<br>
+<br>
+BUILDLOG_DEST seems to be a typo or mix-up which was introduced with 281d1=
df80884bf2969c509ec60ee8a<wbr>6593524fe8<br>
+<br>
+Signed-off-by: Steffen Pankratz &lt;<a href=3D"mailto:kratz00@gmx.de">krat=
z00@gmx.de</a>&gt;<br></div></blockquote></div><br>Steffen didn&#39;t sign =
this off for oe-core, you did, so the patch should have *your* s-o-b.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--001a114469429ab133053a2da1cf--
