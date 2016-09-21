Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id B590C6E5FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 09:06:37 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id o3so121868281ita.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 02:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V0mh8iHdCk5P5BayyjB//2A2SAiQlgxvt6srDACcxro=;
	b=W8RL4yE09caGq7R1SDJB/+YvhM81bgNpgcCfb+3B/rjBp/nehulQhQweDkMfozgx2x
	J3iXb9mMR3L7JClhEpR3+gaG0gvrKu3NOVupChmJxASbV4v57KE3TCUmoFkS+zlzCUd2
	NyXFHG559g5h/Bp+fD4Yn7ax+OKB7r7W0e9vzWYINyp7+KWBbGD5L/RGPYTN9WHleHvb
	2sc/jVTBKvm+QqHzl4Dr6mr38kMsk17KxUPC12/31p6wAiqIE59S6dQ0m+0TbS9wm3gf
	XWgR+jpJz5MvxX13/IOmK+QuVcuSp1jpkvgiXZCwcPL16IhX78sr+7vLuP5mp1rmTiDk
	g4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V0mh8iHdCk5P5BayyjB//2A2SAiQlgxvt6srDACcxro=;
	b=mS67FQO3Ly1RBrJmS4U0VxVlN6THD6YaXvfIu9h5+U+egg5E5wFbLG02RzTr0KeqJh
	vu3FcQCmqXFu+3SWXCZPtlZJN+k57s2phZuZF/wBVpoT/KdMTSOUFZXl8IagOLrZGQK0
	KOAXCB5TjXQA93sOoSQtIg/cAaGu/UjiHcyIprvyLunikgb7cYbBPh2Iczx8f9Y5C1Mr
	ig4f3SzykQz+jy7dCmkl+hZpZRprL+d+AvnUCamWb6n+ixArh58im5THXTuMrNPxNs/Q
	taGtD9sx9hitgZr7jW+XGQ4vMszdmIRfraTPxkO403DG3WO1l9aSzY2u5BJSMxupde6w
	RCrA==
X-Gm-Message-State: AE9vXwMBp2TXW/KcLhCNsgy+/cpeEk3QLQpKM6SO3NTzM9/VBUIdPmd6T/Q5SkpHgEFQt+/1vwgraowCCw1yyjTb
X-Received: by 10.36.115.200 with SMTP id y191mr2824937itb.3.1474448799345;
	Wed, 21 Sep 2016 02:06:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Wed, 21 Sep 2016 02:06:19 -0700 (PDT)
In-Reply-To: <1474435844-16942-2-git-send-email-schnitzeltony@googlemail.com>
References: <1474435844-16942-1-git-send-email-schnitzeltony@googlemail.com>
	<1474435844-16942-2-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Sep 2016 10:06:19 +0100
Message-ID: <CAJTo0LaSU6xmyKqiD2oAGSZX=vadxMe8fNNpvuVveyt99WGMnA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] scons.bbclass: reduce build time by adding PARALLEL_MAKEINST to scons install params
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
X-List-Received-Date: Wed, 21 Sep 2016 09:06:39 -0000
Content-Type: multipart/alternative; boundary=001a11452a12ed41a8053d00dc7d

--001a11452a12ed41a8053d00dc7d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 21 September 2016 at 06:30, Andreas M=C3=BCller <schnitzeltony@googlemai=
l.com>
wrote:

> During install all files are recompiled. This should be investigated
> further
> later
>

I'd put (pretend) money on it being because PREFIX/prefix change between
compile and install, so it needs to rebuild.  Looks like this class is
doing something wrong.

Ross

--001a11452a12ed41a8053d00dc7d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 September 2016 at 06:30, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzelto=
ny@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div id=3D":md" class=3D"a3s aXjCH m1574b3a5ec6c63d8">During install all fil=
es are recompiled. This should be investigated further<br>
later</div></blockquote></div><br>I&#39;d put (pretend) money on it being b=
ecause PREFIX/prefix change between compile and install, so it needs to reb=
uild.=C2=A0 Looks like this class is doing something wrong.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11452a12ed41a8053d00dc7d--
