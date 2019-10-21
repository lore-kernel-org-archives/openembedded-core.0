Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6D32F606B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 17:03:47 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q70so6998684wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 10:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tXvFn6ww7V5gBj/HjCf+bmdlyxWWZHYcb3PjW4CEU2U=;
	b=fBB1zz35v5D83Ml69aJFuTIoX4kSlac0+2puGW9KjqWmkURdRH1OMTABZwlsI6eVPJ
	rqNMy2qoZH0WQONq6GYsBFMMr9kL7WP14d609wwSg/vx+OHczrnk9SO+2JPtB2ujHlFZ
	E+t+XuICUTkSthZi6aOxjLmX9gX7pS+8JljIxU9KOevQLz6Yl2MLZp9LK5cwrnrfUnSN
	cbnFXJ095+Eh5j03hnyrFK45k1rGWcKdLfrWDzSu09TWERZPHgxP9rNXQBRuF4N2o6Tl
	aZPKP9zdpyLfp1UUqUXZblEbFFyZq00Ku7V6AiRbgWWP/bTjUC0qVtTrbFnwdopX+jCd
	L2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tXvFn6ww7V5gBj/HjCf+bmdlyxWWZHYcb3PjW4CEU2U=;
	b=nsQBlBM+H2/CAz4WMjyZKURywnwf2WGqT7FMC4tc5TyYkfiiOUu1NH+Qu2yh/OBR7O
	RoqBWfaVfQcth0TzXt3BwW2ubg/8hyzlYF5GbtbNGZ8Qt+9Of5geUYDGSBzXhx1CmOdY
	S00pxf3jgh8/Z86+KqqKP2DC/JieqNGZG+2VcxRs9SNQo2h1f/Up0068cCr8WsxOXlSw
	GC3ZKfBH2QKO9ex+J8ayfXFZ4EiHIxpUVkvAyQZk3xY03ZTJgiqlthVxpbCBM3RXFExR
	eqaGtDdgm5+T0h3uCva58Qmq5XaSyZQ+qgOHGsPo6eEDBKisipEHfapUUORztrTUTfIZ
	cGCQ==
X-Gm-Message-State: APjAAAUFDcpT8qRk0pFId3LcQdZyF/2ddOpcmgemzjTjGOYlRWVHRktX
	dP+HecLOpwJ6Z/kkLDOgb/6b15Ft9utWs/B8Oo0=
X-Google-Smtp-Source: APXvYqy20O5Hn7YBNUeOgGzRhJxfnnOknWv1+klM3e7o2cy9IrM7bVeblEWIeJKMsNqU0ADT/Eder2KPmxdPTwH1z4U=
X-Received: by 2002:a1c:5587:: with SMTP id j129mr20178508wmb.15.1571677428006;
	Mon, 21 Oct 2019 10:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190204031153.1348-1-jacob.kroon@gmail.com>
In-Reply-To: <20190204031153.1348-1-jacob.kroon@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 21 Oct 2019 12:03:36 -0500
Message-ID: <CAJdd5GbA3MJ9KpbY81EkqfUvGwa8jZD7F8u-f+48NvKX9X+hsA@mail.gmail.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] base-passwd: Add kvm group
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
X-List-Received-Date: Mon, 21 Oct 2019 17:03:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 3, 2019 at 9:13 PM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> Although base-passwd in OE is somewhat outdated, upgrading
> to a newer version is not going to solve eudev warnings about
> missing groups during boot; input/shutdown/kvm are still not
> listed in groups.master. The reason for this is that
> Debian uses systemd, which will automatically create
> missing groups(systemd-sysusers). In a sysvinit+eudev
> configuration you instead get a warning printed to
> the console:

There is an unfortunate problem with this patch that is causing us
build failures when using useradd-staticids. Part of this might be our
fault for not realizing the repercussions in the way we chose static
IDs, but it exposes some deeper issues with this approach to "patching
in" new users and groups that we need to be careful about.

In our case, the problem is that we added the netdev group to our
static group file at ID 47. As such, we get a warning when the netdev
group is created:
 groupadd: GID '47' already exists.

For our part, choosing to tightly pack the group IDs and fill in the
missing holes with our own static IDs when those static IDs might be
allocated by upstream in the future was probably a poor choice.
However, the same reasons that make it a poor choice for us also apply
to this patch. Upstream doesn't have this GID, and *could* (although
unlikely will) add a different group at ID 47, which would conflict
with this patch and cause a lot of havoc with anyone using
useradd-staticids.

Compounding this is the problem that the users and groups in
base-passwd don't play nice in general with useradd-staticids. The
users and groups provided by base-passwd are always assumed to exists
with the fixed IDs assigned by the recipe, and there is no mechanism
to override the assigned IDs with a static ID file as can be done with
useradd.bbclass (also, adding support doesn't appear to be trivial).

In general, I don't think we should be "patching in" users and groups
like this to base-passwd. If upstream doesn't have them, they need to
be added through the normal useradd.bbclass mechanism so that users of
useradd-staticids can choose what ID they get mapped to.

Is it possible to revert this and add the kvm group via the useradd.bbclass?

>
>   udevd[<pid>]: specified group 'kvm' unknown
>
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>
> v2: Add reasoning in commit message trying to justify the added patch
>
>  .../base-passwd/base-passwd/kvm.patch         | 23 +++++++++++++++++++
>  .../base-passwd/base-passwd_3.5.29.bb         |  3 ++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/base-passwd/base-passwd/kvm.patch
>
> diff --git a/meta/recipes-core/base-passwd/base-passwd/kvm.patch b/meta/recipes-core/base-passwd/base-passwd/kvm.patch
> new file mode 100644
> index 0000000000..113d5151e7
> --- /dev/null
> +++ b/meta/recipes-core/base-passwd/base-passwd/kvm.patch
> @@ -0,0 +1,23 @@
> +From 6355278b9f744291864c373a32a8da8f84aaaf37 Mon Sep 17 00:00:00 2001
> +From: Jacob Kroon <jacob.kroon@gmail.com>
> +Date: Wed, 30 Jan 2019 04:53:48 +0000
> +Subject: [PATCH] Add kvm group
> +
> +Upstream-Status: Pending
> +Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> +---
> + group.master | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/group.master b/group.master
> +index cea9d60..5b62284 100644
> +--- a/group.master
> ++++ b/group.master
> +@@ -34,6 +34,7 @@ utmp:*:43:
> + video:*:44:
> + sasl:*:45:
> + plugdev:*:46:
> ++kvm:*:47:
> + staff:*:50:
> + games:*:60:
> + shutdown:*:70:
> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> index c6be1c1d08..d1aab09181 100644
> --- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> +++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> @@ -12,7 +12,8 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
>             file://noshadow.patch \
>             file://input.patch \
>             file://disable-docs.patch \
> -          "
> +           file://kvm.patch \
> +           "
>
>  SRC_URI[md5sum] = "6beccac48083fe8ae5048acd062e5421"
>  SRC_URI[sha256sum] = "f0b66388b2c8e49c15692439d2bee63bcdd4bbbf7a782c7f64accc55986b6a36"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

