Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 62CEC71A3E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 11:44:49 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id k64so12430655itb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 04:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zxDQZlOMQ3yUDCAqc3WhP4JlSHrrQ3jVmbMuXtt+pek=;
	b=VLDigbl2wrz2XfD3Lt9XO3Pb+TF7U/biy/ZlxA/LVdtQXz4XmjogWGQ6vCX5w9BxEc
	5ANE+09+0tQouZjG30TGj8i3/9ZTU0/TZaJIU+2DvMWDspXT9VkIihU+P+rik+WIsCXJ
	CEfTRsLxlfls9YvBM+xELzcaEAND84T2i9pnS87frw7n7ISkHizedf+vurkjiEKyr/Rw
	hohg2qMW2zAIC5EnzP9VeH4VN4JiTokppccgGsBTjEr0ZJ8OvcmICk3+nOIyfJcKHPx4
	++tx1sZgbKkHRqDOggoh+/cl49ZS/oYB6tWL9pU4kIx1+TqPvtfp/8wOFP8CAz24BX1D
	/o9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zxDQZlOMQ3yUDCAqc3WhP4JlSHrrQ3jVmbMuXtt+pek=;
	b=CNrEpULKtMXNeZaUMNVgmP6yW1dROEu8WBDGMeIyNJax714AdEW6fupoMW5IJqcJaw
	uA3HC7/7iOtxYFFCNC+DDPpmnGvo7sZGImM/7jyxvYfkigrb2CtE9fcZjNw9xwZeJS5r
	UhS3HzYgVFEAPusev0tSu3AFCgGU69PeI+4pLwMMlzytk0tKCNOVhBEvTqoQHRJhz8iz
	bmeKH5RBHsFA/+KAk1IbQ92mfflwi9bsjKf0M6976a/yOAjEPo8KdX+fxL9xNhOJdp+S
	eiqBmL8wh5Fi/0HNcgKA7aKhSUJBugqfvv2+v1Njrn3H+fisz6IaTfRXI6eyM8F0kV5S
	BDYw==
X-Gm-Message-State: AA6/9RkZcB6HwQZVVcjksin1k7QB8pwTTTcKEvliZrJQZts7LbnBM9DSwf5cqByvhtulSEFGJhelfXpr+2mVX+mh
X-Received: by 10.36.144.68 with SMTP id x65mr7442165itd.70.1476704690926;
	Mon, 17 Oct 2016 04:44:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.168.146 with HTTP; Mon, 17 Oct 2016 04:44:30 -0700 (PDT)
In-Reply-To: <758e9e3a2047f36dc368add36bd006d53d83a662.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<758e9e3a2047f36dc368add36bd006d53d83a662.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Oct 2016 12:44:30 +0100
Message-ID: <CAJTo0LbgSCCCUvBSdmUw39wybbeYQ+FSkfUudnHDLY9zzpGZ1g@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/9] selftest: skip those imagefeatures tests not relevant for certain distros
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
X-List-Received-Date: Mon, 17 Oct 2016 11:44:50 -0000
Content-Type: multipart/alternative; boundary=94eb2c07e8068ab390053f0e1a42

--94eb2c07e8068ab390053f0e1a42
Content-Type: text/plain; charset=UTF-8

On 14 October 2016 at 17:40, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

>          # Build a core-image-clutter
> -        bitbake('core-image-clutter')
> +        image = 'core-image-clutter'
> +        supported_distros = ['poky', 'poky-lsb']
> +        if not self.distro in supported_distros:
> +            self.skipTest('Test is consider for distros (%s) supporting
> %s' % (','.join(supported_distros), image))
> +        bitbake(image)
>

Wouldn't it be better to check DISTRO_FEATURES instead - i.e.
core-image-weston needs opengl and wayland DISTRO_FEATURES to be present.

Ross

--94eb2c07e8068ab390053f0e1a42
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 October 2016 at 17:40,  <span dir=3D"ltr">&lt;<a href=3D"mailto:leona=
rdo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sandoval.=
gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":1q0" class=3D"a3s aXjCH m157c4107a3ef95f0">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0# Build a core-image-clutter<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;core-image-clutter&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 image =3D &#39;core-image-clutter&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 supported_distros =3D [&#39;poky&#39;, &#39;po=
ky-lsb&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self.distro in supported_distros:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&#39;Test is consi=
der for distros (%s) supporting %s&#39; % (&#39;,&#39;.join(supported_distr=
os), image))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(image)</div></blockquote></div><br></d=
iv><div class=3D"gmail_extra">Wouldn&#39;t it be better to check DISTRO_FEA=
TURES instead - i.e. core-image-weston needs opengl and wayland DISTRO_FEAT=
URES to be present.</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--94eb2c07e8068ab390053f0e1a42--
