Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 01AB76B6F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 13:05:33 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id nk17so94354469igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 06:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=38aN09iyjzix885i55Tyw8xJQq91MwM8yJ1EUgPLMtc=;
	b=iVu1sSnAL89BcF26xHGdybk3ycI92iGRqNgKJNf4TFUb/wP3/ZYCSJBiSENYgLHToa
	/pJxqVmEiLTDQN0hbCObMyJhciujzzIB00RIqc+KuBuapvJGtreg4oDdEagc2nDFSH5z
	5PCGA6rYUiKgEvaMUIUvdc/K4ZZuNlbCzbz6RjhZQL4Jb7JQ+xMVOYE/kdeVpJk1HNPj
	nLI/In0HoiGej6AXehjFHx+8W3XtbdXuYPY1Jg1FJfRFEpN9fLeIaUth/73kerFrJsfo
	cGHedafxuEHxoAYXk/hE0giOYbPTcgulvjX/XZ+3k52hz9yh9VwDaTBAdJTEcPLmlW/N
	XvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=38aN09iyjzix885i55Tyw8xJQq91MwM8yJ1EUgPLMtc=;
	b=U3NGDOFS7mfDbGkUuwv0D8AG1vepwxxdSTspFp78lGvjmsFXd6LtzkuhQEjRI6yKBl
	KKzjek6oo306GnUmAbw1yaFLh4dYw5Gh64ZGU2nXzqO3LB1GkcfW3rjC4jnJ22hvWv+i
	OLfFY55QyaE1iFYd5o3e2vmxTYtGN7bj8vKHtLNRmJY3xbzCMmXg7Te2BZIOFtNMxyCE
	bSz5ZzKcOMo+M4x0EVF4TkvbjICAzc+I1gNWO1vpxW4Tq7k8gBOV1X0SSxA+wQsfjC7v
	uFa3/34dtC0P2OEGvy4y9oNSTlnQvmBOHUagxCOUdiUefsNY9x7CBRFs+QcpRbt8Royp
	nz5Q==
X-Gm-Message-State: AD7BkJJbaWp8dEf2lzfeeze/HbWRxXCTO84THSGKe6wcc22/ToHRDfB3xkNuOv12MLOpPw2y/qOmoBupJ9VgiVw8
X-Received: by 10.50.43.226 with SMTP id z2mr31694398igl.78.1458133533819;
	Wed, 16 Mar 2016 06:05:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 16 Mar 2016 06:05:14 -0700 (PDT)
In-Reply-To: <1458133326.2038.30.camel@pbcl.net>
References: <1458131361.2038.28.camel@pbcl.net>
	<CAJTo0LZVWPcneQzqB5hWaphESAUtVjNggto4oNcTDjdOXj9jFA@mail.gmail.com>
	<1458133326.2038.30.camel@pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Mar 2016 13:05:14 +0000
Message-ID: <CAJTo0LZjS==OOsTV2_dpLc+bmjxzGXzmjxxYu0K0RjQG+-uuHw@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: X.org licenses
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
X-List-Received-Date: Wed, 16 Mar 2016 13:05:34 -0000
Content-Type: multipart/alternative; boundary=047d7bfea0f4519ee9052e2a2bd0

--047d7bfea0f4519ee9052e2a2bd0
Content-Type: text/plain; charset=UTF-8

On 16 March 2016 at 13:02, Phil Blundell <pb@pbcl.net> wrote:

> Yeah, that seems reasonable.  A particularly weird thing is that some of
> the recipes are setting LICENSE = "MIT && MIT-style", which seems bogus
> if they are in fact the same thing.
>

That's just to make sure that it's really MIT licensed...

Can you send a patch?

Ross

--047d7bfea0f4519ee9052e2a2bd0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 March 2016 at 13:02, Phil Blundell <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div id=3D":52p" class=3D"a3s" style=3D"overf=
low:hidden">Yeah, that seems reasonable.=C2=A0 A particularly weird thing i=
s that some of<br>
the recipes are setting LICENSE =3D &quot;MIT &amp;&amp; MIT-style&quot;, w=
hich seems bogus<br>
if they are in fact the same thing.</div></blockquote></div><br>That&#39;s =
just to make sure that it&#39;s really MIT licensed...</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Can you send a patch?</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div>=
</div>

--047d7bfea0f4519ee9052e2a2bd0--
