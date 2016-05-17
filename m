Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 129F060745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 08:38:52 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id 190so14495867iow.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 01:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sQ9WJy+6Ek+RqHyRJ3ustZ4eY19newHet5asfuev78M=;
	b=HU04uS+5nKzB+doW0PFbvFezbCiGZGWbGkgIjz0Cxy/B/ffO/OQfuENWw/+aux/wYH
	KSyg7NxLQh3HPjcwVG82UN7Iy6zLOVHv57VFx+k8wwifYA27lMW/Slahtopw64mFDb+f
	e0nzfc2wJPvDm2nG1ssUXllQqnL5BY7Fu3bFbFsyffBRmYSpWyruUEFM/0nyYZvrDjGi
	X/RaSNA4NqrFTeJ1rJjCua1CTe2398CLfTJAcwUQd2bmZPUlycd6JYm7zgq0xiADSowM
	Ndck2M9mc56Zn+LKPj3O68KBJD4lcOLH/NIZA1WvYqzedZSXL1dOvn7ppqPDJWctcMre
	XngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sQ9WJy+6Ek+RqHyRJ3ustZ4eY19newHet5asfuev78M=;
	b=ZExHFNzZPY4lye7AbGrXE8GshmyK8nDkV3dsZzW19av9QlDIu2zRTn4ltO6iOXezhr
	vEghQdb34hz1WPBqov6cJ46t0kwacDQwiimGBOV8pQik0LVvwBNBcbyiwY/VmXZSqnZ1
	fFVy5VqG39KC+RjNFoReLNHNpNYQt6fGPbWvRK0Zr/lcT1ba00l9KG8YiLO5Br90fFuc
	5YlIncssKRbT7NDHfJAuktWhrAl1RWaCpPvMIP6Z74OynfpXmFmRhglNkhS3oyVrczTd
	o+4v482GfX59lRRSkT3hEGjj1/hxajIhWhPe7qOVyERvz99HXqbViRo11ctP0AmL5cqY
	moGg==
X-Gm-Message-State: AOPr4FVhLuS7uGY4FELBzcm2vDmbeKhb9dBnrPXAgM8qpt4/VHG2+XZqooBIulVyHLeakvOTZrQ+fy1b1dWCXOUM
X-Received: by 10.107.51.213 with SMTP id z204mr24291ioz.148.1463474333337;
	Tue, 17 May 2016 01:38:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Tue, 17 May 2016 01:38:33 -0700 (PDT)
In-Reply-To: <CAHiDW_GzrvqCkkcUMtNQTtgoit9JdJ5Y-pBP2vHsiC67+7JB-Q@mail.gmail.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
	<93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
	<6a0ed7998e66eedbf58fdb54db111b281a2b81bb.1463035854.git.jussi.kukkonen@intel.com>
	<CAP9ODKpbMyzEkKh1WhwnNkRrgXCeBQzTeSrVP89Ngx5CwMO_5w@mail.gmail.com>
	<CAHiDW_FQJuwT=JPtvCMPM3bcQozTqyEDFq8LjziNe=NHT+HPMw@mail.gmail.com>
	<CAP9ODKoNnq0ufH=XF8oPqTQKW_o0NehzUXCvanzLkJMEHXAdFQ@mail.gmail.com>
	<314BCBC6-07F6-4B6E-89E6-FA6D86C682B0@gmail.com>
	<CAHiDW_GzrvqCkkcUMtNQTtgoit9JdJ5Y-pBP2vHsiC67+7JB-Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 May 2016 09:38:33 +0100
Message-ID: <CAJTo0LbN+7V1iZ5u77EZbJxtF4ou2p40+ka-aJaQx=Fk4znSzg@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [PATCH 13/13] weston: Upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Tue, 17 May 2016 08:38:53 -0000
Content-Type: multipart/alternative; boundary=001a11440cd0c6e3de053305abf7

--001a11440cd0c6e3de053305abf7
Content-Type: text/plain; charset=UTF-8

On 17 May 2016 at 08:31, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> There's not much to work on as far as I can tell: 1.11 should be a
> simple upgrade with trivial patch changes.
> As I said, I'm totally fine with waiting a couple of weeks until 1.11.
> On the other hand I haven't seen any reasons to start packaging a
> pre-release -- why this one if we normally don't do it?
>

Agreed, if we want an upgrade now then 1.10 is good, otherwise wait for
1.11.  There's no urgent need for a prerelease is there?

Ross

--001a11440cd0c6e3de053305abf7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 May 2016 at 08:31, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":57z" cla=
ss=3D"a3s aXjCH">There&#39;s not much to work on as far as I can tell: 1.11=
 should be a<br>
simple upgrade with trivial patch changes.<br>
As I said, I&#39;m totally fine with waiting a couple of weeks until 1.11.<=
br>
On the other hand I haven&#39;t seen any reasons to start packaging a<br>
pre-release -- why this one if we normally don&#39;t do it?</div></blockquo=
te></div><br>Agreed, if we want an upgrade now then 1.10 is good, otherwise=
 wait for 1.11.=C2=A0 There&#39;s no urgent need for a prerelease is there?=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--001a11440cd0c6e3de053305abf7--
