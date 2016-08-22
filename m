Return-Path: <ross.burton@intel.com>
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com
	[209.85.161.175])
	by mail.openembedded.org (Postfix) with ESMTP id 102E577081
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 15:20:36 +0000 (UTC)
Received: by mail-yw0-f175.google.com with SMTP id u134so54189131ywg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 08:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ER72bMKIL2k5xTmmti3SNQwyV5ZrX9xRoYWczsXRTjE=;
	b=OkN8eJ2sz0D/e5hnnzfqi09K/yq2rEngU7VSp7Qnr/6M0NZ8QJw7ExopxVZ0KkMNSP
	rlGIDZroKTThZkKGWVZFcgw05MaxfcbYnaEX7V4UkqgE75PSH69zt7tCcOfeQLWGJAl9
	M/i/Pj8HCP+0Yhf/R+vMu0HGO8zHcDHDz5V/TPqm/V29NdXMz7BQoTpRPSugDaJ2v360
	7nN6XyeSzt1mb3FJ4Pp1a0rCOHDsArSH22t/D+kd/r6LgfgwBW0a2J11mn9t0ufgLjlm
	BgMXG/4TMtOyHqZVCb4KeLMd1JEGPdkSATXkBXqop6PBIe0dgMhfYpdIsa2Jzq9RBcWN
	rnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ER72bMKIL2k5xTmmti3SNQwyV5ZrX9xRoYWczsXRTjE=;
	b=NEssNzHbOUPAsyM/VVxzT6d9pxOMQVyLILwdyd1b4eM10ywkAAMw/+rPpC5gkmhozO
	yHU3CifVTjhmRjH0VMKdUWU5JSJ/1JO8UJUZgzIVEPB+OOQgoBLGVXtIfrNSPiWLWa3b
	k3/SRM6rIV6xBwglcH/8Dss6/mofKvffTiRj416t3yvOuDkaZlk9KvuLm6/KNfsLXqZa
	+mnR1NtESgv/0YF73o0oSJUxD7y4ZtgSr6IGZgX6lMm+Yrb69zXCyv5K0x1TAfoyIGdy
	/2QXII6GPNLQeN+Xxx1UM9ZwVZ2UnMLX1EhkBelw/bOkcL534mjIMippcqzhF2A3jUpc
	NR1Q==
X-Gm-Message-State: AEkooutAZwI1fzvs5mKgAXXRR3qP/nozpVUjwWY4K0oBB1rDLp7sbDE8bsEdfZmqrYCnyiU//98JK2Pu2NvICTKa
X-Received: by 10.36.19.75 with SMTP id 72mr20746308itz.83.1471879237306; Mon,
	22 Aug 2016 08:20:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 22 Aug 2016 08:20:16 -0700 (PDT)
In-Reply-To: <020C25BC-315C-4ED3-8268-DB7CC4C0A52A@gmail.com>
References: <1471499308-1666-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
	<CAJTo0LZy-mx4K=eSJdNRq12JVDzGwW+Oe0uf40YRZAmyWVJsZQ@mail.gmail.com>
	<56847BB1-DCA8-446D-9418-2D42098A7073@gmail.com>
	<CAJTo0LZJRJFC71=xEa_EQUiOTZNWR8QPGtnJvSWqqGLqM_QjcQ@mail.gmail.com>
	<8b30fc2d-26ea-03bd-58ea-cdbf00e74b36@linux.intel.com>
	<020C25BC-315C-4ED3-8268-DB7CC4C0A52A@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Aug 2016 16:20:16 +0100
Message-ID: <CAJTo0LYL9eiid4PKOj8OgY81Z3KANhtHkwh1RGGhNQi4+RXehg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdk-pixbuf: 2.34.0 -> 2.35.3
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
X-List-Received-Date: Mon, 22 Aug 2016 15:20:38 -0000
Content-Type: multipart/alternative; boundary=001a1145180a180b0b053aaa9749

--001a1145180a180b0b053aaa9749
Content-Type: text/plain; charset=UTF-8

On 19 August 2016 at 17:52, Khem Raj <raj.khem@gmail.com> wrote:

> good point, will this class give me some sort of parsing error, if I try
> to update to odd version ?
>

No it simply sets the variables so that the recipe reporting service won't
propose an upgrade to a development release.

There may be a good reason for the upgrade to a development release (for
example if you're developing a system and are tracking an upstream
development series), so aborting the build would be overkill.

Ross

--001a1145180a180b0b053aaa9749
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 August 2016 at 17:52, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":2j3" class=3D"a3s aXjCH=
 m156a3b80948b2ec1">good point, will this class give me some sort of parsin=
g error, if I try to update to odd version ?<br>
<div class=3D"HOEnZb"></div></div></blockquote></div><br>No it simply sets =
the variables so that the recipe reporting service won&#39;t propose an upg=
rade to a development release.</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">There may be a good reason for the upgrade to a de=
velopment release (for example if you&#39;re developing a system and are tr=
acking an upstream development series), so aborting the build would be over=
kill.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Ross</div></div>

--001a1145180a180b0b053aaa9749--
