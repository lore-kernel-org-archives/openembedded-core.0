Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3F64F719D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 12:53:38 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id f6so17803638qtd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 05:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CbSv78y0znehHKESRB/zOa87wQ96qsAlQ7B/Q2Bcz4g=;
	b=QOTIM1WUt8cZOW2wib1Oeddvf6AIiA73o/KfviVzITiY/nhv+1RWz4ZPOS3M55+QQQ
	0/+zmj0dzjxf1tg8QFHti2TVM4LMv0viesOM0eCV3dPPT4Ib/q52JdKMy/0Fynxq/maP
	aBa54T0tl0P1SA3uN0e6Mqn1IG3N7dJpnpmxgzKT38Dgc/01I600YDH/WyOoB0AbVEnV
	W5kPtxQDOcXuwJNPuGw0y+5mAs/Y/9P0fVklBRaeO5woKTmKW2pOlqL3ggRwi2ZkqXU/
	PhrP5ZnjgT1p6WuDvz74wPUQK0OD5N6xevPXXrqzH1JoYezltWEFSmbzloHNkWgkZFZ9
	zSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CbSv78y0znehHKESRB/zOa87wQ96qsAlQ7B/Q2Bcz4g=;
	b=R6R5hsL1Etu8+OG/6T7oZQyzVHaO1tL0F8IGbw+AglR3U2lsjyGa+6L8pMEYbyCbv6
	Da6/NBTzglN+7t/vgfx9+rkQTIhySPHqkZoJuday5vXa0kUBgSnVkAN0IkWG5XeJUbBR
	ocu/SuzvJUVCfaT3LaBMNhw9nnvybA6/rKxgfANMnhdZdphyZasopkfh30qfDuPdL1K5
	adbPiIVJiOg99AcfgkzNeVR/6UPZt0VOtBsi86rUwq1CAB8B14jQ89+u0D0AxMexQq+1
	KmmaZQHdVDyEwbg7/zr3M+vcI9HoL0EkbmI6LwfpEZ62y5J11Fhulllg6GogtLJDY5dr
	yIrQ==
X-Gm-Message-State: AA6/9Rmyjb8kveGQG3ie4TUm35Ovw9TGuOIUR2tomdrqIX6TWpOzPFw5AAgNp2enVl0IA4Bsr0GFH+ezxzWpgIcs
X-Received: by 10.200.40.91 with SMTP id 27mr5984053qtr.135.1476881620189;
	Wed, 19 Oct 2016 05:53:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Wed, 19 Oct 2016 05:53:19 -0700 (PDT)
In-Reply-To: <1570516.F2oa9eZtAN@peggleto-mobl.ger.corp.intel.com>
References: <cover.1476469708.git.jussi.kukkonen@intel.com>
	<0464acab-69a2-715d-5a3d-61e3961e8ccb@windriver.com>
	<1570516.F2oa9eZtAN@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Oct 2016 13:53:19 +0100
Message-ID: <CAJTo0LZ=q+030y70h7=sq9c-9_mOm5K6sNRcV7xhBO1PEYAhow@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Re-add piglit to sdk images
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
X-List-Received-Date: Wed, 19 Oct 2016 12:53:39 -0000
Content-Type: multipart/alternative; boundary=001a1141586858e60b053f374c7e

--001a1141586858e60b053f374c7e
Content-Type: text/plain; charset=UTF-8

On 18 October 2016 at 22:21, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> > > Q: Do I need to declare a runtime dependency that typically comes
> > > from busybox (tar)?
> >
> > Yes, because some people try to eliminate busybox from their image.
>
> How would one express such a dependency though, given that it could come
> from
> tar or busybox? "Virtual" runtime dependencies aren't allowed except
> through
> our somewhat awkward VIRTUAL-RUNTIME convention, but that probably isn't
> warranted here.
>

busybox could RRPOVIDE tar?

Ross

--001a1141586858e60b053f374c7e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 October 2016 at 22:21, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D=
"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linu=
x.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span c=
lass=3D"">&gt; &gt; Q: Do I need to declare a runtime dependency that typic=
ally comes<br>
&gt; &gt; from busybox (tar)?<br>
&gt;<br>
&gt; Yes, because some people try to eliminate busybox from their image.<br=
>
<br>
</span>How would one express such a dependency though, given that it could =
come from<br>
tar or busybox? &quot;Virtual&quot; runtime dependencies aren&#39;t allowed=
 except through<br>
our somewhat awkward VIRTUAL-RUNTIME convention, but that probably isn&#39;=
t<br>
warranted here.<br></blockquote></div><br>busybox could RRPOVIDE tar?</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--001a1141586858e60b053f374c7e--
