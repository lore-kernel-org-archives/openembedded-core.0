Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id B682973CF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 14:25:09 +0000 (UTC)
Received: by qcwx2 with SMTP id x2so3155406qcw.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 07:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vcG311h/6vchBfnqY5OORslfphhsSCm0x3hgS5sriDs=;
	b=JoZdFKpxc18HpA3TlOz/oAxYMEi3P8DuGY/vSdNoouDlJ7o0Ow5H7wO7GACMgpW26n
	Ke+ENqtqrvZ/OehlZB0FSiwJ1W4t09r1IERmOkQSm7fZwZW6f1BJwXBOLY/8Jsl0plqn
	GdMt77KtZciiH7dP6z94UsOyZukvROXJ89G+o7qmIJj00l74hOEu9hI5TG6/1DDJK40J
	noCZPdYbXV1LeB8J+q2DfXN8O7X3RCmItylbP1ZHkJhf8c1hp130KJ0JSPSx+oi4j3ow
	tQkyKvQsrN21/SXo5huNf4ifZtE7Jsk8xwokinKxfW6Y4UYGxVyG0mj4Pl0NXRfy3tZG
	Kc/A==
X-Gm-Message-State: ALoCoQmwjLPxgvdvdce5cMrN73zGTALn1DmC85wfVnFV+snlr9vXRJOJg/PzYLMU0zIX3A0v18Fe
X-Received: by 10.55.18.144 with SMTP id 16mr58195938qks.17.1434378310095;
	Mon, 15 Jun 2015 07:25:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 15 Jun 2015 07:24:49 -0700 (PDT)
In-Reply-To: <CALbNGRS9UWjVQQh8POPc5zVYOeYa9VaeC7dEfzH3AMs4k9Mjzw@mail.gmail.com>
References: <557E9EFE.1030703@linux.intel.com>
	<CALbNGRS9UWjVQQh8POPc5zVYOeYa9VaeC7dEfzH3AMs4k9Mjzw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Jun 2015 15:24:49 +0100
Message-ID: <CAJTo0LbRVqw3h_3igs59=DTnaz6nf4w=A5ZpXepmh6xiKtVdPA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Webkit-gtk will be updated to latest upstream; midori browser to be replaced with Epiphany
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
X-List-Received-Date: Mon, 15 Jun 2015 14:25:11 -0000
Content-Type: multipart/alternative; boundary=001a113ad64aa5ab0705188f3957

--001a113ad64aa5ab0705188f3957
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 15 June 2015 at 12:53, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
>
wrote:

> So we are loosing last working browser around - what get's better
> except later is greater?
>

If you actually compare the build dependencies, you'll see that Midori and
Epiphany are actually almost identical.

We need to upgrade WebKit as the release we're shipping has known security
flaws and is very old - and the community is rightly moaning about that.
However Midori doesn't build with a recent WebKit... if you have an
alternative solution then your thoughts are welcome.

Ross

--001a113ad64aa5ab0705188f3957
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 June 2015 at 12:53, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a href=
=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@go=
oglemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":1dc" class=3D"a3s" style=3D"overflow:hidden">So we are loosing last w=
orking browser around - what get&#39;s better<br>
except later is greater?<br></div></blockquote><div><br></div><div>If you a=
ctually compare the build dependencies, you&#39;ll see that Midori and Epip=
hany are actually almost identical.</div><div><br></div><div>We need to upg=
rade WebKit as the release we&#39;re shipping has known security flaws and =
is very old - and the community is rightly moaning about that.=C2=A0 Howeve=
r Midori doesn&#39;t build with a recent WebKit... if you have an alternati=
ve solution then your thoughts are welcome.</div><div><br></div><div>Ross=
=C2=A0</div></div></div></div>

--001a113ad64aa5ab0705188f3957--
