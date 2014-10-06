Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3206965E0C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Oct 2014 20:15:41 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id h15so3098295igd.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Oct 2014 13:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=qWLAkm2+rqHyDz9/Px3bc0S8Ll6qt6IWXk9wSWwCYXA=;
	b=OG5EW51StMLLHHO6MkTAbaLmLmI0pilq0UDwH3m++YXFql1kp/uGd/kpzvun4vvGbY
	H6mmuPSeB8dURp+FFuLvRdXDH8CYY7xv9M+qNAn2EuZBtUCw0oqWx878nehWZhao21J/
	iu8UumRdF2d0PUbKWqKa4EUv3Il9sFrSBNDmsjPWS2vph67ALgh6ieBedCCDVf20H8s6
	UUR5rXoiiYwTmVSt2gDIF6eB1pTYXJ+adIBVe7y/W8jz4L17it5d0EAUUJKedfvvJAb1
	1aj4uezq/ahZnJI7qb5K4ZhrM40N7+gdFLOIZnSvTZza0vENObRD58P3URvORi6+pcnT
	FtoA==
MIME-Version: 1.0
X-Received: by 10.42.180.5 with SMTP id bs5mr6495232icb.70.1412626542276; Mon,
	06 Oct 2014 13:15:42 -0700 (PDT)
Received: by 10.50.179.5 with HTTP; Mon, 6 Oct 2014 13:15:42 -0700 (PDT)
In-Reply-To: <CAJTo0LaDLCMa7S83WPzcxJcim0BEcnq3X4EO6=AtzPB__nxjgw@mail.gmail.com>
References: <1412550979-15317-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LYakD7wSHpGMwEYnz_v2xoBv-hiD9zXmHLP72VrVT0oKg@mail.gmail.com>
	<CAMKF1spq=NefNnf4UB6jEurF2+0amt1x3PHT7dX2yOqgaKR=fg@mail.gmail.com>
	<CAJTo0LaDLCMa7S83WPzcxJcim0BEcnq3X4EO6=AtzPB__nxjgw@mail.gmail.com>
Date: Mon, 6 Oct 2014 13:15:42 -0700
Message-ID: <CAMKF1soFU6oqKy8HkyRFRtNKCCmsxF6B5Q2s2pr0-ZeWO3jRrg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH] gnome-desktop-testing: Fix build on uclibc
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
X-List-Received-Date: Mon, 06 Oct 2014 20:15:50 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e866a40b8400504c6bf44

--90e6ba6e866a40b8400504c6bf44
Content-Type: text/plain; charset=UTF-8

On Monday, October 6, 2014, Burton, Ross <ross.burton@intel.com> wrote:

> On 6 October 2014 15:30, Khem Raj <raj.khem@gmail.com <javascript:;>>
> wrote:
> > Yes. It should be in master too, I was not sure if same patch would be
> > needed on master when I sent this one when I sent this one
>
> Both master and daisy have the same release of gnome-desktop-testing,
> so please submit a patch to master that can then be backported to
> daisy.
>
> I dont understand. Doesn't Same patch apply to master


> Ross
>

--90e6ba6e866a40b8400504c6bf44
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, October 6, 2014, Burton, Ross &lt;<a href=3D"mailto:ross=
.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">On 6 October 2014 15:30, Khem Raj &lt;<a href=3D"javascript:=
;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;raj.khem@gmail.com&#39;)">raj.=
khem@gmail.com</a>&gt; wrote:<br>
&gt; Yes. It should be in master too, I was not sure if same patch would be=
<br>
&gt; needed on master when I sent this one when I sent this one<br>
<br>
Both master and daisy have the same release of gnome-desktop-testing,<br>
so please submit a patch to master that can then be backported to<br>
daisy.<br>
<br></blockquote><div>I dont understand. Doesn&#39;t Same patch apply to ma=
ster</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Ross<br>
</blockquote>

--90e6ba6e866a40b8400504c6bf44--
