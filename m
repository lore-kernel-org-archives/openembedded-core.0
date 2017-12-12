Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8AEAE7835C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 21:28:21 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id f12so195678pgo.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 13:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ak1CIFCaqq8yJ4TKMNB1uXwcaarXQ5lNXvZCkrgcsUU=;
	b=Kf+E5JxOJqq5RaDmjVDv3i1Wr7K/QWBRJrOvXtMpryJdV2dp7Luru59f9BiERm4MKG
	rhh4d2Kd9rxsqyRzzHEGUdCdv9i0QlpO7WhaMzCSR0y9chvUXAGuFaTqf1KLPc+Ckm00
	8FjO+9V9eLdIpxIpOToZFeEayXs4gADI8MdWA1sloAk726c+GUzo9KbQPIcX9Ojw/Rwb
	qe9L4VX8+J4N8mbPzQ7xFHfencUEX2ebt6DRL1PrvNvqSiNXm0QTwp0ltyLHyNtH8i92
	2LxbzLfhi1DvD3ErsVj44pFu2mNx+HIYyLdnYUltxn46yo6DgKCeQnxbNzkcS3gNpn0V
	5ARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ak1CIFCaqq8yJ4TKMNB1uXwcaarXQ5lNXvZCkrgcsUU=;
	b=GhZ0gQ94gTzhICJX2FpVemEFzAYmr/ABX+c5J+Y4JuSS2VGzrm+Gw7rv6qvNqbDMl0
	Fs4O2t1RLhpNCOPzkhbbzQceQP84n+s9N6oVCf99MyzywlbJiORGa3kFoWhQrn2rroRc
	M9Y8m0SLtG2G2+JWesBqI/LHUfOjyLxbJPjvaF+kWUcHq5F7tPmgRRWWp4FzKvx2VWz1
	FpzjO39KvyRwHXcuRRkAOowm5Ml37s71xVzqWSIFqx02Eq6HWlSlX/T+Ge8/m3nmaQz2
	jW9fJY1ugj/qM+jkam345wIFkRmR1rFRd04eRULh+0IJJ2Gm69l7INgTKNDeIeNJtq8/
	D5bA==
X-Gm-Message-State: AKGB3mJAV/qyC44m/xOmHpgNE+C224fjn9sKeRfUGMKjZN18zqmtSu1b
	QhNO+vex/FM+9PwWYAMm8V8Mj47ENfByREcFl5w=
X-Google-Smtp-Source: ACJfBovWFgUi71XMCRJZFtI3omK3a40C2boO9HeaEPpvWvfNCQ3pZK42i0D7haoAB162wa4+35g7W60n/nK+B87GE8w=
X-Received: by 10.98.155.129 with SMTP id e1mr3696379pfk.119.1513114102536;
	Tue, 12 Dec 2017 13:28:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Tue, 12 Dec 2017 13:27:52 -0800 (PST)
In-Reply-To: <20171212171155.15603-1-limon.anibal@gmail.com>
References: <20171212171155.15603-1-limon.anibal@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Dec 2017 13:27:52 -0800
Message-ID: <CAMKF1sqkTX3Hf7M2yCtoRri4zSTOFgTWHQS1X2jg0H=ia=HfvA@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>
Cc: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] recipes-multimedia/gstreamer: Add gst-validate recipe
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
X-List-Received-Date: Tue, 12 Dec 2017 21:28:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2017 at 9:11 AM, An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail=
.com> wrote:
> From: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>
> The gst-validate is a tool to run integration tests of Gstreamer
> components [1].
>
> This tool can be used along with gst-integration-testsuites (scenarios
> and media) [2] to test Gstreamer components on the target device.
>
> An example of test using gst-integration-testsuites:
>
> $ gst-validate-launcher --sync # get [2] uses git and git-annex
> $ gst-validate-launcher
>
> or
>
> $ gst-validate-launcher -nd # needs xserver-xorg-xvfb to run wo DISPLAY
>

perhaps it should following the same recipe naming convention as gstreamer =
1.0

> [1]
> https://blogs.gnome.org/tsaunier/2014/04/21/gst-validate-a-suite-of-tools=
-to-run-integration-tests-for-gstreamer-2/
> [2] https://cgit.freedesktop.org/gstreamer/gst-integration-testsuites
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ---
>  .../gstreamer/gst-validate_1.12.3.bb                   | 18 ++++++++++++=
++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-validate_1.12.3=
.bb
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb b/m=
eta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb
> new file mode 100644
> index 0000000000..8f5437641f
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Gstreamer validation tool"
> +DESCRIPTION =3D "A Tool to test GStreamer components"
> +HOMEPAGE =3D "https://gstreamer.freedesktop.org/releases/gst-validate/1.=
12.3.html"
> +SECTION =3D "multimedia"
> +
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37=
343"
> +
> +SRC_URI =3D "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz"
> +SRC_URI[md5sum] =3D "623edc479a1e5c1e76bd7e1cf8393253"
> +SRC_URI[sha256sum] =3D "5139949d20274fdd702492438eeab2c9e55aa82f60aca17d=
b27ebd3faf08489e"
> +
> +DEPENDS =3D "json-glib glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
> +RRECOMMENDS_${PN} =3D "git"
> +
> +FILES_${PN} +=3D "${datadir}/gstreamer-1.0/* ${libdir}/gst-validate-laun=
cher/* ${libdir}/gstreamer-1.0/*"
> +
> +inherit pkgconfig gettext autotools gobject-introspection gtk-doc
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

