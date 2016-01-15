Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 039E6731C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 11:23:20 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id q21so483404461iod.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 03:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=IeRNtL0mTcqfYuhlFw6QPBzocHuPA96CLF4eC7aczlw=;
	b=14iFf6s9QYYqtWXDi76q9Sr4Lyuasrew3B5Ewek0HAbpq86fHa9/LWaH5RJnxOElaf
	i5N9YgdZ1CT5+ZZxxxO/NoP9JlLRCZAukn5rqFHQFsFLRxuOll5Ohzd0nyGm3dMggqEc
	NHHtWfh/maAuUD+Zwgf7Cm+cmzWQ/neat8q7qMO9lL564lvJ1rNlpQU7wQmvcZOtELSi
	rfF8Oa68F1bsrAiD+9ibI0CvDYkpBBTCiCCmq2wASZNWhyQc3K26MQ0r8aQqdcW5d094
	38TxKb4SzjcgDs9jsnDVxaxkhfTBJgFa3cu8udgFcJKoxH2N8U8bl8Kh/q+gcrZpfNNP
	eejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IeRNtL0mTcqfYuhlFw6QPBzocHuPA96CLF4eC7aczlw=;
	b=BLpupPaGlxdp6G4IqEAmnwhHQBiNIKd96PXgTUWzcmmOydV/XGAE6H0+FcEIlZfSHn
	qDHq52laCwzclOXFlKUGHOMGX3kYWyKBM2GkZFlm2YmpF06/P3C2Oa7YM1T3qnxDBtLV
	JV7ywjVxLZ5OSG8mQxKoLCHVf5332iwnd1B9ZY+SSn+b6BCO/HvTzxQdHtQGqTTvLeLP
	22jVKMfjznmxQW4gIItyZ5yytvD9/SBtpN1svR2NAlDa3oXq07fAc3cU87+N//SqaSxS
	5yRyFfQJv5p9XpfbZx8ce0l61F77LnPq7QypEC1d6Gay0giuPktdP3H3IjjG8eRkcJxn
	MT/w==
X-Gm-Message-State: ALoCoQmJ3HbGHIkV51cUER6VzAB8impKNgEIQ8xTt7vHre6UIXT/I8egUXwnwBkqBFzw8cYXc4QYiFrVRc7wJITIgQrQTI/xnMMZF91wlvkZ7w0sUv2+uvg=
X-Received: by 10.107.3.154 with SMTP id e26mr9206812ioi.99.1452857001040;
	Fri, 15 Jan 2016 03:23:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 15 Jan 2016 03:23:01 -0800 (PST)
In-Reply-To: <1452856537.28375.142.camel@linuxfoundation.org>
References: <cover.1452823464.git.liezhi.yang@windriver.com>
	<2f2bda63c8a7f435e76c5d4ea1c5c529847f7f65.1452823464.git.liezhi.yang@windriver.com>
	<1452856537.28375.142.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Jan 2016 11:23:01 +0000
Message-ID: <CAJTo0LY0KjioTDfG34hLkZQoCpOhkZrFwgnMJULQCKTHgD3Pew@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] e2fsprogs: 1.42.9 -> 1.43-WIP
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
X-List-Received-Date: Fri, 15 Jan 2016 11:23:22 -0000
Content-Type: multipart/alternative; boundary=001a113ec10a74f6fb05295da11e

--001a113ec10a74f6fb05295da11e
Content-Type: text/plain; charset=UTF-8

On 15 January 2016 at 11:15, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Can we just call this 1.42+1.43-git${SRCPV}?
>

I've a branch somewhere which added test cases for each package manager to
exercise the ~ codepaths in the package managers (where 1.42 < 1.43~git <
1.43) with "interesting" conclusions:

* dpkg works just fine
* opkg's version compare logic is reimplemented three times, differently,
and the tool for comparing versions from the shell is one of those
implementations, at best returns inverted results, and at worse is
non-deterministic.
* rpm has no way to compare versions from the shell

Something else to chip away at during this cycle I guess. Maybe in 2.2
we'll be able to confidently use ~ in versions!

Ross

--001a113ec10a74f6fb05295da11e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 January 2016 at 11:15, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":39j" class=3D"a3s" style=3D"overflow:hidden">Can we just =
call this 1.42+1.43-git${SRCPV}?<br></div></blockquote></div><br>I&#39;ve a=
 branch somewhere which added test cases for each package manager to exerci=
se the ~ codepaths in the package managers (where 1.42 &lt; 1.43~git &lt; 1=
.43) with &quot;interesting&quot; conclusions:</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">* dpkg works just fine</div><div c=
lass=3D"gmail_extra">* opkg&#39;s version compare logic is reimplemented th=
ree times, differently, and the tool for comparing versions from the shell =
is one of those implementations, at best returns inverted results, and at w=
orse is non-deterministic.</div><div class=3D"gmail_extra">* rpm has no way=
 to compare versions from the shell</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Something else to chip away at during this cy=
cle I guess. Maybe in 2.2 we&#39;ll be able to confidently use ~ in version=
s!</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div>

--001a113ec10a74f6fb05295da11e--
