Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4D5D860053
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 12:05:09 +0000 (UTC)
Received: by qkcf65 with SMTP id f65so41701381qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 05:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=GD1hjwglf90p0nWmqb0N6KDIzGuIj/mGSE8ApsLN4Zw=;
	b=BMkap2mTnM3eaq5UXl40wYZQQw+J4XyEtU1GGRWblpr6UNTEPS2IffTL9VvWGP4bQw
	Fvc0iqqNMgzSgR7i3d1ldambf95xULh3vOL0X/2rRwT5oFV+8hgiqCzPNqBrbIvJzDAo
	N3UTsR3PKjZT8t0456z0oanWhBdnKqqaFmtJhVx50jJLLsmzEkYcF96AqehzC2mlJl1I
	dK6b7+kKtYSnN5oX8gLFRVqKveH52UlYEoFEXZUe0Fg6cW3ZEIQ6Z6SVb1tW3FgnHfC9
	nt1a7dvpMKgyoAdC7MlOYM9dvQZbiQewwZQr/cwun9aTJO+ZemIgXocauQgdE2RNLF+t
	9Oxg==
X-Gm-Message-State: ALoCoQkOJ7oT3DrlWHpnD/vDHP1yWBP3csXP6TecFfaDSRkfKSUr75HL0mqX09Sud993zgQqRk99
X-Received: by 10.55.221.199 with SMTP id u68mr33053332qku.83.1441713909428;
	Tue, 08 Sep 2015 05:05:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Tue, 8 Sep 2015 05:04:50 -0700 (PDT)
In-Reply-To: <D2E79685-E16A-4941-BB7B-E7F21E250DD2@axis.com>
References: <D2E79685-E16A-4941-BB7B-E7F21E250DD2@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Sep 2015 13:04:50 +0100
Message-ID: <CAJTo0LaAUgn5i==+JcS5Xd3sFP8jCMWG2M-9ptnhh3j-hsipEw@mail.gmail.com>
To: Umut Tezduyar Lindskog <umut.tezduyar@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: 32 bit time_t in openembedded
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
X-List-Received-Date: Tue, 08 Sep 2015 12:05:10 -0000
Content-Type: multipart/alternative; boundary=001a11499758709c35051f3b2d5f

--001a11499758709c35051f3b2d5f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 8 September 2015 at 12:44, Umut Tezduyar Lindskog <umut.tezduyar@axis.co=
m
> wrote:

> Upstream systemd=E2=80=99s answer is pretty much using 64 bits time_t str=
ucture
> but this is relatively expensive on 32 bits ISA.
>

What problem are you trying to solve here - the general problem of "I want
my hardware to work after 2038" or "my RTC is stupid"?  For the former
you'll potentially be writing a new ABI to introduce a 64-bit time_t (then
updating the kernel, libc, toolchain...), for the latter can't you have
some kernel code that clamps the random times on initialisation to be <2038=
?

Ross

--001a11499758709c35051f3b2d5f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 September 2015 at 12:44, Umut Tezduyar Lindskog <span dir=3D"ltr">&lt;=
<a href=3D"mailto:umut.tezduyar@axis.com" target=3D"_blank">umut.tezduyar@a=
xis.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:1ik" class=3D"a3s" style=3D"overflow:hidden">Upstream systemd=E2=80=99s an=
swer is pretty much using 64 bits time_t structure but this is relatively e=
xpensive on 32 bits ISA.<br></div></blockquote><div><br></div><div>What pro=
blem are you trying to solve here - the general problem of &quot;I want my =
hardware to work after 2038&quot; or &quot;my RTC is stupid&quot;?=C2=A0 Fo=
r the former you&#39;ll potentially be writing a new ABI to introduce a 64-=
bit time_t (then updating the kernel, libc, toolchain...), for the latter c=
an&#39;t you have some kernel code that clamps the random times on initiali=
sation to be &lt;2038?</div><div><br></div><div>Ross</div></div></div></div=
>

--001a11499758709c35051f3b2d5f--
