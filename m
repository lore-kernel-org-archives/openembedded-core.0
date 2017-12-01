Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id DB06160722
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:26:53 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id u62so3049461ita.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 08:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CbVVHomnestK8G5R83MBQ0Mjbn+b8HjujOxXnNfQHiw=;
	b=d3mvmLFcMJrIaE2pqJ3pNpDIwwtxZsvq0t5k7WWXg0CXDnRWCGr54AwdWyytINscnQ
	hOhrrLi+gGycTVnFRn0aGzBDZXKevcxyXmX9tnxftbHfIunRedO/cY5qd8/PQrXPqEaM
	gRFapen9WFQVIQOvolE/iglBpZ/2Ccgw5ZGwwI1NN1zSVhpqzneWqoAKViPfPl9tbnqE
	GLzJ6IzH32EiP7nvHIbTiM0tomWLw9bJdvsFPYJSVZEgSSlT3mmVNcEmZRsnCI9+y0gI
	V94KxmxbC3AVCQVt/VcY6ZXNBBU+o4AK9ePcDsAzLDy/inRoRPtZRncsNrk/iM7ZIOtU
	beqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CbVVHomnestK8G5R83MBQ0Mjbn+b8HjujOxXnNfQHiw=;
	b=feEq8BYTgIc17azgGUamuUfZGKVDY2HDLPugqyLoayc+1LvkYLiOkYVXf6g/a0U9Tk
	e7qO0QbvJdM/MXXq49AjKIVehngLU7sRQFUG4U1/tsNFYx5Ay+7tMPSa8wd7GrZocF6O
	ltQmDOhIWWpTFUZ+bnlILIeno8e8qJRV+MNVJNW3atscqiA9ZT7S6WXP8dbi55AC8W01
	2VXvfLVwNjJ1LUTR820Im8RJQz0kkLybpNB4DwXYyJYvJQ+kZQlrmXvtrONbna1KJV7k
	bVipNfDMa2XhxNdJ9YMYZFNPCqNtSaodLbcZJdbTM44gs/j4zPi6uond2lL0s6T3v5ZW
	YABQ==
X-Gm-Message-State: AKGB3mJs/ZZxeEyqMZcEgd16LXGPc1YPB2WyM+uq5yyN4/XKJPiNYHY8
	k0pUN62vSSNbApVaQvBT81gspf81o3f01CykyArZdw==
X-Google-Smtp-Source: AGs4zMZVvE6tjx9pG+x1xM4LlxMbWNSxMw8p5s6BK1d5S/M5iDIScUwjob1pvaMZPU51r3fgJSkNMs987ArguPDQR+8=
X-Received: by 10.36.162.65 with SMTP id o1mr2585007iti.85.1512145614864; Fri,
	01 Dec 2017 08:26:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.134 with HTTP; Fri, 1 Dec 2017 08:26:34 -0800 (PST)
In-Reply-To: <CAMKF1sq-VPxdRuKcpbvfK74GRnTk5mNwthuYj6S92bXCdPuF3Q@mail.gmail.com>
References: <cover.1512111404.git.dengke.du@windriver.com>
	<43d0b786bf6dc1ae091ddb6c5c590880cadcc6fe.1512111404.git.dengke.du@windriver.com>
	<CAMKF1sq-VPxdRuKcpbvfK74GRnTk5mNwthuYj6S92bXCdPuF3Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Dec 2017 16:26:34 +0000
Message-ID: <CAJTo0LZ9JiPXBQV11NP24Y_HUZyXiOYe5Oq1x2bHDFCQ9LGELw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ltp: add runtime depends ltp-staticdev
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
X-List-Received-Date: Fri, 01 Dec 2017 16:26:54 -0000
Content-Type: multipart/alternative; boundary="f403045fbd84391cda055f49d6cd"

--f403045fbd84391cda055f49d6cd
Content-Type: text/plain; charset="UTF-8"

On 1 December 2017 at 14:51, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Nov 30, 2017 at 10:58 PM, Dengke Du <dengke.du@windriver.com>
> wrote:
> > The test case nm01 depends on /opt/ltp/testcases/data/nm01/lib.a in
> > ltp-staticdev package.
> >
>
> perhaps its better to create a packaging exception to include this static
> library to be packaged into ${PN}


Definitely.  For ltp I suspect the standard PN PN-dev PN-staticdev split is
entirely pointless, so just don't create those extra packages and silence
the QA checks.

Ross

--f403045fbd84391cda055f49d6cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 1 December 2017 at 14:51, Khem Raj <span dir=3D"ltr">&l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><span class=3D"">On Thu, Nov 30, 2017 =
at 10:58 PM, Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">dengk=
e.du@windriver.com</a>&gt; wrote:<br>
&gt; The test case nm01 depends on /opt/ltp/testcases/data/nm01/<wbr>lib.a =
in<br>
&gt; ltp-staticdev package.<br>
&gt;<br>
<br>
</span>perhaps its better to create a packaging exception to include this s=
tatic<br>
library to be packaged into ${PN}</blockquote><div><br></div><div>Definitel=
y.=C2=A0 For ltp I suspect the standard PN PN-dev PN-staticdev split is ent=
irely pointless, so just don&#39;t create those extra packages and silence =
the QA checks.</div><div><br></div><div>Ross</div></div></div></div>

--f403045fbd84391cda055f49d6cd--
