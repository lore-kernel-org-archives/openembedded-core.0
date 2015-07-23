Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8361173CBD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 22:37:11 +0000 (UTC)
Received: by oige126 with SMTP id e126so6717085oig.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 15:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kWWD8w4vWuBD7q7LpDsn1myKw2Qyz0MBQ/JHz+5ztEw=;
	b=hUFs14cIAc6sVjfTAb1SIz4VorMb0AXFOtYmW15xTDYMo/RnnsAPDp7Bi3uoEPxDQs
	i3PPSaiKiaBQDszSVTHj52ZMPKQUFxd+xThHN/LyIsM5G7HxHcMmq8FDdlqW4Zr+qRsr
	DhxAtWYOfaLb40U3T4UcYRgSnDXPInZks5pgqU9ybZx/lMfQMnbTVxuAfPO/UaDopI/r
	zF9mJ2Gz1EqVlPmbFqv4OIkJurKQ5Gughm61qFFkCkBjUgbzXh6Ctznggf/u7fOfym/q
	rq1FRQw+uDvT4cW/+mBqmJCFZOpM31x+aGYY00siPWxPuRgUSeAF+XbLw7Zms2duK9mH
	1Fmw==
X-Gm-Message-State: ALoCoQn4MDNRojLsTh4EIDLBQct4pGJNcxdwt6/PFDGaabBh6PSvVv1PpXk0YdUFto2U74wk4Dl5
X-Received: by 10.202.229.66 with SMTP id c63mr11286910oih.57.1437691031590;
	Thu, 23 Jul 2015 15:37:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.108.4 with HTTP; Thu, 23 Jul 2015 15:36:52 -0700 (PDT)
In-Reply-To: <1437606836-26840-1-git-send-email-randy.e.witt@linux.intel.com>
References: <1437606836-26840-1-git-send-email-randy.e.witt@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Jul 2015 23:36:52 +0100
Message-ID: <CAJTo0LZ6xwk7DekPwyA3LWuDmO=MMKM_SxhD0vKQTAVYjdp6=Q@mail.gmail.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcf-agent: Update to version 1.3
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
X-List-Received-Date: Thu, 23 Jul 2015 22:37:12 -0000
Content-Type: multipart/alternative; boundary=001a1141bdea3c5022051b928700

--001a1141bdea3c5022051b928700
Content-Type: text/plain; charset=UTF-8

Hi Randy,

On 23 July 2015 at 00:13, Randy Witt <randy.e.witt@linux.intel.com> wrote:

> According to the Eclipse tcf team, 1.3 tcf is required for the newest
> Eclipse release "mars".
>
> [Yocto #7886]
>

"Yocto" should be uppercase, and you're missing your Signed-off-by.


>  do_compile() {
> -       oe_runmake
> +       oe_runmake -C agent
>  }
>
>
If you do everything inside the agent/ directory, consider setting S to
take that into account.

Ross

--001a1141bdea3c5022051b928700
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Randy,<div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On 23 July 2015 at 00:13, Randy Witt <span dir=3D"ltr">&lt;<a href=
=3D"mailto:randy.e.witt@linux.intel.com" target=3D"_blank">randy.e.witt@lin=
ux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Accord=
ing to the Eclipse tcf team, 1.3 tcf is required for the newest<br>
Eclipse release &quot;mars&quot;.<br>
<br>
[Yocto #7886]<br></blockquote><div><br></div><div>&quot;Yocto&quot; should =
be uppercase, and you&#39;re missing your Signed-off-by.</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">=C2=A0do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake -C agent<br>
=C2=A0}<br>
<br></blockquote><div><br></div><div>If you do everything inside the agent/=
 directory, consider setting S to take that into account.</div><div><br></d=
iv><div>Ross</div></div></div></div>

--001a1141bdea3c5022051b928700--
