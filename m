Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id D4BA376806
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 13:29:50 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id b62so18673458iod.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 06:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p+2l5JQezHhUgSUS9WOZ5fV48dGyEoHWqfnnbZKhAYc=;
	b=hldtz6LOj7TWdY5qamE8BHgt+6KppZS4ypFyZQrJaolh1fJjFeWaTyji4cuR/ZNiGf
	rufImCyeb69mCGnIXHtGzTf+o7/7ncrQtK8zg9e47Frdhu7Pj/7ORhasXtNdogdV/doN
	aParB1t981cWHUaVer76JKnUGKJioivzGRmxohqDVLZy6C6SNDL5pQtRvxi7tPU5o20l
	AC4HmWuEnpq3JzBC54MvOD7mTy4mNTSSWpU+As0pB97VIKwIya6y9x26o6h0YmT40sGP
	3i9hkmNo2SF/m602XuzweRhZBUVO1W6F+YFGQvnQltoz3n+YY2CMvw5/FEu4NKd7CoBI
	+ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p+2l5JQezHhUgSUS9WOZ5fV48dGyEoHWqfnnbZKhAYc=;
	b=ic87KA8EnJuTgpGlHO3+q0EPXgsEEdf5NlQ6ZT2QI11B7xyuwVMDx7xVFtsJBlyVwX
	cfU0F0wiGDXpBGmFtYWYqIuXN/kEw3u+UHX74Eh+YNnzzwUiI++E6F/zZXcNOAgyignN
	1hOPyl23krFw23QG5GPRcRBeAPeJF1R18hTaeabWN3J5WQv2xTiPyF7k0HMevlTn001N
	W80Oq08xTj6/6gqA3GO8jDg8Z5fGhzNLmT1S7WKFoELxU5Ff+zGUFiwSP1Si/weBw+Tx
	14R6C60WOx8udF8QikkuHG+eHOLIkb1rTdPgZW4ezswB/y8EsBz+05XLXIwpD5O92tzs
	ROBQ==
X-Gm-Message-State: AEkoousOAsjpuXPhNsoo9P8aOEXLVItZ/JGDuE8lMqeVlxmIlaPdojDtAnVTrZs+u7VOM6Gh3kScQiXRE4IXjr5a
X-Received: by 10.107.138.212 with SMTP id c81mr3052206ioj.148.1471526990822; 
	Thu, 18 Aug 2016 06:29:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 18 Aug 2016 06:29:30 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1608180914320.18547@ca624034.mitel.com>
References: <alpine.LFD.2.20.1608170956050.12816@ca624034.mitel.com>
	<CAJTo0LbY7x-e_iGa3qNOAKMwB+wudoDkORQgB3t-6WB4pVhNHg@mail.gmail.com>
	<alpine.LFD.2.20.1608180914320.18547@ca624034.mitel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Aug 2016 14:29:30 +0100
Message-ID: <CAJTo0LbvpByGXhbBcH_nQHE0Dc7HOZ2Eq==HOe6y5EWB5Lr2Dw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what means IMAGE_ROOTFS_EXTRA_SPACE_append += "+ 3000000"?
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
X-List-Received-Date: Thu, 18 Aug 2016 13:29:51 -0000
Content-Type: multipart/alternative; boundary=001a113ed93290f865053a5893bc

--001a113ed93290f865053a5893bc
Content-Type: text/plain; charset=UTF-8

On 18 August 2016 at 14:15, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   i think you misunderstood, i was curious about the "+" *inside" the
> string, but it's pretty clear that it's just adding to the current
> value of that variable somewhere
>

I meant the content of the variable, but I now noticed the append so I'm
wrong.

Yes, this value is passed through eval(), so it's adding an extra 3MB to
the extra space.

Ross

--001a113ed93290f865053a5893bc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 August 2016 at 14:15, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":538" cla=
ss=3D"a3s aXjCH m1569dcb6550a0899">=C2=A0 i think you misunderstood, i was =
curious about the &quot;+&quot; *inside&quot; the<br>
string, but it&#39;s pretty clear that it&#39;s just adding to the current<=
br>
value of that variable somewhere<br></div></blockquote><div><br></div><div>=
I meant the content of the variable, but I now noticed the append so I&#39;=
m wrong.</div><div><br></div><div>Yes, this value is passed through eval(),=
 so it&#39;s adding an extra 3MB to the extra space.</div><div><br></div><d=
iv>Ross</div></div></div></div>

--001a113ed93290f865053a5893bc--
