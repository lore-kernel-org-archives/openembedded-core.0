Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9596C605D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 11:00:00 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id i50so26265436qgf.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 03:00:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zKQ5h5iS0Ct5LYgi9aVtWzh1Ae24wPsbHNWGM3Uxils=;
	b=b20LzDLY/G7Y8ecSng9DvH+OTJsaWo9kN7AoRylWtK4Y61yZhS2Uy1kao7ph2fB2n1
	uJyBWk02OKmQTj/4S9rxNJxcdNlVmIryhztlfHvEN+4Rq33C7JOk8SRTB/AY51Ntq+T6
	OO18/1/BV4ryPhUAj0RzuD+Rs7NGGXfOVvqd6TzvpClsV9a2Wz7goXg0W505eVNav7dX
	ATIT0OuUq95kUKJp2SsXpqgpaLXnpAWwPAXwEqTUouSOzfVUQRpqerIwhV5gbzSWWu8V
	DNOS3S2VkdpH7w5NhcYJSeUt9exxdkkoCw4XWBaNW7VUE3mjHz8mritWsM1rJAHPr0Oj
	RT2A==
X-Gm-Message-State: ALoCoQmEsTY7moZo8Qccuynr1m3PsmXvFiX74kpn7r+UgYDnzSTCu9I2XvDM+WzIE4n7ZZcz7isW
X-Received: by 10.224.7.197 with SMTP id e5mr9269qae.64.1422529201330; Thu, 29
	Jan 2015 03:00:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 29 Jan 2015 02:59:41 -0800 (PST)
In-Reply-To: <1422507259-14758-1-git-send-email-raj.khem@gmail.com>
References: <1422507259-14758-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Jan 2015 10:59:41 +0000
Message-ID: <CAJTo0LYmsTWJjH4-n-n2EvP60pOSNABkMF0sXMCY_6UdBKJuXw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Backports fixes to 216
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
X-List-Received-Date: Thu, 29 Jan 2015 11:00:03 -0000
Content-Type: multipart/alternative; boundary=001a11c223f4ba7134050dc86330

--001a11c223f4ba7134050dc86330
Content-Type: text/plain; charset=UTF-8

On 29 January 2015 at 04:54, Khem Raj <raj.khem@gmail.com> wrote:

> Fix systemd-timesyncd assertion
>
> when networkd is disabled then we now do not
> create /run/systemd/netif/links but timesyncd needs it. So lets
> manually create this file when networkd is disabled so timesyncd
> can still function
>
> When enabling systemd-timesyncd we need systemd-timesync user
>
> Backport patches to enable timesyncd when resolved and networkd
> are disabled
>
> replace the resolv.conf symlinink patch with a proper backport
>

Awesome, but the patches need you to add your Signed-off-by tag.

Ross

--001a11c223f4ba7134050dc86330
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 January 2015 at 04:54, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ym" class=3D"a3s" sty=
le=3D"overflow:hidden">Fix systemd-timesyncd assertion<br>
<br>
when networkd is disabled then we now do not<br>
create /run/systemd/netif/links but timesyncd needs it. So lets<br>
manually create this file when networkd is disabled so timesyncd<br>
can still function<br>
<br>
When enabling systemd-timesyncd we need systemd-timesync user<br>
<br>
Backport patches to enable timesyncd when resolved and networkd<br>
are disabled<br>
<br>
replace the resolv.conf symlinink patch with a proper backport</div></block=
quote></div><br>Awesome, but the patches need you to add your Signed-off-by=
 tag.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Ross</div></div>

--001a11c223f4ba7134050dc86330--
