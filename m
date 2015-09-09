Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id D4463763F8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 19:29:56 +0000 (UTC)
Received: by qgt47 with SMTP id 47so17087739qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 12:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=x4AYoxKTolI1LfpTxJ2XwefCN916DSMLesxl/cZGoRA=;
	b=NcFxnYz7GQFKGaTUxaEXPl0v02hcp54Ob5j3iTz0NQr4HfOfE/bFGPGpVdHkopMgyS
	dN+IsfZh0gURSJEjXGYaXj+2aPHFr0T++nYbqAqHPQSWBYTk4pLsSxnPmk1f3OnQfs9R
	fUnOYEkj1EN1GIdTJ0G3G0SnnmlAibVN9G0PTBuFZ6hrAa5BC1OA3Dng3vPpc9wgTxmG
	MUUEJeSnfoZGIJw8oxiTrvOAOESoYSHPApb6pxy8WdegSdHElvlGnlbMuyMjQMtlwJeC
	s6WxcK0JGYn6DXWAUAGlSSxM2243KyT4xBL4J1Dxzw1dhwvvMwtrNaFqT4nP22FrDogb
	lV6A==
X-Gm-Message-State: ALoCoQkB1CoZh1x0N9QpOD6h7/68pBx3YZdLBOx4684p31qV8/XzA8cTFd6qI69UOLvP5RQaangx
X-Received: by 10.140.93.53 with SMTP id c50mr46483694qge.59.1441826996359;
	Wed, 09 Sep 2015 12:29:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Wed, 9 Sep 2015 12:29:36 -0700 (PDT)
In-Reply-To: <29BB45DC-8BCA-4559-AD0E-BFE1FB3E5A03@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
	<b4be4eb148b3551893639ac087be2d4e8dcb8eb5.1441753511.git.raj.khem@gmail.com>
	<CAJTo0LaCUeR2pt6d2=yrTtdfJsd1AOd4iUeZMXOuOm_ROvcsWg@mail.gmail.com>
	<29BB45DC-8BCA-4559-AD0E-BFE1FB3E5A03@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Sep 2015 20:29:36 +0100
Message-ID: <CAJTo0LZMYLk_4FukX37avDAGJS1LcWikdcNNfQ-d5GToq8oQqQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/16] webkit-gtk: Backport fix to remove FrameDestructionObserver
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
X-List-Received-Date: Wed, 09 Sep 2015 19:29:57 -0000
Content-Type: multipart/alternative; boundary=001a113a63c0f24cb7051f5581ec

--001a113a63c0f24cb7051f5581ec
Content-Type: text/plain; charset=UTF-8

On 9 September 2015 at 20:28, Khem Raj <raj.khem@gmail.com> wrote:

> yes its been fixed in 2.8.x. point me to MUT commit I can cherry-pick
> locally here and try it out to make it sure.
>

The webkitgtk upgrade is poky-contrib:ross/mut (a01c056).

Ross

--001a113a63c0f24cb7051f5581ec
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 September 2015 at 20:28, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex"><div>yes its been fixed in 2.8.x. point me to M=
UT commit I can cherry-pick locally here and try it out to make it sure.</d=
iv></blockquote></div><br>The webkitgtk upgrade is poky-contrib:ross/mut (a=
01c056).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a113a63c0f24cb7051f5581ec--
