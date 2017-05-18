Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 29FBF77811
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 10:19:28 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id v27so30180427qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 03:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4JMIvtyNkPf2EaNbnybqypOLNHS+3ffvvJ1pWxWa/6w=;
	b=S6lPkVSGL4O2FcuZHV6An/AKzznnqLwUuYtnoWaHOq9+XVCCVP3wwnzCv3bDkRfOYH
	b7bFxeC/qj9IN+4BsXuapcQxdW7lBOWatjq+fO7M1vB8XA1dbdheQeEbekpNFO3cejZB
	s5SBa0UD7ZKq/QiGYDhxFIQG2IWJFQklbHWta/NALFApMjLpaZ/d0gY00HraC0595MWG
	sZwLopBZiqmwq2O8wWxOAk4b08J4XN3VpCTRjp8sU3sTtbqJNcx9FdcaKBOorJ8eOISW
	Re0Oa/q8w1bHe1tptYntnNGKFn1+5lLOcm3zZMKdAsHVYidnIxOHxPSOq1Cx/q4t/tfc
	GaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4JMIvtyNkPf2EaNbnybqypOLNHS+3ffvvJ1pWxWa/6w=;
	b=a2EpqngpL3H077sdj3KT4gpK78vNKrg8D+BFPWoAZt6CY7thkkaDOMg1xkxsLZJZGk
	doz73K77u3BVxqytqvWwyvmrKnr32FhCTscNeNqmtderIQjlD7f+j5Yvtez78iF0vm5b
	Ga5RopucNOOmRAZkZz+8J+9ckZculLVFO+XImUBbCL6Q92NFhAMzwywBWPOb2/nSQpZ0
	14yCgXvsJT674vl5fFfFsJC6s23ptxJnnD9IPSAz78Tr5+JTuTivSh/R8UUOVqHeUZ1W
	FHA8i/AL2PV9RMd3J565/94Wmdhk3jwRYmonAQEejWQZtIGWyvCi+MfpRGD32xZrXQQ0
	eoLQ==
X-Gm-Message-State: AODbwcBSlvKP2e8o9gOwBNQ1DjmhjOAc/oRI3BB5XN4IPXGDwcKbtYqI
	K9uEU5Lam9Gnaz1wye3653M+XKEZOMGO
X-Received: by 10.200.34.162 with SMTP id f31mr3222911qta.65.1495102769982;
	Thu, 18 May 2017 03:19:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Thu, 18 May 2017 03:19:09 -0700 (PDT)
In-Reply-To: <97F7C8E70D26E94FA7E05578493F65C60DFAF522@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1495098950-18824-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<CAJTo0LbAX6DHYZUNUH1bzJF3a7xaK0o5RPX4jXBzTXDhAvUZXg@mail.gmail.com>
	<97F7C8E70D26E94FA7E05578493F65C60DFAF522@G08CNEXMBPEKD03.g08.fujitsu.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 May 2017 11:19:09 +0100
Message-ID: <CAJTo0LbjrBN9oJa8UK5Ec_4Aw2xYNYFFBLgCY0-R8JEDU4dERQ@mail.gmail.com>
To: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] libnl: 3.2.29 -> 3.3.0
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
X-List-Received-Date: Thu, 18 May 2017 10:19:29 -0000
Content-Type: multipart/alternative; boundary="001a114027ec8204fe054fc9bd9e"

--001a114027ec8204fe054fc9bd9e
Content-Type: text/plain; charset="UTF-8"

On 18 May 2017 at 11:03, Huang, Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:

> I fixed this error by myself, so it don't have Upstream-Status.
>
>
Yes, you do.  Have you submitted it upstream? (then, Submitted).  Is it
appropriate upstream at all, or is it customisation (Inappropriate).  If
you wrote the patch, it needs to go upstream but you haven't yet, then
Pending.

Ideally we want Submitted/Backport/Inappropriate, but we've a worrying
number of Pending.  Please send it upstream.

Ross

--001a114027ec8204fe054fc9bd9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 May 2017 at 11:03, Huang, Qiyu <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:huangqy.fnst@cn.fujitsu.com" target=3D"_blank">huangqy.fnst@cn.fujitsu.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p class=3D"MsoNo=
rmal"><span lang=3D"EN-US">I fixed this error by myself, so it don&#39;t ha=
ve Upstream-Status.<u></u><u></u></span></p>
<p class=3D"MsoNormal"></p></blockquote></div><br>Yes, you do.=C2=A0 Have y=
ou submitted it upstream? (then, Submitted).=C2=A0 Is it appropriate upstre=
am at all, or is it customisation (Inappropriate).=C2=A0 If you wrote the p=
atch, it needs to go upstream but you haven&#39;t yet, then Pending.</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ideally we w=
ant Submitted/Backport/Inappropriate, but we&#39;ve a worrying number of Pe=
nding.=C2=A0 Please send it upstream.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a114027ec8204fe054fc9bd9e--
