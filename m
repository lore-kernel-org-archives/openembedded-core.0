Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5B19A6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 20:25:52 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id e3so24907896qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2016 13:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=WQ3tGg9iNS2I8uTDPib7p8R/9Sw/v5UjH2ctkUij97s=;
	b=rqpdZSJYY8C177BwEvia/LsWbI8xwWpJk8PMADX5TeouKXarPzlKcn+8cIoBk6+flq
	iY7GkHBYA7T2WbobkpISYvZNDcue5/V4rrk4LLXf6UT9yIU2kjl0HXSXJ+ZeVaW0ZnaJ
	OGuGSjYtENuy6h8i7jqYRSP+kxj8xDxmVVbKaJGbljCUkYgPjA4h0GVwnwN9uN6KZq1Z
	EE4RHoNcnCT2WqT+pAmcxb3G/IOMxAKpR3SGpvtre5AFGQ22/7cJcwITdZvfiSUA3Hk6
	3l42SkK+JYSWfkXtOnDhgcVOYm4/BGPAQVK4figcjTBb/4ndE5L5nbpjfSMuoivG04at
	dx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=WQ3tGg9iNS2I8uTDPib7p8R/9Sw/v5UjH2ctkUij97s=;
	b=UVmqDq229sfdoTlxQT0griX0ReTHyYbp646cil6GFRLjQj+mcG1g/HBjMegPiQ4Xw8
	l9DSdb0fWnIkU8ojd6lmt4KZ2+gUvCUTdHASnFb3bZ7Ti8FpzByr28PRYQwzIbLnUaP/
	ZKYSB0NlXKBgKORpxVx/mgj0ALF42mPOSJXwmZwX1DRmZs5mk5QnRGmm+0wh1h3Dud/3
	2Yy0TzAfVjDhP6lLcF4lrVvPyu8TghhfGLzcj87D1Sa5NmU+HXOGAvxEhvaWXiDCLNjy
	RwevocLsywL8o4X6xfzrDPf3Qyetb6trvaogSZZ39CgJ7/aU06YI/pK3jASkkYMHdNGA
	liwQ==
X-Gm-Message-State: ALyK8tLJhiMMG3sEA0krNiUmXk7/jpsH1oCkAb4re4fV7mB8iBW8rRrh3YQ9skQWk8a3DQ8rbqeq84A6sn/J/g==
MIME-Version: 1.0
X-Received: by 10.55.74.138 with SMTP id x132mr2843057qka.26.1467923152842;
	Thu, 07 Jul 2016 13:25:52 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Thu, 7 Jul 2016 13:25:52 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Thu, 7 Jul 2016 13:25:52 -0700 (PDT)
In-Reply-To: <20160707200510.GA4311@openSUSE-i7.site>
References: <20160702081927.7365-1-raj.khem@gmail.com>
	<20160707053905.GA28068@openSUSE-i7.site>
	<CAMKF1spS0OSZ=aWRP+ZJPkcBPn=SfMrgP=uA9SvR8CmNiXm4PQ@mail.gmail.com>
	<20160707200510.GA4311@openSUSE-i7.site>
Date: Thu, 7 Jul 2016 13:25:52 -0700
Message-ID: <CAMKF1soSd7zJt4PXa0oDzycHK5G6+r1xeh2AvCw3srgFZ-mSCA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] glibc: Upgrade to latest tip of master
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
X-List-Received-Date: Thu, 07 Jul 2016 20:25:53 -0000
Content-Type: multipart/alternative; boundary=001a114a82f81535060537117e81

--001a114a82f81535060537117e81
Content-Type: text/plain; charset=UTF-8

Ok thanks. Let me know if you get to see the same issue on say qemuarm or
qemuarm64

On Jul 7, 2016 1:04 PM, "Trevor Woerner" <twoerner@gmail.com> wrote:

> On Thu 2016-07-07 @ 09:27:30 AM, Khem Raj wrote:
> > Is it specific to x86-64
>
> Up to this point I've only been focused on x86-64, but now that I have
> things
> cleared up on that arch, I'll be working on aarch64 to see how that goes.
>
> My "solution" for the time-being is to simply pull in the glibc_2.23
> recipes
> into my build and set GLIBCVERSION to match. At some point I'll be trying
> to
> bisect the glibc commits themselves to see if I can find anything
> conclusive
> (but, as always, that'll take some time).
>

--001a114a82f81535060537117e81
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Ok thanks. Let me know if you get to see the same issue on s=
ay qemuarm or qemuarm64</p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Jul 7, 2016 1:=
04 PM, &quot;Trevor Woerner&quot; &lt;<a href=3D"mailto:twoerner@gmail.com"=
>twoerner@gmail.com</a>&gt; wrote:<br type=3D"attribution"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">On Thu 2016-07-07 @ 09:27:30 AM, Khem Raj wrote:<br>
&gt; Is it specific to x86-64<br>
<br>
Up to this point I&#39;ve only been focused on x86-64, but now that I have =
things<br>
cleared up on that arch, I&#39;ll be working on aarch64 to see how that goe=
s.<br>
<br>
My &quot;solution&quot; for the time-being is to simply pull in the glibc_2=
.23 recipes<br>
into my build and set GLIBCVERSION to match. At some point I&#39;ll be tryi=
ng to<br>
bisect the glibc commits themselves to see if I can find anything conclusiv=
e<br>
(but, as always, that&#39;ll take some time).<br>
</blockquote></div></div>

--001a114a82f81535060537117e81--
