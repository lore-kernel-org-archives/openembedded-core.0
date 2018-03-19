Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f52.google.com (mail-pl0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 59ADB77E92
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 15:29:18 +0000 (UTC)
Received: by mail-pl0-f52.google.com with SMTP id x4-v6so1482558pln.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 08:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QGEwZxEnnfOxiVn/5UilpLY145gL3/SMG8hYDLAc9RQ=;
	b=coISfFgzU7UPTH/SWnA2Jc2J2b7K7eGOwiPFrJe5OOKe/YY/zHVvGHKTNUZT2VzZtx
	05G5zkbfrLZG+gL0Lef9EWaupwsskntONvL1bUbZlyroU34mQXXxHDsFIY5OSA08cQLY
	cunI/TEqwwcUPjcbzYiU3Wj8b0yYqPKIHnQEMZ+uHB14fVcK+PsaJKoiXeZFmPGqjeCy
	f0kExQJL+nmNGJEDSR8wiokAuIuHeji0AEUjWYmG+Ci29yU3W+LSQRGyJQGzE6lqGlWS
	/F6cZEEnDSQ0160pnZ8YNJO6Vj6BJF2MlcfL3t96rKGE0IOGe9Wg1GVVNWtY8oRMd0fw
	8kAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QGEwZxEnnfOxiVn/5UilpLY145gL3/SMG8hYDLAc9RQ=;
	b=eU9GzMuOpJhQwacKLTOE9rxsRsGQJWjG7vHi3rXQBLknIdsRr/akBw2Il/IReVfxMS
	RQ4r59/wyyvCOUNfVbeauZEesfo978VCqjG6bxmm6ctJfovtaVHVMonj/s4MfzB+aE2a
	Vk7dLQDIuKxTkeq+z4iPUQSVc2rWA2JcVmdy5kUs3qGSO91WE4uUF56eDVaUyT5HEFlw
	qJuVABz2mE+mgxqx45LD/jhAK5TP/C2jrb2y/KAzatrA4k1nj/3NyXgveV3nYFv8ikOT
	FyyN1hvNp1anK/GAg89tGCzglQ+EpQLTr20zUSx+pTlRU6jE4CNEwVcHU7hHtM4iNfPQ
	8eAw==
X-Gm-Message-State: AElRT7FYDp74ZStX+e8lkF0tILCOmm9noBhfs3MVpT3Jv2pXRBaZECHv
	MvshDBuZqrbsjuuEOfaOkcO/dlyu+Ge2HkPaZmQ=
X-Google-Smtp-Source: AG47ELtPDRzjE/7N4n7ff251+12HVsGuf+05HPzZzYRnm3FL0pbMpZzKSRwbRv3dTqIxp7NJHSwHCbTx6K2MKSjVEX4=
X-Received: by 2002:a17:902:3283:: with SMTP id
	z3-v6mr12729548plb.118.1521473360071; 
	Mon, 19 Mar 2018 08:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20180317111539.42108-1-alexander.kanavin@linux.intel.com>
	<CAMKF1speHQU8vNbdiXSrbE2zy-keJX1e9evsEBiYcbPq5Jw3vg@mail.gmail.com>
	<64bf3224-8d92-a547-44ba-c7a2f4f0c8dd@linux.intel.com>
In-Reply-To: <64bf3224-8d92-a547-44ba-c7a2f4f0c8dd@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Mar 2018 15:29:09 +0000
Message-ID: <CAMKF1sryc1yJU=A3vwsrabiPk2dDhSdv34c1+ptiux_0XnkvrQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: fix upstream version check
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
X-List-Received-Date: Mon, 19 Mar 2018 15:29:19 -0000
Content-Type: multipart/alternative; boundary="0000000000002990520567c59f86"

--0000000000002990520567c59f86
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 19, 2018 at 1:53 AM Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 03/17/2018 05:16 PM, Khem Raj wrote:
> > On Sat, Mar 17, 2018 at 4:15 AM, Alexander Kanavin
> > <alexander.kanavin@linux.intel.com> wrote:
> >> Exclude x.y.90* pre-release versions in particular.
> >>
> >
> > Looks ok. So I guess it pokes at master branch right ?
>
> It lists all tags regardless of branch and picks the highest.


I think that does not work effectively for how glibc release works we
should probably track the Release branch name and deduce version from there

>
>
> Alex
>

--0000000000002990520567c59f86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Mon, Mar 19, 2018 =
at 1:53 AM Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@linux.=
intel.com">alexander.kanavin@linux.intel.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">On 03/17/2018 05:16 PM, Khem Raj wrote:<br>
&gt; On Sat, Mar 17, 2018 at 4:15 AM, Alexander Kanavin<br>
&gt; &lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_bl=
ank">alexander.kanavin@linux.intel.com</a>&gt; wrote:<br>
&gt;&gt; Exclude x.y.90* pre-release versions in particular.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Looks ok. So I guess it pokes at master branch right ?<br>
<br>
It lists all tags regardless of branch and picks the highest.</blockquote><=
div dir=3D"auto"><br></div><div dir=3D"auto">I think that does not work eff=
ectively for how glibc release works we should probably track the Release b=
ranch name and deduce version from there=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><br>
<br>
Alex<br>
</blockquote></div></div>

--0000000000002990520567c59f86--
