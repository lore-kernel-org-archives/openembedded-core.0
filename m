Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 10E9265C9C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 11:01:06 +0000 (UTC)
Received: by qgde91 with SMTP id e91so20350131qgd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 04:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lOtrfnAUZQhMqjGJioYFXmeGaAc5FlnsrtfuiPVpV5A=;
	b=LNNEqj+QbTqDVKKsbXNaj7TX+MXsziqAdkyAQYygFGeg6IwopWmlq8qnfuK2dRIlXu
	RMf25JXqSAtihj2/IDdFnjUja6HYFxqdoZsvmeORrpcAyt/lDYdBcW2EMfHKMt1kv8Fr
	3rUiAVxcSX8FLGHMQKotqWB32ZZIasyHQKeIzoY+oLu0Y2Idlhz+4QMRsU055CUccsgN
	joj6H0SOFdfg5D2pP+9eeoZ8SuJVCuFiCoHyshkK2lrwchVnQaGyzEjjENcG4t3K6Ppc
	6ph0Fryr+4TlErEBcFRPEqlpPuaqZvwfLpyYZEGzjO3vLdZlE3dbIVZFCQm4aqVlEumU
	ElSQ==
X-Gm-Message-State: ALoCoQluJQ73A+TcmUHCJ1tjZvScJAshUodcdsngcNwnag1j5I3rpeChRoldJdu5JupSsoUSteCU
X-Received: by 10.55.43.130 with SMTP id r2mr36899369qkr.14.1431946866296;
	Mon, 18 May 2015 04:01:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 18 May 2015 04:00:45 -0700 (PDT)
In-Reply-To: <CALbNGRReufGQXfR3eYqQKN6CRwhcEk5-EaeTfctenBdWeoYm_w@mail.gmail.com>
References: <20150312143521.GD2338@jama> <5501D4CA.2090209@r-finger.com>
	<08f401d08df0$aba9be00$02fd3a00$@lge.com>
	<CALbNGRReufGQXfR3eYqQKN6CRwhcEk5-EaeTfctenBdWeoYm_w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 May 2015 12:00:45 +0100
Message-ID: <CAJTo0La7EummgKK7-dp7oubo4XV_-yjn0WMbAysDJN4Btmah2A@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>, 
	Changhyeok Bae <changhyeok.bae@lge.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: meta-gir issues and maintenance
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
X-List-Received-Date: Mon, 18 May 2015 11:01:07 -0000
Content-Type: multipart/alternative; boundary=001a1147afb04db76a0516591c62

--001a1147afb04db76a0516591c62
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 18 May 2015 at 09:00, Andreas M=C3=BCller <schnitzeltony@googlemail.com>
wrote:

> I would appreciate to have the gintrospection more central - this
> would give us a chance to get the gtk stuff out of stone age..
>

Well, oe-core already has GTK+ 3, so we're "just" missing the bindings to
Python and JavaScript.

Changhyeok, you're welcome to fork meta-gir to your own repository and work
on it independently.  If you can update it so that it works with oe-core
master then you're the new maintainer. :)

Ross

--001a1147afb04db76a0516591c62
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
8 May 2015 at 09:00, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@googlem=
ail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:7py" class=3D"a3s" style=3D"overflow:hidden">I would appreciate to have th=
e gintrospection more central - this<br>
would give us a chance to get the gtk stuff out of stone age..</div></block=
quote></div><br>Well, oe-core already has GTK+ 3, so we&#39;re &quot;just&q=
uot; missing the bindings to Python and JavaScript.</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Changhyeok, you&#39;re welcom=
e to fork meta-gir to your own repository and work on it independently.=C2=
=A0 If you can update it so that it works with oe-core master then you&#39;=
re the new maintainer. :)</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a1147afb04db76a0516591c62--
