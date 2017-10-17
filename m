Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9DCA4782DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 16:26:13 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id f187so3231011itb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 09:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8910xobRfLsCkGhvJ20kz5z8TsttXv9wG0ZriJvi6nE=;
	b=okHnnGOFGYbQD45jwWOVqZ4xFpZ3X0qXbGyJhmT552VlKnXwHlENkUJhCuZfO3f2HH
	0VYGoaonxb+yA9Cu4Ab10T+2jzruoDexLFyqyWBu1/GO6Fb5cIKs6ZTMW6iut6990i23
	y4KQDGe58b/WN7Ije51ZDXcGzfLZwZMuhWMEvxtJcmyQIkAxiafeUa+ADWyl4HV1W+Vk
	UB7mRNITyC6v6cXChnDoW5dsxEED/nsQDKxE29eTVAgT4YVNjHpiLRkxdTSYRU5ZNcVa
	SmoRWf0QuUQb7kqsra64Q6k5G7T0ar/7qwK+JvldT2zaLPt/K/noV860kknaiXOsCbu5
	2mAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8910xobRfLsCkGhvJ20kz5z8TsttXv9wG0ZriJvi6nE=;
	b=G9gt4DSjrp6hcoWg9/DDK/1GNXTM6PDoZwfXsgZ8J8G197ZZoIQ/crBprA51QozbMO
	ZHEwW5I9Sr4tpfD0bXikpEddD5fdE/Bn1ql4U2yjd99wvZKF+/lhGYqKMbUmntBkftdE
	h7P3diiYI+m2Rop5sck/nEGwpVHdxJ9PeVXFZovaPKih7yg7uTBnjn+0UI+VAxe8n3ul
	L29t/D7joMXi7+dfei/KWswwRlWotTatF1ZCsP/oEhn/hQJo02zDQAl0RxXPvICaUFzH
	JCyrOqYzEA3COWZnscslqecpH1hTmAwRZEh6usTEJ99nL8khPNVHDppd9+/KBLcLG09E
	0zGQ==
X-Gm-Message-State: AMCzsaX7WffJwvU5+yDdyPFR23otvjZ1sTt557CCsUOaPlH7thmI0d7i
	/v3GZWdvmaQ17P2pFGD7Xo05e9FAJADO9OtC1IeMzQ==
X-Google-Smtp-Source: ABhQp+Rxg3nOKz7qqp9xUrv8vbzlq9Ej/fUH20OTUu6DmnAVemu4uOVf/FFPTeIh/FQVCJVN/zqBro5JcV9mRIbK+O0=
X-Received: by 10.36.116.5 with SMTP id o5mr6447366itc.132.1508257574862; Tue,
	17 Oct 2017 09:26:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Tue, 17 Oct 2017 09:25:54 -0700 (PDT)
In-Reply-To: <CAMKF1sov3p8viw9h1SjNF9Hyz0X5LuMqbJ4JnyFw-7HHxnKTLA@mail.gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
	<20171014154858.35123-4-raj.khem@gmail.com>
	<CAJTo0LZC2At7Jnni1eLBTXyAdWsNVf-ynAVX8thc1EOujnsRuA@mail.gmail.com>
	<CAMKF1sov3p8viw9h1SjNF9Hyz0X5LuMqbJ4JnyFw-7HHxnKTLA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Oct 2017 17:25:54 +0100
Message-ID: <CAJTo0Lb81WDPU5mFKi+5SJkuqXDgxFEwnD2LLCMk+T24_M7nWg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] libevdev: Add dependency on libcheck
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
X-List-Received-Date: Tue, 17 Oct 2017 16:26:13 -0000
Content-Type: multipart/alternative; boundary="001a114a9e5efafce4055bc09463"

--001a114a9e5efafce4055bc09463
Content-Type: text/plain; charset="UTF-8"

On 17 October 2017 at 17:24, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Oct 17, 2017 at 5:41 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > Curious how you hit this with master.  For me:
> >
> > checking for check >= 0.9.9... no
> > configure: WARNING: check not found - skipping building unit tests
> >
> > The configure script uses pkg-config so shouldn't be picking up host
> > binaries.  Can you dig a little?
>
> do you have ptests on


Yes but libevdev doesn't have any.

Ross

--001a114a9e5efafce4055bc09463
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 17 October 2017 at 17:24, Khem Raj <span dir=3D"ltr">&l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><span class=3D"">On Tue, Oct 17, 2017 =
at 5:41 AM, Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.=
burton@intel.com</a>&gt; wrote:<br>
&gt; Curious how you hit this with master.=C2=A0 For me:<br>
&gt;<br>
&gt; checking for check &gt;=3D 0.9.9... no<br>
&gt; configure: WARNING: check not found - skipping building unit tests<br>
&gt;<br>
&gt; The configure script uses pkg-config so shouldn&#39;t be picking up ho=
st<br>
&gt; binaries.=C2=A0 Can you dig a little?<br><br>
</span>do you have ptests on</blockquote><div><br></div><div>Yes but libevd=
ev doesn&#39;t have any.</div><div><br></div><div>Ross</div></div></div></d=
iv>

--001a114a9e5efafce4055bc09463--
