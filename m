Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id B61E06FFD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 15:06:43 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id w25so3257359ioc.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 08:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=blYfoSABmbYCwYjW++0R0MKMAv06QXd86JnRehEbSxA=;
	b=NhsmxSPg2M+cfIaIYrO59DArKXo48eD9xdlPfpRjjSvscqnw633/UYys+Uc1iO5NJL
	vq199YJUJjkxgWC3tGClB0/JlcdTxmu8ukOhArIryzCK+O0vXpXS5XUvI/cO0vaXPmln
	p+oCcySyVANvE6tbfsQjbSFMKP61OoRvggQ53CNQhw2QvieysOFQvkWQLCjMUXs2BpeX
	Yd3Y5TUgFJjQ4FpwUSuSD3myf170gF3/dPQA8/SSAE5fWuASNTXTfRz45adlxcU9Yvx1
	q1U0phogdt5/MADZG//EeMgJeBr2S7e/QMpyY9afVVXBd1dCfdjGqMctdgS7cmkRA4Yg
	u9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=blYfoSABmbYCwYjW++0R0MKMAv06QXd86JnRehEbSxA=;
	b=KUSJ8o5TqexR+ERjmLuKi9mFjxh8Ie1Bs1umBetmLMFViCeDnlqvWrwArLLyJIMsXS
	4JUaNp63uOYoUaCL66UzNI8sh48VQgsKQJ6wjTU+a6miapoGQK3d8kz3FcV33b+m/B9G
	+als32jLSXFWsg5S6fUCfpDqxSx2PZN9sVDy2QqVSCAqwjMnzkitTcIQMwhr6ySLXjD7
	PaHccUZ0gaAvnD2zBTKjY14C5uNI2RbVfeQJHZY+L+9rUS21gJ4WtCcW+JsUJCU7KsJH
	63+mfm+z2VJk4+1jdm/XH8Ca9HkYGi8jWWr1uVygNI1Jyb6CaZ6BwPWLmsaV1Negp52o
	+lew==
X-Gm-Message-State: APjAAAVjFCWMUgbjwIyqcH0V+3mwlA9R3QC8MTlrPs7b3/faxctvDKSn
	mwJm4GKDG4e/dl07oDw1Fce1GTEkqcWXICGkVn/TkA==
X-Google-Smtp-Source: APXvYqxLmJEOkqlEGeOy0f52QQfTPd6WDQNBDRqPjpbNzyHR8z9PHE/TK8zbtYpBOMNFYbuPePI39G6DuHiPpwDJLHk=
X-Received: by 2002:a5e:9701:: with SMTP id w1mr5708275ioj.294.1561561603791; 
	Wed, 26 Jun 2019 08:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <BL0PR04MB46592E859DE13D9E3EB43234FBE20@BL0PR04MB4659.namprd04.prod.outlook.com>
In-Reply-To: <BL0PR04MB46592E859DE13D9E3EB43234FBE20@BL0PR04MB4659.namprd04.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Jun 2019 16:06:32 +0100
Message-ID: <CAJTo0LZCnT8ZGHT9UpXGn0YidReLe5bx4uBhED2p5cvQYU58eg@mail.gmail.com>
To: =?UTF-8?Q?J=C3=B6rg_Hofrichter?= <Joerg.Hofrichter@ni.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: fix build with resolved enabled
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
X-List-Received-Date: Wed, 26 Jun 2019 15:06:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The patch doesn't have an Upstream-Status tag, and at no point do you
explain in the log that this is for musl, and results in resolved
being enabled in musl builds.

Ross

On Wed, 26 Jun 2019 at 09:36, J=C3=B6rg Hofrichter <Joerg.Hofrichter@ni.com=
> wrote:
>
> From: Joerg Hofrichter <joerg.hofrichter@ni.com>
> Date: Wed, 26 Jun 2019 10:30:34 +0200
> Subject: [PATCH] systemd: fix build with resolved enabled
>
> Signed-off-by: Joerg Hofrichter <joerg.hofrichter@ni.com>
> ---
>  ...e-also-add-missing.h-needed-for-musl.patch | 25 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_242.bb      |  2 +-
>  2 files changed, 26 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/systemd/systemd/0026-resolve-also-a=
dd-missing.h-needed-for-musl.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0026-resolve-also-add-miss=
ing.h-needed-for-musl.patch b/meta/recipes-core/systemd/systemd/0026-resolv=
e-also-add-missing.h-needed-for-musl.patch
> new file mode 100644
> index 0000000000..9c29944511
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0026-resolve-also-add-missing.h-n=
eeded-for-musl.patch
> @@ -0,0 +1,25 @@
> +From afddcc9f6686b85380f2c4ac15f901012b725b1e Mon Sep 17 00:00:00 2001
> +From: Joerg Hofrichter <joerg.hofrichter@ni.com>
> +Date: Wed, 26 Jun 2019 08:04:50 +0000
> +Subject: [PATCH] resolve: also add missing.h (needed for musl)
> +
> +Signed-off-by: Joerg Hofrichter <joerg.hofrichter@ni.com>
> +---
> + src/resolve/resolvectl.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
> +index 1d2fc71309..b12c80f125 100644
> +--- a/src/resolve/resolvectl.c
> ++++ b/src/resolve/resolvectl.c
> +@@ -30,6 +30,7 @@
> + #include "strv.h"
> + #include "terminal-util.h"
> + #include "verbs.h"
> ++#include "missing.h"
> +
> + static int arg_family =3D AF_UNSPEC;
> + static int arg_ifindex =3D 0;
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core=
/systemd/systemd_242.bb
> index 29f64b995a..4c72890d28 100644
> --- a/meta/recipes-core/systemd/systemd_242.bb
> +++ b/meta/recipes-core/systemd/systemd_242.bb
> @@ -53,6 +53,7 @@ SRC_URI_MUSL =3D "file://0001-Use-getenv-when-secure-ve=
rsions-are-not-available.pa
>                 file://0024-test-json.c-define-M_PIl.patch \
>                 file://0025-fs-utilh-add-missing-sys-stat-include.patch \
>                 file://0001-do-not-disable-buffer-in-writing-files.patch =
\
> +               file://0026-resolve-also-add-missing.h-needed-for-musl.pa=
tch \
>                 "
>
>  PAM_PLUGINS =3D " \
> @@ -102,7 +103,6 @@ PACKAGECONFIG_remove_libc-musl =3D " \
>      nss \
>      nss-mymachines \
>      nss-resolve \
> -    resolved \
>      smack \
>      sysusers \
>      utmp \
> --
> 2.17.1
> National Instruments Dresden GmbH; Gesch=C3=A4ftsf=C3=BChrer (Managing Di=
rector): Dr. Thorsten Dr=C3=A4ger; Sitz (Registered Office): Dresden; HRB (=
Commercial Register No.): 22081; Registergericht (Registration Court): Dres=
den
>
> This email and any attachments are intended only for the person to whom t=
his email is addressed and may contain confidential and/or privileged infor=
mation. If you received this email in error, please do not disclose the con=
tents to anyone, but notify the sender by return email and delete this emai=
l (and any attachments) from your system.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

