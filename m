Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 069DC7E8B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 19:50:30 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id i7so4244534vsp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 12:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WLt33nErXCtVn/DhKwxPa20GCz7ZJjTs3WMA/khvmwg=;
	b=IlP5ftgBEux8TAcgmX7TrLpFovTJWDgZ+RQSMlILIAVJea7S/kUYgLAPbVpbbggV7h
	WYJE1GsKaUeM/kGj63Hc7nuAL/ubmvUShwYT0imdZaaEUieKyqc6QbJGbn3IuTSyjVb7
	62aABLWnjMJkhjXQXUwf4no1NkNiY19lEIXRhJ0vCDrCP7/R2ZHVK59Wnes5xV/agssk
	BxLxPksQyo0h8/7mAcpVnvnjvE70dRfuQ0CQSvzWViuXs+LXw7aljqovgsZTy4Jfx42v
	YNAsoFTxESBlqqx0CmsNFXJaUkF9K20vciX7p2hfn2h7iMkDhqVZ/vKzWEMRGhq68kO9
	knsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WLt33nErXCtVn/DhKwxPa20GCz7ZJjTs3WMA/khvmwg=;
	b=CUcHdpnwIbbu7Hu7D+ZzcS+c+RLrY/mAY0HTPBRWI63m94N4wLbEmVh9N2HE4Z7M4F
	4pm0F9iDcAE+zfxtXEnxqF6ktFvSwFc8A2dP1lWqfMGhNhk+0LV6sF70tv+SgmUt1LW8
	4WvjIQlk0xucdJSlVM6bf3VQ4qkaUvvrPXpwHG8AEO0OclTw5vVRjD1ExQgMxCrncNiw
	4Lota/s9L6+TQfoLFrj0H8wGe+oOajl/sV1muc90+KYJl2H7hyvn5pDXFqsNKfeu5KYw
	nQZVQoYQn5Yrc2Ue1qVAb34qMIpXHSnbIv0kDoXXpHdZrb/ZfRkmZgtTdro/FxBVYLmA
	kCSg==
X-Gm-Message-State: APjAAAXdNk6fktQPwLt8OUK6na8rLVzWoEVaaSGe7uZrRSCe/CzTd+32
	hRtHiUNVk0EWya6dtZPNQc68TEtzE5TvxTn2Yqg=
X-Google-Smtp-Source: APXvYqyA1V5KPUJswXuEsDo4QwdqoeeQM7VgSRlzFmcvK5uZ0ltLqYJL6HLgdE42RjWj7feFAzpDViEI4c/O8gWxj20=
X-Received: by 2002:a67:62c5:: with SMTP id w188mr6357544vsb.25.1565639431940; 
	Mon, 12 Aug 2019 12:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190807102939.12760-1-alex.kanavin@gmail.com>
	<94b692a828bbf5230f56afbc401bf9d66660283b.camel@linuxfoundation.org>
	<CANNYZj-t2TSN4dMpfEgU_k_dDqHRLeqNSYWi-=uUK2BH09-tMA@mail.gmail.com>
	<CAMKF1squwmc8-sm+JMM6gU5oyHSKHv7ejRoOokTdb4Nd-SEk2A@mail.gmail.com>
	<CAMKF1soSXrDEHu+0v7v052EpCfXwu=+_ysWiwDcd=HY7oaBU8Q@mail.gmail.com>
	<CANNYZj81jgzZP0VNSbpA6RVh=JDc7748XszNEOJ9Dz+qf+8hmQ@mail.gmail.com>
	<CAMKF1sqRZGqR7pquRdqjfqs0=PAKB_5C2W6p_uwM9uTHZeD2GQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqRZGqR7pquRdqjfqs0=PAKB_5C2W6p_uwM9uTHZeD2GQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 Aug 2019 21:50:20 +0200
Message-ID: <CANNYZj9GsfTokbQG0LW4pBiY6tPQ1Dhv8oiED3VZoyNQuzaLJw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively
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
X-List-Received-Date: Mon, 12 Aug 2019 19:50:31 -0000
Content-Type: multipart/alternative; boundary="0000000000002fedcb058ff0d691"

--0000000000002fedcb058ff0d691
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Aug 2019 at 21:01, Khem Raj <raj.khem@gmail.com> wrote:

>
> Richard, another issue I saw was slowness in world builds when I had
> this enabled
> I was on master-next for both core and bitbake. It was spending a lot
> of time in ensuring
> the build is not needed so much that the build took almost same time
> than the build with
> out it where the build without it will build everything.
>

world builds seem to have regressed (preparation time wise) even without
having hash equivalency. Just oe-core is bearable, but adding meta-oe
layers makes it spent many minutes after initializing tasks but before any
tasks actually begin.

Alex

--0000000000002fedcb058ff0d691
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 12 Aug 2019 at 21:01, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
Richard, another issue I saw was slowness in world builds when I had<br>
this enabled<br>
I was on master-next for both core and bitbake. It was spending a lot<br>
of time in ensuring<br>
the build is not needed so much that the build took almost same time<br>
than the build with<br>
out it where the build without it will build everything.<br></blockquote><d=
iv><br></div><div>world builds seem to have regressed (preparation time wis=
e) even without having hash equivalency. Just oe-core is bearable, but addi=
ng meta-oe layers makes it spent many minutes after initializing tasks but =
before any tasks actually begin.</div><div><br></div><div>Alex<br></div></d=
iv></div>

--0000000000002fedcb058ff0d691--
