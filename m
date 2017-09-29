Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id CB1C170101
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 16:29:02 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id k101so282256iod.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 09:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wK/0Z4OPFAFbUZ+LBcZQ8oNcxEEl1YKxJREF3EFRzGg=;
	b=TdiQ8d5e5tHaKdCp7mpOugI2uKFKbntAKO1LgjFmlRa7eAzoBxS7gBWo4LEEsl6jC9
	d//yY5Klkf7+0xcY3UV/KUWEc5pLQqr09xwpECNtkqS41HEUmKT1hZr/8STizNYPDGWQ
	dW82lfYc3zWZAA6H26WCzgyXFyhy6BYKo3gWvwl7Qcva+YTLLrsjKnpO7txgrzQVSntb
	Gg/hYHk0lPej9iXmTysraldtqz3nyLnytLMLagdYT8T03mWVSY4Y+DDSW+7iXaHU3uQY
	GrRBRzKLKsGgtPBL68a4xDWe+Ek1818Iv+XZKHwBhrT1RuQ8y1GvqmSIgINPo3belt27
	e/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wK/0Z4OPFAFbUZ+LBcZQ8oNcxEEl1YKxJREF3EFRzGg=;
	b=CTkiCziXX91Xt5sUYP5FC6miCAbutq4j3Cbr0o9kw3PL1nbWD/LPEE54JSYpAgVvTC
	5INN7IiTvpjVp3eaP1b7bnp6e57RGOKgaEoXdamGDhmtsnYDSaO1wsBgGx6jI0kPanNW
	8zWbcd3ah8FxNZ831pH09rspgMgQRXrE+CSHvHAy3t4qs9DmPkYcO2BqeBXk04g6gx8a
	pdZJ/vYUK9Ue/tlA45QvsIUyKkxs7nEb5/vOr+U2Qs7eV/t04wb8PY4HzTjpMqrY8YgM
	zg94aJ9Xfu0ttUF6RLoghcjYGJLDCW8Z28POhASLyG+NVeR2ED8fPrP8tygdzygd0XGM
	nnXA==
X-Gm-Message-State: AMCzsaX6K1AUSQgQHPJSShanbqS4QyUg1STT3JPLJ1WBHxNI95/pUbfg
	cQB/MbiKx7D0htVH3Zew7fQg8HQTfc/MS+fnYzLmUg==
X-Google-Smtp-Source: AOwi7QDTM7RCwHchrz5akkhU3IOm+6TDiL5OCd5qP5Z6VWGjar7yYuffOnRkUbo/zhsJoONmoRqp1/EdiiSZrCxdetM=
X-Received: by 10.107.164.28 with SMTP id n28mr12691779ioe.175.1506702543898; 
	Fri, 29 Sep 2017 09:29:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Fri, 29 Sep 2017 09:28:43 -0700 (PDT)
In-Reply-To: <FAB9E48578194042BE5C63B8BE47610339682926@MBX.NIKO.LAN>
References: <FAB9E48578194042BE5C63B8BE47610339682897@MBX.NIKO.LAN>
	<d0e88e18-0540-2d7f-abe4-11f677d5af4e@linux.intel.com>
	<FAB9E48578194042BE5C63B8BE47610339682926@MBX.NIKO.LAN>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Sep 2017 17:28:43 +0100
Message-ID: <CAJTo0LbM9JenyrSNhyGztA9A2JU5uHY5HJcsTNt6fH885F4M8w@mail.gmail.com>
To: Jef.Driesen@niko.eu
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Small improvement for the initscripts package
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
X-List-Received-Date: Fri, 29 Sep 2017 16:29:03 -0000
Content-Type: multipart/alternative; boundary="001a114223ace960d7055a5685d1"

--001a114223ace960d7055a5685d1
Content-Type: text/plain; charset="UTF-8"

On 29 September 2017 at 14:21, <Jef.Driesen@niko.eu> wrote:

