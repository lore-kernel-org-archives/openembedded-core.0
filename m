Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id C0DF960684
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 11:23:07 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id u84so17548344iod.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 03:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HDv3GgL13ptveQtX4Mcd2dVcnpqGhzYJ6JyrdKuRE54=;
	b=pLZFURhdwpUODmuzzbBRqd+R7886vFtrdMzzRAosy87sf+ky3D7WRGRnf0OzFjSdiK
	oqYrPKzcDdwWGz85p8wg5l5rAjmDFDK0OYnPd5KbeO+IX3Ui4L+EtSvvUvMslD0hEYlZ
	JURChQ/YonxvoQNwObIrqECXk3cVj4eJ85pndmVmrQfuId8jaImWMh7rMzFLU4Dm8v/M
	iRxspeASAFDR2y7abx78v36XsbdmvdouvafWiQZWjjJsf2rh2LdF32Mr0YXoCKJrQFuT
	dUu5EXSLyhqP1YirTsCkMrsMlzpiby6GfNsrp5LwQZvYBGwxfHzhAa7vmjbImPabuQJ8
	vckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HDv3GgL13ptveQtX4Mcd2dVcnpqGhzYJ6JyrdKuRE54=;
	b=U53Gl+cYa3z2/GHL1WQT1iYm21O6/X8K6gEz6oJD8CQ674jxMOClT03gWC8nuwWtG8
	w198XqU+BbPicz+zf4y9nrKAWK7z4YPmh0kM8OPXrOziwAWmea14ToxnS2iq++vUQive
	aFmeUFXsvugOXBmxsgqtK346ii7LYjpmtbtqFSenYNavoKQGEnwcNu4gy1yWTXbU7dzd
	NeZDHn4wxycS1ECl3uwKM3hZr7dvGaprpx2XSxjQT9tO1D0xQx6zIHSaeWA54p8hbeQO
	VL60OxxCwjNDSL658uxUW60Fmg6t6ol6XDmrSkGJqFWZq+h5bqIPoCX3ZjIq5KQr7GLi
	PhQQ==
X-Gm-Message-State: AElRT7HuD162xGDznW6FS9hr8744pTMrCb2yI8I08N0h8ucP6o0RAEGV
	KDkjuLOD15kDyuP3Tg1RlneuVc3n4Dufii2yp+Kt/g==
X-Google-Smtp-Source: AG47ELsY71WuRt5LRLF8vIYXTvtyjT3OW5h8logTcZl7pIOb6au2rzgEf7qUHmzGLYa4sr/3mG2E8z8wKHsNYRq/zXY=
X-Received: by 10.107.37.212 with SMTP id l203mr16559824iol.20.1520248988772; 
	Mon, 05 Mar 2018 03:23:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Mon, 5 Mar 2018 03:22:48 -0800 (PST)
In-Reply-To: <CAP9ODKpRAUwaUysuOVC7rWq1ZdXDAzH31L2YRAt2Dp7u1MoNkA@mail.gmail.com>
References: <20180302203314.32737-1-matt@madison.systems>
	<876d96e7-1425-df8e-621c-b2dd3c263d88@gmail.com>
	<CAGgRHJoNhQTyVN7ww5BAoQLs1GPkxO3rsdujLttH8V-84vFiAw@mail.gmail.com>
	<CAMKF1sqZr+tBB9wVR_aVp0U8X2v25_LX1fuRHSaH=JqAiOUPmg@mail.gmail.com>
	<CAP9ODKokRKXqyec5QCU1z5vaHut5a4kSJ9Zq=eAY=V_APirV7Q@mail.gmail.com>
	<CAMKF1sp5tRPs7yB9bCZShJnozK_cHTskcSSTUP-=Vag72sZZRg@mail.gmail.com>
	<CAP9ODKpRAUwaUysuOVC7rWq1ZdXDAzH31L2YRAt2Dp7u1MoNkA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Mar 2018 11:22:48 +0000
Message-ID: <CAJTo0La5d88sn4Ce=QkwDnP7pd-r1iKH2S6ouGZikSsMjq40zA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 00/13] go1.10 update and misc improvements
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
X-List-Received-Date: Mon, 05 Mar 2018 11:23:08 -0000
Content-Type: multipart/alternative; boundary="001a11405f16f2415e0566a88c8d"

--001a11405f16f2415e0566a88c8d
Content-Type: text/plain; charset="UTF-8"

On 4 March 2018 at 20:46, Otavio Salvador <otavio.salvador@ossystems.com.br>
wrote:

> I understand the need and I see the value. The GCC is harder to
> upgrade but problems using newer Go toolchain does not happen very
> often and likely are caused by a regression on Go itself.
>
> As I said, there are two options:
>
> a) wait for 1.10.1 release
> b) keep 1.9.4 around
>
> My preference goes to (a) as I prefer to not include 1.10 now with
> those known issues.
>

Considering that we're technically past the upgrade freeze and we're only
still talking about this patch set as there's other, larger, patches we're
holding M3 for discussing waiting for another upgrade isn't really an
option unless 1.10.1 is due *very* soon.

So my opinion is that as Go is getting quite some traction but is also
under quite heavy development, unless there's a 1.10.1 release due *this
week* which solves the problems that InfluxDB et al are having then we
should ship both in this release, and drop 1.9.4 from master once 1.10.1 is
added.  1.10 should be the default version, and hopefully we don't have to
do this again.

Ross

--001a11405f16f2415e0566a88c8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 4 March 2018 at 20:46, Otavio Salvador <span dir=3D"ltr=
">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank"=
>otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><div class=3D"gm=
ail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I unde=
rstand the need and I see the value. The GCC is harder to<br>
upgrade but problems using newer Go toolchain does not happen very<br>
often and likely are caused by a regression on Go itself.<br>
<br>
As I said, there are two options:<br>
<br>
a) wait for 1.10.1 release<br>
b) keep 1.9.4 around<br>
<br>
My preference goes to (a) as I prefer to not include 1.10 now with<br>
those known issues.<br></blockquote><div><br></div><div>Considering that we=
&#39;re technically past the upgrade freeze and we&#39;re only still talkin=
g about this patch set as there&#39;s other, larger, patches we&#39;re hold=
ing M3 for discussing waiting for another upgrade isn&#39;t really an optio=
n unless 1.10.1 is due *very* soon.</div><div><br></div><div>So my opinion =
is that as Go is getting quite some traction but is also under quite heavy =
development, unless there&#39;s a 1.10.1 release due *this week* which solv=
es the problems that InfluxDB et al are having then we should ship both in =
this release, and drop 1.9.4 from master once 1.10.1 is added. =C2=A01.10 s=
hould be the default version, and hopefully we don&#39;t have to do this ag=
ain.</div><div><br></div><div>Ross</div></div></div></div>

--001a11405f16f2415e0566a88c8d--
