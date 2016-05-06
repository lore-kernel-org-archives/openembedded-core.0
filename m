Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 55ECD731F2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 07:10:41 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id x1so47721954obt.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 00:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UEQZ/ZxsEbDAskp1EC9DKIxTWMTT44ay4YDaNA+Vw0o=;
	b=Bdc5HinFZoIZOgSu0qt1vFqX+z1dw8SOZlVHN52/bDyuBIvrugVe3KAkwdy/ZqvaeS
	QPvhMgevtmrsCQ+I70zPYUaDhtMYCkC4IFXxBSo+84ipSLGnjWiLlr1MPRcY05J0gcMC
	L/l8o+PBBakXqzagyftcOC9Ak15UfJIkxMAVWc9nnTwYr25/5wg01q0NpwR1wF/LatEb
	UnRswMg0BjEHZMk4z0FFrTJ5r+O2dVt3c4kE6f1Bv8DPYiATHdXiYQvrEpCLIgTRMdbf
	efiXeUrx+Vn8L5hbBbOKrqehqWeuqBA/Y6WB9eJeWfy9TbLygJ0wmwWePcHouM/jh4+7
	PS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UEQZ/ZxsEbDAskp1EC9DKIxTWMTT44ay4YDaNA+Vw0o=;
	b=VuanqF1WMHXN4NIKZY20Js2psjNmvqifDRPHgwxbscmCdxVIbsBpn6A1OsjeJqZWRy
	gZ6Mjh/1ZZEfu81kua6f2Gb+s+SVqK6ndtzjlrjqlHcC8hcQ5c9VROcM8iGYc5spQyCx
	RThjsUS4sQN02MMaIQ5SDazVLXUz9hMiKCs4lezBiCNR6iC85VqICxXjesJS2D9RWXZx
	Pmcl8GGgO+7LRmxyMbW2Isnb/39nEbKYA6FufvpummTNIFvXzs6G5T0f00XEJpJ1bYHR
	R+HvS+lNr3MxRxEDXt2hUTAqtX0FNDpLcLXWOrBkFcgNQSZ/alrRpnNfHZ+HRibOxA/0
	tGtw==
X-Gm-Message-State: AOPr4FWSPC9ocO1OdtgO3ZJz4NYlq7eY+T8LNdFENItRGuFxkU7RyMz3hy7vUu/A2J8qVpVSwkhcaOAlqO9ijil7
X-Received: by 10.60.62.4 with SMTP id u4mr4044821oer.1.1462518642427; Fri, 06
	May 2016 00:10:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Fri, 6 May 2016 00:10:13 -0700 (PDT)
In-Reply-To: <1462428966-21934-1-git-send-email-junzhu@nxp.com>
References: <1462428966-21934-1-git-send-email-junzhu@nxp.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 6 May 2016 10:10:13 +0300
Message-ID: <CAHiDW_Fbjq=_ZTc0n5Y7kUvAUm6SQbObDcvJ6nnEA0Bvr6fC+w@mail.gmail.com>
To: Jun Zhu <junzhu@nxp.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Revert "xinput-calibrator: fix XDG launch"
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
X-List-Received-Date: Fri, 06 May 2016 07:10:43 -0000
Content-Type: text/plain; charset=UTF-8

On 5 May 2016 at 09:16, Jun Zhu <junzhu@nxp.com> wrote:
> This reverts commit 6464bcd67d10ab9967ac83c27c413c1014be707e.
>
> If another GUI xdg/autostart app runs, the xinput-calibrator may be hidden.
> And touching the GUI app causes the wrong input data for calibration.
> So it is not save to run xinput-calibrator in xdg/autostart.

For what it's worth, I agree with this. If Koen or someone else could
explain why the Xsession script is not good enough for them, that
would help.

 - Jussi

> ---
>  meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> index a9de3d7..2812520 100644
> --- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> +++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> @@ -27,11 +27,7 @@ do_install_append() {
>
>      install -d ${D}${sysconfdir}/X11/Xsession.d/
>      install -m 0755 ${WORKDIR}/30xinput_calibrate.sh ${D}${sysconfdir}/X11/Xsession.d/
> -
> -    install -d ${D}${sysconfdir}/xdg/autostart
> -    sed -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,' ${S}/scripts/xinput_calibrator.desktop > ${D}${sysconfdir}/xdg/autostart/xinput_calibrator.desktop
>  }
>
> -FILES_${PN} += "${sysconfdir}/xdg/autostart"
>  RDEPENDS_${PN} = "xinput formfactor"
>  RRECOMMENDS_${PN} = "pointercal-xinput"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

