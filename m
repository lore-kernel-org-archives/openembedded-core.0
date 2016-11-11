Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id D7D846093B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 14:55:28 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id n21so21809532qka.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 06:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ayqVoCUJqaCxjYzsZmJcaH5j9Fdog/Gb02szRC+REJM=;
	b=SmAQNYNJe6Yab4C3CB92ff5Sodj9HtJWvr9gFXBPePxRxs62PVDnUJikDZSbu/kkLl
	D8C9t/wOtlPF+dRYA61VoPwf7lf5lFVbpJsXFsij4stBZp0eKGKu+kzOi16TPIXIZw6l
	xrMh2ubkJra5ceRqE3b/XzVe/2R9KLzKj+37BypipR602cSsZRLXfacLgShbfITBU+Py
	WBAyIO8APFbOl5XEnXO1cveF4XzfIXnCfHiLlij8mDxpVqLnc5x+/9+BV8joMVNHYUT6
	iDMATFyB81XZkKvJohqPYIq9o/ljwy5e2ipeUD1JSvCo1jtbwRmv7x/zH5rbO5NgrJ/J
	eWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ayqVoCUJqaCxjYzsZmJcaH5j9Fdog/Gb02szRC+REJM=;
	b=FeKHSlc5zK59T7HqrMsM48z8URl/hcU8XZKN4hr67BzHq83l8I5Oiz68rHdQ5W9SBO
	G+fiV6GDxTeybYvBj3BrofH4heCXQZBRfjgadilqQ8jeo9CIN95iOakOolRRP2KDnhi5
	TVJFQUeYjKK6JhnVY7X7NUh5PCk2Tpx0E9l0TcUlI54F4MynN5jtPfJfp+sfAUHv/pVR
	rvsTVwCBrG75QkWfZft//iknh1Mrnxq7b/5I4oSDbu//LLgLpFKX+F2FbOzZJWD/IW7E
	D2pR2/vqECKQlf5rcM8ScJSNGeRNNCfBdqrd4YRWCuj23msqVBw9C3QFCjCCYSaNUdYd
	n+/g==
X-Gm-Message-State: ABUngvdiBsQArfo5by0VqoxbA0+V4CaQYpzQdaDZ3jiaKVHos2TUHqQvt3x/dX0XvTsByHa88OUVoqHy7GtZSIp9
X-Received: by 10.55.207.78 with SMTP id e75mr4222446qkj.36.1478876129623;
	Fri, 11 Nov 2016 06:55:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Fri, 11 Nov 2016 06:55:09 -0800 (PST)
In-Reply-To: <20161111142525.20700-1-zeeshan.ali@pelagicore.com>
References: <20161111142525.20700-1-zeeshan.ali@pelagicore.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Nov 2016 14:55:09 +0000
Message-ID: <CAJTo0LaBdAd86OqS0dAEc90y_xJMuSzhGZ-8HEdZJdEN4oCC1w@mail.gmail.com>
To: Zeeshan Ali <zeeshanak@gnome.org>
Cc: Zeeshan Ali <zeeshan.ali@pelagicore.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [krogoth] nss: Disable warning on deprecated API usage
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
X-List-Received-Date: Fri, 11 Nov 2016 14:55:29 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b85fb902054107ae53

--001a1145b7b85fb902054107ae53
Content-Type: text/plain; charset=UTF-8

On 11 November 2016 at 14:25, Zeeshan Ali <zeeshanak@gnome.org> wrote:

> +Upstream-Status: Pending
>

Please use either Backport (upstream did the same change) or Inappropriate
(upstream did an invasive change, this is easier to audit for a stable
release).

Ross

--001a1145b7b85fb902054107ae53
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 November 2016 at 14:25, Zeeshan Ali <span dir=3D"ltr">&lt;<a href=3D"=
mailto:zeeshanak@gnome.org" target=3D"_blank">zeeshanak@gnome.org</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":747" class=3D"a3=
s aXjCH m15853db7bd6199f1">+Upstream-Status: Pending<br></div></blockquote>=
</div><br>Please use either Backport (upstream did the same change) or Inap=
propriate (upstream did an invasive change, this is easier to audit for a s=
table release).</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a1145b7b85fb902054107ae53--
