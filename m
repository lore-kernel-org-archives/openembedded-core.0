Return-Path: <ross.burton@intel.com>
Received: from mail-yb0-f173.google.com (mail-yb0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id D4ACE73173
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 14:08:36 +0000 (UTC)
Received: by mail-yb0-f173.google.com with SMTP id 123so54819536ybe.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ot8eH2RWs8L9wexnGJfJ4CbjjFkN+ZRnCh2sv65n5Zg=;
	b=DEBeZTaw1GV45UmvzMYA2NPCtDjzuxgYy9e7kBfUZEwCxdncwvlU/VUzCyYst6jfXO
	34xEXqWxu8D4aZOjZ9gDAop57gpPyzGg6QreITr7pnsmospi1P7mU/+tWIj6skR99yLL
	HN+5L7hd6PvC8zhLPv+WftcVo+dba/qJ5AUTCNUDP1+3+T8hNosyqH6grQdkHIyagUE9
	Pt7dfgIM6Q7jyTLglmqB8q7yR4rqA3exIF1boNtW2WXhvHsgsvUJyvB3HIAz1OLIx4tJ
	1U9HlfySUMOHsox0zVvIRKKRKzqt2e5MqHfEmONHdK53tSnixop+PHOClNuUgWG1mv/2
	3bZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ot8eH2RWs8L9wexnGJfJ4CbjjFkN+ZRnCh2sv65n5Zg=;
	b=ow4shOe3/ZejaMqZZX5Ehf00yZjbZW/Umd3w7IQ57NK14kq2EQfH+n40sNTolb7ysQ
	4NgWx3O6Cxq7W/ndGHdLAATtu9xBaC1tDykmMysMC80/W6Oyk9YyEXQVdTlFtICI733t
	7AHDmaqZIkVQ5wZn3evgxzgw+wROjcCgV3YRCr8rbKvGSbK5YJWLah7DS/v8OXDrFil6
	J3kRIV/LuuwhWxE6OZN0xvA/SGaeCUj7q95LFqISJjbe5Tg5Fcn6PZJHlO+80BBifNIp
	KWM3DQAD8OYlnXvBW31KYd5Nm/xp6l6wxidPNIODmET+zNN1TG/ykM8RA/pznvjqgtym
	A+1Q==
X-Gm-Message-State: AIkVDXLLSjHeZ43LIygjIuEjct+DLW4+pPlfbQTjpWWeeY2D8RH1chBhcqLwSgH9GXhmm6dX4ykraBmJ6m79Izj9
X-Received: by 10.237.39.148 with SMTP id a20mr12413370qtd.65.1484921316616;
	Fri, 20 Jan 2017 06:08:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 20 Jan 2017 06:08:16 -0800 (PST)
In-Reply-To: <1484921224.23233.123.camel@intel.com>
References: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
	<20170120135343.23276.63313@do.openembedded.org>
	<1484921224.23233.123.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 20 Jan 2017 14:08:16 +0000
Message-ID: <CAJTo0LZbR=p5Ge7YLjbeY-GzHC3sV6igQTLxDQ=yX3NpDpwyew@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFVFRkkgKyBTZWN1cmUgQm9vdCArIHFlbXUgKHJldjQp?=
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
X-List-Received-Date: Fri, 20 Jan 2017 14:08:37 -0000
Content-Type: multipart/alternative; boundary=f403045ee6d898d4500546872f0e

--f403045ee6d898d4500546872f0e
Content-Type: text/plain; charset=UTF-8

On 20 January 2017 at 14:07, Patrick Ohly <patrick.ohly@intel.com> wrote:

> This is intentional: I'm not the original author and didn't want to mess
> too much with the recipe. Should I add Upstream-Status in a separate
> commit?
>

Sneak it in, it's just a minor change.

Ross

--f403045ee6d898d4500546872f0e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 January 2017 at 14:07, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D"=
mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":mj" class=
=3D"a3s aXjCH m159bc342c8423aff">This is intentional: I&#39;m not the origi=
nal author and didn&#39;t want to mess<br>
too much with the recipe. Should I add Upstream-Status in a separate<br>
commit?<br></div></blockquote></div><br>Sneak it in, it&#39;s just a minor =
change.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--f403045ee6d898d4500546872f0e--
