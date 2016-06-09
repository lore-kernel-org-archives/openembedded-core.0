Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD82608B7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 10:16:04 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id 5so33594692ioy.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2016 03:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f96Ni5yNWGl4dqi1wQmTF+vbwRC6ujlYpHMzoMaEmWQ=;
	b=a8a8BpFVhHTlFpf3PtwmfaFHv0/ZHZZffMFKHn9YT5XEkriRXFzb2X9yE+lGOfDX1y
	e8346ZpBbeIjfvAASbQC6uqYAb1yolVMX2LQw7uoiiMGaCzIVOMgIOR0yt/7zCw2NHLq
	wDm1AnTMEuvlFVvXmBqvz3oi3tVN6VZrpvCgeFCvFWhFhb3dYVaJeMS2NVdMVLnqss4x
	jXfuO8vZq2pEqmRuFCVTupZHIMGYB/WKSHBXuiz0MvyrFQjFkeqoxhTXbHj6PDhm3Iry
	hpgtRd9Q/bqMnoZWlpXok+Al19BQpMrvgycPeizDL3LwLOY6YLkZk5HQMmiGZLMBr32x
	l4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f96Ni5yNWGl4dqi1wQmTF+vbwRC6ujlYpHMzoMaEmWQ=;
	b=kaiCfZfvn3lfQ4YSXqdAXhLy4l92f6SvBwXNHfDh9Uoyz72QwEr4xtwMcqlEkHpD+0
	3g9vfC0DMazHJ63i+2VdYAqkd4D06F68jRBQDvFjaOmqKYa/YV1kU8ii9EgCq4mkVgRL
	HD2VnuCqsE+gpLfiHINqM7AOLfFncqiAp5YqEdhHJehAys2+N/pyGKuxzgcKRHikCChM
	x9v1YSZNt6n0P0DG2dfD16rs0ABuVStHv+TAmhLgDBqoYLPCm1qRAjTTV8DaB54MBxTU
	REagqT7F7NNeGHEOHahAgLWI+2lnvHmQHB73wO1TZXQNR9mqWE6JWIIKn009RPd/pM5/
	t08w==
X-Gm-Message-State: ALyK8tKp/IiC6iscliU24np5ToBxTaVhlblM7mAXQJr1LpjZ31j6UMIvPXxEjoDPYjJJglBg2uX2CLgC/X1F32Te
X-Received: by 10.107.135.137 with SMTP id r9mr16020554ioi.133.1465467365320; 
	Thu, 09 Jun 2016 03:16:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Thu, 9 Jun 2016 03:15:45 -0700 (PDT)
In-Reply-To: <1465465368-26196-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1465465368-26196-1-git-send-email-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Jun 2016 11:15:45 +0100
Message-ID: <CAJTo0LZMjyZMqvC5wvJ95-i05N5pFtYZ82mrggCYJ7q_MtOnNA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bash-completion: fix upstream version check
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
X-List-Received-Date: Thu, 09 Jun 2016 10:16:07 -0000
Content-Type: multipart/alternative; boundary=001a113ec842bd7f840534d5b574

--001a113ec842bd7f840534d5b574
Content-Type: text/plain; charset=UTF-8

On 9 June 2016 at 10:42, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> @@ -12,6 +12,7 @@ SRC_URI="
> http://bash-completion.alioth.debian.org/files/${BPN}-${PV}.tar.bz2"
>  SRC_URI[md5sum] = "4e2a9f11a4042a38ee79ddcd048e8b9e"
>  SRC_URI[sha256sum] =
> "2b606804a7d5f823380a882e0f7b6c8a37b0e768e72c3d4107c51fbe8a46ae4f"
>  UPSTREAM_CHECK_REGEX = "bash-completion-(?P<pver>(?!2008).+)\.tar"
> +UPSTREAM_CHECK_URI = "https://github.com/scop/bash-completion/releases"
>

If canonical upstream is github, should we change the SRC_URI to download
the releases from there too instead of Debian?

Ross

--001a113ec842bd7f840534d5b574
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 June 2016 at 10:42, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D=
"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kana=
vin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div id=3D":3l9" class=3D"a3s aXjCH m155348b47c7fd9c3">@@ -12,6 +12,7 @@ S=
RC_URI=3D&quot;<a href=3D"http://bash-completion.alioth.debian.org/files/${=
BPN}-${PV}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://bash-comple=
tion.alioth.debian.org/files/${BPN}-${PV}.tar.bz2</a>&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;4e2a9f11a4042a38ee79ddcd048e8b9e&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;2b606804a7d5f823380a882e0f7b6c8a37b0e768=
e72c3d4107c51fbe8a46ae4f&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;bash-completion-(?P&lt;pver&gt;(?!2008=
).+)\.tar&quot;<br>
+UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/scop/bash-compl=
etion/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/sco=
p/bash-completion/releases</a>&quot;</div></blockquote></div><br>If canonic=
al upstream is github, should we change the SRC_URI to download the release=
s from there too instead of Debian?</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a113ec842bd7f840534d5b574--
