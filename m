Return-Path: <ross.burton@intel.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5F50971D8C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 23:45:33 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id l19so55938299ywc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 15:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OaJkc8JIr0U/LQ6FP3cZizD4xssn72/8evlIgam/yTY=;
	b=wcKS9wSQ6YdKKYNEviuVtDXsbReKEbaRDtYTXSxdHqeEccSajzrBIGdm46G+7SqmfI
	GghLZOluuPNYhHmd9fR4WgAdalxVMEb2Ft2vss50Q9y7zXKr6A9msxumEMF97iFED0yg
	6X4Mh/g5i9c7RTfEuAn7EQhl9CmCWzkC+RhX9NTM3jPWAx7Uj1AeAM9sLYwC7eScUWxF
	xjMUtRp1clgWacsWyPgH3FvSzDs/V4ic6awH/VTo4nUxpRvLQqlF1HNDBGwagnzECnmN
	eyW5xEzb2Zj+KOXzz/Ai/xKeMZhoHCqBe3o/d7ZPKxs71QDf7FSmiH7RHVTXEW3FWNh0
	qejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OaJkc8JIr0U/LQ6FP3cZizD4xssn72/8evlIgam/yTY=;
	b=Geyhw5q950kDXbYjAADQqTUZIYhXu5vi337Q6IVVqfaZhfjtfpGf3hMP4xu9m/fHlu
	VfzdeN4SwV+7V7tm/gnoXP8avZEAK2iogmqoVXYGT+xZlW8FIGOiFKGGXTPrwXSRKMI5
	Nnadub+RaaHSz5je0K9bZSrMlPoJ0ulN39eQD7Uu5OZux7VgKawQz4u23ZU8EhLnEIan
	WCRGM1s0RN6sfHBb5D5MQ/2kOhedKEG7OCqljyg1BqeMEneXDx0oK8iH89FnUpnRZyD5
	gZUbMo9tNJRKfK+DBz8KPPeqlZZ3+s7vz7dP/29cmocsU1GHUrtiBbbxi+SqIxaGMGhe
	gRSA==
X-Gm-Message-State: AIkVDXKv2L8CdJKBCNfwkkRE/6eDPvOyRGjFwNWX+WTihHIsXVtu8z2D9tIGf34MOixymhDB4LUnzKwm2MNt8e/2
X-Received: by 10.200.53.247 with SMTP id l52mr10105814qtb.144.1484869534297; 
	Thu, 19 Jan 2017 15:45:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 19 Jan 2017 15:45:13 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1701191542230.6131@localhost.localdomain>
References: <alpine.LFD.2.20.1701191542230.6131@localhost.localdomain>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Jan 2017 23:45:13 +0000
Message-ID: <CAJTo0LZyLf=U99wpLC9ROCYVSm0rQwb3qX0E7J1MxGH+PqA6Kg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: still fighting to get an OE recipe for "libfilesys-smbclient-perl"
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
X-List-Received-Date: Thu, 19 Jan 2017 23:45:34 -0000
Content-Type: multipart/alternative; boundary=001a1142ba20214d4b05467b21e8

--001a1142ba20214d4b05467b21e8
Content-Type: text/plain; charset=UTF-8

On 19 January 2017 at 20:58, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   beyond this, i'm not sure how to use an OE patch to adjust this
> source the right way, given that dozens and dozens of other modules
> cross-compiled just fine.
>
>   thoughts? i am in now way a perl expert so i really have no idea
> where to go from here
>

Is this the module you asked about earlier that I had a quick look at?  I'd
say that basically it can't be cross-compiled easily - or with moderate
effort - because of various pieces of crazy in the way it builds.

My recommendation is to either find or become a Perl build system expert
and entirely rewrite the build to use something modern and sane, instead of
something archaic, hand-coded and crazy.

Ross

--001a1142ba20214d4b05467b21e8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 January 2017 at 20:58, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3f9" cla=
ss=3D"a3s aXjCH m159b886ddd73285c">=C2=A0 beyond this, i&#39;m not sure how=
 to use an OE patch to adjust this<br>
source the right way, given that dozens and dozens of other modules<br>
cross-compiled just fine.<br>
<br>
=C2=A0 thoughts? i am in now way a perl expert so i really have no idea<br>
where to go from here<br></div></blockquote><div><br></div><div>Is this the=
 module you asked about earlier that I had a quick look at?=C2=A0 I&#39;d s=
ay that basically it can&#39;t be cross-compiled easily - or with moderate =
effort - because of various pieces of crazy in the way it builds.</div><div=
><br></div><div>My recommendation is to either find or become a Perl build =
system expert and entirely rewrite the build to use something modern and sa=
ne, instead of something archaic, hand-coded and crazy.</div><div><br></div=
><div>Ross=C2=A0</div></div></div></div>

--001a1142ba20214d4b05467b21e8--
