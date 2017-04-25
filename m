Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 756AB71AD4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 10:19:54 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id f76so60082697qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 03:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=21bcXolbetpb64iJK2lJArjcgrTc0M7V+oFpjaOm4Pw=;
	b=Y+nDJdVvmpGopqHUyMuLJoT+xl0mW3WKmjW0mVesRQGN3jBe9QvIGEjwqW6OI1mOqa
	LoqgQN5LnK3FhWuJcCqS+D3HoYq7n18CjAvWwW45Sr8kriUi3qJo/tphN/8S87RcLW1x
	xsaUawJLcTlmARfyZcueaNo+XvQmL23c0yjJvCbsdOn6uxCZFN5ffxMliqJAUhlDVMWe
	N7dtfmLOvLNbgBX0S92j+9aagg6mOlO62zFx+rUrldI25o3FfGaB/o2FI25g/DKfaC2f
	YYg3FrTZilfFeOO8oKMtPvdypN3xK4kYewThCjqg15niOCX7Vh8IrIxAE4EqitBjz0LM
	0v+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=21bcXolbetpb64iJK2lJArjcgrTc0M7V+oFpjaOm4Pw=;
	b=HkCmB75XI8dzwTbyg9tNIt9Ml8qhsuWk2Epw8PSMIPU0B3lGMgMlmAp/wz9jkIZPik
	ic9dg84HzwwiH9+sr+J3eVot0VeNBzfjz9fApqjFw2GbPBc4quebpXF6YaSQtkSJFuNs
	yLCtxppBD8JZ6ptNpqA2aNS//a/Zs0e01FElYrbTtAgpwKyypB9uMUg82IkGYN1yH4U+
	s1Cg5Hcn3nKgVfpeoc5ZlcMLI01wcHk3z8uVxPxMyVjDi/RRdY/mmGwr20ChQpN7TWpJ
	xHA0HxMRlhmr3S4DELaIWpYtcUQNwadJDxQqw04Kb3WpZz3wwafYLeu2lM5NLbitzWft
	s2ag==
X-Gm-Message-State: AN3rC/41zz+lr+zMRJRb3jkkfys9cejOlznNbxYXwEGSnxFlByYl3KqG
	ZLm/aJCLZN/JvaWC7QYDXvJ4kIQk2sT8
X-Received: by 10.55.17.224 with SMTP id 93mr27151963qkr.244.1493115595424;
	Tue, 25 Apr 2017 03:19:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 25 Apr 2017 03:19:34 -0700 (PDT)
In-Reply-To: <87a875qxeg.fsf@largeson.i-did-not-set--mail-host-address--so-tickle-me>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
	<CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
	<CAJTo0La+bGDBuJ42yVy79hW2iN3ZhpeyjXrhUApLn-PAi6PYBw@mail.gmail.com>
	<87a875qxeg.fsf@largeson.i-did-not-set--mail-host-address--so-tickle-me>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Apr 2017 11:19:34 +0100
Message-ID: <CAJTo0LaLOhPcz8DYQ4wGzVXrP7Qs_Fa7jgrx76wCDAuR8eoWfQ@mail.gmail.com>
To: Nathan Lynch <nathan_lynch@mentor.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Tue, 25 Apr 2017 10:19:54 -0000
Content-Type: multipart/alternative; boundary=001a1135cbccac9a6f054dfb10c7

--001a1135cbccac9a6f054dfb10c7
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 23:00, Nathan Lynch <nathan_lynch@mentor.com> wrote:

> Does adding this patch to lttng-modules work around it?
>

Yes, it fixes the build here.  I'll throw it at the autobuilder now, can
you send a patch with a commit message that isn't "someone told me to try
this"? :)

Ross

--001a1135cbccac9a6f054dfb10c7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 April 2017 at 23:00, Nathan Lynch <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:nathan_lynch@mentor.com" target=3D"_blank">nathan_lynch@mentor.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4eq" class=
=3D"a3s aXjCH m15ba1fae39ac5632">Does adding this patch to <span class=3D"i=
l">lttng</span>-<span class=3D"il">modules</span> work around it?<br></div>=
</blockquote></div><br>Yes, it fixes the build here.=C2=A0 I&#39;ll throw i=
t at the autobuilder now, can you send a patch with a commit message that i=
sn&#39;t &quot;someone told me to try this&quot;? :)</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1135cbccac9a6f054dfb10c7--
