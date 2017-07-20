Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 573D578310
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 15:15:01 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id a62so17827663itd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 08:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OyGPySxGoYR8gF/00tz9WAzTnRfzm9K+0VSDVW9TdzA=;
	b=EdU8+ssyeX2ZThu9ZF3i+lcbqf0NckZjGfvTe7xhewNcF5WhNf/lG1y8CUNhyAJnVK
	/Ms4K8PIr0ZPwrHPAsiazEkQbEUKySewGz672gZIRtnvdN8Gw+R8W322Fupv1egDpypR
	lnct9AmJSyUbo/XV+JgNVdfpXDJEAY3O+7S8b/9Hl0rIAlLRKVK+j8EZRTXZFmNPoBhD
	tILPwHVsUaGLlrM5b/x4u9QEBFTnFzK6XT1Q7g9qPRgqkIRtJ24Y1pm+d0sYnbdT43Pu
	7NkJL9hJpOg3AyMUrGYJpFqQJWPhD7VRmy/bM9Ov0TFIYqZcT9m6D7ScqaAIK/TjmMva
	WfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OyGPySxGoYR8gF/00tz9WAzTnRfzm9K+0VSDVW9TdzA=;
	b=OzP9EBXptRvok46CjMT/FfrRRfYrlbgcPiwbzy0cGlQt0TH2f5tBsxsWE9PMT4Vi9x
	dTsXSDAKmqDMoRNhS3Y96cw2m+RmqCEYZ1Gtc+dIhN3cC+GSOfA/i+oZpyy6eAPgmU5v
	dQ6Stzo/ZCup81YBJ5h37RY8Y/z/Z3KUYq+bC/Gd9fDL/YmIrBJeYagAJhhTxwBZlVL7
	fcFsFliNF6N8yX69bqQWpnE6TIt4ECPnMk0IKqtATiF8hiHFURnV+TKS1Wd07feozGCc
	4k4ZBGNElsHO/GGngPyQz/An7737Rn40Qf1R+94/1xp678WF0a9RSgVo1MHCjJdFpaio
	TUCw==
X-Gm-Message-State: AIVw110cxWub1l3IxfYJIcE6jGaGGlaqGbOycS3FopsbC4QDlqJ6CEHa
	3JjIbtB4wHkC3hCiCaAoQ04aHt4XjuZI
X-Received: by 10.36.154.67 with SMTP id l64mr3429098ite.87.1500563703200;
	Thu, 20 Jul 2017 08:15:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Thu, 20 Jul 2017 08:14:42 -0700 (PDT)
In-Reply-To: <20170718185441.GR26405@denix.org>
References: <cover.1499854502.git.liezhi.yang@windriver.com>
	<3afb134341c5cfde7c0f72fda35d6d94bad24704.1499854502.git.liezhi.yang@windriver.com>
	<CAJTo0LYUwPxW_0aLGwmwANyNv5sCovXijF-XrMCzTjGSr_V=Nw@mail.gmail.com>
	<dcbc00ff-666c-ce9a-9884-42224e2701e8@windriver.com>
	<CAJTo0LanadueCFtjEZXDrk3-jkv2+Y3kBO6FsSBC-9t-Ey1GWg@mail.gmail.com>
	<a75792ff-4291-1f5c-dca3-0a97ce64639b@windriver.com>
	<CAJTo0LYV+oyEwE15JQ7+wyRAAWFqorcrAcCRGZOqLdoyY40w_g@mail.gmail.com>
	<dc06c161-4226-aae8-963b-87090202913e@windriver.com>
	<CAMKF1spYtmTfAw8aaayFkKbU1eJA2cdgqQX7qAH_VBuMu0FX5g@mail.gmail.com>
	<20170718185441.GR26405@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Jul 2017 16:14:42 +0100
Message-ID: <CAJTo0Lb13utF3cwjXS70Q2ZwC4mRBsAGZWj+Z5HeZJTycpmVew@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] cryptodev: 1.8 -> 1.9
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
X-List-Received-Date: Thu, 20 Jul 2017 15:15:02 -0000
Content-Type: multipart/alternative; boundary="94eb2c11489e7e19dd0554c136a9"

--94eb2c11489e7e19dd0554c136a9
Content-Type: text/plain; charset="UTF-8"

On 18 July 2017 at 19:54, Denys Dmytriyenko <denis@denix.org> wrote:

> Should this kind of behavior be addressed by BSP Guidelines and the Yocto
> Project Compatible 2.0 requirements?
>

Not sure what it would say other than "don't jump the gun"...

Ross

--94eb2c11489e7e19dd0554c136a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 July 2017 at 19:54, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=
=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":42f" class=3D"a3s aX=
jCH m15d570dac34f9bf5">Should this kind of behavior be addressed by BSP Gui=
delines and the Yocto<br>
Project Compatible 2.0 requirements?<br></div></blockquote></div><br>Not su=
re what it would say other than &quot;don&#39;t jump the gun&quot;...</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--94eb2c11489e7e19dd0554c136a9--
