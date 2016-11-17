Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id C57F17199A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 09:02:40 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id n204so209894910qke.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 01:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZN7c4Erm60d6DZsO4E3XdNQjOuld26/BjIvAexqfztw=;
	b=fK7uCTf6k0HX/jfi4uIUi4aGXFkKkeaSMpBB/BiL32M9/eC6h3dFuzanrieTKvFCZ7
	LyJM8s8ntR9475uP3bCa4Z7HvGq6BJZCwJ0EiS4mqRTQWZsj1vWaOKJb8bpEUBivzx8u
	2m+bivSKFOxPLIw0Wxp85pdUVlyX+cmgC6jsicFRGq+lwfxBQEj6Hyp9oHW78/XshFpr
	oYluCY3RJOp+Ek19pWhjiHm4xBlq0pkKAfhDWdaC9UHwwby/f0OZmMqbtbnX1NAfXp2Z
	tM1x4zi6cj55xH58YqzCMR9Quiaunpn4RSUMpImEIx8q4NciG5V+CdpYbuLhhQzn8HCT
	vOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZN7c4Erm60d6DZsO4E3XdNQjOuld26/BjIvAexqfztw=;
	b=JO/QfzAYS58TW7lv+bM3H6bxmB/2Y6dr54IxoqLdX7hvqyiMQ+aRE+7K536xo36b5J
	1NQnlR/dyFgkClaH1eM82NFHBLFGiTO3UJwq7pI+XNe8BS+d1O8WzBMqLcOCZrU91E0a
	RLNowV1NKHrLMvXL3wczHXaeydV2AMSuN8gT6XNB47Fjfd8i/4F3ROV2GffZqbj/ZXQO
	52ufcJ+oZOWmtF9ySS/8eC1EIvhCdzqwnBkeKoFrgekhoMzAJTZsJDwEY6FbTPRO4PVR
	DkGtFy2XeXMVionIid5dg0bpmzihJSb0eF4KuCLhraJoNT0BCpxRspFJqfH68lZsX+KV
	Tb/A==
X-Gm-Message-State: AKaTC02A35IIQavDyHEhk6WWT+lRPMHkJ5zLhyt02ito5zaWLq03zlOqM8CyGED/UJKe/oNv7d10aKNXwVrHAK1i
X-Received: by 10.55.207.78 with SMTP id e75mr2402132qkj.36.1479373361873;
	Thu, 17 Nov 2016 01:02:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Thu, 17 Nov 2016 01:02:21 -0800 (PST)
In-Reply-To: <20161117065519.7693.7868@do.openembedded.org>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
	<20161117065519.7693.7868@do.openembedded.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Nov 2016 09:02:21 +0000
Message-ID: <CAJTo0LYTbP3h5T+YEMiESUCwq0YM6QXtj5+_nr0ZWMH1Z3mhNQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: "Lock, Joshua G" <joshua.g.lock@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIEZpeGVzIGZvciBlU0RLIGFuZCB0ZXN0c2RrZXh0?=
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
X-List-Received-Date: Thu, 17 Nov 2016 09:02:41 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b8b9cbb505417b73d2

--001a1145b7b8b9cbb505417b73d2
Content-Type: text/plain; charset=UTF-8

On 17 November 2016 at 06:55, Patchwork <
patchwork@patchwork.openembedded.org> wrote:

> * Patch            [7/8] oeqa/sdkext/devtool.py: skip
> test_extend_autotools_recipe_creation when no libxml2
>   Issue            Commit shortlog is too long [test_shortlog_length]
>   Suggested fix    Edit shortlog so that it is 80 characters or less
> (currently 82 characters)
>

I'm not sure we've ever been super-strict on this, so I'm wondering if
warning over 90 is sensible so that we allow an extra two characters when
function names are long but still detect when someone has put an essay in
the first line (which does happen if the submitter isn't aware of the git
convention).

Ross

--001a1145b7b8b9cbb505417b73d2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 November 2016 at 06:55, Patchwork <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:patchwork@patchwork.openembedded.org" target=3D"_blank">patchwork@patc=
hwork.openembedded.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":3fv" class=3D"a3s aXjCH m1587111a6568b301">* Patch=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [7/8] oeqa/sdkext/devtool.py: skip test_=
extend_autotools_recipe_<wbr>creation when no libxml2<br>
=C2=A0 Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Commit shortlog is to=
o long [test_shortlog_length]<br>
=C2=A0 Suggested fix=C2=A0 =C2=A0 Edit shortlog so that it is 80 characters=
 or less (currently 82 characters)<br></div></blockquote></div><br>I&#39;m =
not sure we&#39;ve ever been super-strict on this, so I&#39;m wondering if =
warning over 90 is sensible so that we allow an extra two characters when f=
unction names are long but still detect when someone has put an essay in th=
e first line (which does happen if the submitter isn&#39;t aware of the git=
 convention).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--001a1145b7b8b9cbb505417b73d2--
