Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 39BF06011F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 11:32:34 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id i2so71551307qta.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 04:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DFK/F3jSEis7N271JM7bCd/NsKMzgKc1GVaFvd3t2xE=;
	b=DhhmYwxTU8ugeb652em2sqtPA5MaPI+vQPAPty0yyrhs70ec5mo4nShJEGJvwYtj83
	QCbRJ/Yvd749V+BuB4JE36qTbVGBf4yXqUbPjnHDi4/xVyURCC11hig3+hnQz7X/WSNS
	JC9peY9AE5pM7qiDOmCmkygoAzdOTL5JQd4f/HaE5t8DQEfC9vrjeJFnV3ULEwFs+6Bv
	ym6rDTi60T9vyXiOlkPR6ypLZw+DjKsNNbj5CtsKtdNBMaxliTJ6owDHdCS+eltBodqJ
	J6S8BCKhl6/StwcTR6IT5ei3LJPZgSsQP/gvFR2QHBZU+kjUFCBOMV+9HwNtdU5Haoog
	jfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DFK/F3jSEis7N271JM7bCd/NsKMzgKc1GVaFvd3t2xE=;
	b=LFCztTytUU/ozQDAIH2m0UwYYHZR/tiVnm9wdqJL6HdPnrf2StzZhMV9Y1Blxsmwbe
	OSIrii61zBxcTjaHvCcOqHPHxQpj1uajDJQvowiZkqYxK9ye6dY7BKrBfLqAvSz1DgPX
	S5A6dx9OUezQzFh7yN8P8ZZ2T/TkTdstxlEMlj/Fu0yHGyZYNZ7dfLo/adrqU6b4MnyU
	tk9r/z+pWEaQTYlyk8z7c7mQfZYQK1FemdZmjhVOhn3p84nhBgLTdSzZhUhmqKZLVfiw
	nXtB0dly8NH8bH/JesoeJ5umsJPv8qvu32mEOW4R6F5EwkOS/q93FBH5s8TOf1T9wZS3
	SDPw==
X-Gm-Message-State: AKS2vOz+J2E/5uRHlGjXdPEqD7f22Dp3efzt+SeNzO2trupZyCOsB0Pg
	Q5U1gOQSZ1vg7XRhEyob+rEvDuabeLDZ
X-Received: by 10.200.43.105 with SMTP id 38mr19839268qtv.6.1498735956237;
	Thu, 29 Jun 2017 04:32:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Thu, 29 Jun 2017 04:32:15 -0700 (PDT)
In-Reply-To: <935b59af735ed9b3ece5bc41ff8d5dc0fe701bd4.1498722885.git.dengke.du@windriver.com>
References: <cover.1498722885.git.dengke.du@windriver.com>
	<935b59af735ed9b3ece5bc41ff8d5dc0fe701bd4.1498722885.git.dengke.du@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Jun 2017 12:32:15 +0100
Message-ID: <CAJTo0LYztd+7eTx4_C6eZSzT-ssniZV2u-msiK_pd8KA0Zr8zA@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] expat: upgrade to 2.2.1
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
X-List-Received-Date: Thu, 29 Jun 2017 11:32:35 -0000
Content-Type: multipart/alternative; boundary="001a113d00a648b50c055317a8ce"

--001a113d00a648b50c055317a8ce
Content-Type: text/plain; charset="UTF-8"

On 29 June 2017 at 08:57, Dengke Du <dengke.du@windriver.com> wrote:

> -LIC_FILES_CHKSUM = "file://COPYING;md5=9c3ee559c6f9dcee1043ead112139f4f"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
>

Checksums changed, remember to always explain why in the commit log.

Ross

--001a113d00a648b50c055317a8ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 June 2017 at 08:57, Dengke Du <span dir=3D"ltr">&lt;<a href=3D"mailto=
:dengke.du@windriver.com" target=3D"_blank">dengke.du@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1yl" class=3D"=
a3s aXjCH m15cf2dcb442202dd">-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=
=3D<wbr>9c3ee559c6f9dcee1043ead112139f<wbr>4f&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>5b8620d98e49772d95fc1=
d291c26aa<wbr>79&quot;<br></div></blockquote><div><br></div><div>Checksums =
changed, remember to always explain why in the commit log.</div><div><br></=
div><div>Ross=C2=A0</div></div><br><br></div></div>

--001a113d00a648b50c055317a8ce--
