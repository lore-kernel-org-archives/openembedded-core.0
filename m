Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3DA6FEE0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 10:23:42 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id d205so54555256oia.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 03:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O8cSn9WCSnjvbGl1BzUcT9JPQ69pZ9aWjjvHUPENkHs=;
	b=zvLSbmZ0w2+6b2UhJ16RWJvpnCshdKIqmP8f4wC+ogbso54KvsRMRWpE+0BZ4r/la7
	PcM03rMwZA48asvkuKtC9jnG86jrSrBAsQIvJseldSX5x9ofPlyZm8LBuc13etWUxV8Y
	XrPDtXIemKEAAgg0JQXDiFNngOj6qw0zZkoIVL1cfhe39+njeXFWGcXwoOQ5uFjqMzbx
	rwIriRLBg51SzIneqWbOqnqp1TIMCT2FCF37+tL85cd3ndNotevi2AwGp/sIleg5/bte
	Xz1ejLCH8ja4fYILLpDbMIm93M0lktHJ3KoBECJzd+TgWyNSF5yk6ttmZkrt+UlQXHv0
	yt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O8cSn9WCSnjvbGl1BzUcT9JPQ69pZ9aWjjvHUPENkHs=;
	b=dfsIUYUc++kjsObw+3kgpBrS0JUEnaPQEdXSB2baKzWs2gQ7FYZBS6C7EeT2oKU7nx
	R/8YanpTm1EBWfjn93zB9+3YcpThlTYG0G2JFVjUqTp8FEe+iExDtIneT+hYby7sw4iS
	cNjFbQcH2ZNipbbbjblD82sphjTbEX+q9vATVjs83YEp8xYvPx41WDXy2vP/73iXBZfw
	D2uavkSYjqtSo8rB16TJTNrHss7rYlFHtybnL81B7lBqe31YHNM73dChXzCqYqHsoGy6
	5w7TKMSMCDrgJyUfy9HcvSRpUD4WUbindMrV5hx3ZnQ1xMok8sQ497IEF5Dm3rMz1tD+
	O2SA==
X-Gm-Message-State: AD7BkJI1Hhd4t9kVG0pn+iLYxH2tdaZjZRdrbWgYQsJwUTGKXoVXwJvjCZqQf4CMV1pl1kdOyovg2zWG1ID7GhyJ
X-Received: by 10.157.47.166 with SMTP id r35mr3627436otb.29.1458815023547;
	Thu, 24 Mar 2016 03:23:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.90.134 with HTTP; Thu, 24 Mar 2016 03:23:24 -0700 (PDT)
In-Reply-To: <56F3B739.3030108@mlbassoc.com>
References: <56F3B739.3030108@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Mar 2016 10:23:24 +0000
Message-ID: <CAJTo0LZWmp7iqE22miPiq2Sp+oNUYzGtU-YR=7ZGiA3QjDaRbg@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Change in udev
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
X-List-Received-Date: Thu, 24 Mar 2016 10:23:44 -0000
Content-Type: multipart/alternative; boundary=001a113dce08459e80052ec8d736

--001a113dce08459e80052ec8d736
Content-Type: text/plain; charset=UTF-8

On 24 March 2016 at 09:45, Gary Thomas <gary@mlbassoc.com> wrote:

> Is this [somehow] equivalent to the old udev device cache?
> Does it really belong in /etc/udev?  What about read-only roots?
>

An update to current master will help: the file is generated at build time
and in a separate package so if you don't need it you can not install it.

Ross

--001a113dce08459e80052ec8d736
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 March 2016 at 09:45, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":fw3" class=3D"a3s" styl=
e=3D"overflow:hidden">Is this [somehow] equivalent to the old udev device c=
ache?<br>
Does it really belong in /etc/udev?=C2=A0 What about read-only roots?<br></=
div></blockquote></div><br>An update to current master will help: the file =
is generated at build time and in a separate package so if you don&#39;t ne=
ed it you can not install it.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--001a113dce08459e80052ec8d736--
