Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 128196013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 11:37:17 +0000 (UTC)
Received: by qcaz10 with SMTP id z10so40339172qca.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 04:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=AIFiRb4as8ebYHFxWsKEHUZhu2WpuzqaavCczI9ai/8=;
	b=fM5avjh8gSxBWkDlVBvKxYCATPeGaQx/aphTF+oExyRLXo+ayhBr6oYysNhtxbKMzy
	S5AF94FfOel6L+BJqvwjj855NBUk1jBMZBEPXQqD1dUCWZPCvkkkTTwM+8L7vpEHLvJx
	0SJfLaVEbKAhmqh2xJmi8vvSiaOrjLuXhX1nW4wq2AGPZ7NpdchqRuVv8QrC507/7NTO
	uMpGVs5hfaanr/nv5v7PYTvdp8cWBgDBG36tCIQwVswWs91foc7UG498nmgru2Vp4tzG
	QUTTekWZd6vhQT2nLntExVdBs6gNLhMbB41bLdQjUOdsFm+FUwvgyFU4FuzL13yPnTde
	+NVg==
X-Gm-Message-State: ALoCoQkNzP4/0lOyJQjduAL9zQb+638JSHPivP9honCkPT29GMVVpe/w6MZ+CKezQ+tO4du3jU/G
X-Received: by 10.55.31.32 with SMTP id f32mr59073833qkf.41.1426505838401;
	Mon, 16 Mar 2015 04:37:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 16 Mar 2015 04:36:58 -0700 (PDT)
In-Reply-To: <cover.1426454666.git.anibal.limon@linux.intel.com>
References: <cover.1426454666.git.anibal.limon@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Mar 2015 13:36:58 +0200
Message-ID: <CAJTo0Lb3=5uZ0nm6Zzu-1ewP5jVaJonLjb4QUrESRkGMGh9jmg@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] fixes for x32 ABI build
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
X-List-Received-Date: Mon, 16 Mar 2015 11:37:23 -0000
Content-Type: multipart/alternative; boundary=001a1147b0dcc4b3f1051166456d

--001a1147b0dcc4b3f1051166456d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Anibal,

On 15 March 2015 at 23:28, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel=
.com>
wrote:

> An=C3=ADbal Lim=C3=B3n (3):
>   mdadm: Fix build in x32 ABI
>   systemtap: Fix build in x32 ABI
>   puzzles: Fix build in x32 ABI
>

The patches need a Signed-off-by alongside the Upstream-Status tags.

Ross

--001a1147b0dcc4b3f1051166456d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Anibal,</div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On 15 March 2015 at 23:28, An=C3=
=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<a href=3D"mailto:anibal.limon@linu=
x.intel.com" target=3D"_blank">anibal.limon@linux.intel.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":25e" class=3D"a3s" sty=
le=3D"overflow:hidden">An=C3=ADbal Lim=C3=B3n (3):<br>
=C2=A0 mdadm: Fix build in x32 ABI<br>
=C2=A0 systemtap: Fix build in x32 ABI<br>
=C2=A0 puzzles: Fix build in x32 ABI</div></blockquote></div><br>The patche=
s need a Signed-off-by alongside the Upstream-Status tags.</div><div class=
=3D"gmail_extra"><br>Ross</div></div>

--001a1147b0dcc4b3f1051166456d--
