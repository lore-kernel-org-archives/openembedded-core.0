Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
	[209.85.221.195])
	by mail.openembedded.org (Postfix) with ESMTP id BB0DB7FD71
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 21:07:06 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id b129so2038192vka.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hgjef4S/+EZAzy3FBIh4FHCx5ArHZoi9G+bQOYEXlmE=;
	b=D5ar4E7WqtAMtgRSoGv03Sx7UDwGhwFxbTFmPw5FB+1H5dWTh9h5+inf2ie6tpPHXT
	DVWoOA83+vKOmg5h72gQ8Ht/Bg3BIMsINaN+5RWL8oNUONhkBF0moSpHNXJYfDW2Ou+2
	6Ibk7L/3iN8rnNF5qPjLucEVly48kGV5AsquR/vT4l1uJmxAq1Rfmn/47+R6frE/JA6C
	uAGN3C6p9QoH37Sywn4/V+UR15+EbwKoGw0sKM3Ltn6xt8i1omViFohI5pzFwd/9Lvvj
	fTKPvf1WsP1nqBtijrk3vHob9l6RsREc4FkyvxyrdW4jqm/ZA3zsNMrQ8U2sjUdpQ3xm
	yr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hgjef4S/+EZAzy3FBIh4FHCx5ArHZoi9G+bQOYEXlmE=;
	b=PWoZEmKTjF7HPu+zT7EtcpNU9gLcIYEY1YaKLHmhfC9FmDO3pz4KxKfkTEE3/LFdI2
	awQzDQZEI/juKEhwgMdyEOV88wgwM+/ezDj+pvc4PvmgvEP5oSozU5Q+z5P/R4nIZIER
	cGBg3KdonHrz1Lqp8DVxyk9ODPGlv68rqjAMCMbJDP43kIY1A3vY+/y+kDqh/O/st467
	0bPYlsLYtj65fCiRkN+wWAzCckO6Sn+h8vnOMBNTmRcXqGoglhBBDHgDMVKv7wv7z3/D
	fRrkAUonLj4f5cgmslYR87KZvKP7ZfkKEaQ7b5Y6WrjyhMmbG7Y1rfDX++euIs4wS7xV
	Amug==
X-Gm-Message-State: APjAAAV1y8Z5c4H1M7uDC4JYOC6jqWyry8eiASZ83+RRt3YmIpAc1eFe
	HMrCNZkZ9mNw8M9AmxIY/yu7aozZWWAw5nNZ0bA=
X-Google-Smtp-Source: APXvYqygfZPUv0n9vkRdtNk95Fee/OiH44Ml9J6LxQFOs1S7CY1Mmc1Yswsk5lWkNjWNeDwF4bvtTHTBUs7WIwsFkfA=
X-Received: by 2002:a05:6122:2b6:: with SMTP id
	22mr7371038vkq.49.1576789627688; 
	Thu, 19 Dec 2019 13:07:07 -0800 (PST)
MIME-Version: 1.0
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
	<20191218143758.129308-12-alex.kanavin@gmail.com>
	<8c5d060d-c77e-d6ef-cd41-672724245cb6@intel.com>
	<1d5a83ad-7b87-9c13-0c10-c05fb52ea539@intel.com>
	<CANNYZj8PXt_yqtusUTxO-gVs=tzBHa2bj2H-H40_ur-kkGB1dQ@mail.gmail.com>
In-Reply-To: <CANNYZj8PXt_yqtusUTxO-gVs=tzBHa2bj2H-H40_ur-kkGB1dQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Dec 2019 22:06:56 +0100
Message-ID: <CANNYZj_1R5V3zyT1-URfhhN4yXg7XcG51i-xRSqWJFgrhdfjvA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/25] acl/attr: update to latest upstream releases
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
X-List-Received-Date: Thu, 19 Dec 2019 21:07:08 -0000
Content-Type: multipart/alternative; boundary="000000000000a4dc85059a14f125"

--000000000000a4dc85059a14f125
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Dec 2019 at 22:01, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Thu, 19 Dec 2019 at 21:56, Ross Burton <ross.burton@intel.com> wrote:
>
>> > I don't think this was intentional?
>>
>> A more idiomatic way of handling this, although it would break
>> dependencies, would be to inherit bin_package.
>>
>
> Yeah, the packaging was hidden under all the build hacks so I didn't spot
> it. Let's do the inherit, library dependencies should be automatically
> updated via shlibs.
>

*lib*_package :)

Actually, that'd be many recipes to fix (attr -> attr-bin), so it's best to
put the two lines back.

--000000000000a4dc85059a14f125
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 19 Dec 2019 at 22:01, Alexander K=
anavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com=
</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Thu, 19 Dec=
 2019 at 21:56, Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" ta=
rget=3D"_blank">ross.burton@intel.com</a>&gt; wrote:<br></div><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; I don&=
#39;t think this was intentional?<br>
<br>
A more idiomatic way of handling this, although it would break <br>
dependencies, would be to inherit bin_package.<br></blockquote><div><br></d=
iv><div>Yeah, the packaging was hidden under all the build hacks so I didn&=
#39;t spot it. Let&#39;s do the inherit, library dependencies should be aut=
omatically updated via shlibs.</div></div></div></blockquote><div><br></div=
><div>*lib*_package :)<br></div><div><br></div><div>Actually, that&#39;d be=
 many recipes to fix (attr -&gt; attr-bin), so it&#39;s best to put the two=
 lines back. <br></div></div></div>

--000000000000a4dc85059a14f125--
