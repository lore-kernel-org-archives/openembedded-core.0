Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2D0967557F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 18:33:14 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id 74-v6so470623uav.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 11:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VO9THWYyYaSB/I0W7W/v4an6goj3HvJXxzEo5ZBip4c=;
	b=A2saVxpT+u4YgyWAdcKjGNCzCBH5sCTtY7Cd4sU8n907HeARkeCqRfP2yLemrQ1xfl
	Ktj22/72B0g7WzDyUzqhbaLzkHUN5ZtIN4/Wr9Mly3KS7oRthLImw7ZEU+WvsbUs+TWL
	xRnPP0GIoP99kHK+ULg15sp/Hf1bLrPMQokf0gG3eNgab97LDCzZQeU6x44rV751NWLk
	hquR7wgvJipZ/IG7g1CCo+ZCpunUirShta/niHiGHsiGjxMU7gJgSddd3GAec3Wceiyi
	fTKzRFQIT7NFUWMnI4s+An4eRwLjM0uPIpSAlxglSdqp57XeEx6VM3TY7pyBYSl2lske
	lRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VO9THWYyYaSB/I0W7W/v4an6goj3HvJXxzEo5ZBip4c=;
	b=sdmuBslk63w1UhD77HWRMay0o2Muy8KZ2Hq3IJbozXcRp5LAObJHavn6zBqH9o5W4s
	uwbBafRj4ReIFvSsM/wIYG3K0/MdXUg6tp8Muloy0leHdUO7nOK6TT5jboBxWhN262yy
	hM0K0T9Ewc94If/Ub6uiUV82Cf3zL83dyUXuklZaSgmphjx67qQKacIq+Kl+qG1EfLA0
	4PyicVU6AlChez0FBbczvS+Slo5B8jqxx00lqBzHjrr0/H5YamyMR4d96Ox43+OHmnB+
	Y05jO+f2V2WPMRBj5v4+yc0TefcotFEg9hCGMPGakIfaIoJDos5VQtrFul9JhONRI5CS
	/tuQ==
X-Gm-Message-State: APt69E3LmY2ni08MXJ5/SrmHGR7ENyOBKCFSYfwCIO9g+rsl2Zkji/aZ
	jTY61UmXndzx83UEtesmFqgs5+uV1881VCFdjFdHHA==
X-Google-Smtp-Source: ADUXVKLGCuc1+YloAZ70P9TiTZwM5BwRLUnnrcMuOBZ7wl4RjFAa+ZvkCrupGaFnaqe80B0iNtUjDLillLOLLdY/fjM=
X-Received: by 2002:ab0:50ba:: with SMTP id
	c55-v6mr12114853uaa.150.1529433194854; 
	Tue, 19 Jun 2018 11:33:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Tue, 19 Jun 2018 11:33:14 -0700 (PDT)
In-Reply-To: <DB6PR0601MB2133CEC1B8D8FAB2DFC46118C3700@DB6PR0601MB2133.eurprd06.prod.outlook.com>
References: <DB6PR0601MB2133CEC1B8D8FAB2DFC46118C3700@DB6PR0601MB2133.eurprd06.prod.outlook.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 19 Jun 2018 11:33:14 -0700
Message-ID: <CAJ86T=UUz7_m+P1cWAk8tNT6Y=Cmme-2Jy3b4q8ZUkHzJwi1Gg@mail.gmail.com>
To: Tobias Olausson <TOl@hms.se>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv4] image_types.bbclass: add optional size to ubi vols
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
X-List-Received-Date: Tue, 19 Jun 2018 18:33:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 19, 2018 at 8:09 AM, Tobias Olausson <TOl@hms.se> wrote:
> From 1d15f0d3c516351e6540a912367bcb22f9c25bbf Mon Sep 17 00:00:00 2001
> From: Tobias Olausson <tol@hms.se>
> Date: Mon, 18 Jun 2018 15:01:53 +0200
> Subject: [oe-core][PATCHv4] image_types.bbclass: add optional size to ubi vols
>
> Instead of hard coding the ubi volume to be just large enough to fit the
> root file system, one can use a variable to set a preferred size.
>
> Signed-off-by: Tobias Olausson <tol@hms.se>
> ---
>  meta/classes/image_types.bbclass | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 00a00d318f..2a0a7994c9 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -164,10 +164,22 @@ multiubi_mkfs() {
>                 local vname="_$3"
>         fi
>
> +       # Set UBI_VOL_SIZE (for regular ubi) or UBI_VOL_SIZE_vname for multiubi
> +       if [ -z "${vname}" ]; then
> +               local ubi_vol_size=${UBI_VOL_SIZE}
> +       else
> +               eval local ubi_vol_size=\"\$UBI_VOL_SIZE${vname}\"

This looks odd. Presumably it (and the multiubi code from which it's
derived) relies on the _<VOLUMENAME> suffix variables
(MKUBIFS_ARGS_foo, UBI_VOL_SIZE_foo, etc) being exported from bitbake
to the shell?

I didn't find any discussion about that from when the original
multiubi code was merged though. Are there any multiubi users who can
clarify?

> +       fi
> +
>         echo \[ubifs\] > ubinize${vname}-${IMAGE_NAME}.cfg
>         echo mode=ubi >> ubinize${vname}-${IMAGE_NAME}.cfg
>         echo image=${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs >> ubinize${vname}-${IMAGE_NAME}.cfg
>         echo vol_id=0 >> ubinize${vname}-${IMAGE_NAME}.cfg
> +
> +       if [ -n "${ubi_vol_size}" ]; then
> +               echo "vol_size=${ubi_vol_size}" >> ubinize${vname}-${IMAGE_NAME}.cfg
> +       fi
> +
>         echo vol_type=dynamic >> ubinize${vname}-${IMAGE_NAME}.cfg
>         echo vol_name=${UBI_VOLNAME} >> ubinize${vname}-${IMAGE_NAME}.cfg
>         echo vol_flags=autoresize >> ubinize${vname}-${IMAGE_NAME}.cfg
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

