Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2405274DCF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 09:38:21 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id c9-v6so31245880iob.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2018 02:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1vv1rbl3vt63C04jzySocKG0U6VIgWm6BMKSduP6x9M=;
	b=Jy/hd23Er8drDvYXs3GVSGiW5D8XKoXZCTkSoDj7j3baAFsGZ0pn2vlwcNzYDZrCU4
	r9JKM74TXdkndCHefqELt+JzyfPtb4yyYkXHVLj9a6YomX2Fja48mhtX2kTn3gaj/pIo
	uwe2LuJNxJzGEkZWdUSjtmRVGCTwvw97JhQ6kYa0GDr3HpBlHFNSCfwwCTK+USRIPWZI
	03nEyP12khO8zlV3xEZH/dDj4KHLEXe5M3pbpES4arGn18qisBuXVoZqV6bvVrWkwoBh
	cNmyWCHf7FTU5Dly0p40EyC2QZQex4mhOMZ4tzPJajVg4U28X5plvbL+OKl0oHGQOl3K
	arOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1vv1rbl3vt63C04jzySocKG0U6VIgWm6BMKSduP6x9M=;
	b=EJVXb8qVAuTAKXlmhQ2LFm8EvSZlY+7A+1meadF2uZzn3rQw3Je7NyZPkLQJq5cIN6
	tB9m1V9sj2wbs7NMK+XcRxfkYHravVWa1r1mzQ9OmsnX74yE/iR+2h3Yt31CyPJZSdrw
	hh/8l/LaoGtzsAIr6+8k665NZ6bkNYgrhAOmGBh89ECO5mAPVGkQIG4zqFgXMlQVJQqr
	nGFdfD5lgxB3Q9/kcc+kAyTJpihUFM/Se6bUwaEk++B+1YNwERFSKTwWNJhilrGGqjJ2
	wtmq5kAQXWD2Hi62gY/VNHmrfFW1BIoWo7EAi32QQVZgeLZLX5miaKOMBSpR2Bh2UPYK
	KqRg==
X-Gm-Message-State: ALQs6tCGftHQYGay1e5Zvj3KIeQDzU4SXtC0ZjipOWTjtpFJHCCBkEIV
	Mh/znuov1g/Zrb1yl/WcEJxq5vV5l9/6BYlZREXcZA==
X-Google-Smtp-Source: AB8JxZodisGEiK2ptwxoAK3dHYEXWpXRJuiL6VZmgadqibHwX4ZpqITRuFG+qlWQa+kkI0p1A23HMPRlcO2bSMTtmZ8=
X-Received: by 2002:a6b:5507:: with SMTP id
	j7-v6mr46403723iob.23.1525772302719; 
	Tue, 08 May 2018 02:38:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Tue, 8 May 2018 02:38:02 -0700 (PDT)
In-Reply-To: <CA+chaQfbViBTpaV3rOXd1Q9NBnViSLAjb-obywEi7y1rpJAz5w@mail.gmail.com>
References: <20180507152701.12046-1-twoerner@gmail.com>
	<CA+chaQfbViBTpaV3rOXd1Q9NBnViSLAjb-obywEi7y1rpJAz5w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 May 2018 10:38:02 +0100
Message-ID: <CAJTo0Lb1ye2gXy7iNoFNwrZWjP2BoJdc6MP2H471+HMH0fPsvw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] babeltrace: switch source URI
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
X-List-Received-Date: Tue, 08 May 2018 09:38:22 -0000
Content-Type: multipart/alternative; boundary="0000000000001cb36f056bae8c4c"

--0000000000001cb36f056bae8c4c
Content-Type: text/plain; charset="UTF-8"

On 7 May 2018 at 16:33, Martin Jansa <martin.jansa@gmail.com> wrote:

> There is already a fix for this, see:
> http://lists.openembedded.org/pipermail/openembedded-core/
> 2018-May/150423.html
>
> Using github archives is even worse as they are regenerated from time to
> time. Also when you really want to use v${PV}.tar.gz archive, then
> use downloadfilename parameter to fetch it with some more meaningful
> filename and to prevent possible conflicts with other badly named tarballs.
>

http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html
has a bit more background to this problem fwiw.

Ross

--0000000000001cb36f056bae8c4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 7 May 2018 at 16:33, Martin Jansa <span dir=3D"ltr">&lt=
;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@g=
mail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr">There is already a fix for t=
his, see:<div><a href=3D"http://lists.openembedded.org/pipermail/openembedd=
ed-core/2018-May/150423.html" target=3D"_blank">http://lists.openembedded.o=
rg/<wbr>pipermail/openembedded-core/<wbr>2018-May/150423.html</a><br></div>=
<div><br></div><div>Using github archives is even worse as they are regener=
ated from time to time. Also when you really want to use v${PV}.tar.gz arch=
ive, then use=C2=A0downloadfilename parameter to fetch it with some more me=
aningful filename and to prevent possible conflicts with other badly named =
tarballs.</div></div></blockquote><div><br></div><div><a href=3D"http://lis=
ts.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html=
">http://lists.openembedded.org/pipermail/openembedded-devel/2017-September=
/114916.html</a> has a bit more background to this problem fwiw.<br></div><=
div><br></div><div>Ross</div></div></div></div>

--0000000000001cb36f056bae8c4c--
