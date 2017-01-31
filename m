Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 44DFC71DAD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 20:03:01 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id w20so175597837qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 12:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LLghDo5HMyVy/k/DnVrUeRzLOZkXIXcmpkLqxtp258A=;
	b=vL9Whb9g1f18/38XoUIEqg8Oefd98W8f/6pj7cpCNm2aBK1zTzpcO2ZCw4UprDvMrY
	kgcF3Oo8tYnQrHoCWdM+CqG7/JdaTNXRNhI2L+ectJf/F0GgboPIZ6xza1tIT6HhVybX
	Pu0Lap6Rhfusbr1d101KDgK84PW6SOfC4t74KTDki8PuCs+F7OK9YN2GyQv3ooUEVxPg
	7Ow53XxqLKci3GBiQ0KMCOlZYmL5Lh5YnyPUdCmD9vgS8ofEzrGttBXccFZeSQnZAyzR
	x0GyjTQFn9dS0ElGyq3RHJMbwd6rYCEmIguNP4tKqeEnuLjzfva3Nn8UwYIslDJxf4kY
	yeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LLghDo5HMyVy/k/DnVrUeRzLOZkXIXcmpkLqxtp258A=;
	b=Tybtd+j8wgN0VNQsPd4TLXK6yy5Ht65eKsjAeVj3oaXqwDTSOS0Ra7VYrLsLTR1wlb
	rb4G0PN9spA8cayWDMRJ7Cce4/opxd2nbkbWAXMrXc+CdE+1kO1VoqgWGv5ZKXXcFwOE
	XQxFNaOChuzpEfY7IGMFIH2ERfSudW5DjkyFpxXhUlcLYZ9fNHu6FfNH473uhY4yWsjS
	jSYAs3GLzAUSfFjGW5PtBHuhLoJB03f25PWoziRORGzaqv+P6Xlj3EaeO3ESXb4rwuK6
	ilkVp9MEqebDmlMNBk0xW8oyqK0h9dReZU/6ZYyIWwPstfXke5jLwAH0idsV2LHJvLLK
	1m4g==
X-Gm-Message-State: AIkVDXK6mKtzvK7FZ5wjLO78kIR/LXkAmxc5Of7e1JyBaKJpyF8ufHoiK8mXl1dW8Runc2tBSvctKHLRjvzIi0QJ
X-Received: by 10.237.36.208 with SMTP id u16mr28508167qtc.105.1485892982139; 
	Tue, 31 Jan 2017 12:03:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 31 Jan 2017 12:02:41 -0800 (PST)
In-Reply-To: <20170131150524.GA11350@mbabyjoh-desk.ger.corp.intel.com>
References: <1485777358-32699-1-git-send-email-maxin.john@intel.com>
	<b054aebd-10df-6cb5-841d-b06df81e9fb6@gmail.com>
	<20170131150524.GA11350@mbabyjoh-desk.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Jan 2017 20:02:41 +0000
Message-ID: <CAJTo0LYkeZOZ0A4ZfY1tNmmc+gXR7MvhpSNtXcr5fTAuFZ4_mQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libtasn1: Upgrade 4.9 -> 4.10
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
X-List-Received-Date: Tue, 31 Jan 2017 20:03:03 -0000
Content-Type: multipart/alternative; boundary=001a114104ce600d1a0547696b08

--001a114104ce600d1a0547696b08
Content-Type: text/plain; charset=UTF-8

On 31 January 2017 at 15:05, Maxin B. John <maxin.john@intel.com> wrote:

> Somehow we have an old wint_t.m4 provided by gettext-0.18.2 in the
> aclocal search path.
> Looking into that now.
>

I've a branch (ross/autoargh) that changes how we autoreconf and might
solve this, but it would depend on packages correctly versioning the macros
so aclocal knows what one of the many copies it finds is newest.

Ross

--001a114104ce600d1a0547696b08
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 January 2017 at 15:05, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D=
"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5bn" class=3D=
"a3s aXjCH m159f50fb36a8f30f">Somehow we have an old wint_t.m4 provided by =
gettext-0.18.2 in the=C2=A0 aclocal search path.<br>
Looking into that now.<br></div></blockquote></div><br>I&#39;ve a branch (r=
oss/autoargh) that changes how we autoreconf and might solve this, but it w=
ould depend on packages correctly versioning the macros so aclocal knows wh=
at one of the many copies it finds is newest.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114104ce600d1a0547696b08--
