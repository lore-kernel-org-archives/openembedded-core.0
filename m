Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7DB6057B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 20:59:34 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id 34so2734045qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 13:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=JnhA8EeU6GOeFkOKHheTREBQbc1up5e06C1ZxjVQC6I=;
	b=bTcKtZUyH6Kjh0AFvv44vHug3wuYfyp1MZWvxzlSCYqyExscKFtpVfOgLz9W3q4wQd
	z+mtcrHB5P1Zu6piH0x/g/s1CUIQDqS659J6EcE1PRuvuEcv/MQeSfpM+geRnw/JkPBQ
	zBzq/K0635YAoUN+hGXtRgRoxCVDo/m8/WIGEP/05f+EMUs++OAQq0n+hV0DSEL3Q4Ue
	0vnEbXV9K6uN4AJS/CHgyDtaD2mBCadeeZm4a9ooFYpMLUZnMXUYQakhbf8/MulLfOyI
	MHVfzvsXOf9ugpc/Vmsshy6CWmkPrmqB5EaenDsklcoHBkEGbxZF+GKM4o4HX0zlItED
	2qQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=JnhA8EeU6GOeFkOKHheTREBQbc1up5e06C1ZxjVQC6I=;
	b=XUD7nmK5zLWDSrt3M9HBiN/6D4vFKk6Np45aYjULXAqZ5IApTvtwdOoHyM4G4oe/wE
	qmWGtAawqOSt6xV2JvmLa59xvcP4MXYM7vHeljpdpArI3szssM3icHVKtFqqCGdet/MX
	YjTn8xh+v5AFkmIJ7S3Z8lEygguFhHKXgfTSrWkhl7+DRhpsObMJln2nROz8+4X2z2mx
	6L9BSN4SSHZjzTxLkrkOPS7EGHnCIyUfVDHjeVIrJTGaPZjezYh0WJLhuabFp8WNnC2u
	cPpJf6z2Ubxtst2zDb8TaL32KnmpuRd9Sp4tBVJbnZuJEpeIzVh3llZpazSwTBMAkb5g
	Kcqw==
X-Gm-Message-State: ALyK8tI/Hw2eaOLca/KcRg2jApzwHyB9Ldm95zlEgdNExnXV/o5nhWLaXzw/ndfMFPt7o95FiiCfDhf3r2w/rw==
X-Received: by 10.140.84.231 with SMTP id l94mr839567qgd.44.1466024374827;
	Wed, 15 Jun 2016 13:59:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Wed, 15 Jun 2016 13:59:05 -0700 (PDT)
In-Reply-To: <1465829181-23218-1-git-send-email-urs.fassler@bbv.ch>
References: <1465829181-23218-1-git-send-email-urs.fassler@bbv.ch>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Jun 2016 13:59:05 -0700
Message-ID: <CAMKF1so=Bd2E-uJGr5OgJTg+DAFOxiQf=5xZGhe_KBFyEvQEXA@mail.gmail.com>
To: =?UTF-8?B?VXJzIEbDpHNzbGVy?= <urs.fassler@bbv.ch>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xinput-calibrator: add missing dependency for xinput_calibrator_once.sh
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
X-List-Received-Date: Wed, 15 Jun 2016 20:59:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2016 at 7:46 AM, Urs F=C3=A4ssler <urs.fassler@bbv.ch> wrot=
e:
> xinput_calibrator_once.sh uses xrandr to read the resolution but is not i=
n the dependency list.

this is ok.

> Busybox is unable to parse the corresponding line, hence depending on bas=
h.
>

Can you dig more and see if this can be un-bashed ?

> Signed-off-by: Urs F=C3=A4ssler <urs.fassler@bbv.ch>
> ---
>  meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_gi=
t.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> index ac5b70c..98ce7ee 100644
> --- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> +++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> @@ -34,5 +34,5 @@ do_install_append() {
>  }
>
>  FILES_${PN} +=3D "${sysconfdir}/xdg/autostart"
> -RDEPENDS_${PN} =3D "xinput formfactor"
> +RDEPENDS_${PN} =3D "xinput formfactor xrandr bash"
>  RRECOMMENDS_${PN} =3D "pointercal-xinput"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

