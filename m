Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id D5BA273237
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 08:09:43 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so48170427qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 01:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HI1xUtPMQ2SYaN3cz/IcPEFOQkt0t+SJEsW9Lv7MwP0=;
	b=Tiz+GBWZTZX3BlQhlaUn6jULVlLhhG+MG+Y7Cu5m1S1ASstLp0XJLW/4jtrAZohlg1
	d0wZLvEn7PWjIN538s22RS9usZ8AtOJ+jl3NF/29LHyTIaTAtwroC4tTfhzfkYC0X4pZ
	9mAM1a76Kv0bpZfm0IIhrxpL8usZtolH4V3Tn/pDvWBoepxnBQE8YKiKbGF+QSrPXq07
	HxFRaYhcMzVWRqaY2m7bti6d8OkO490l05XETC4wzCbjTQeDuTKxxKgOJ66vQhKDnieJ
	IE4YsbBR3Cgu0vjRdWq5SISZuS20UZrxLBxls2cWlKzU7T4yeDUriY30VhaC2uLKZRlD
	pmZA==
X-Gm-Message-State: ALoCoQlUKchF0zsXmsZ4E7vYdKzUVcxxGwRntJgH9N0EX6L3Dpnm3+L7hAWtQNaIkKp7o4gSDyFm
X-Received: by 10.55.17.170 with SMTP id 42mr43216283qkr.29.1438070983480;
	Tue, 28 Jul 2015 01:09:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Tue, 28 Jul 2015 01:09:24 -0700 (PDT)
In-Reply-To: <55B734EA.8050903@windriver.com>
References: <55B734EA.8050903@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Jul 2015 09:09:24 +0100
Message-ID: <CAJTo0LaAkEcLK=7Bzne+N8fQa2+KsA_EbuK4r1syEjR7YVcMbw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: About upgrade a package to a Release Candidate version (RCX)
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
X-List-Received-Date: Tue, 28 Jul 2015 08:09:47 -0000
Content-Type: multipart/alternative; boundary=001a1135bd022218ef051beafed2

--001a1135bd022218ef051beafed2
Content-Type: text/plain; charset=UTF-8

On 28 July 2015 at 08:53, Robert Yang <liezhi.yang@windriver.com> wrote:

> Is it a good idea to upgrade a package to a Release Candidate version,
> such as RC1, RC2 and so on ? I think no because:
>
> 1) Maybe the RC version is not stable enough.
> 2) Maybe the package's final version doesn't release when
>    oe-core/meta-oe releases, I think that use an older but stable
>    version is better than new RC version usually.


In general that's true, - qemu is the obvious recent exception because they
should be releasing before we freeze and there were major fixes in the RC
compared to the latest stable release.

Ross

--001a1135bd022218ef051beafed2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 28 July 2015 at 08:53, Rober=
t Yang <span dir=3D"ltr">&lt;<a href=3D"mailto:liezhi.yang@windriver.com" t=
arget=3D"_blank">liezhi.yang@windriver.com</a>&gt;</span> wrote:<br><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Is it a good idea to upgrade a package to a Release Candidate version,<br>
such as RC1, RC2 and so on ? I think no because:<br>
<br>
1) Maybe the RC version is not stable enough.<br>
2) Maybe the package&#39;s final version doesn&#39;t release when<br>
=C2=A0 =C2=A0oe-core/meta-oe releases, I think that use an older but stable=
<br>
=C2=A0 =C2=A0version is better than new RC version usually.</blockquote></d=
iv><br></div><div class=3D"gmail_extra">In general that&#39;s true, - qemu =
is the obvious recent exception because they should be releasing before we =
freeze and there were major fixes in the RC compared to the latest stable r=
elease.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--001a1135bd022218ef051beafed2--
