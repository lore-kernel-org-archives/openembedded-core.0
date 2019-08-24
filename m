Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8D1677ECB9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2019 16:55:42 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id d79so10923870qke.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2019 09:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OHhiVLhj9I0Yh6G84SGJuzZowYAc7TciooIzoOsAbWs=;
	b=MVx4KIUOQfTGd0SrTFKU/DfeC2MsILIwftpAv3lG7mHkpQkq/BUkR0qNUrCexlpHeD
	Z9gIUD+fYBWpYU4RslJMLFS7FlysvLJP3fqGYQx2xioSo/hmQd8T4RfjV9TTYKfzmml1
	b3owyS+jP/IoWv9gK/9fVsBhE5O72PKDbQbvQlCQX+8UVoEon/Cgb6m90NzSflk6aQ/M
	Cgw9B0hgQprElHzGeNjFl158Ja9DrGlPo/hysA5vU2bfGSyocMuY8KSOyyZ2OMCIzKMv
	ptCtRv1pRKaxccp52A1uOPEXjJaAmryNE/zCcBPmN0c8MJ4r8HmgcDKTf0XKiHWvztDJ
	rUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OHhiVLhj9I0Yh6G84SGJuzZowYAc7TciooIzoOsAbWs=;
	b=fc55cSXuJLxKbOsEAWRMfMruRgJtEjUVU6cR7TsuaS5wC2nD/QKdW+BWV6/VbP50aQ
	rHAGyVW19vViKOdhO6k2EsVUXMXxH91PcIP2xEfp/Inc4/fLsEipGcYUDu3/Om0s/1oa
	dE73aFzUaZcoWq+3Ak43gppVxEsao9fDEHO9bY/ckoUQKxvrjHtaqpoPjwjRlk3IDjJE
	3q3DKMsfdyyDI2vbVc4/hvAZTEEqPWybONzjH9eLdhObARDO9YaYFVFsoJVNdkrwFp87
	FPLVxVAeiGr4LBl8GBLHdS+cS/36r5NE3UcrWQ/r/wPn2osO1Wn2D9jOHSMWfC+/PkBl
	kzpQ==
X-Gm-Message-State: APjAAAVR1KgNufdq/eJ92vZvIK19CmXvQufEJBAvOSZU3GWjap99AzVD
	DX0CFvGDDT0HkZyix4bEE3IjMyOiyM7zSnWllAI=
X-Google-Smtp-Source: APXvYqxch0+AQjsqcrPBRa18uI2k5OoPAyaNc8Wf+e8yyZgO9rnTWAboWaBCFxKckxDGYcwmfzWDUkKyfW5X7H7Bg78=
X-Received: by 2002:a37:b481:: with SMTP id d123mr9230083qkf.71.1566665743106; 
	Sat, 24 Aug 2019 09:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
	<1566593504-21918-11-git-send-email-armccurdy@gmail.com>
In-Reply-To: <1566593504-21918-11-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 Aug 2019 09:55:17 -0700
Message-ID: <CAMKF1sqv7sLvUf15w+DxcQnMWoiUqjfef6b-9mnJWfb0MQ1nFQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/13] dropbear: don't create invalid symlinks if ssh, scp, etc are disabled
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
X-List-Received-Date: Sat, 24 Aug 2019 16:55:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 23, 2019 at 1:54 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-core/dropbear/dropbear.inc | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
> index dcbda74..7269888 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -70,8 +70,13 @@ do_install() {
>         install -m 0644 ${WORKDIR}/dropbear.default ${D}${sysconfdir}/default/dropbear
>
>         install -m 0755 dropbearmulti ${D}${sbindir}/
> -       ln -s ${sbindir}/dropbearmulti ${D}${bindir}/dbclient
>
> +       for i in ${BINCOMMANDS}
> +       do
> +               # ssh and scp symlinks are created by update-alternatives
> +               if [ $i = ssh ] || [ $i = scp ]; then continue; fi
> +               ln -s ${sbindir}/dropbearmulti ${D}${bindir}/$i
> +       done
>         for i in ${SBINCOMMANDS}
>         do
>                 ln -s ./dropbearmulti ${D}${sbindir}/$i
> @@ -101,7 +106,7 @@ do_install() {
>  inherit update-alternatives
>
>  ALTERNATIVE_PRIORITY = "20"
> -ALTERNATIVE_${PN} = "scp ssh"
> +ALTERNATIVE_${PN} = "${@bb.utils.filter('BINCOMMANDS', 'scp ssh', d)}"

This perhaps is better done via packageconfig maybe. {S}BINCOMMANDS
could be turned into packageconfig logic and

>
>  ALTERNATIVE_TARGET = "${sbindir}/dropbearmulti"
>
> @@ -113,3 +118,5 @@ pkg_postrm_append_${PN} () {
>          rm ${sysconfdir}/dropbear/dropbear_dss_host_key
>    fi
>  }
> +
> +FILES_${PN} += "${bindir}"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

