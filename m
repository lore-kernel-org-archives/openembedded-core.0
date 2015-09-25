Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id D79587680E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 16:32:07 +0000 (UTC)
Received: by qgt47 with SMTP id 47so73516680qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 09:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qTpqHY7lcXRNq+uvE/jK90z9nZxaTJ9GplIi5mcu7Os=;
	b=DAqqegdR85w1CEZQZnqNhfvjMsUbSW5xmKtt0UdrQ9cUxzPUz0LZyn6GO7J4yuvXxB
	bVms9xwN70IUknD3lSyVop8mYlcMJbNwMkjZqJw+Y/QhV13LNreNMtSkYyc8aWhEfca9
	uqpJOYoUPzEvMWdy/DzlgptAUnr/WIEvQZ5IKBwE/tLwHyHB9pDY9Cz05IVWanZdDkPR
	fD6oUj+ndqjzU8jQxeeW59X4fu7CPVSUzZvb58V9RULwoaC/0uuRdgQDXfW6A4tHQaZ7
	OgZkpXyX9U+P0mPxSxdD4/mxYOkavxkaRtulPQdxvwEc+G8tG3SuQganS6Nil8AwTqjq
	4HAA==
X-Gm-Message-State: ALoCoQk8UrZlMAk5NXnzl6enJsRi8cElLHL3AmTxArOUfkMZ/nY4DiDVzmI0cOtuiIP/i0JfTcsb
X-Received: by 10.140.109.74 with SMTP id k68mr7429703qgf.77.1443198727452;
	Fri, 25 Sep 2015 09:32:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 25 Sep 2015 09:31:48 -0700 (PDT)
In-Reply-To: <CABcZANkSSCbS9S6WyUAVeJd5Kn95=AR8jDYXL2UFmnDXCLFVEw@mail.gmail.com>
References: <1443198035-30551-1-git-send-email-ross.burton@intel.com>
	<CABcZANkSSCbS9S6WyUAVeJd5Kn95=AR8jDYXL2UFmnDXCLFVEw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Sep 2015 17:31:48 +0100
Message-ID: <CAJTo0LavOBronBDZqNiD3LVQ1GHXd=watDE0MssQstVyC2jY1g@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: fix typo resulting in crazy directory creation
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
X-List-Received-Date: Fri, 25 Sep 2015 16:32:08 -0000
Content-Type: multipart/alternative; boundary=001a1139af247e3595052094e37c

--001a1139af247e3595052094e37c
Content-Type: text/plain; charset=UTF-8

On 25 September 2015 at 17:29, Christopher Larson <clarson@kergoth.com>
wrote:

> I think I'd have just passed a list instead of a tuple here :) Easier to
> parse visually.
>

Yeah, agreed in hindsight.  Also insert a groan about untyped languages.

Ross

--001a1139af247e3595052094e37c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 September 2015 at 17:29, Christopher Larson <span dir=3D"ltr">&lt;<a =
href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_=
extra">I think I&#39;d have just passed a list instead of a tuple here :) E=
asier to parse visually.<br></div></blockquote><div><br></div><div>Yeah, ag=
reed in hindsight.=C2=A0 Also insert a groan about untyped languages.</div>=
<div><br></div><div>Ross=C2=A0</div></div><br></div></div>

--001a1139af247e3595052094e37c--
