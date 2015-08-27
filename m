Return-Path: <psidhu@gateworks.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4743F73E11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 22:27:35 +0000 (UTC)
Received: by igui7 with SMTP id i7so4818305igu.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 15:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WK+6RnhX0RCk7HNCJdQmz1WiUzdjrhe86uoBQ10+Xpk=;
	b=JAhukc3nHRrrehtpRJF1rmIAMZtDMgZ6e3jQzcTXmrP8Q5QQrXBLYQSgcI8rK4brBd
	UPTgaFVZu5BMe2GYgo1D7BtE4C7WUxWJk412NpG/L7Gg8Fkeh/RnVwLBLbPCOq3pma/u
	ctdF0R83SNy91Ms/vS787fLm2FUR9FwHbKrmIYBRdWW6m3I7TwODZuOquxs7TkzK2f/f
	VwhtHJsJBfkeCGUH/MEjTk17Ov11Zil+3EQEDvoAvvLROnklnegAUKWU63sz7ySJ4ZM0
	vJ9NimdEOOf+OE+LNE5kAfWyhG4s67JKknTqo6tPnhgvpnG9aKbGMduJCUQ9t53Ac8ZV
	Qavw==
X-Gm-Message-State: ALoCoQm1CAWA1uyjWVRqXhWz9fz4MfhznS4m5hbNMLmY2gx1NoGfgkqEzy5U16uHAEr/mmohvIuz
X-Received: by 10.50.129.5 with SMTP id ns5mr919854igb.40.1440714455509; Thu,
	27 Aug 2015 15:27:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.65.146 with HTTP; Thu, 27 Aug 2015 15:27:06 -0700 (PDT)
In-Reply-To: <1440714120-13204-1-git-send-email-psidhu@gateworks.com>
References: <1440714120-13204-1-git-send-email-psidhu@gateworks.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Thu, 27 Aug 2015 15:27:06 -0700
Message-ID: <CAD1M061O_wHoFk_oY6A0GfdxNTc85HVG4A17JgSdDpYN11bjbA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtd-utils: add acl dependency
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
X-List-Received-Date: Thu, 27 Aug 2015 22:27:36 -0000
Content-Type: text/plain; charset=UTF-8

I see that there is a pending patch posted today to address this
(subject: OE-core] [PATCH 1/1] mtd-utils: add xattr PACKAGECONFIG and
fix acl dependency). Sorry for the noise.

- Pushpal

On Thu, Aug 27, 2015 at 3:22 PM, Pushpal Sidhu <psidhu@gateworks.com> wrote:
> Without this DEPEND, build will break for mtd-utils-ubifs as shown below:
>    ...
>    CC      mkfs.jffs2.o
>  mkfs.jffs2.c:70:21: fatal error: sys/acl.h: No such file or directory
>   #include <sys/acl.h>
>
> This was introduced in commit cbf8dcc9f326faca0fbc8efe52f2920022576631 when
> reintroducing xattr support.
>
> Signed-off-by: Pushpal Sidhu <psidhu@gateworks.com>
> ---
>  meta/recipes-devtools/mtd/mtd-utils_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> index 8d4892a..72ce9ed 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> @@ -5,7 +5,7 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>                      file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
>
> -DEPENDS = "zlib lzo e2fsprogs util-linux"
> +DEPENDS = "zlib lzo e2fsprogs util-linux acl"
>
>  PV = "1.5.1+git${SRCPV}"
>
> --
> 2.5.0
>

