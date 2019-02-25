Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1F4067C8A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 11:24:34 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id p17so7167439iol.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 03:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HLuzfw8ZDw8c9Ef5c5yR+lo1/7x0cvEZGbw5l/0uXFU=;
	b=Kqv7AmGiOg55XLwqmKyEScXMaWICPbWWlKBgPSpq7BWxflkoPucQHt8r36MwjC+as+
	dp13O+h3BL8SRHNhxX1SapSkroX65OC8npbOgfcU9eFE2nKqlleRoGL65QUsPh3lBCs2
	OR5Em+4qdpKFYhrb/eDLx0XHr4AZz88BvXw7NYjHcQQ+gKHTpRNSRkEq1/Efudv9yZLV
	xjxDNVY5z1Pwcf1aAT8IpTFCOSYsLhIE42ew7pBtCBHOVOSYGVJnJUjVuHbtxOpCCr6X
	PyA2pd+OfADeuMxjRP+373qtCJ3s9wjzBXVSK3dc5HARG1h6WSchvlALQeLJ2BiwH2oZ
	WhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HLuzfw8ZDw8c9Ef5c5yR+lo1/7x0cvEZGbw5l/0uXFU=;
	b=lcsZ82nRyK5gqziXddJXO/4XXAUb41Atg/wtk+Mo7IrcpVjK0IbMvU8seBSLnpXpB0
	c8aFsiU5uZnXKpYoXuqq+OHYq72StJnUSPtce8M0bnNWEuhmKNCdc3qTXtTKXVybqh/5
	5yUA03E6GAmSwv+RaEFS2cOXo6rvRfF4chvnAW9QkAqX2LB79kQvhgzp1E8YNp/WIx3b
	kmxI3or3iDt3sOROYwPbjrA3HdTEFHlNcQ8r5kAwU6m3HBp9oHu19sEqeeBNmsqRcY/T
	BExEdaEv3XqZeyPB3Meq62YV/MD4MrXcdBbwXKV/18Ceyd/aXTddamb5nb+LWaizgAn+
	50rw==
X-Gm-Message-State: AHQUAuYWqVCMNSwT4Mb7LJhDKiPtmdCrfJqKFVUxCux9wgCR5fx1r6hz
	ssBjc3jFLUE91n0BqNGv/QVij/2lkAa71R5T3pxpxg0qHd0=
X-Google-Smtp-Source: AHgI3IYtxxbqruLm1RwJxwWqxFFaT8O9ttdiRmaSHlBdS2cNcnoLxQeYYFA2pc5f0ZY8/B3duHhk1btbcR5p1mgzSK4=
X-Received: by 2002:a5d:848b:: with SMTP id t11mr8332458iom.270.1551093875976; 
	Mon, 25 Feb 2019 03:24:35 -0800 (PST)
MIME-Version: 1.0
References: <1928708604.1124302.1550860318265.JavaMail.zimbra@inango-systems.com>
In-Reply-To: <1928708604.1124302.1550860318265.JavaMail.zimbra@inango-systems.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Feb 2019 11:24:24 +0000
Message-ID: <CAJTo0LaagzCJ=qLdpuVkyDQqdvT1mvz3_1TThZtkQ6mDKyGUrw@mail.gmail.com>
To: Ivan Efimov <i.efimov@inango-systems.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] btrfs-tools Makefile: remove duplicated '-o $@' option from CC cmdline for libbtrfsutil/ subfolder
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
X-List-Received-Date: Mon, 25 Feb 2019 11:24:35 -0000
Content-Type: text/plain; charset="UTF-8"

Please don't send patches in HTML  [1].  The patch you add is also
missing a Signed-off-by and Upstream-Status [2]  For such a trivial
build issue, we encourage submitting the patch upstream too so we
don't have to carry it forever.

[1] https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
[2] https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

On Fri, 22 Feb 2019 at 18:32, Ivan Efimov <i.efimov@inango-systems.com> wrote:
>
> Command line for target "libbtrfsutil/%.o" contained
> double usage of '-o $@' option and causes compilation error:
>
>      cc1: error: too many filenames given
>
> Signed-off-by: Ivan Efimov <i.efimov@inango-systems.com>
> ---
>  ...01-Makefile-fix-double-o-compiler-option-using.patch | 17 +++++++++++++++++
>  meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb |  1 +
>  2 files changed, 18 insertions(+)
>  create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-fix-double-o-compiler-option-using.patch
>
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-fix-double-o-compiler-option-using.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-fix-dou$
> le-o-compiler-option-using.patch
> new file mode 100644
> index 0000000000..335067bc1f
> --- /dev/null
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-fix-double-o-compiler-option-using.patch
> @@ -0,0 +1,17 @@
> +Command line for target "libbtrfsutil/%.o" contained double usage
> +  of '-o $@' option and caused error:
> +    cc1: error: too many filenames given
> +
> +Index: git/Makefile
> +===================================================================
> +--- git.orig/Makefile
> ++++ git/Makefile
> +@@ -414,7 +414,7 @@ libbtrfs.so.0 libbtrfs.so: libbtrfs.so.0
> +
> + libbtrfsutil/%.o: libbtrfsutil/%.c
> +       @echo "    [CC]     $@"
> +-      $(Q)$(CC) $(LIBBTRFSUTIL_CFLAGS) -o $@ -c $< -o $@
> ++      $(Q)$(CC) $(LIBBTRFSUTIL_CFLAGS) -c $< -o $@
> +
> + libbtrfsutil.so.$(libbtrfsutil_version): $(libbtrfsutil_objects)
> +       @echo "    [LD]     $@"
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb
> index 1b4f515cb6..f1c4691313 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb
> @@ -19,6 +19,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
>             file://0001-Makefile-build-mktables-using-native-gcc.patch \
>             file://0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch \
>             file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
> +           file://0001-Makefile-fix-double-o-compiler-option-using.patch \
>             "
>
>  inherit autotools-brokensep pkgconfig manpages distutils3-base
> --
> 2.14.1
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

