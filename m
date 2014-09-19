Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2F01A60144
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 17:02:50 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id gi9so3461799lab.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 10:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=kF4rHnAXVkz874G1Nc/A0MOtevznDtkifIMNBC17oKs=;
	b=f/+c9klgNdmLAa4v2QvX2TANrUvKOOsgVkNx8bLs4PsO67asKcrfoZOzMTXuhTdkbY
	qbx0t3rnKcU50Sjmpm9K18R3JsOQdNGEK9isWm1E4hzT7aWCWSZj07GgnPasKrKwA8Q1
	nYEUTBgEKwCKoyEWqfpKoTRV11go0ySz3XzAd1k3ajw7xDa3Hl10fDgFVapB8YjqFgRL
	dUqD7wOtn8OQ+TL2W141YJF+ryue+6vX9b8tnmyCydRFmL6dqTjtaR+Dp2f0eDei76cX
	2TpgoqJK1jq202ZaoWpi6Dkq1CYwMD44PjjkBrI8ttq0blFkfbWJTCka0YOQzg8nQ9do
	BgDw==
X-Received: by 10.152.37.72 with SMTP id w8mr8029860laj.48.1411146169616; Fri,
	19 Sep 2014 10:02:49 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.43.236 with HTTP; Fri, 19 Sep 2014 10:02:29 -0700 (PDT)
In-Reply-To: <6249697.nqJ7MiLpN2@peggleto-mobl5.ger.corp.intel.com>
References: <1411031735-14721-1-git-send-email-marex@denx.de>
	<CABcZANkxOj-8VhQvafT5cQP1TDfTmVn=MGDYygkUaxQNtwYezw@mail.gmail.com>
	<201409191827.30418.marex@denx.de>
	<6249697.nqJ7MiLpN2@peggleto-mobl5.ger.corp.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 19 Sep 2014 10:02:29 -0700
X-Google-Sender-Auth: 6a0N_uI4Y8vdKxje20_jOh0ivcg
Message-ID: <CABcZAN=EGg68zyNGoefo9yr4GS8W8SjLjtZjSLSdoECEzZwvFQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Marek Vasut <marex@denx.de>, Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] nativesdk-packagegroup-python: buildtools-tarball: Introduce NativeSDK package group
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
X-List-Received-Date: Fri, 19 Sep 2014 17:02:52 -0000
Content-Type: multipart/alternative; boundary=089e0160c1562a8c0705036e122e

--089e0160c1562a8c0705036e122e
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 19, 2014 at 9:42 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> There's clearly a bug here, adding a Python-using component does not mean
> you
> should have python in the SDK but that's what currently happens. There is a
> bug open now covering this, we will do our best to address it in a timely
> manner. (FWIW, I would have thought this issue has been present for some
> time
> rather than being a recent regression.)
>

Ah, we've hit something similar. We had a need to add the git perl tools to
the buildtools-tarball to support the gitsm:// fetcher (git-submodule is
perl, iirc), which sucked in nativesdk-perl. At the moment we're doing a
horrible hack and just rm'ing perl itself after it gets installed, do you
have the yocto bug # for the python one?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0160c1562a8c0705036e122e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On Fri, Sep 19, 2014 at 9:42 AM=
, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux=
.intel.com" target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</span> =
wrote:<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":up" class=3D"a3s" style=3D"overflow:hidden">There&#39;s clearly a bug =
here, adding a Python-using component does not mean you<br>
should have python in the SDK but that&#39;s what currently happens. There =
is a<br>
bug open now covering this, we will do our best to address it in a timely<b=
r>
manner. (FWIW, I would have thought this issue has been present for some ti=
me<br>
rather than being a recent regression.)</div></blockquote></div><br>Ah, we&=
#39;ve hit something similar. We had a need to add the git perl tools to th=
e buildtools-tarball to support the gitsm:// fetcher (git-submodule is perl=
, iirc), which sucked in nativesdk-perl. At the moment we&#39;re doing a ho=
rrible hack and just rm&#39;ing perl itself after it gets installed, do you=
 have the yocto bug # for the python one?<br>-- <br>Christopher Larson<br>c=
larson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br=
>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--089e0160c1562a8c0705036e122e--
