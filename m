Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id E43CF60767
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 14:48:32 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id n85so11860831pfi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 07:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=wDnwoGQtp691NiPttD4uyG/f8Wckh7gf08Na9dwDgc0=;
	b=ia9y1O+Qje0HlJOcQvTm3q1YVnn7mnFQMkhOw+1NCtzWDbcEr6ZUfe6qez69L840ki
	wuPpM5t2Gzg16NwgpORtuLR4c9i78Tsu12UuwYZF7aspTvVLJkACpfXxOHcAo866C+Jc
	tjz5vVlkIMICp/hx3xcUcnyrBWy/1JzGPSS7xGrqbdGKWY7vLKozklQYtWN4e5TOiXIp
	sbz5FawdcanN8fJCAxZ4ur52Z0q9PdA1fAWv5M/ZnjnP0Q+GkvTMv2dpDkUmif5Ph/hG
	7aWmamGseFiWDPNNSBRFfOkGGESRxHph8FdqRmHpICJVnIzlDGdvnVVj9Sm40mwoNM3k
	qsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=wDnwoGQtp691NiPttD4uyG/f8Wckh7gf08Na9dwDgc0=;
	b=AQYVuSTJR6JoRbyv1i70hjoga37AtrlbHN81mhhDx9Uh9Qz3Zr33jfMIm66NPRm/V+
	gtjOqY2rj95nnMnqrJ/UFm7MY2jHtsjbqnzFsWlFlwC0bl/29mKV6xUzuK44dt1eYHq2
	n6U2xG433jgi4w3ah9pfPQZGwwhq89HYYEOWWiBrce4tNpW+PfKN+XlUqlbKA1xl75mA
	84eF6IuSMMSjYJDv8ebbrQY9JUSkPCG3FSvZajZh3XbWCX43K17tn6tBgm29jUv2NMT5
	dF4Fl1GOdrH2U6us0T/G9n/zBIpkkHdCHqhnfjwDhCbyBquDZDSKe1Urq5l+Cx6kXTzm
	qE4A==
X-Gm-Message-State: ABUngvcxMofPPfrl3u6GWQeije7guzPfkT0rFgXboIhxu7WtOynZU5On07pKRTf4Cwrw7A==
X-Received: by 10.99.44.84 with SMTP id s81mr20690022pgs.153.1478011714016;
	Tue, 01 Nov 2016 07:48:34 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:bddd:dc37:37:9aa?
	([2601:202:4001:9ea0:bddd:dc37:37:9aa])
	by smtp.gmail.com with ESMTPSA id
	z6sm42907261pay.31.2016.11.01.07.48.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Nov 2016 07:48:33 -0700 (PDT)
To: Enrico Jorns <ejo@pengutronix.de>, openembedded-core@lists.openembedded.org
References: <20161028060902.1133-1-ejo@pengutronix.de>
From: akuster808 <akuster808@gmail.com>
Message-ID: <ae3851e6-46cc-91ef-0d77-39d64e26412f@gmail.com>
Date: Tue, 1 Nov 2016 07:48:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161028060902.1133-1-ejo@pengutronix.de>
Subject: Re: [PATCH][krogoth] pseudo: backport 'Work around issues with glibc 2.24'
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
X-List-Received-Date: Tue, 01 Nov 2016 14:48:37 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Enrico


On 10/27/2016 11:09 PM, Enrico Jorns wrote:
> This patch is required for krogoth, too in order to make it properly
> work with glibc 2.24.
>
> Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
>
> Below the message of the original commit:
>
> There are issues with a change made to RTLD_NEXT behaviour in glibc 2.24
> and that change was also backported to older glibc versions in some distros
> like Fedora 23. This adds a workaround whilst the pseudo maintainer fixes
> various issues properly.
>
> (From OE-Core rev: 21c38a091c4a1917f62a942c4751b0fd11dce340)

Merged to staging,

