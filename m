Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0FDB1607A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 21:40:09 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id n189so61859262qke.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 14:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mhzMKFd1ZSlAA2R3zvQKzT3gs9fbmmf6lIvUXq+jg+U=;
	b=PgsuN4Rp37I6Z3Nr2TZAoRRZd+9vDOJ4x/OQcAoFa5OQBosEqzThw89BLsdOlJSVgX
	y7qq6A6IwmdyfIB/2VPGYH/oN+20IfbqHZOxXwHjKP1dsy8li+huTljXdg48iroSYeWw
	FQwbvrTPhl1kGLuenk/5MhdlBJVw8ySBxZOWvj5o2BL87W9hVmVnw6xaYzDnDGNPL2j+
	oDAOGU8IUJTJOQjkkSgzP7l2Y3Wjk8U1HNMvWrzVW0+SpfUG47r3VYS1sEBQlYifgcVZ
	WluBgIhJmmHiCeDivS1Bjtt34vB+BJkTNNzGGYGn0Y4D6Nhkb2JdNp++vdL2a9fo1wr1
	7xMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mhzMKFd1ZSlAA2R3zvQKzT3gs9fbmmf6lIvUXq+jg+U=;
	b=fGHFmcJzDykugbaNuQAPJVhDAyiMikkxRz+iyS35oH96rm8Kvuz1ODTZQBi7qxaiWV
	permw6nEoVDbeZpHgGA2hkky0DlEi10Uhfw6ZG904X5B8zg6pkzVS9/eJwMglMk+Djur
	GEjPuzN3CCqDd8upa6MTcdMY9r4/0wliajw9vELuE/ckjpnfkRnCmlUIkgYYAERS6Wyr
	xQjvqGpQdewzDJ0NsjeJtC1DAS61koboMC1vnNot+HBCyQ2uzhbJ3cjbOhvY+twa8Qwr
	YNJSdxNsAA6/RraImdKRyER/+lTGbvOW5GynR3elQsyaNZjahIdX1M3EBMZPHxECJvkr
	9ckg==
X-Gm-Message-State: ABUngvcgfF9E2k1Vnohkk/NtGP85T7Lhop0KhrOt3ZlfnDy5dZj2EhWZo6suGDHYWEEFvlEgCeRkvBJJwYFvPxIi
X-Received: by 10.55.198.132 with SMTP id s4mr5867528qkl.221.1476913210951;
	Wed, 19 Oct 2016 14:40:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Wed, 19 Oct 2016 14:39:50 -0700 (PDT)
In-Reply-To: <20161019211532.GV2494@denix.org>
References: <20161018215513.2873-1-marex@denx.de>
	<20161018215513.2873-4-marex@denx.de>
	<20161019201021.GP2494@denix.org>
	<26a26c16-7eaf-70c3-698e-164bdba67d8b@denx.de>
	<20161019211532.GV2494@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Oct 2016 22:39:50 +0100
Message-ID: <CAJTo0LbWKZ1Ob1pQdUm4L4sLJX=CKDNifwHJpKSY_UVXoo-6Rw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Marek Vasut <marex@denx.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] u-boot: Drop PV altogether
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
X-List-Received-Date: Wed, 19 Oct 2016 21:40:10 -0000
Content-Type: multipart/alternative; boundary=001a11438fd04da7e5053f3ea766

--001a11438fd04da7e5053f3ea766
Content-Type: text/plain; charset=UTF-8

On 19 October 2016 at 22:15, Denys Dmytriyenko <denis@denix.org> wrote:

> > > But do we need to bump PE to ensure upgrade path and proper sorting?
> >
> > I don't think so, since the whole U-Boot version got updated.
>
> Still, vXXXX.YY will always sort higher than XXXX.YY no matter what digits
> there are. That's what PE is for, to get the sorting working even when
> versioning schema gets changed in major way like this one...


Agreed, PE is required here.

Ross

--001a11438fd04da7e5053f3ea766
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 October 2016 at 22:15, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; &gt; But =
do we need to bump PE to ensure upgrade path and proper sorting?<br>
&gt;<br>
&gt; I don&#39;t think so, since the whole U-Boot version got updated.<br>
<br>
</span>Still, vXXXX.YY will always sort higher than XXXX.YY no matter what =
digits<br>
there are. That&#39;s what PE is for, to get the sorting working even when<=
br>
versioning schema gets changed in major way like this one...</blockquote></=
div><br>Agreed, PE is required here.</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Ross</div></div>

--001a11438fd04da7e5053f3ea766--
