Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 427C9605FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 20:44:17 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id y8so3750423igp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 12:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nB8anvs4WAT6s3lC5M+4zu99uJJIgjYoOpgTdrLzysU=;
	b=Sf1Kng/sY8QIKX9C432RMGEaoS62s500rXHXmvxc6bK7pqPnMMQwbUiwUqjAFM2U9E
	2Ev3Cy3vU+xqDg1Xyf+REVwgMM/lbn0NZOYyVJdPB8G6n4VzhnBNMZ2Vp7lY9/OZtgUa
	55iwuhC1JuMymQ/tVfVxhUSqqKEQSTpfQjSuc1/Clid0zmg3PbY2wEFR1hrBwrMyehZc
	xfqORyIrHJFMFgL9JSxUTLG432cwce25UgP+HkRsYqlSmvF6krQnce9IAoYAmaKvPgxS
	OdjCBec+pVf/XWDo03HM41kj05yaWhkuTL6lXuEf6DdJgEND2nev2KkgRr09wOKUcuVh
	Lp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nB8anvs4WAT6s3lC5M+4zu99uJJIgjYoOpgTdrLzysU=;
	b=I9BwTyYmg14SePVm6TY8Bf/uAz74wLeCZdWQB4cEak8OzHWztpnvuaS3GFKwMXmhpJ
	m/IWVrevQ3L1NgjA8/8AUad27xtUcVobjuYA8pjnl1yLnT/ymaqTbAKTqKFkua9ukVdr
	mFWAJ3915UYvSoFZNUYR4qtmiOUZC68Pqx338Rr3PSmS2pZEZWcdF8i0jaO7TDKrQkVj
	p75YJHbmVVHrswZAg8C62naUZbajI92hrgyz9CBazUGMYmLBYibdir+G/5feC8R//ejr
	a1mDn6tQPMqjeNDdSLP5282pvSKZurGiU6V6Ct1Ff0rJQn4ZWlFh92sTe3nb8OAnt1fE
	HKBQ==
X-Gm-Message-State: AD7BkJKyGBdfw8PxIKzzr7KT8jyBnw+Tqgk9eUKDFcFENybUKok4+rbJ513iz7Le/Dz2sNeK8lpcEEU8SyIDT75w
X-Received: by 10.50.160.7 with SMTP id xg7mr10946277igb.64.1456778658649;
	Mon, 29 Feb 2016 12:44:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 29 Feb 2016 12:43:59 -0800 (PST)
In-Reply-To: <1456778449.11498.183.camel@linuxfoundation.org>
References: <1456773039-5178-1-git-send-email-Martin.Jansa@gmail.com>
	<1456778449.11498.183.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Feb 2016 20:43:59 +0000
Message-ID: <CAJTo0LZ6RabE0C2o4wjuKQRbgikjc3f+CH8RF=j4RdVP2nu=7w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] no-static-libs.inc: add gdb
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
X-List-Received-Date: Mon, 29 Feb 2016 20:44:18 -0000
Content-Type: multipart/alternative; boundary=001a11339de8773922052ceeb603

--001a11339de8773922052ceeb603
Content-Type: text/plain; charset=UTF-8

On 29 February 2016 at 20:40, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I'm a bit puzzled as our autobuilders build this all the time and we
> don't see failures. Any idea what the configuration difference might
> be?
>

Since oe-core 94e1b917078bedf73830e54278af77f742c93581 gdb has a
packageconfig for system readline, which is enabled by default (and has
been enabled explicitly for a long time).  Do you have some local patches
adding more PACKAGECONFIG options but not enabling readline?

Ross

--001a11339de8773922052ceeb603
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 February 2016 at 20:40, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=
=3D":58s" class=3D"" style=3D"overflow:hidden">I&#39;m a bit puzzled as our=
 autobuilders build this all the time and we<br>
don&#39;t see failures. Any idea what the configuration difference might<br=
>
be?</div></blockquote><div><br></div><div>Since oe-core 94e1b917078bedf7383=
0e54278af77f742c93581 gdb has a packageconfig for system readline, which is=
 enabled by default (and has been enabled explicitly for a long time).=C2=
=A0 Do you have some local patches adding more PACKAGECONFIG options but no=
t enabling readline?</div><div><br></div><div>Ross=C2=A0</div></div></div><=
/div>

--001a11339de8773922052ceeb603--
