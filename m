Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2BEEE600E9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 23:22:46 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id g16so1616032qvz.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 15:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=y7N4++VIkXuKmoq/DwK16TbYVRzeDdkRoq/m5W6WwqE=;
	b=sZFLy6WQkiXgieupYul00w4p09BpCOqXw8tnBkQw0kk79sjb/FxwQifaFbAAa0WIaC
	+URq1Z9ecK6PX8xloITvL5UtS4X/oDSH1sxZu1LvVdR2hwGozBYvd1bUsC12NWMKjz7L
	sZFiFo6U6nmxxb8POz8s17ngA5Zj7Pe8KgdHBluPQJ+t1+8DTFf8rgFqwPF/hJUJlZkQ
	qybZsggz/oI+cqXp3VIgksK9Vb4S9SmkcP0Zypett0qUfWR4gFa5FKHaQcOtGyHlbD9n
	vtm9KAR932/Txz1C5XPNnodRhi1HODLsLv+UDLJi7lza0irNK8EYhQrJFPDAx4ijk20j
	W/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=y7N4++VIkXuKmoq/DwK16TbYVRzeDdkRoq/m5W6WwqE=;
	b=WF20IORmrcOPWHbXWzTUDPEreVZ1KiKNDhF+KEMJf0Zkc1+aiXc5Zrxt8ULgzGcMfB
	xv0kFt8nfs67vEFr6iiZiFQARB3I0EmDzupx9B01xtKVz8RguAsaKnTiYAGiN+hml6UK
	rqbqWKifCS6+/YZ/1RwhKzajnX+JOCSUgquLfv7YywAupzbsokn8nNUjxC2c66n9p1yj
	5CeTeJc1R+vWfGJo90DMI7I5Jeskdw1AllA81qq6nnTVdaIXEo+lIipLnc3abDILYFEo
	rp7iJBvst3ALs7y85VsE4zRt9QPS0hr465SDKK/o1PJNr1HtyDS5UecEuPNW9cb8P0f/
	CqGQ==
X-Gm-Message-State: ANhLgQ0gNcRGcVbYuiZ+IQKKEJ0JcWNndfZ81nk3mE1bgm4NmJDmkC9D
	MdJ9s1bJAgiFrfk8Vo4xYpzNyZ1TL/oiTnHV742bH228
X-Google-Smtp-Source: ADFU+vtYsqn7fyI872Tx+ezLohxH8Fm5yqKLapvvQjd02SAgo6mHJ7rI7v4i1N8cLy0+ZP+gG8SidOKFDFtsfgbqjuk=
X-Received: by 2002:a05:6214:6f0:: with SMTP id
	bk16mr4177244qvb.23.1583364166720; 
	Wed, 04 Mar 2020 15:22:46 -0800 (PST)
MIME-Version: 1.0
References: <20200304222447.1787-1-jpuhlman@mvista.com>
In-Reply-To: <20200304222447.1787-1-jpuhlman@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Mar 2020 15:22:20 -0800
Message-ID: <CAMKF1so0sueuAe73mCuHkU99s9a70EiXDg+5P3CpRE3hbAYicQ@mail.gmail.com>
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdbm: add depend on readline for consistent builds
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
X-List-Received-Date: Wed, 04 Mar 2020 23:22:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 4, 2020 at 2:25 PM Jeremy A. Puhlman <jpuhlman@mvista.com> wrote:
>
> From: Jeremy Puhlman <jpuhlman@mvista.com>
>
> Whether readline is installed on the build host or not
> influences the way gdbm builds. Depend on readline for
> a consistent build.
>
> This fails to build on a system with readline, and using
> the buildtools-extended installer.
>
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  meta/recipes-support/gdbm/gdbm_1.18.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> index 7e2efe3c9b..5326184181 100644
> --- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> +++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> @@ -15,6 +15,8 @@ SRC_URI[sha256sum] = "86e613527e5dba544e73208f42b78b7c022d4fa5a6d5498bf18c8d6f74
>
>  inherit autotools gettext texinfo lib_package ptest
>
> +DEPENDS_class-native += "readline"
> +

shouldn't this be readline-native

>  # Needed for dbm python module
>  EXTRA_OECONF = "-enable-libgdbm-compat"
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

