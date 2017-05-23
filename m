Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1352A77E7E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 16:36:03 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id v27so132883067qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 09:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PwWSk3C8kzFu73zNljhBidoMN4DD5eq009Vcipa5tGI=;
	b=1lSxmSatlg0K96Q7KEBeD8+dszxEZEL8V0jnirUiRB4a3p0AY0NFhIzfWtk9VQGQ5n
	tWL1TD+RQzSI8ZB4er4aUX1hvdhD3p84xj8YFQpOgSp1/YtnKgsX9PM3pbulbokcyive
	ItJwk5zC5Z9lFqBHVBeFcyGmp9yTv2aXeZBRoBvF8J6GOJHs3TYR5QY+VwStRrDBjyoc
	hlsr+KhjYsTY1U6Cl2NGlNs3pvUkYMI1atYqkb+9kjaXaYHhbP1RMz64jcpN/Yj7FSGI
	zeq6k325U2lux3AR0R8XJ3k8Ei555wWP+tEjcnVgIOdmBRXCBrO1A2aLaxhpYrPqPEjW
	F+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PwWSk3C8kzFu73zNljhBidoMN4DD5eq009Vcipa5tGI=;
	b=jGAMBO0DXuvhOhMCqZWMyu00Oa9HBbC4gbxuJ6AKsY8ojNZ1G3ogVlzZ6ijrOg+jgf
	ztHVOVmbEDPqcA0aQYsluqRWiCvL/lacRFRaPYYkOiuRCvf6TV7pR0J/PCgAEvONVcAl
	tFoEaSxe7Hrw91b/dwZ103GM/dDvXeEvg2ep/j17P5WTdRSPE0u7I9wwjAfAw1IE2Qc4
	VkFe6vTVsFAFsOw53zsPFvHgvRGkmtAjhBkyYOUcyqtJslVHom50Jlo8zOyT7P9uuGAM
	k2NL5DQpMHq1uK7w1rrxt90nWnuFvxLyv1FNGNuHGcdrpK27+GMEav+8NOZkUaqDoV77
	T0gA==
X-Gm-Message-State: AODbwcC1T7MlXJt93mIwVfarvwXb4orabEFjBRww5IiCQlzUBGl9sT/k
	Yvbly045eXjssNTSBDTlB5hclz8Pkl2S
X-Received: by 10.200.50.67 with SMTP id y3mr30216687qta.27.1495557364789;
	Tue, 23 May 2017 09:36:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Tue, 23 May 2017 09:35:44 -0700 (PDT)
In-Reply-To: <20170522071935.GA11250@linux.intel.com>
References: <cover.1495028624.git.ed.bartosh@linux.intel.com>
	<b852248822868b543e6bec8c4dbea6d43eb55f1b.1495028624.git.ed.bartosh@linux.intel.com>
	<1495234544.16942.222.camel@intel.com>
	<20170522071935.GA11250@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 May 2017 17:35:44 +0100
Message-ID: <CAJTo0LYZcEGNHz03fQzF7hcsskSnGVVNk7Q0iHXrPRFDBTWLfA@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [PATCH v4 7/7] image_types_wic: schedule prepare_wic_build correctly
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
X-List-Received-Date: Tue, 23 May 2017 16:36:04 -0000
Content-Type: multipart/alternative; boundary="001a1141047a7872a705503395b2"

--001a1141047a7872a705503395b2
Content-Type: text/plain; charset="UTF-8"

On 22 May 2017 at 08:19, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:

> I'll try to test it with meta-intel. Can you provide more detailed
> instructions how to reproduce this issue? Which image did you try to
> build?
>

I just hit this.

image_types_wic does this:

+            d.appendVarFlag('do_prepare_wic_build', 'depends',
+                            '%s%s:do_deploy virtual/kernel:do_deploy' %
(d.getVar('MLPREFIX'), d.getVar('EFI_CLASS')))

Where:

meta/classes/live-vm-common.bbclass:EFI_CLASS =
"${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"

With meta-intel, EFI_PROVIDER is rmc-boot, which is a class but not a
recipe.

Ross

--001a1141047a7872a705503395b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 May 2017 at 08:19, Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D"mailto=
:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-=
color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:1z8" class=3D"gm=
ail-a3s gmail-aXjCH gmail-m15c2f1ce13e761aa">I&#39;ll try to test it with m=
eta-intel. Can you provide more detailed<br>
instructions how to reproduce this issue? Which image did you try to<br>
build?</div></blockquote></div><br>I just hit this.</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">image_types_wic does this:</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_extra">+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFl=
ag(&#39;do_prepare_wic_build&#39;, &#39;depends&#39;,</div><div class=3D"gm=
ail_extra">+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;%s%s:do_deploy virtual/kernel:do_de=
ploy&#39; % (d.getVar(&#39;MLPREFIX&#39;), d.getVar(&#39;EFI_CLASS&#39;)))<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Where:=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">meta/=
classes/live-vm-common.bbclass:EFI_CLASS =3D &quot;${@bb.utils.contains(&qu=
ot;MACHINE_FEATURES&quot;, &quot;efi&quot;, &quot;${EFI_PROVIDER}&quot;, &q=
uot;&quot;, d)}&quot;<br></div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">With meta-intel, EFI_PROVIDER is rmc-boot, which is a c=
lass but not a recipe.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div></div>

--001a1141047a7872a705503395b2--
