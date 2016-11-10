Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id D9F7B71A28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 20:15:54 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id n204so300686587qke.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 12:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nOuNL92RzNWVYyil8svnWqmlxaCQoR1lpjfnJdZ+95Q=;
	b=sH+5eBzXmx/Uq2Bj2F6oGEpD1lLo2d8tyoMftuovRoscfcNpv7E/BZpa/D/Pk83yNc
	hs43PpFBkOMjNFPwFgEEMmmNiouSZy4grZAShblhmyh/qC9cga1mF9ynhtfgaDh+bRBn
	ybSmVopCtxf2ljU1VLiv898WjtQAZFTNoxqDW3/x/p8RELqQ8UWdS2/eGsz5Ivcsgh7n
	Tn70+EAc5zp4uGshO+7+Uh9AMoZwuv9WFO1kfCVKohXQ9ebih1H/DCybnonO2C6aOPLF
	+UQ3Z+8y4g8aBoQ5Ziz99pB8QObbOyyfPENYlWcjw5hr2nbF5h8qQNai0u5UxIJm+KRc
	6AkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nOuNL92RzNWVYyil8svnWqmlxaCQoR1lpjfnJdZ+95Q=;
	b=POD6XyEqhtmzcR1gg5Jf+rbtJ6afZPaDY3LF4ZmagE19xaFETzCClhx0idzPAi8kEh
	6cKvkbfZ6m/roYaF5fstVZRx7hA/bLDi8Ee7vExYdBlA3jmaV69q+vwytKVYD2N1UTXT
	Vd/p47tjYHwJototFnXhc0PPunHQXmw0Dt99N3TGjif9ZRjxgLyqc3FemKJLLPTqO3Yl
	OwToEJlbqgMafLcUBoR0CAmaLvJfdwqk+pn4zudcJiwiKadl51gCRc9G7cAqXBzqBvPk
	vA74DCqgaHKwokjWiwPI8Vkjc1/wV5Gqsia0rvIfocu2FWFJKktOZH2hwfUDg0NASBKD
	u/FQ==
X-Gm-Message-State: ABUngvf4KmxhuXT7o9XZJ02ZAyrygdORs0C/shP7j+/HJADiB2+Plapp6XjXW0cZxyNj2v8s3VB+sSC9KOwgrqPG
X-Received: by 10.55.31.157 with SMTP id n29mr7471533qkh.221.1478808955507;
	Thu, 10 Nov 2016 12:15:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Thu, 10 Nov 2016 12:15:35 -0800 (PST)
In-Reply-To: <504135c9082216ff89af282dfcb686a50b22f578.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
	<504135c9082216ff89af282dfcb686a50b22f578.1478779674.git.maciej.borzecki@rndity.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Nov 2016 20:15:35 +0000
Message-ID: <CAJTo0LbKYTd9SRZgHHHyuF0Wt+7AqYdLcweUTO78ROgYsG9VYA@mail.gmail.com>
To: Maciej Borzecki <maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 08/10] wic: selftest: do not repeat core-image-minimal
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
X-List-Received-Date: Thu, 10 Nov 2016 20:15:57 -0000
Content-Type: multipart/alternative; boundary=001a1147f2287be5f90540f80a5e

--001a1147f2287be5f90540f80a5e
Content-Type: text/plain; charset=UTF-8

On 10 November 2016 at 12:18, Maciej Borzecki <maciej.borzecki@rndity.com>
wrote:

>      def test_qemux86_directdisk(self):
>          """Test creation of qemux-86-directdisk image"""
>          image = "qemux86-directdisk"
> -        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
> -                                   % image).status)
> +        wic_cmd_vars = {
> +            'wks': image,
> +            'image': self.OE_IMAGE,
> +        }
> +        self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
> +                                   % wic_cmd_vars).status)
>

Is it just me who thinks that this is more understandable then?

def test_qemux86_directdisk(self):
  self.assertEqual(0, runCmd("wic create qemux86-directdisk -e
core-image-minimal").status)
  self.assertEqual(1, len(glob(os.path.join(self.resultdir,
"core-image-minimal-*direct"))))

Not my test case so just an opinion :)

Ross

--001a1147f2287be5f90540f80a5e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 November 2016 at 12:18, Maciej Borzecki <span dir=3D"ltr">&lt;<a href=
=3D"mailto:maciej.borzecki@rndity.com" target=3D"_blank">maciej.borzecki@rn=
dity.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:1kf"=
 class=3D"gmail-a3s gmail-aXjCH gmail-m1584e35ea3494c0f">=C2=A0 =C2=A0 =C2=
=A0def test_qemux86_directdisk(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Test creation of qemux-=
86-directdisk image&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;qemux86-directdisk&quot;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(0, runCmd(&quot;wic create %s=
 -e core-image-minimal&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% image).status)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wic_cmd_vars =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;wks&#39;: image,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;image&#39;: self.OE_IMAGE,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(0, runCmd(&quot;wic create %(=
wks)s -e %(image)s&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% wic_cmd_vars).status)=
</div></blockquote></div><br>Is it just me who thinks that this is more und=
erstandable then?</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">def test_qemux86_directdisk(self):<br></div><div class=3D"gmail=
_extra">=C2=A0 self.assertEqual(0, runCmd(&quot;wic create qemux86-directdi=
sk -e core-image-minimal&quot;).status)</div><div class=3D"gmail_extra">=C2=
=A0 self.assertEqual(1, len(glob(os.path.join(self.resultdir, &quot;core-im=
age-minimal-*direct&quot;))))</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Not my test case so just an opinion :)</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147f2287be5f90540f80a5e--
