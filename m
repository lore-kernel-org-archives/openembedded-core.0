Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id E12EE60851
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 17:29:36 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id x34-v6so6353995qtk.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 10:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oKaNAWbKmxrnoAih19qyK6rRobJFKgCtQiocxwh5B3g=;
	b=evisN559Gz2Km15nqFhuJ7lf8qTTC1AYQX3r2M/OraFrhuhkccLDEv8HdmMkCOUoBl
	uvm7eKYEnmaWZOH+7VSGtWHFNvk4u0rdoJOE4kNKBiYKILIK349f7FV55b5NpynCw5Uw
	u4rEIh2pzAG2zdn19PEpNuPcSnd44NA5yMlPEvaL/R0kbMKePxcFSqGfdNbX3+RiMAH6
	hJSS4WgVxCWy1wG2pZmJHVDESytdm8JBIiuB1ArrMEVf2QNxDqNBZIeN1upQbRjbu7ya
	OYVQ8PI11p7qE7yH13QtOJYXSDC0CRNzT24psIIFzgUVIjxbFat+rM+Gnu+OQqw9jwsn
	4CIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oKaNAWbKmxrnoAih19qyK6rRobJFKgCtQiocxwh5B3g=;
	b=MpMrWsQ+pG433+d+tRnPVSFVtWDMLpp6iwn//kbGh8C1VJMiPul+d1hEm3872uuKAx
	m43mdmGTg5jaNJIoYa4kKmR7MBmWpvCrTGIdCK4wgwb+ybQFD2tU7hRXXam2ca2jT4c9
	yjd7k3zpfwTlHLXDR9OscmgS3I4vfhJOCmky56QYwyB0ERR9lb+0RgYojNqeYhSVpQf5
	72xuIdq+1258KjrJPex6BdhMIip6a77pyBXIIefU/BOiTXpo6bEpItO+kM4hseqfQMo8
	HqMb4I+2SQDj9pKbXJZbRjNTIPdUSZpxM16jXUxF63wQtXONBnW5nuxS0cvAmS7Myiar
	f/gA==
X-Gm-Message-State: ALKqPwdrit5gNfhWGJee73tCjBURlDZDmvJcBE9j7hC9ihjroiYPxAqd
	P1lRrt1r/BqrYOqRerkeOBxCB7jgkrCfHM/rh+k=
X-Google-Smtp-Source: ADUXVKIUR3vJ6OGUhi9i3vQPyROHVmoc2xmd0OrrnXP+JHk9LR6oujbpKZ/y0CAjrYYKerl1ZQeSdh55OfatcbfxHYI=
X-Received: by 2002:ac8:2b5c:: with SMTP id
	28-v6mr17379552qtv.117.1527614976069; 
	Tue, 29 May 2018 10:29:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:9a0f:0:0:0:0:0 with HTTP; Tue, 29 May 2018 10:29:05
	-0700 (PDT)
In-Reply-To: <1527215248-7224-1-git-send-email-armccurdy@gmail.com>
References: <1527215248-7224-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 10:29:05 -0700
Message-ID: <CAMKF1srvQZ7z3xYaNJU9M_QQNq+pBFftSrJNBWwhcXQp0XDQPw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dropbear: drop obsolete patch 0004-fix-2kb-keys.patch
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
X-List-Received-Date: Tue, 29 May 2018 17:29:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 24, 2018 at 7:27 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> This patch has been obsolete since 2005:
>
>   https://github.com/mkj/dropbear/commit/736f370dce614b717193f45d084e9e009de723ce
>

Seems fine to drop but I would like to understand why we carried it thus far.
What is the history of it in OE ?

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-core/dropbear/dropbear.inc               |  1 -
>  .../dropbear/dropbear/0004-fix-2kb-keys.patch         | 19 -------------------
>  2 files changed, 20 deletions(-)
>  delete mode 100644 meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch
>
> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
> index 16ac644..a5dcab8 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -14,7 +14,6 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>
>  SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
>             file://0001-urandom-xauth-changes-to-options.h.patch \
> -           file://0004-fix-2kb-keys.patch \
>             file://0007-fix-localoptions-search-path.patch \
>             file://init \
>             file://dropbearkey.service \
> diff --git a/meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch b/meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch
> deleted file mode 100644
> index 60c6a29..0000000
> --- a/meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Subject: [PATCH 4/6] fix 2kb keys
> -
> -Upstream-Status: Inappropriate [configuration]
> ----
> - kex.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -Index: dropbear-2017.75/kex.h
> -===================================================================
> ---- dropbear-2017.75.orig/kex.h
> -+++ dropbear-2017.75/kex.h
> -@@ -106,6 +106,6 @@ int curve25519_donna(unsigned char *out,
> - #endif
> -
> -
> --#define MAX_KEXHASHBUF 2000
> -+#define MAX_KEXHASHBUF 3000
> -
> - #endif /* DROPBEAR_KEX_H_ */
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

