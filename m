Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id C07AA6093D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 15:16:33 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id o68so90373331qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 08:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yZ3molGcXqtaxfxbUoRPx8Il86lgWsJ8Zf2s+ClVIcQ=;
	b=hGVhZItRVEy/tjHLKhGshoHnD6EesCBUY3V7tjlqCQ8BML0YKfKw1+c4Jwp+RZFFNM
	Dz0pgJ0Ul29r1poAFM4HrI09PIqzpZmy5sWZpM92BYQRJlsRpO+WFpRS80aZf2LXIUM0
	JBWJ/jneoZe6XfxlFoglkP1UL9M9fqIayYfClIfoEGJhX5IBWmfy3gAmF8m/eZF3ap8R
	yqBy3q7UH6Xwzan94dN0ZQ6EsYLSkHRHRj8WG82Z4jjELmQeWEeFv/vVzdccTPD/xRCJ
	6YIezR8LbUpFixBtj4wvYFmAxjuBiQrKHxGafZaIQ+49MAPJGiMohDhS9JrEkUwQyq0G
	Jhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yZ3molGcXqtaxfxbUoRPx8Il86lgWsJ8Zf2s+ClVIcQ=;
	b=JuAw9cdriu1IJjlfHa46qynKssl36VcXEFjehO7MqeoLeWlPFUty3XESS0UQJ4/p5d
	CQqYOYX6QJEd9DPcaBw0hmMk91N2TxkIx/sxpvaLYARiv9F1z3PAkCPQOn+9xvN7CvoD
	uu+8g7yTUGzg+yytfGKRIgRk+yz+yXBiesmgaZyS0prp/wM1Bul6ZgS3GL4AtkHrt3BK
	OPhZlHCDwPr4jfwh8ntsF/Xnp0DX74J/NK/jmuSQW8CHm9NvBZ7aJlI5EIpGd/tdIMwL
	JJUdcqxY6q03pBE3I4iYFhP7Q581ooUmTHom0Dq7BrjAt/4DyyawnUPllI9rzb948FUg
	6xTQ==
X-Gm-Message-State: ABUngvcKw9i+bALsU9ln9IxwU/tqc0jBunATbUHZBiH8ZI0t2qCRM7Y3OTob3qMY+mDm1UZo6km7N6t464jACAm2
X-Received: by 10.55.207.78 with SMTP id e75mr13704108qkj.36.1477667795025;
	Fri, 28 Oct 2016 08:16:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Fri, 28 Oct 2016 08:16:14 -0700 (PDT)
In-Reply-To: <c53d058c-c4f9-ac6f-8a55-bc3d78c180a1@denx.de>
References: <20161020133514.3403-1-marex@denx.de>
	<CAJTo0LZeox5Xe6hpnH82JZLaMb1_LtuUjKpcZtmcLOAOnosSUg@mail.gmail.com>
	<016763e0-b2cb-0c2c-f0d0-219da1c1faa3@denx.de>
	<20161025183239.GF2494@denix.org>
	<83c5347a-3962-7b3b-30d3-d5ee876fc2aa@denx.de>
	<5811E899.6050000@phytec.de>
	<ae855dd3-d95b-8616-8b6b-a3cf1f0a5275@denx.de>
	<20161028021134.GK2494@denix.org>
	<c53d058c-c4f9-ac6f-8a55-bc3d78c180a1@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Oct 2016 16:16:14 +0100
Message-ID: <CAJTo0LbtQGRnE_ET=1joJKk2V70UF=uK10TfCv=WLSbnT7BAkA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] u-boot: Update to 2016.09.01 release
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
X-List-Received-Date: Fri, 28 Oct 2016 15:16:34 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b804e417053fee585e

--001a1145b7b804e417053fee585e
Content-Type: text/plain; charset=UTF-8

On 28 October 2016 at 03:14, Marek Vasut <marex@denx.de> wrote:

> > Ross,
> >
> > Care to elaborate on what is breaking for you and what setup you are
> using?
>
> Please do, indeed.


Sorry, I was away for a week and my out-of-office only fires for @intel.com
senders to avoid spamming the mailing list. :)

This was doing a build of *target* u-boot-mkimage for qemux86-64.  I
suspect that this autobuilder was running on Debian as Debian doesn't have
a /lib/lib-linux-x86-64 but oe-core does, so a binary built for x86-64
oe-core may work on some distributions but not others.

Ross

--001a1145b7b804e417053fee585e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 October 2016 at 03:14, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:soli=
d;padding-left:1ex"><span class=3D"gmail-">&gt; Ross,<br>
&gt;<br>
&gt; Care to elaborate on what is breaking for you and what setup you are u=
sing?<br>
<br>
</span>Please do, indeed.</blockquote></div><br>Sorry, I was away for a wee=
k and my out-of-office only fires for @<a href=3D"http://intel.com">intel.c=
om</a> senders to avoid spamming the mailing list. :)</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">This was doing a build of *=
target* u-boot-mkimage for qemux86-64.=C2=A0 I suspect that this autobuilde=
r was running on Debian as Debian doesn&#39;t have a /lib/lib-linux-x86-64 =
but oe-core does, so a binary built for x86-64 oe-core may work on some dis=
tributions but not others.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--001a1145b7b804e417053fee585e--
