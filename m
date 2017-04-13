Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9293E77D3A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 07:41:29 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id v207so6456056ywc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 00:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GJXtw43gxW/VQt2yeX2/Pg67DwOqRiOJkjXCDwyOjo8=;
	b=FhOihfM+1onV2cJ5n8IJ678IimWbjdUn6gvT5mO/Hz/b62Ne43d26mx9dKVpdCdyP2
	NOm9PlUFisaHLwwySVmuWCsZvoWt8h2PKaVRUm/8LXw3Fp2MmG8B22T8gObDffMvoNlL
	1/n1SXzmNUKgkGwGErdSBM3WuC5/h0L+/iLymEO8IUWwCLYgWJf4MQKfzncQro1a2QhH
	V+F9oeFMxwWaqDcBxRhkqgsOoGc4uCIt+KD/0Wnz0M2OM3sx1xGE617gixlJ7SXzSiAb
	u37jg3I4zqKAqhfi+syUBQO4zLBZnu47peGM8GJnJ7ybbcxI957MmwtFvv1yoE7Y5Ayo
	V8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GJXtw43gxW/VQt2yeX2/Pg67DwOqRiOJkjXCDwyOjo8=;
	b=QGrpuFi4piCf7Oh8x5kVzVlh3imu7X8eo9Pq+wfdG8z0IKxtixPduk35d8fFqlgn4K
	FFFpTEk8iRv34BRZl2wR2fZ2HEGwwS2sx67XUjR+gs4VVYaghU+boipLmvF+Lu+1ZpXf
	0yKmTzASfZUFXCJQFXr0pAIAEp9adbxSshVFJhCafu80GUAcf3cc6jVpAe4K4sCvbWQ1
	2IcymWI9Rez8LiI5D+CgP0CqPfoAnA6bWNUC83EmXtLXm8dL28dzY6Q7V/OjCuUbIgz7
	7tTvT2NZ1ithk+8EulnDhW5U+Io8oGLCfgj8ClB4m6iZ0nx7WKgwNUdRWW3F4S3HMI/O
	Vpsg==
X-Gm-Message-State: AN3rC/4gx+pSU7nZ5JGVUHuqXSRhUHCgjeWSIh727BigIV2pr6Z4Ord7
	DM+eG9SXD1qVazMnq+nRlHCI3tQ7UOd2
X-Received: by 10.129.172.99 with SMTP id z35mr1131572ywj.177.1492069290464;
	Thu, 13 Apr 2017 00:41:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.121.75 with HTTP; Thu, 13 Apr 2017 00:41:00 -0700 (PDT)
In-Reply-To: <a274ed9b-010d-f890-2c3c-064e6e1bbcc2@linux.intel.com>
References: <1491994341-28659-1-git-send-email-zhixiong.chi@windriver.com>
	<CAHiDW_E2xCAED+8kCde3w3sNyFZa5w-96VfN-+kbd0+4HjmiEQ@mail.gmail.com>
	<58EEE028.5000606@windriver.com>
	<a274ed9b-010d-f890-2c3c-064e6e1bbcc2@linux.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 13 Apr 2017 10:41:00 +0300
Message-ID: <CAHiDW_GAbFnDivfNvTYGKoUDd5fiyo4yeP4gYiG7aMpMr1nGFw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnome-common: add EXTRA_OECONF "--with-autoconf-archive"
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
X-List-Received-Date: Thu, 13 Apr 2017 07:41:29 -0000
Content-Type: multipart/alternative; boundary=f403045f0a480a3b0b054d0774bd

--f403045f0a480a3b0b054d0774bd
Content-Type: text/plain; charset=UTF-8

On 13 April 2017 at 08:02, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 04/13/2017 05:19 AM, Zhixiong Chi wrote:
>
>> autoconf-archive is not in oe-core, is it?
>>>
>>>
>> Yes,it is.
>> As Alex said, it shouldn't depend the recipe from the other layers.
>> I will try to move autoconf-archive into oe-core next step.
>>
>
> First research other ways to fix the issue please; we try to avoid
> unnecessary bloat in oe-core.
>
> For example, how about deleting the conflicting macros from
> autoconf-archive, and making it depend on gnome-common? Or researching if
> we can get rid of gnome-common altogether in oe-core.
>

I had a quick look at this. We have three recipes in oe-core that "need"
gnome-common (python3-pygobject, gnome-desktop3, matchbox-desktop). The
only meaningful usage of gnome-common in their configure.ac's is
GNOME_COMPILE_WARNINGS().

with this in mind I would not object to just the original patch with the
autoconf-archive dependency removed. However, it would be nice to build
test the meta-openembedded recipes that depend on gnome-common (and add a
dependency to autoconf-archive to the recipes that seem to need it).

Jussi

--f403045f0a480a3b0b054d0774bd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
3 April 2017 at 08:02, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kanavi=
n@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
span class=3D"">On 04/13/2017 05:19 AM, Zhixiong Chi wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
autoconf-archive is not in oe-core, is it?<br>
<br>
</blockquote>
<br>
Yes,it is.<br>
As Alex said, it shouldn&#39;t depend the recipe from the other layers.<br>
I will try to move autoconf-archive into oe-core next step.<br>
</blockquote>
<br></span>
First research other ways to fix the issue please; we try to avoid unnecess=
ary bloat in oe-core.<br>
<br>
For example, how about deleting the conflicting macros from autoconf-archiv=
e, and making it depend on gnome-common? Or researching if we can get rid o=
f gnome-common altogether in oe-core.<br></blockquote><div><br></div><div>I=
 had a quick look at this. We have three recipes in oe-core that &quot;need=
&quot; gnome-common (python3-pygobject, gnome-desktop3, matchbox-desktop). =
The only meaningful usage of gnome-common in their <a href=3D"http://config=
ure.ac">configure.ac</a>&#39;s is GNOME_COMPILE_WARNINGS().</div><div><br><=
/div><div>with this in mind I would not object to just the original patch w=
ith the autoconf-archive dependency removed. However, it would be nice to b=
uild test the meta-openembedded recipes that depend on gnome-common (and ad=
d a dependency to autoconf-archive to the recipes that seem to need it).=C2=
=A0</div><div><br></div><div>Jussi</div></div></div></div>

--f403045f0a480a3b0b054d0774bd--
