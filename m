Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 375C0762B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 15:29:32 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id u186so40128145ita.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 08:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sl1BycMxKRh9wKa3/c3+0lHg3mE3dreNmPrJBEop7yw=;
	b=GrHTRxo3QRyrWchevwCLUCD0rQ1/gYyDNCi/TB73giJryXVubTzzp/+M1NxMI9TSVz
	8IRe6sUF8733g14APYHfpy0M8IJTFoEZsZNQH7meiBH/+ujH+ii3+tshsm4cq1oAeDPI
	SNx7ld4IV4DJ4eCNmUgFN3tpfuSspxnY0ZWhEauYnQBO8TsD0/eZgCCLePz+wMId1B2t
	Iy5MNiamh+o7SX7qyWVf5yUGLy1N3Wy+xJq6Ds5zZ+wQAj2Wl4FtjdBjfni7qkv1Lufi
	dKIGdrgXjgK1UfLG+KtH26nYiTLHXT4qZVMcF69+bJ4mjRN67zVcXRjyQ6sYpeX5bE+S
	E+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sl1BycMxKRh9wKa3/c3+0lHg3mE3dreNmPrJBEop7yw=;
	b=TJsqCYgLkUBPRIfydYY+T/YNZl4hNAB1rmxw90wMvaSosg2JbCfm3zgWbqFSvzaVfi
	wcbWzDxtm9NIl4tET7IrY56PqnlKgRU4mh5DMdOQQXFEShzixYUi0vBNiJcWmom4p+rE
	esGTBGsxlvmYHEp9p5fzg9zFihERMWAkEnxgFFWutYrXcY2QYCd+JHj4yoIvgZS9Adaf
	gv/bbOFWoaitakH9GzLuwbtnp/nK4MduIQyVOOmE+8T2xAcAYrx3EU9Jrml9tTK3VAIf
	990MQ6wfbcNbx+vYFj2kE8ACdstmYVMoxEsGDCfwruR0K4SsUcZKc5nadhsbaK8xWx0k
	mbYA==
X-Gm-Message-State: AEkoouuZw/sc0TPR9lgi0nGjdsrp8ag+EQUSlGcU8PrNmAVhD39pG+GHwIWetc3Q2un70Lixh8eWfu6/QS2OU0JQ
X-Received: by 10.36.121.206 with SMTP id z197mr4195739itc.22.1471274972935;
	Mon, 15 Aug 2016 08:29:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 15 Aug 2016 08:29:12 -0700 (PDT)
In-Reply-To: <1471273082-14460-1-git-send-email-liu.ming50@gmail.com>
References: <1471273082-14460-1-git-send-email-liu.ming50@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Aug 2016 16:29:12 +0100
Message-ID: <CAJTo0LY1FVQjxb4aSf-+M+goXRZeDN30TrBu5p7sVk6G2pdsmQ@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: Yue Tao <yue.tao@windriver.com>,
	Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bootchart2: fixes a BOOTLOG_DEST typo
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
X-List-Received-Date: Mon, 15 Aug 2016 15:29:33 -0000
Content-Type: multipart/alternative; boundary=001a114aa8202104e2053a1de6ef

--001a114aa8202104e2053a1de6ef
Content-Type: text/plain; charset=UTF-8

On 15 August 2016 at 15:58, Ming Liu <liu.ming50@gmail.com> wrote:

> +++ b/meta/recipes-devtools/bootchart2/bootchart2/0001-
> Fixed-Missing-default-value-for-BOOTLOG_DEST.patch
> @@ -0,0 +1,28 @@
> +From 2225ab2038bfe50f16f972e39d89bcd0bd7767f5 Mon Sep 17 00:00:00 2001
> +From: Steffen Pankratz <kratz00@gmx.de>
> +Date: Tue, 9 Feb 2016 13:49:42 +0100
> +Subject: [PATCH] Fixed: Missing default value for BOOTLOG_DEST
> +
> +Upstream-Status: Backport
> +
> +BUILDLOG_DEST seems to be a typo or mix-up which was introduced with
> 281d1df80884bf2969c509ec60ee8a6593524fe8
>

Missing signed-off-by.

Ross

--001a114aa8202104e2053a1de6ef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 August 2016 at 15:58, Ming Liu <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ff" class=3D"a3s a=
XjCH m1568eb6ac3e38a1f">+++ b/meta/recipes-devtools/<wbr>bootchart2/bootcha=
rt2/0001-<wbr>Fixed-Missing-default-value-<wbr>for-BOOTLOG_DEST.patch<br>
@@ -0,0 +1,28 @@<br>
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
df80884bf2969c509ec60ee8a<wbr>6593524fe8</div></blockquote></div><br>Missin=
g signed-off-by.</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--001a114aa8202104e2053a1de6ef--
