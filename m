Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id D0BF878049
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 18:13:35 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id n69so4263552ioi.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 11:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oDRCpIbNFOTlpdN4EJ9scJrbl3f06BWHf8+bTpVMMfU=;
	b=LqABPJv8bXVXS8LY0u1rehf36Z/mPZsl8aPL2IWmVa/AwGFRHkSU2l73UM4riTT5hi
	7aJX+7h8tva1QlSJJdpXobjWRoJxsEzpBRlXTjKo/Do+WO3iK61l54WxRfr+z/XI8HEp
	fnb9pJguEhzoFQrG0Pcq+Kq02WDQMz9wU6pgq5qZ7EgR/cDyJ9bbfHKOrta/xchfYjac
	3chMIIbDuVwRxkAUnPEYm2EL++Hw92ky82x4FNjVtq1ScziGmAaBXRav5gjs4059vYz6
	2GvWQmPmEOtMajOp/+jurujITxRfK2xredGpp4H9Vt9t59s8UCMxMech8Hf/UbC0CoGs
	1fJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oDRCpIbNFOTlpdN4EJ9scJrbl3f06BWHf8+bTpVMMfU=;
	b=qWqM/wW2rFSi4quXCfLSDlkt7a+qhID8oCgsQy5DVpGwRV1GV8r2TDQmV06X+7aP+0
	314OMibVu5UQECCUED7Rdl6mSSsCVbgdgdFVkgxqK9f+9H8kJvekpKquVQEnXpZGcj/q
	xeo/ZmNni2WXT7pGFTnf8ioow6/6/GsBLNynnKWTTZ1UMF22TKLT2Q+7PdiI2rvz32em
	uRS7JQqh42m3pKZB8R5924eYuC1tY1xNPzTxuRmlzIdORgjolI+ShjGeAO72nJN0oqVj
	7krUZyjcYb3mmwafVkmB70WRqfTEpL8UnBouRoApedByu8bjVBjxIDsv3UaBQyqemp/U
	A/WA==
X-Gm-Message-State: AHPjjUjX4GVW+x8bcwCGnQVbbx6GF44bD3AyWhS0N+eXBYI8S2giBBGv
	XVoH0PlitUDjo9tVVIczPi32o6YByrQ5J5u85JQQEg==
X-Google-Smtp-Source: AOwi7QDOueeUYI3/K+S+Y2aMlA3TVKHp+fJBaYoZlQ3A+G1RBE6ontkMR0/QwWTRuVBItop86+92UT3+eLQco2+d0Ls=
X-Received: by 10.107.32.70 with SMTP id g67mr22258453iog.77.1505758416988;
	Mon, 18 Sep 2017 11:13:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Mon, 18 Sep 2017 11:13:16 -0700 (PDT)
In-Reply-To: <1504704099.26206.1.camel@gmail.com>
References: <20170629123022.4580-1-JPEWhacker@gmail.com>
	<20170704011818.724-1-JPEWhacker@gmail.com>
	<1500949398.19503.0.camel@gmail.com>
	<CAJTo0LZPFUEskGphbk8PnTK1aSOOCSt3JuCTxYGbkiQiKPnPuA@mail.gmail.com>
	<1504704099.26206.1.camel@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Sep 2017 19:13:16 +0100
Message-ID: <CAJTo0LbvtLZCMMy1qW_tZSmt8JroK_ornK0La_k-qOOQ0v5UVg@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] openssh: Fix key generation with systemd
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
X-List-Received-Date: Mon, 18 Sep 2017 18:13:35 -0000
Content-Type: multipart/alternative; boundary="001a1140ae2c900fdc05597ab313"

--001a1140ae2c900fdc05597ab313
Content-Type: text/plain; charset="UTF-8"

On 6 September 2017 at 14:21, Joshua Watt <jpewhacker@gmail.com> wrote:

> On Tue, 2017-08-01 at 12:07 +0100, Burton, Ross wrote:
> > Sorry didn't notice the v2.  In staging now.
>
> I noticed this hasn't been merged yet, is there something holding it
> up?


It was implicated in a number of the test cases failing.  I'll pull it back
in now and try again.

Ross

--001a1140ae2c900fdc05597ab313
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 6 September 2017 at 14:21, Joshua Watt <span dir=3D"ltr=
">&lt;<a href=3D"mailto:jpewhacker@gmail.com" target=3D"_blank">jpewhacker@=
gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Tue, 2017-=
08-01 at 12:07 +0100, Burton, Ross wrote:<br>
&gt; Sorry didn&#39;t notice the v2.=C2=A0 In staging now.<br>
<br>
</span>I noticed this hasn&#39;t been merged yet, is there something holdin=
g it<br>
up?</blockquote><div><br></div><div>It was implicated in a number of the te=
st cases failing.=C2=A0 I&#39;ll pull it back in now and try again.</div><d=
iv><br></div><div>Ross=C2=A0</div></div></div></div>

--001a1140ae2c900fdc05597ab313--
