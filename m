Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9C609772EE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 13:54:42 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id 9so215108737iom.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 05:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=u+OAEouQiQy9ZTmh57fsiL2tyJFE88Pf+u4LIhVz2bQ=;
	b=I/X5dBC+C5rf7cyIS1GFLfPMXNNNhrRYYhP7GH2s47kDMSECdtOb2+v89kfSNfTVfS
	YYNX102D3XACUVr+aSiKi8IO57vlmxTjyLz8BKAgPsgNYDv2fQPIRNCyjDVldU+KI7M7
	cLsGu7WpADm0qmoEX+VcPuO8C9FhCB6WAkf7T5YYRrLreOGLgQDubwHDyGoV6xMk/xbE
	ogK0LgQlYK0LAMcwh4bUpR9WrRe5e8OPGiCZFTDd2H0e/5AssXtWb+aOjR66Xvm1zA8U
	IVpaD/g1N231kCTXGro4O2dLgjQS/V23u1GNmoyuNd4AFGs9gApm/upzXeGWtkpuZrI5
	R08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=u+OAEouQiQy9ZTmh57fsiL2tyJFE88Pf+u4LIhVz2bQ=;
	b=dk4AqkI/imvaH6bHXSa63o2LGXxNEYR7PjAYb+9GizR+LsPjGGnYQ1aBpVZsaZ90k6
	YirLoDqYv4LHdDiTXLe7JuiEKnGjrc3dJzDxUm+TWhy4ZXHIzmJAP6YGerBKLJIUlu0w
	S+Ph5SB7UwglIYk7NIo0ljbplQpUzVUDM+j+ocND754kvP1xp3zjjUwH/AY5QO03T8bq
	Y6i1W6K6EUS1WS9G1FRL0X7njNi5D+yY0jcJYaYd9BfKuh/CpYeoAM+wgf8U0xCaC+KQ
	59FcAFK6vlT1tbPP4eMT8IMQ67GMYxyM30BtWJej/UeDGqLqDwQ1jjBHfpSD5336ojc0
	IBsw==
X-Gm-Message-State: AG10YOQkK+aPg4IWvD7ibvIB9RKkaC+LhHQmj1nuLLNg2QCkYkA9iXr14f3a0eBtZn/mPsZTDf/GKXMMMicSOQ2L
X-Received: by 10.107.3.220 with SMTP id e89mr31857136ioi.99.1456235683027;
	Tue, 23 Feb 2016 05:54:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 23 Feb 2016 05:54:23 -0800 (PST)
In-Reply-To: <1456227383-9212-2-git-send-email-markus.lehtonen@linux.intel.com>
References: <1456227383-9212-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1456227383-9212-2-git-send-email-markus.lehtonen@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Feb 2016 13:54:23 +0000
Message-ID: <CAJTo0LZdtxNJa3FPAthW02iS2n+-xvntVrGU1MwA5vWvh1FnXg@mail.gmail.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass wipe ${S} before unpacking source
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
X-List-Received-Date: Tue, 23 Feb 2016 13:54:43 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7c98b36c052c704a1f

--001a113f0e7c98b36c052c704a1f
Content-Type: text/plain; charset=UTF-8

On 23 February 2016 at 11:36, Markus Lehtonen <
markus.lehtonen@linux.intel.com> wrote:

> Make sure that we have a pristine source tree after do_unpack.
>

Interestingly this fails on db-native rebuild for me, as db is playing
games with S (it's not the top of the tarball).  I had a look at the db
recipe, screamed a bit, and am testing a patch to make it more idiomatic.
Let's throw this at the autobuilder and see what happens...

Ross

--001a113f0e7c98b36c052c704a1f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 February 2016 at 11:36, Markus Lehtonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:markus.lehtonen@linux.intel.com" target=3D"_blank">markus.lehton=
en@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":2po" class=3D"a3s" style=3D"overflow:hidden">Make sure that we =
have a pristine source tree after do_unpack.<br></div></blockquote></div><b=
r>Interestingly this fails on db-native rebuild for me, as db is playing ga=
mes with S (it&#39;s not the top of the tarball).=C2=A0 I had a look at the=
 db recipe, screamed a bit, and am testing a patch to make it more idiomati=
c.=C2=A0 Let&#39;s throw this at the autobuilder and see what happens...</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a113f0e7c98b36c052c704a1f--
