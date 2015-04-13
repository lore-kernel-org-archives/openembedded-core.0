Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 939E573D9D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 22:12:30 +0000 (UTC)
Received: by qkx62 with SMTP id 62so202454748qkx.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 15:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=F8OaXUcs57fsu1eQJyiJ96eztRZxGgj2MTWqHtbfmFU=;
	b=e8sMOC7bMAK22bxlHDtXGe2ExBJ6BS+DyeBqnGxiq5bG3rfL9HaNHZ3JIZe+SmJFnE
	xFX+tVwAlXGx50T2+YTx4dRmkc2KZd2lial811R34oEPf8MR580rltWAPyRlFooZFSEu
	KnSQdOtmsoGJSxatuNnpzs6+ExDOnMJMA92JF2IhNpNbmVxsyBryATQ4Tuq7+e3Fadcj
	Ocu7NXHkv5dCz2/Ff/NrI95Pmb3E73trWM2yvamEfY6tx1+Wd4mdKUGYWedUpnAtvekY
	I+CBREzuvk3ILOcJAYmupi8BoCAVBfPADCaivqt1cmpwxnMF3UovGZUoX7x62WZ9Bgbq
	xB2A==
X-Gm-Message-State: ALoCoQl/lZgPnkCCSxv9h4jY8ly/EYrE8uHpcW3hyCC5R13of3fqEUnqv4MicMXVZp/ENI5EHu3R
X-Received: by 10.140.39.164 with SMTP id v33mr20533812qgv.80.1428963151413;
	Mon, 13 Apr 2015 15:12:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 13 Apr 2015 15:12:11 -0700 (PDT)
In-Reply-To: <1428962883-26803-1-git-send-email-thomas.perrot@tupi.fr>
References: <1428962883-26803-1-git-send-email-thomas.perrot@tupi.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Apr 2015 23:12:11 +0100
Message-ID: <CAJTo0Lbb5STVkmLomVrypmukoivRkhLhvX+hPcjfdv3LTx9uAw@mail.gmail.com>
To: Thomas Perrot <thomas.perrot@tupi.fr>
Cc: tprrt <tprrt@tupi.fr>, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] zap_empty_root_password doesn't work with toybox, /etc/passwd isn't never edit if /etc/shadow exist.
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
X-List-Received-Date: Mon, 13 Apr 2015 22:12:32 -0000
Content-Type: multipart/alternative; boundary=001a11c14eae09a90c0513a269c3

--001a11c14eae09a90c0513a269c3
Content-Type: text/plain; charset=UTF-8

On 13 April 2015 at 23:08, Thomas Perrot <thomas.perrot@tupi.fr> wrote:

> -       elif [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then
> +        fi
> +       if [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then
>

So this is a logic bug and has nothing to do with toybox?

Ross

--001a11c14eae09a90c0513a269c3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
3 April 2015 at 23:08, Thomas Perrot <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:thomas.perrot@tupi.fr" target=3D"_blank">thomas.perrot@tupi.fr</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">-=C2=A0 =C2=A0 =C2=A0 =C2=A0e=
lif [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then<br><=
/blockquote><div><br></div><div>So this is a logic bug and has nothing to d=
o with toybox?</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a11c14eae09a90c0513a269c3--
