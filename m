Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
	[209.85.210.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9C3D0745D5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 11:10:21 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id i10-v6so9027277oth.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 04:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=esU7vlWMeHJI1ZdS4H8twxWIPZ9BV7rA+gJ6ZxSSKLk=;
	b=jsweoQuYTArg5U0zth5V7d0UQs48iLyii5tRzME1014pHupnC0ku7RDNtRmBrveOFF
	9DklyrolEXXDxrnKinqG0+2RNHHFOXBWP/o1zVPeSvyVWK8DpK45V2STmX2e9vbWu15E
	rKGECyscpPUrHNTTFnKk/+n0YoVdb4+jWOvv+9iNSbmHUCrQEiMAsXbnNdXxsobnydUV
	hoAYuEsaLiI8MhEalsEvShcGh1dWRjABFv6tajJKMwOVbCJLnpzzwih7tYT8Md7npcj5
	XxJmOF/aNb7L3wbN+Z7Wut0eAbAzEpIgCgfAn3F5flyK/dKvFKhh3Ny6BltB1aqk1Aki
	n4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=esU7vlWMeHJI1ZdS4H8twxWIPZ9BV7rA+gJ6ZxSSKLk=;
	b=uEMzE/73KN9vbSJp5brGDwUUBpG0VZ9O6N4zJ61mFQmx2LlDl9twDM6ZgO/BXc9nFI
	yv8IGe0DBTA+rcuDZk1w5fzK6wnHrd/3jXfZwKKoFPntSKgaSsMKbdPa4+gkoZ0v0kxq
	LTCJ1dUdQy0+7mfw2DBLobfviCeGBsrpnRWsq6wlB8H+QgDpcgQ0jImHrm9X7czHFOdS
	yPtZ5vjMb2EAN43X19iIWBnYNN2cVOi1Ss1bPR5ZsaAFexoaznfAyi06k5L5JiDAY18o
	hSY2XjAug1s/wbUubbN3gCQeeW/KLruFcWhMpVid60xWVJIWcCGA5LUZo9P+E/Tew4Rf
	8YAQ==
X-Gm-Message-State: APzg51AHqDeOULvDLXUVMiMFePjPGXTZ3NqhBQRo3A3RTGJqHqmL0f7s
	n3I75AhKJuPq4S2pvgvqLGD25KmDcVeLsbcmEOjL8w==
X-Google-Smtp-Source: ANB0VdayF9WXnMJCfYoQAgvoKBUoL8gFyrOpsOUh81kkeQxHPlDM2RJApllFPEX7cy/PUI8Y9N65EH+Sx+UD1irkhoA=
X-Received: by 2002:a9d:3a5:: with SMTP id
	f34-v6mr22644747otf.343.1537441822311; 
	Thu, 20 Sep 2018 04:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <1537266969204.31967@mentor.com>
In-Reply-To: <1537266969204.31967@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Sep 2018 12:10:10 +0100
Message-ID: <CAJTo0LbCJwoD8Rc4uLffTx5P0enQxppY4-5YmGYPDbhahU8j8A@mail.gmail.com>
To: "Belal, Awais" <Awais_Belal@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc-package.inc: correct intention for deleting /usr/lib as needed
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
X-List-Received-Date: Thu, 20 Sep 2018 11:10:21 -0000
Content-Type: text/plain; charset="UTF-8"

Can you resend using git-send-email, as this patch is encoded in HTML.

Ross
On Tue, 18 Sep 2018 at 11:53, Belal, Awais <Awais_Belal@mentor.com> wrote:
>
> In case the baselib is lib64 we would want to delete /usr/lib
> after removing the /usr/lib/locale dir and the implementation
> wanted to do that earlier as well but the fault was checking
> an already removed dir (/usr/lib/locale) before trying to
> remove /usr/lib as that check would always fail.
> Now we simply try to delete /usr/lib after deleting
> /usr/lib/locale to make sure it deletes cleanly and is empty
> at the time of deletion.
>
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>  meta/recipes-core/glibc/glibc-package.inc | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
> index 9ea41b7..22a59d2 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -207,11 +207,10 @@ do_poststash_install_cleanup () {
>      rm -rf ${D}/${localedir}
>      rm -rf ${D}${datadir}/locale
>      if [ "${libdir}" != "${exec_prefix}/lib" ]; then
> -        if [ -d ${D}${exec_prefix}/lib/locale ] ; then
> -            rm -rf ${D}${exec_prefix}/lib/locale
> -            # error out if directory isn't empty
> -            rm -f ${D}${exec_prefix}/lib
> -        fi
> +        # error out if directory isn't empty
> +        # this dir should only contain locale dir
> +        # which has been deleted in the previous step
> +        rmdir ${D}${exec_prefix}/lib
>      fi
>  }
>  addtask do_poststash_install_cleanup after do_stash_locale do_install before do_populate_sysroot do_package
> --
> 2.7.4
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

