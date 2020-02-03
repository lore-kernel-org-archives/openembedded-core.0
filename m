Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8C76B60F29
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 15:34:22 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id g3so6003891qka.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 07:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qaLXkPEMhLzjy9E+o/JbdcBYuRJdJHP8tj3Cp1fIG2U=;
	b=Az+JWGAUhSM8ZQR8KaCgt/tfOFW3GHnpS3fdlSxyxFMdhLlWm92K7DNPMQZErd+cIG
	u6r0+4Q+aL7PkLiJomQMfGdFjjVc+Wxc7qRNct43q8bD6hvNFomHgmUdJ1RnRksVzj0V
	4g3R22FT25gk+ZNw/E4AB6SFTooc00kNeBouOAQET1jxbBqp6lI3ZOi6fG67UIJmudTT
	qe8yG3k4+NLBjf3KPD50AZ2CZsqC5Eb3rgAk4WGrRb6m1WE3jelXWQ4+9u5wsQf0ScHX
	cw+FKTSkgH0iQTgiCPE8eKYjC4TCND7Ac/Ownk9jWtxJ4m9RHZU4JckXBeoK/usFPFbI
	j0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qaLXkPEMhLzjy9E+o/JbdcBYuRJdJHP8tj3Cp1fIG2U=;
	b=pYGGVQjnWIBtuGj5oTLXE2uRns9MIcrLrk6o30jsK9ZOb0s1dFjgVzIswsvEyNDvUw
	RpkUXqCC0udIlqczq9ZAX/nscTm53//gQJCTUJqAMiW1xhYLH7FgaGmrLmOFgLxq6bP8
	UOhRfb6OkcqZ+x7N4su3l2m6UVQ9A/ommxssB1QCUzQlNAW4LoX/7YPt86bJloMCtAPB
	LT6oMshVi3NUbykXrnWaxALDmGi6kRv/PvkGzTlvM3T4+dSugUDL55spWqxfPwyWCy2H
	DEHq9iuXG9Yr1Sjy4hA8D0YmX7ebaOXFb6H/iq9315EfUN+BMGoVrdXJWbjefH04jBjz
	yteQ==
X-Gm-Message-State: APjAAAUz+VmY8NT/ULC6s5plRpQqAPAJZBYWqhsy1iZmDv6cM43Nr0b9
	ZiWnDSe2ABLBidVYo1LEgsvQjS7KqHynMoVIY36k5Eu/VsI=
X-Google-Smtp-Source: APXvYqwsW3hCHmP8D4gJmzj681kvUt3xrOoccG4Np3vIzJ0FAxBWfAxAAMWPQs9K5qRa5JWIOMVbaEX7obHSGXhi02g=
X-Received: by 2002:a05:620a:6b8:: with SMTP id
	i24mr24755624qkh.9.1580744062817; 
	Mon, 03 Feb 2020 07:34:22 -0800 (PST)
MIME-Version: 1.0
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
	<20200129090738.1398-6-alex.kanavin@gmail.com>
In-Reply-To: <20200129090738.1398-6-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Feb 2020 07:33:51 -0800
Message-ID: <CAMKF1srnJBbYKttY1PEgr2gAjRxUXXjvmjFcMgkMteHYaLxgEg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/24] bison: upgrade 3.4.2 -> 3.5
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
X-List-Received-Date: Mon, 03 Feb 2020 15:34:22 -0000
Content-Type: text/plain; charset="UTF-8"

http://errors.yoctoproject.org/Errors/Details/368059/

On Fri, Jan 31, 2020 at 1:34 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/bison/{bison_3.4.2.bb => bison_3.5.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/bison/{bison_3.4.2.bb => bison_3.5.bb} (90%)
>
> diff --git a/meta/recipes-devtools/bison/bison_3.4.2.bb b/meta/recipes-devtools/bison/bison_3.5.bb
> similarity index 90%
> rename from meta/recipes-devtools/bison/bison_3.4.2.bb
> rename to meta/recipes-devtools/bison/bison_3.5.bb
> index 46f0f908dd4..3d8f6579b9e 100644
> --- a/meta/recipes-devtools/bison/bison_3.4.2.bb
> +++ b/meta/recipes-devtools/bison/bison_3.5.bb
> @@ -17,8 +17,8 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
>  # No point in hardcoding path to m4, just use PATH
>  EXTRA_OECONF += "M4=m4"
>
> -SRC_URI[md5sum] = "d1ceb9dfde2d03b24a4c1137f7f1b572"
> -SRC_URI[sha256sum] = "27d05534699735dc69e86add5b808d6cb35900ad3fd63fa82e3eb644336abfa0"
> +SRC_URI[md5sum] = "c0230be066069f33c8445766833f3205"
> +SRC_URI[sha256sum] = "55e4a023b1b4ad19095a5f8279f0dc048fa29f970759cea83224a6d5e7a3a641"
>
>  inherit autotools gettext texinfo
>
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

