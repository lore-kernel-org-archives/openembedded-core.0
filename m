Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0377C7838A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 13:25:33 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id u19so20266821qta.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 06:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ohTUieFDSzmarxIiQ3kzg06hMpuV4Pq8FXUdKnwGAg8=;
	b=ZqAd9rGdL7jnUpxWv5VCgUMq7NzcLuF8w27q1GKAl/qgvAJXha3DPMosi1cuMhB+Hk
	OzqFA0K6kQx0JOob5+DOuyeOil60WHW22RQuP3Oyz6UR3AXhHXsgjjtxwIfAOGIU+h3f
	Kf1ht2qRm5nc+9xIYRaPd67jWPJyIR2XKB10+dYvhEOj6I1YZN9KcbcG3tQQkC8AVwAM
	193SEcRb4XPmJekLye4jh6Kl96NyfaOicXJlLWzKsZpyHTaYf8jTix3ucAtDpQY+Wwep
	F6e6uePjYmffq1LXHQ5nMGcgBPnEtY2l6AmWHGRfA3x6V1eCggJSO6ugOKXLUKL9EzmA
	NIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ohTUieFDSzmarxIiQ3kzg06hMpuV4Pq8FXUdKnwGAg8=;
	b=AWxmhdZ6TQCzmGjoPkb+OJ4IJqd0CROZ0FiRT3V4PLvg26gNIwisAD1VlYRWOtffoU
	8pr3qRVruNZlE+KkDsPFWmxmzfPx0RgazxBzIMdIP1kDT1NNrfGz5wCsWnYZZdcxJUQ4
	tvuGwM5eiNdd6ImRkN98TH74KgAPd50ujR0SsmraKnSgyaHlu7XqwSwWwQZH4DHQyGg3
	u/Tvs5pnDnvJopBSYaOnz1Utzyk54WkAFbyxnJ7GbF7LlPwhpEgfBRmaxI1A+4UISHuD
	23m0EG1X2XdkjqnCU59nAALk812/CzTkBk9VMn3t4NJaLm8Ojgn8oPwvj0FyLOPfzpFz
	QuXA==
X-Gm-Message-State: AKS2vOzp26ScNb1zHQK3X5SW3+X6IP4/JBBNdPCdo4dXvhAkjluMGLGI
	AqZc7b0DNWjizkwDQ09bDyIFi2/Vo9p7
X-Received: by 10.237.52.33 with SMTP id w30mr6169458qtd.139.1497533134370;
	Thu, 15 Jun 2017 06:25:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 15 Jun 2017 06:25:14 -0700 (PDT)
In-Reply-To: <1497527986-20808-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1497527986-20808-1-git-send-email-ed.bartosh@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Jun 2017 14:25:14 +0100
Message-ID: <CAJTo0LbEz_8uDR0xqSiyD4ZvcxRX4bFCS2Fyx1qn8g_xKTbsaw@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types.bbclass: get rid of IMAGE_DEPENDS
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
X-List-Received-Date: Thu, 15 Jun 2017 13:25:34 -0000
Content-Type: multipart/alternative; boundary="001a114dc03e8399180551ff9acc"

--001a114dc03e8399180551ff9acc
Content-Type: text/plain; charset="UTF-8"

On 15 June 2017 at 12:59, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:

> The IMAGE_DEPENDS variable can be overriden to add dependencies for
> individual image types.  Those dependencies are added to the do_rootfs
> task, while they really should be added to the specific image type tasks.
>

Other layers such as meta-raspberrypi use IMAGE_DEPENDS, should we move
oe-core to use [depends] but handle IMAGE_DEPENDS (with a deprecation
warning) for some of the 2.4 cycle?

Ross

--001a114dc03e8399180551ff9acc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 June 2017 at 12:59, Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4jh" cl=
ass=3D"a3s aXjCH m15caba2157e6a713">The IMAGE_DEPENDS variable can be overr=
iden to add dependencies for<br>
individual image types.=C2=A0 Those dependencies are added to the do_rootfs=
<br>
task, while they really should be added to the specific image type tasks.</=
div></blockquote></div><br>Other layers such as meta-raspberrypi use IMAGE_=
DEPENDS, should we move oe-core to use [depends] but handle IMAGE_DEPENDS (=
with a deprecation warning) for some of the 2.4 cycle?</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114dc03e8399180551ff9acc--