Thanks,
Armin
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta-jupiter                                       |  2 +-
>   .../pseudo/pseudo-glibc-rtld-next-workaround.patch | 85 ++++++++++++++++++++++
>   meta/recipes-devtools/pseudo/pseudo_1.7.5.bb       |  1 +
>   3 files changed, 87 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/pseudo/pseudo/pseudo-glibc-rtld-next-workaround.patch
>
> diff --git a/meta-jupiter b/meta-jupiter
> index a1299a3..5a66c62 160000
> --- a/meta-jupiter
> +++ b/meta-jupiter
> @@ -1 +1 @@
> -Subproject commit a1299a3e711c93ed8a7eb652bdbacd83669263c6
> +Subproject commit 5a66c628800824585208d0130ee6b731c7e95edd
> diff --git a/meta/recipes-devtools/pseudo/pseudo/pseudo-glibc-rtld-next-workaround.patch b/meta/recipes-devtools/pseudo/pseudo/pseudo-glibc-rtld-next-workaround.patch
> new file mode 100644
> index 0000000..6710734
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/pseudo/pseudo-glibc-rtld-next-workaround.patch
> @@ -0,0 +1,85 @@
> +We started seeing:
> +
> +No real function for mknod: /home/paul/poky_sdk/tmp/sysroots/x86_64-
> +linux/usr/bin/../lib/pseudo/lib64/libpseudo.so: undefined symbol: mknod
> +No real function for mknodat: /home/paul/poky_sdk/tmp/sysroots/x86_64-
> +linux/usr/bin/../lib/pseudo/lib64/libpseudo.so: undefined symbol: mknodat
> +
> +In glibc 2.24 they've merged:
> +
> +https://sourceware.org/git/?p=glibc.git;a=commit;h=7d45c163d00c88d5875a112343c4ea3e61349e6b
> +related to bugzilla entry:
> +https://sourceware.org/bugzilla/show_bug.cgi?id=19509
> +
> +which means that the behaviour of RTLD_NEXT is slightly different.
> +As far as I can tell, mknod has not been present in glibc for a while.
> +To quote stat.h:
> +
> +/* To allow the `struct stat' structure and the file type `mode_t'
> +   bits to vary without changing shared library major version number,
> +   the `stat' family of functions and `mknod' are in fact inline
> +   wrappers around calls to `xstat', `fxstat', `lxstat', and `xmknod',
> +   which all take a leading version-number argument designating the
> +   data structure and bits used.  <bits/stat.h> defines _STAT_VER with
> +   the version number corresponding to `struct stat' as defined in
> +   that file; and _MKNOD_VER with the version number corresponding to
> +   the S_IF* macros defined therein.  It is arranged that when not
> +   inlined these function are always statically linked; that way a
> +   dynamically-linked executable always encodes the version number
> +   corresponding to the data structures it uses, so the `x' functions
> +   in the shared library can adapt without needing to recompile all
> +   callers.  */
> +
> +so I suspect mknod has not existed for a while, if ever and what we
> +were finding, who knows. Everying in the system links against _xmknod
> +which we have a separate wrapper for.
> +
> +Anyhow, ignoring that problem which hasn't caused a issue in the past,
> +the RTLD_NEXT change causes messages to be printed to stdout which causes
> +carnage if for example the packaging code is expecting a list of packages:
> +
> +WARNING: core-image-minimal-1.0-r0 do_rootfs: No not found in the base feeds (qemux86_64 core2-64 x86_64 noarch any all).
> +WARNING: core-image-minimal-1.0-r0 do_rootfs: real not found in the base feeds (qemux86_64 core2-64 x86_64 noarch any all).
> +WARNING: core-image-minimal-1.0-r0 do_rootfs: function not found in the base feeds (qemux86_64 core2-64 x86_64 noarch any all).
> +WARNING: core-image-minimal-1.0-r0 do_rootfs: for not found in the base feeds (qemux86_64 core2-64 x86_64 noarch any all).
> +WARNING: core-image-minimal-1.0-r0 do_rootfs: mknod: not found in the base feeds (qemux86_64 core2-64 x86_64 noarch any all).
> +[etc]
> +
> +This bug will affect:
> +* any distro using glibc 2.24
> +* any system using a uninative tarball for glibc 2.24
> +* any system which took a backport for the fix which was merged into
> +  the 2.23 branch for a while before it was reverted (Fedora 23 had this)
> +
> +The easiest thing to do is to ignore the problem and disable the diag
> +message which masks the problem with no ill effects.
> +
> +As Peter notes, there are a few issues here:
> +
> +* the fact there is no mknod symbol
> +* the fact an error here isn't fatal
> +* the #ifdef/#else looks suspect
> +* handle RTLD_NEXT chaining properly (need more libs?)
> +
> +which he'll work on upstream and hopefully have fixed in a new version.
> +
> +Upstream-Status: Submitted [Peter is aware of the issue]
> +
> +RP 2016/5/18
> +
> +Index: pseudo-1.7.5/pseudo_wrappers.c
> +===================================================================
> +--- pseudo-1.7.5.orig/pseudo_wrappers.c
> ++++ pseudo-1.7.5/pseudo_wrappers.c
> +@@ -146,9 +146,9 @@ pseudo_init_one_wrapper(pseudo_function
> + 			return;
> + 		}
> + #else
> +-		if (e != NULL) {
> ++		/*if (e != NULL) {
> + 			pseudo_diag("No real function for %s: %s\n", func->name, e);
> +-		}
> ++		}*/
> + #endif
> + 	}
> + }
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb b/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
> index d90e644..38e6f4d 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
> @@ -7,6 +7,7 @@ SRC_URI = " \
>       file://fallback-group \
>       file://moreretries.patch \
>       file://handle-remove-xattr.patch \
> +    file://pseudo-glibc-rtld-next-workaround.patch \
>   "
>   
>   SRC_URI[md5sum] = "c10209938f03128d0c193f041ff3596d"


