Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 93C2660232
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 10:07:47 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wo20so2264482obc.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 02:07:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=drhcOVUyxsSmsP20g217rtiDWIHha7POeX3eXC4Wgbs=;
	b=TjmANmsb/vdBGkyuKZUi21yfmBaeHPX0CFbD2cdSwxSYXXdLiA/Z/pZECv23wBywKe
	JOJ8W25Dx2pd2DKsP+w+VjjD1aW4Hx+zVWLNZx2Ybqih2JX0BjEV6umCbA8Y2KS+REuv
	2dYvVEvkOMqaC29WiBSzO47EvlPgoLG01qAlo0HQemnkeBlr07xHH7Wr/83kfVSwgAUD
	dYNFBBQvzlDPHvJLoPY4xmmISLdXtSMMPJE90uEuwev4eOBbejoupxzB6mSErjV4W+0M
	KjftHOmi6nneUxQveHaoEC3+sYEQZwtCZiTGL/XFqJ5rVLEwXqEr4VM0Z7z20iRR+T3w
	FoZQ==
X-Gm-Message-State: ALoCoQljIy3MPPlq4qkfLlq/E3/CGw/mMM8+KPbn54SxMfymo2hgvwoKDfetOHJpr709MkQDrGdz
X-Received: by 10.60.145.167 with SMTP id sv7mr38830261oeb.38.1417514868062;
	Tue, 02 Dec 2014 02:07:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.159.138 with HTTP; Tue, 2 Dec 2014 02:07:27 -0800 (PST)
In-Reply-To: <77c054ff36774c9013ea046024489cabca8102e7.1417466738.git.anibal.limon@linux.intel.com>
References: <cover.1417466732.git.anibal.limon@linux.intel.com>
	<77c054ff36774c9013ea046024489cabca8102e7.1417466738.git.anibal.limon@linux.intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 2 Dec 2014 11:07:27 +0100
Message-ID: <CAP71WjxaCpKBUOadPKxJCwZb6qAUrs_3icwqxOQDNkb9VN_9WQ@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] mesa: Upgrade to 10.3.3
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
X-List-Received-Date: Tue, 02 Dec 2014 10:07:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2014 at 11:36 PM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
> -SRCREV =3D "0028eb1083e6adc110a23a5f02c993cda217067a"
> -PV =3D "10.1.3+git${SRCPV}"
> +SRCREV =3D "9cc26056ee13f25c5785fef81b31487f1429baa4"
> +PV =3D "10.3.3+git${SRCPV}"

10.3.4 has been ~2 weeks ago, can't we use this one instead?

in the mean time, I am going to test this series on a non Intel
platform (ARM based Snapdragon using Mesa/gallium freedreno driver)

>
> -SRC_URI =3D "git://anongit.freedesktop.org/git/mesa/mesa;branch=3D10.1 \
> -           file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when=
-HA.patch \
> -           file://0006-fix-out-of-tree-egl.patch \
> -           "

awesome to get rid of those , and finally use a vanilla upstream..

> +SRC_URI =3D "git://anongit.freedesktop.org/git/mesa/mesa;branch=3D10.3"
>
>  S =3D "${WORKDIR}/git"

