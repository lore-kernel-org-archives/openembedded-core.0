Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 246C265CA0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 14:43:14 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id j107so2451736qga.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 06:43:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pgryI2fCk5nMdXKnz/S8UJCc4PeWTU7dPrM1IIhxAig=;
	b=SG0eRsB1uo269Wwk90RCXJh24UVciX/Q2nXBmtebkYDS7pReSv3dNdGaewk6LBZSS7
	d5sPgbHuN90iUwOfkBKvpSjS3FQvgLBUz1S6KpqtVC5WHywgsdoMtbppOefQFPKe1h+F
	DT+obGwFU6W942KYO+4j5E4Gxw4m/o52hSJGSLNptW6SZMS/kxtImFf8Bj/Mt8bTDHd7
	u3j3s4U3+wAsTLmj0PHwekPmSazJlIUYV+Ajd5XHJzB4UYWh/+s+6cO+86qoXgKSa0Ft
	mclVqbSTWcCX+BAzxcl8M4WzoT7isi9kY9DsTbLrqCofK4OKWj4egvTS3XWSiVlmHJ1P
	x4YQ==
X-Gm-Message-State: ALoCoQnOmsIW0SatWZfC9tvddE3GfgYpiglWprMc7C9SnG7t3tO9AipAe1ya3qA9nHTd0c0hi9jf
X-Received: by 10.224.28.193 with SMTP id n1mr17741462qac.93.1415371393785;
	Fri, 07 Nov 2014 06:43:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 7 Nov 2014 06:42:53 -0800 (PST)
In-Reply-To: <20141107143813.GF2444@jama>
References: <cover.1415346812.git.hongxu.jia@windriver.com>
	<16384282a6c5f4878b1c377bbe38cfae1d311d0b.1415346812.git.hongxu.jia@windriver.com>
	<20141107143813.GF2444@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 14:42:53 +0000
Message-ID: <CAJTo0LacPP-ZNLR-ZtTVSJZKJWR91LkUUqKvkSMifYvKkRw-Qw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] avahi.inc: use avahi-daemon as avahi's provider
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
X-List-Received-Date: Fri, 07 Nov 2014 14:43:25 -0000
Content-Type: multipart/alternative; boundary=001a11c2ca3026f6fc050745d5b5

--001a11c2ca3026f6fc050745d5b5
Content-Type: text/plain; charset=UTF-8

On 7 November 2014 14:38, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Fri, Nov 07, 2014 at 03:57:01PM +0800, Hongxu Jia wrote:
> > The package avahi does not exist, so we use avahi-daemon as the provider.
> > It avoids the do_rootfs failure while IMAGE_INSTALL += "avahi"
>
> Why don't you fix your IMAGE_INSTALL instead?


Or propose the recipe is changed so that the daemon is in PN (which
rprovides avahi-daemon for compatibility).  Providing PN seems like the
worst solution.

Ross

--001a11c2ca3026f6fc050745d5b5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 November 2014 14:38, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Fri, =
Nov 07, 2014 at 03:57:01PM +0800, Hongxu Jia wrote:<br>
&gt; The package avahi does not exist, so we use avahi-daemon as the provid=
er.<br>
&gt; It avoids the do_rootfs failure while IMAGE_INSTALL +=3D &quot;avahi&q=
uot;<br>
<br>
</span>Why don&#39;t you fix your IMAGE_INSTALL instead?</blockquote></div>=
<br>Or propose the recipe is changed so that the daemon is in PN (which rpr=
ovides avahi-daemon for compatibility).=C2=A0 Providing PN seems like the w=
orst solution.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross</div></div>

--001a11c2ca3026f6fc050745d5b5--
