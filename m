Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id EAC4371A71
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 15:48:31 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id b2so1004653iof.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 08:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=2ZjLX77CJQL/lIvBPYqy7om/5sycmwXKlmJgmvSbFnc=;
	b=0ZnmCVgpboHvTBrpQpJ/MHIJvy7Xxb47ru7a8XQfp6ybzcprtpRzkzjVTHiiL6z/JC
	fSp26WwYL7kkqUO38fDwbWFcrOgWgo33N3OQ86uvFJeB+P+ZQKls7n7DnR3X2hmG/SsV
	dh+f5xiQlCoS+NWapLSsD/9r/+qxr4+cCck60ci9M7NPQ/84Jre8vHLOefZce39/zQka
	2iNw4BBafjf2484CFfvV3ne1A0tYhW6EQ33b0tpIDsFnMpWHTUBNWbTjhEHz46IKqXVM
	WKYmypr/n87IELi/oxgDz+Ec6pxxMwGAOhCHGmBSAjOQa9kjnUBQeQmKjv6niR3Pio3z
	e1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=2ZjLX77CJQL/lIvBPYqy7om/5sycmwXKlmJgmvSbFnc=;
	b=Z+NinLy773CiXCxTJloGh78WT2cYdnKZWj5uWLurq9OZkBeUU0sDHIJxuZQruPFFGi
	4VCIGmhEnP0o/aHxbsL+NOgXz3f7ZcL8SzDwYjf/4MrnT2cShFhA1qFnXgGQCv8r6thj
	f55kwEwG7GibMgJtPtxFPr9bAC/eqUIApsTpdH5NKboJYT9l28/FzAmKzQQZXqo1IXkb
	fyAFEQWOn8hFFc4g8TsSvZCRDY+S8NJV/5HGf/LYO8cNJdNPBV5R6aqL4CCZ/Q/44cWW
	Sfs8Tb810S85qEpssNK4yJNKgcNTDVhKmlI5apKi5bliO0h0SChJf5vkfZIbj4s0YVmU
	hvzg==
X-Gm-Message-State: AHPjjUiI0bPdjgiZuedp53egP60k/KFP1wV6sNzWHV4R8HcLvLYXUWaf
	mTGoBpZ65T8GDZryF8Ni1dzpFg8VM+Gx
X-Google-Smtp-Source: ADKCNb4455t2/xf8CQvPvkdPVYi6yCIyeIi8NAA9Oxh0lekzkFqQtl1M9msucd9QAi9Wl7x7NRys2mXWvXZU3ZqmqGc=
X-Received: by 10.107.188.66 with SMTP id m63mr5463927iof.9.1504194512760;
	Thu, 31 Aug 2017 08:48:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Thu, 31 Aug 2017 08:48:12 -0700 (PDT)
In-Reply-To: <ddf815cf-b746-7107-ba7e-9e41ab8747ec@igalia.com>
References: <20170831122335.6864-1-clopez@igalia.com>
	<CAJTo0LZTdWS=haawEyk_k2cq=5DKqPM=4s_JS0RyWxyw7epMVA@mail.gmail.com>
	<ddf815cf-b746-7107-ba7e-9e41ab8747ec@igalia.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 31 Aug 2017 16:48:12 +0100
Message-ID: <CAJTo0LbsBGGCqksh5RcM48q-sNMWg42o+3iM=OjnR5dya1mXRw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-live-boot: disable systemd-update-done.service on live images
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
X-List-Received-Date: Thu, 31 Aug 2017 15:48:32 -0000
Content-Type: multipart/alternative; boundary="94eb2c05d5009b49da05580e93a6"

--94eb2c05d5009b49da05580e93a6
Content-Type: text/plain; charset="UTF-8"

On 31 August 2017 at 16:38, Carlos Alberto Lopez Perez <clopez@igalia.com>
wrote:

> On 31/08/17 15:46, Burton, Ross wrote:
> > Presumably/hopefully systemd isn't hardcoding /etc and /var but
> respecting
> > sysconfdir and localstatedir, so the touch should also use those
> variables
> > (by sedding the script).
>
> https://github.com/systemd/systemd/blob/master/units/
> systemd-update-done.service.in#L15
> https://github.com/systemd/systemd/blob/master/src/
> update-done/update-done.c#L72
>
> // losing the hope


Sigh.

If you promise to file a bug against systemd moaning about that, I'll queue
your patch. ;)

Ross

--94eb2c05d5009b49da05580e93a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 31 August 2017 at 16:38, Carlos Alberto Lopez Perez <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:clopez@igalia.com" target=3D"_blank">c=
lopez@igalia.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 31/=
08/17 15:46, Burton, Ross wrote:<br>
&gt; Presumably/hopefully systemd isn&#39;t hardcoding /etc and /var but re=
specting<br>
&gt; sysconfdir and localstatedir, so the touch should also use those varia=
bles<br>
&gt; (by sedding the script).<br>
<br>
</span><a href=3D"https://github.com/systemd/systemd/blob/master/units/syst=
emd-update-done.service.in#L15" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/systemd/<wbr>systemd/blob/master/units/<wbr>systemd-update-don=
e.service.<wbr>in#L15</a><br>
<a href=3D"https://github.com/systemd/systemd/blob/master/src/update-done/u=
pdate-done.c#L72" rel=3D"noreferrer" target=3D"_blank">https://github.com/s=
ystemd/<wbr>systemd/blob/master/src/<wbr>update-done/update-done.c#L72</a><=
br>
<br>
// losing the hope</blockquote><div><br></div><div>Sigh.</div><div><br></di=
v><div>If you promise to file a bug against systemd moaning about that, I&#=
39;ll queue your patch. ;)</div><div><br></div><div>Ross=C2=A0</div></div><=
/div></div>

--94eb2c05d5009b49da05580e93a6--