> On 09/29/2017 11:38 AM, Jef.Driesen@niko.eu wrote:
> >> For our system, we are using some custom initscripts. Because of
> >> that, some files conflict with the initscripts package, and thus the
> >> initscript package gets removed from our build. But when trying to
> >> build an sdk, somehow the initscripts-dev package gets pulled in, and
> >> since that has an automatic dependency on initscripts, our build
> >> fails.
> >
> > Please do find out why this happens; that's what you really need to fix.
>
> I tried, but I couldn't figure out where this came from.
>
> >> I've been trying to find out why this happens, but without much
> >> success so far. But I did found a simple workaround: remove the
> >> initscripts-dev package completely. Since the initscripts recipe
> >> contains some shell scripts the initscript-dev is empty anyway.
> >>
> >> I've fixed this locally with a bbappend, but this is probably
> >> something that can be applied upstream.
> >
> > You can use bbappend to instead replace the standard files with the ones
> > that you want installed. Or you can add PROVIDES = "initscripts" to your
> > recipe with the 'custom' initscripts, and set
> > PREFERRED_PROVIDER_initscripts = "my-custom-initscripts" to have that
> > installed.
>
> Those custom initscripts are not in our own layer. It's in a layer we
> build upon. So it's a bit more complex.
>
> Anyway, what we have there is the following. In the machine conf file
> there is:
>
> VIRTUAL-RUNTIME_initscripts = ""
>
> This replaces the default meta/recipes-core/packagegroups/packagegroup-
> core-boot.bb:
>
> VIRTUAL-RUNTIME_initscripts ?= "initscripts"
>
> So I assume that's how they remove the initscripts package. And then in
> the image recipe they have:
>
> PACKAGE_EXCLUDE += "initscripts-dev"
>
> But for some reason this doesn't work for us. It fails with this error:
>

I'd definitely be curious as to where initscripts is coming from in the
SDK.  You can use bitbake -g <target> to generate dependency charts.

Ross

--001a114223ace960d7055a5685d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 29 September 2017 at 14:21,  <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:Jef.Driesen@niko.eu" target=3D"_blank">Jef.Driesen@niko.eu</a=
>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><span class=3D"">On 09/29/2017 11:38 AM, <=
a href=3D"mailto:Jef.Driesen@niko.eu">Jef.Driesen@niko.eu</a> wrote:<br>
&gt;&gt; For our system, we are using some custom initscripts. Because of<b=
r>
&gt;&gt; that, some files conflict with the initscripts package, and thus t=
he<br>
&gt;&gt; initscript package gets removed from our build. But when trying to=
<br>
&gt;&gt; build an sdk, somehow the initscripts-dev package gets pulled in, =
and<br>
&gt;&gt; since that has an automatic dependency on initscripts, our build<b=
r>
&gt;&gt; fails.<br>
&gt;<br>
&gt; Please do find out why this happens; that&#39;s what you really need t=
o fix.<br>
<br>
</span>I tried, but I couldn&#39;t figure out where this came from.<br>
<span class=3D""><br>
&gt;&gt; I&#39;ve been trying to find out why this happens, but without muc=
h<br>
&gt;&gt; success so far. But I did found a simple workaround: remove the<br=
>
&gt;&gt; initscripts-dev package completely. Since the initscripts recipe<b=
r>
&gt;&gt; contains some shell scripts the initscript-dev is empty anyway.<br=
>
&gt;&gt;<br>
&gt;&gt; I&#39;ve fixed this locally with a bbappend, but this is probably<=
br>
&gt;&gt; something that can be applied upstream.<br>
&gt;<br>
&gt; You can use bbappend to instead replace the standard files with the on=
es<br>
&gt; that you want installed. Or you can add PROVIDES =3D &quot;initscripts=
&quot; to your<br>
&gt; recipe with the &#39;custom&#39; initscripts, and set<br>
&gt; PREFERRED_PROVIDER_initscripts =3D &quot;my-custom-initscripts&quot; t=
o have that<br>
&gt; installed.<br>
<br>
</span>Those custom initscripts are not in our own layer. It&#39;s in a lay=
er we build upon. So it&#39;s a bit more complex.<br>
<br>
Anyway, what we have there is the following. In the machine conf file there=
 is:<br>
<br>
VIRTUAL-RUNTIME_initscripts =3D &quot;&quot;<br>
<br>
This replaces the default meta/recipes-core/<wbr>packagegroups/<a href=3D"h=
ttp://packagegroup-core-boot.bb" rel=3D"noreferrer" target=3D"_blank">packa=
gegroup-<wbr>core-boot.bb</a>:<br>
<br>
VIRTUAL-RUNTIME_initscripts ?=3D &quot;initscripts&quot;<br>
<br>
So I assume that&#39;s how they remove the initscripts package. And then in=
 the image recipe they have:<br>
<br>
PACKAGE_EXCLUDE +=3D &quot;initscripts-dev&quot;<br>
<br>
But for some reason this doesn&#39;t work for us. It fails with this error:=
<br></blockquote><div><br></div><div>I&#39;d definitely be curious as to wh=
ere initscripts is coming from in the SDK.=C2=A0 You can use bitbake -g &lt=
;target&gt; to generate dependency charts.</div><div><br></div><div>Ross=C2=
=A0</div></div></div></div>

--001a114223ace960d7055a5685d1--
