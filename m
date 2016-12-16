Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0291F77247
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 17:53:44 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id q130so98283815qke.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 09:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=v+ovlE3/o30Mi5H77mqMNrW9ZAf/Im/92daDoTTDtv0=;
	b=PCNAceFTRSqBroAC6kypjJ4i+ChQT7xXbx8+CFgnN4ZtWJJWfctqGVS5NaF3RplJ/p
	pYyYPHyWXiNSkK57yaqEyQ85zTI65fTMBBlC8SJUWXwVVZMKgVe0KTpDyl+SethJ1Vl8
	tOgovwf9VTgIPx4wFLHPo7eh+n8t8ZWo/GrRqlsr7CJ0p8sQGlZOtDWVFN2DAmDrxJ0t
	ONOi9l+Yh92wDOc6nYE59kZOs3wDnz+kmpQqeLdttmvGCXEKm/9VFb53zsZK0Jyw6ZoJ
	kTSJfNho628fyYYFXOgj6JnyaI/0y2bZypOX+Au8MGzkre9qccOGSs80yNM9yyYxG2Jd
	WT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=v+ovlE3/o30Mi5H77mqMNrW9ZAf/Im/92daDoTTDtv0=;
	b=TqdtxVHlShrVh1qBYcO+y5P1TuSZIb3OGfIP4rYLinEe/4vi4HPZBqyN2/mCgwz72w
	e0J0M3o/XXAXQvwJ2kxDuYthSBzg6ebKmes7iA0tlMAlG99/TX9KVFTjLMwsqTgGyACW
	VV8wcSDjSUEFxPnQT0YUTvjkADzHkQVAxVQgxmBU1YvZWMNFk2hvwbcXc0lPWdAYzHnZ
	NkPmPJaav3VwjtT9b+pkNi/ai79sWoul0Mw6oefly8Gxe73PQWSIN8jLi15t2pJHJar2
	lOfaesB7JLgRkwhRllPvvJVemJZOWJI5HBxjFjrxhRNgRuI/rqTgIMNS7UlqUvgx1hJT
	SfsQ==
X-Gm-Message-State: AIkVDXJ/Nt+/dx9LdjFpkaYZWTkKTE9BjjD6222GFunjRbv5MvltOMcUIGP8vsVsDssoqtZy1jbhig2BH6k0OKiH
X-Received: by 10.55.207.78 with SMTP id e75mr4748151qkj.36.1481910825665;
	Fri, 16 Dec 2016 09:53:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Fri, 16 Dec 2016 09:53:25 -0800 (PST)
In-Reply-To: <1481548162-22276-1-git-send-email-maxin.john@intel.com>
References: <1481548162-22276-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 16 Dec 2016 17:53:25 +0000
Message-ID: <CAJTo0LZ5ne934RKTZChfSx8TeuTqneZE5R7fd6JJNOSsd=9M=A@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Cristian Iorga <cristian.iorga@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: add ptest
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
X-List-Received-Date: Fri, 16 Dec 2016 17:53:45 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b85a65060543ca40e0

--001a1145b7b85a65060543ca40e0
Content-Type: text/plain; charset=UTF-8

On 12 December 2016 at 13:09, Maxin B. John <maxin.john@intel.com> wrote:

> +                         python-argparse python-pprint diffutils openssh \
>

Sadly this dependency on openssh breaks images which pull in dropbear
explicitly, such as core-image-sato-dev.

Why does the curl ptest needs openssh, and can it use dropbear if that is
present?

Ross

--001a1145b7b85a65060543ca40e0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 December 2016 at 13:09, Maxin B. John <span dir=3D"ltr">&lt;<a href=
=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":94z" class=
=3D"a3s aXjCH m158f327424b917db">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-argparse python-ppr=
int diffutils openssh \<br></div></blockquote></div><br>Sadly this dependen=
cy on openssh breaks images which pull in dropbear explicitly, such as core=
-image-sato-dev.<br></div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Why does the curl ptest needs openssh, and can it use drop=
bear if that is present?</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--001a1145b7b85a65060543ca40e0--
