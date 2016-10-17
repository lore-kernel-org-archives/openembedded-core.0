Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id DB6A471A5E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 11:48:30 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id 139so39999955itm.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 04:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nTU77clt2htw2Y5/DCwAM19VkNGIqYJveDCnouzqedQ=;
	b=RPVjeqNKx0eJyAlDnuLh0ckMufXyumDXHzPSRFBwGdc76EYFNoq6spJDmoW2IxD6fk
	c6FeOZLJIyRocTby5ZTTy3nlkxE2rdF1T3e5gr322RGdBXniBanfK0qFIypDHdq5kyyw
	FIssnSt8YsSw/XRLtHza4YcRnRnqyyqmh1KFv8f27mlEq8+cx1OcX14g5j1X6qXf8mLe
	eg6I0lIF2EQP+2p9qg1fRH+p0ni5ruZJb4X60V/0W4VMZmvLQw/hPzFfp83qXEFBe3VS
	gTTprExwkJbr/XB6j3hX1n8XRYagZ8ixRBswfz/okOOeP4nX1a+56vwuSvoUqE0GPCXY
	1/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nTU77clt2htw2Y5/DCwAM19VkNGIqYJveDCnouzqedQ=;
	b=YmBfB9FF9G1nwSl2F/TA9RdmMGYw2BbWlqkoVsy2Mcy3cArYRjrljKuLa7qbjXXlqv
	a40rXIEg/w0uexocNkjL4xLeXfXLPrQJYpdggRIQmRXUMhn9lF4oCIO92+huKvWMc7O/
	6kW50XPwNkPWnQkdz4BSsWSfn5NpBzD5ujUKkMRN5P+RKhhIGFvlHTFZSiGZE5hwfBjV
	AQtoHpeNTPTZ7iHHT1b0Nf5P6dkZNflKoWgltdXlAEg9D3bPb9kdazsR9oZzIUgkFk6e
	9upbzkZQu90vXdQPbFOfR2D8L/hJiLiXTJYsOXHmA8QoXk1CMK7JcgkBljv43coyVKJX
	wcAQ==
X-Gm-Message-State: AA6/9RmPt8ekpbftxd5bYqIn8eHbQc1nh3rGr9pKBLFdUnildBI/Ki2DBE7nhVCtonRTmZkKSuJNyECFnGGgKsfZ
X-Received: by 10.36.200.85 with SMTP id w82mr8074294itf.29.1476704911987;
	Mon, 17 Oct 2016 04:48:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.168.146 with HTTP; Mon, 17 Oct 2016 04:48:11 -0700 (PDT)
In-Reply-To: <c41808ff150629815c3dc6cd6291ebcc305e6025.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<c41808ff150629815c3dc6cd6291ebcc305e6025.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Oct 2016 12:48:11 +0100
Message-ID: <CAJTo0LZSNzif29-=uU-jqCF5Es0BiUPfGg+XD7aggrQuacyL6w@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/9] selftest: skip test_read_only_image on poky-tiny distro
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
X-List-Received-Date: Mon, 17 Oct 2016 11:48:31 -0000
Content-Type: multipart/alternative; boundary=94eb2c05a3b4b7ab92053f0e27b0

--94eb2c05a3b4b7ab92053f0e27b0
Content-Type: text/plain; charset=UTF-8

On 14 October 2016 at 17:40, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

> +        if self.distro == 'poky-tiny':
> +            self.skipTest('core-image-sato is not buildable with
> poky-tiny')
>

DISTRO_FEATURE check - sato needs opengl x11 so this is the actual blocker.

For a read_only_image test, switching the image to core-image-base or
similar would exercise the code just as well without needing as much
building or assumptions on DISTRO/MACHINE.

Ross

--94eb2c05a3b4b7ab92053f0e27b0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 October 2016 at 17:40,  <span dir=3D"ltr">&lt;<a href=3D"mailto:leona=
rdo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sandoval.=
gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":cc" class=3D"a3s aXjCH m157c4109d99db774">+=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if self.distro =3D=3D &#39;poky-tiny&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&#39;core-image-sa=
to is not buildable with poky-tiny&#39;)</div></blockquote></div><br>DISTRO=
_FEATURE check - sato needs opengl x11 so this is the actual blocker.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">For a read_=
only_image test, switching the image to core-image-base or similar would ex=
ercise the code just as well without needing as much building or assumption=
s on DISTRO/MACHINE.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--94eb2c05a3b4b7ab92053f0e27b0--
