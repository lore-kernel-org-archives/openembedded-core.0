Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2200B7402B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 14:21:19 +0000 (UTC)
Received: by qcvo8 with SMTP id o8so5016146qcv.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 07:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WOguHsA+Q3p0eS5xcg7xFX7lC7P6zi+nuMDAJGefUVI=;
	b=UWzDxVZYdukFL+DTNbzpP7sLq+Kqf/v7ykpHfMUnpA84U1icn8E9IZDURRkB5Bef6w
	utEbjA3VTOhcjxOzXEfFYgX2WdEBu/mXxrRqY96dDwvXBR6Uba7wIc9j8pXGv0iud8ui
	LjO1hMcc8OXNUjIaJtcdc9v2oofKp4ot3FC1egRTVURaCwZBzIVH7cGFx6W7dFurOohv
	bmHHjAtHl/TsAYqTG2+zUKqh3MeafiH/25ZV+RcolM1ksv03c1+Sl+dvyCyMTnC/7qEE
	846n4+QjMnVJzUIaKiJL6TZJsN0xIk+pMSHvPXr9YFIgWnCPl4EPxgxlRJYTUsA4OkMF
	tGHQ==
X-Gm-Message-State: ALoCoQlx59IwMgW82GtCNbQlnhug4B/5Z3TwxHjI/zbAGbJqEyYJFHP76I3nGGYKz3NRdxuLMRnq
X-Received: by 10.140.235.77 with SMTP id g74mr21328261qhc.64.1431440481138;
	Tue, 12 May 2015 07:21:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 12 May 2015 07:21:00 -0700 (PDT)
In-Reply-To: <55516887.5080908@windriver.com>
References: <cover.1431333085.git.liezhi.yang@windriver.com>
	<d81cfb100f102438213c54a72c1f412323a80dd2.1431333085.git.liezhi.yang@windriver.com>
	<CAJTo0LZ40TNQ4NiFKChiYikMsyKN3hUyZ9GjhezVeEtSQqSeVQ@mail.gmail.com>
	<55516887.5080908@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 May 2015 15:21:00 +0100
Message-ID: <CAJTo0LYsOyP27CHxMvy87fgU=+YhMREtfbodMSv4o+C4jgh1_g@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] xserver-xorg: disable xwayland
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
X-List-Received-Date: Tue, 12 May 2015 14:21:21 -0000
Content-Type: multipart/alternative; boundary=001a11354a0065517d0515e335d4

--001a11354a0065517d0515e335d4
Content-Type: text/plain; charset=UTF-8

On 12 May 2015 at 03:42, Robert Yang <liezhi.yang@windriver.com> wrote:

> Thanks, updated it in the repo:
>

Please check with a clean sysroot:

| checking for XWAYLANDMODULES... no
| checking whether to build Xwayland DDX... yes
| configure: error: Xwayland build explicitly requested, but required
modules not found.

Ross

--001a11354a0065517d0515e335d4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 May 2015 at 03:42, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bo=
rder-left-style:solid;padding-left:1ex"><div id=3D":4xj" class=3D"" style=
=3D"overflow:hidden">Thanks, updated it in the repo:<br></div></blockquote>=
</div><div class=3D"gmail_extra"><br></div>Please check with a clean sysroo=
t:</div><div class=3D"gmail_extra"><br><div class=3D"gmail_extra">| checkin=
g for XWAYLANDMODULES... no</div><div class=3D"gmail_extra">| checking whet=
her to build Xwayland DDX... yes</div><div class=3D"gmail_extra">| configur=
e: error: Xwayland build explicitly requested, but required modules not fou=
nd.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div></div>

--001a11354a0065517d0515e335d4--
