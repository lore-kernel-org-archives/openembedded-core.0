Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id A73A46010D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 11:20:09 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id y76so113520966qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 03:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4VxUhm4CdmFNfC6PVHVoFALpLHkd5FQu9h/DucqIQTw=;
	b=wxDo5jA9FF2TL46KHVJIcFWlNQx1EwfQxuvXPLfB7OgTTeKiQm5g2Zy17VDtvkUUN4
	4eLaWl5BqhgPVK5GBgpfU8O11jAxOzH+Z/96OM/kddwuLn62g0bCxDiZPPZJ35+a75b5
	ceLQhWXCk0W2RPt0kWJUvUEygkFJS2PZWZ/DSOumljNyS+YUrB2yfzxe2R52geEkFj7D
	/lOgSK4gD7W2GH310x4GUrULblM5v1/tqR+QN5Ud1CA03xZoaN0eAp07cHFxztQxGSv9
	q2+Afl2NgDnGgMrbev5GS1NjgzWEJjocK/kq72pyhMVipc3NbbBf6DIboRKLseTbc3JY
	dAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4VxUhm4CdmFNfC6PVHVoFALpLHkd5FQu9h/DucqIQTw=;
	b=mBnhLpQAm+EcpYlFg84o4Ytkn/TxoGbht99tkKs/g+aVpPwGDRVGazoX4Nq+NpUUrf
	cPwkfyNnrJ5tWsyt+8gk+bxzn50feoZpIyAJsJ/hYqEuifSpdlraFdVEKgS+5VsLVPNN
	xh5BmJFRDlkvfntNUpxeLw1sj58rBsaZbwqx6OLISSb43nBbXqbFsxys8uF8gAEyqT0C
	Qh2lMYqgt+oNKX2THayQTaXoGYq5xvam1K5ye/mXbIe1rJA8QkwJGjbLlTfio9Uw2TzN
	8OL5aI6PtaQIzaF0W5BfcCNh9znK5iZ7yJ1EoDmRXZuKQN/3nq93IvU+t39XaUXro4d6
	nhTQ==
X-Gm-Message-State: AFeK/H0hVVKgjR/421Wzlus3VfwNvMR6KrCnBYLjBnU/PVkcOtmLloct6sqfhtRRz2Na1rPbCH8ZHINMjyTBoiUs
X-Received: by 10.55.192.145 with SMTP id v17mr13957420qkv.3.1489058410531;
	Thu, 09 Mar 2017 03:20:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 9 Mar 2017 03:19:49 -0800 (PST)
In-Reply-To: <81d930ff-2eff-16dd-126b-864f4dbfc1c9@mlbassoc.com>
References: <20170308064023.27986-1-raj.khem@gmail.com>
	<81d930ff-2eff-16dd-126b-864f4dbfc1c9@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Mar 2017 11:19:49 +0000
Message-ID: <CAJTo0LbR1skkK-3j5V3RSt4UfxWxsYsL90j+YrFHCsz0BOQJGg@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>, Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V9] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Thu, 09 Mar 2017 11:20:10 -0000
Content-Type: multipart/alternative; boundary=001a1149a1c29c54bd054a4a6db9

--001a1149a1c29c54bd054a4a6db9
Content-Type: text/plain; charset=UTF-8

On 9 March 2017 at 07:52, Gary Thomas <gary@mlbassoc.com> wrote:

> However, there don't seem to be any packages for the target created
> by the 'go' recipe:
>

That's pretty bad.  Khem, can you also test nativesdk-go?

Ross

--001a1149a1c29c54bd054a4a6db9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 March 2017 at 07:52, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"mail=
to:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":19y" class=3D"a3s aXjCH =
m15ab20edb3fd6fe3">However, there don&#39;t seem to be any packages for the=
 target created<br>
by the &#39;go&#39; recipe:<br></div></blockquote></div><br>That&#39;s pret=
ty bad.=C2=A0 Khem, can you also test nativesdk-go?</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1149a1c29c54bd054a4a6db9--
