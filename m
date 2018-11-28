Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 25CA86C502
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 10:26:10 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id c9so3405313itj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 02:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gUKiGnOVmZeMosLJpuzOXoIT354vyp7r2WqELG3WhxM=;
	b=T+E9BsLrD23lnpEc5aAmhkvtuyfAp7/WubRBmtChppnuxtbnIdzRfiCv41j1wnZVGq
	ia321pEWeRA+Z/YlaXdeuvjWr8zlBAZY31HVP6GkWpemLovd+xfI5x7OnFIDNLourhad
	29nCOxW9sKcb9eL//pwA2gKqtcVQ0O6J45ctvSjYmcOoLiZjLSvgDj9xpSXB9+Xj2ZR6
	qOPINLRKRYret/d4yPWrzD54t8qeydLiziKHM1Skezhg8pAroWyiYtC5KyYzk+uiGAEK
	KGvhiH0KgRYV6uSo/dk+MFdo+q7k5Z87UNcWz1nlRDwuVv3qBkOIXZ1zeWm3CHvMePvi
	zs4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gUKiGnOVmZeMosLJpuzOXoIT354vyp7r2WqELG3WhxM=;
	b=eXbxHEZy5yBTYb4s+RJJ0iW7V4fuZ2E39ycVYACeVCDS5jUcFpih+4nhxpjkSfA+m0
	7q23S/EmIb6sneKDQ9wcM0OeUCxg2XFFUrf2NGUVDHMfdKYFYLOJr0Ki1kNiy5K7euI2
	ljsuzEdaUBhs1nELvONqEqWMKRkyDi0WpZ/pBHSQ5Oe6EDT4zr2V+UdOa1093MWfKFrS
	3Im1v47hV5+pPucBOrnnux8Kiywij4BO/T7n19Jv3C1dUlJ7cJWIMSMTzlRLWCASmgLK
	bIOZA0imdAVwlOywizNVYCDMpuZHCkb6VSytqVHVqLZBoeZp+yIE0rDSCU33+/KkP4/H
	MDoA==
X-Gm-Message-State: AA+aEWYHSon7uyULXvrBIOHODEdJvp0AR5M30/bJLxsTEzF071AfGfv7
	6+XH/+4WBgFSH3xNHpua0uuCnuRlTVblWw5wf+FL2w==
X-Google-Smtp-Source: AFSGD/UKy/FvuTyrxXw1GJFFfQtKqtw2dw2w91No/Xliw7gJ8UuJlpR/griXpcY1dmiSpRVXmAFE/MpYqTmnYzedI5U=
X-Received: by 2002:a24:ce45:: with SMTP id
	v66-v6mr2253396itg.26.1543400772073; 
	Wed, 28 Nov 2018 02:26:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1543215301.git.Qi.Chen@windriver.com>
	<5e62cfa7835011994fbfbd9b0f1cfd22b0b53bf3.1543215301.git.Qi.Chen@windriver.com>
In-Reply-To: <5e62cfa7835011994fbfbd9b0f1cfd22b0b53bf3.1543215301.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Nov 2018 10:26:00 +0000
Message-ID: <CAJTo0LaGc91uHa4gufXz6GKqdqUsW2oHfNHSaz2CjEVdLc-beQ@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] netbase: add entry to /etc/hosts according to /etc/hostname
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
X-List-Received-Date: Wed, 28 Nov 2018 10:26:11 -0000
Content-Type: text/plain; charset="UTF-8"

What if the hostname entry already exists? $sysconfdir instead of
hard-coding etc.

I can't help but think a better solution would be to simply move
/etc/hosts to base-files, so it can be updated at the same time as
hostname.

Ross
On Mon, 26 Nov 2018 at 06:51, Chen Qi <Qi.Chen@windriver.com> wrote:
>
> We default hostname to ${MACHINE}, but it's not in /etc/hosts,
> resulting in commands like `hostname -f' failing due to lack
> of entry.
>
> So add entry to /etc/hosts according to /etc/hostname. We do
> this via pkg_postinst because hostname is set in base-files
> recipe.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/netbase/netbase_5.4.bb | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/recipes-core/netbase/netbase_5.4.bb b/meta/recipes-core/netbase/netbase_5.4.bb
> index 5ab0c58..384c430 100644
> --- a/meta/recipes-core/netbase/netbase_5.4.bb
> +++ b/meta/recipes-core/netbase/netbase_5.4.bb
> @@ -23,3 +23,12 @@ do_install () {
>  }
>
>  CONFFILES_${PN} = "${sysconfdir}/hosts"
> +
> +RDEPENDS_${PN} += "base-files"
> +
> +pkg_postinst_${PN} () {
> +       if [ -s $D/etc/hostname ]; then
> +               hostname=`cat $D/etc/hostname`
> +               echo "127.0.1.1 $hostname" >> $D/etc/hosts
> +       fi
> +}
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

