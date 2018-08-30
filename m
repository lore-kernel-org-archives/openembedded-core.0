Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id B27227936A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 09:29:00 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id x197-v6so14279271oix.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 02:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QbE/++e/fOBzC8dVwP2VlVsgOjSp9+Eggc1VTlYxebs=;
	b=qSKlAwRqy9YMYKMptghGl5S8wjyT92k98J0sfDVe4hFOcm3dQLzECSHXtkDyUoRv4d
	RxG/zd9m1FuOwnwzxNM6X7hKm/d7kG1AKYvMELJ/7HVuqOJgOWCcn1Y3Znd6ForqshF5
	yLRgCKlh748FeSCNUi4essefHieKhLEprLwl5yFaQJRCAJRo7claee5/ZMtlBKX5mlIQ
	9YXjM45mVK7MOIDJiHW4KjlgvXTHilHs1+t+R44TblcP3snprhDGnhXEfY5p6XffM0lf
	nT0UN9MnIUArrRDc74kV45bPSbgnc2fnj8WHo41UWyc1N8sXP8tSSUlsIpRfyKqaK3E/
	U/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QbE/++e/fOBzC8dVwP2VlVsgOjSp9+Eggc1VTlYxebs=;
	b=MBqLx0AdIsxfkoM+G8fotjEDjeclXEUgojPy6NyjoJZggKTrPfUksBI8QD1rPfNsjL
	N31ZBt/dqi8gbqWHcooLANbrFehh2pVtIAf0gIds+bkz+VIdfqW9zGn4iixtAyU18/Eq
	r/pSwpiAlXj8Gtk3n3oqSAprzOkUxOjMQt8mdiaAAFkrc9R0vA570RwJysz82ViJQSWH
	PoagdMBWgXkbUSozxD8iVWZi//3q6unGl4yScN7ZpzYgH4Tck35bBX2oKuOWYl6G66+W
	1AtBBKzJUzCmDUkOlp2lHZoJHOhcQ8cyB3GT6FuY67jO7TEINlrNcHF4Q7pxw0TcfA7s
	/xkw==
X-Gm-Message-State: APzg51C+zT48C+BRbuNeHDHui1BxPZiy+HSfjObjEKyaKyYXUq/qAybT
	mv846KYwlhAHWnSVFapD8YVCLJUnupFPSjHwC+c=
X-Google-Smtp-Source: ANB0Vdbgzn6XFYysUDaimRABiAaZ31zqw4+TRF0i7bxTw0w1l3g8qDD8IY1dl9CaX4AbnKgoFO6F4um7ICLvSU1+TSU=
X-Received: by 2002:aca:4455:: with SMTP id
	r82-v6mr1760265oia.260.1535621341727; 
	Thu, 30 Aug 2018 02:29:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90ed:0:0:0:0:0 with HTTP; Thu, 30 Aug 2018 02:29:01
	-0700 (PDT)
In-Reply-To: <2fad8bf9a5e937fbf3effceda5ee7704cbd77c7b.1535597145.git.kai.kang@windriver.com>
References: <cover.1535597145.git.kai.kang@windriver.com>
	<2fad8bf9a5e937fbf3effceda5ee7704cbd77c7b.1535597145.git.kai.kang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Aug 2018 11:29:01 +0200
Message-ID: <CANNYZj-LHk5k4Lr89ahMqKMov5bbPNUmy_fH1jNR3w4WQr3mGQ@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] webkitgtk: fix CVEs
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
X-List-Received-Date: Thu, 30 Aug 2018 09:29:01 -0000
Content-Type: text/plain; charset="UTF-8"

Isn't it better - and simpler - to just update webkitgtk itself?
2.20.3 to 2.20.5.

Alex

2018-08-30 4:46 GMT+02:00  <kai.kang@windriver.com>:
> From: Kai Kang <kai.kang@windriver.com>
>
> Backport patches to fix CVE-2017-17821 and CVE-2018-12911 for webkitgtk.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../webkitgtk/0001-Fix-CVE-2017-17821.patch   | 44 ++++++++++
>  .../webkitgtk/0002-Fix-CVE-2018-12911.patch   | 82 +++++++++++++++++++
>  meta/recipes-sato/webkit/webkitgtk_2.20.3.bb  |  2 +
>  3 files changed, 128 insertions(+)
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-CVE-2017-17821.patch
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/0002-Fix-CVE-2018-12911.patch
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-CVE-2017-17821.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-CVE-2017-17821.patch
> new file mode 100644
> index 0000000000..a3f7599276
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-CVE-2017-17821.patch
> @@ -0,0 +1,44 @@
> +Backport patch to fix CVE-2017-17821. Refer to
> +https://security-tracker.debian.org/tracker/CVE-2017-17821.
> +
> +Upstream-Status: Backport [https://trac.webkit.org/changeset/232119/webkit]
> +CVE: CVE-2017-17821
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +From 2a17b15297eb886b0bfb7d098ef607cfad6c3da0 Mon Sep 17 00:00:00 2001
> +From: "mcatanzaro@igalia.com"
> + <mcatanzaro@igalia.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
> +Date: Wed, 23 May 2018 17:54:01 +0000
> +Subject: [PATCH] Prohibit shrinking the FastBitVector
> + https://bugs.webkit.org/show_bug.cgi?id=181020
> +
> +Reviewed by Oliver Hunt.
> +
> +Prohibit shrinking the FastBitVector. It's not prepared for this and the current usage does
> +not require it.
> +
> +* wtf/FastBitVector.cpp:
> +(WTF::FastBitVectorWordOwner::resizeSlow):
> +
> +git-svn-id: http://svn.webkit.org/repository/webkit/trunk@232119 268f45cc-cd09-0410-ab3c-d52691b4dbfc
> +---
> + Source/WTF/wtf/FastBitVector.cpp |  2 ++
> + 2 files changed, 15 insertions(+)
> +
> +diff --git a/Source/WTF/wtf/FastBitVector.cpp b/Source/WTF/wtf/FastBitVector.cpp
> +index eed316975f4..8b019aaa3ed 100644
> +--- a/Source/WTF/wtf/FastBitVector.cpp
> ++++ b/Source/WTF/wtf/FastBitVector.cpp
> +@@ -42,6 +42,8 @@ void FastBitVectorWordOwner::setEqualsSlow(const FastBitVectorWordOwner& other)
> + void FastBitVectorWordOwner::resizeSlow(size_t numBits)
> + {
> +     size_t newLength = fastBitVectorArrayLength(numBits);
> ++
> ++    RELEASE_ASSERT(newLength >= arrayLength());
> +
> +     // Use fastCalloc instead of fastRealloc because we expect the common
> +     // use case for this method to be initializing the size of the bitvector.
> +--
> +2.17.0
> +
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0002-Fix-CVE-2018-12911.patch b/meta/recipes-sato/webkit/webkitgtk/0002-Fix-CVE-2018-12911.patch
> new file mode 100644
> index 0000000000..37a43ae95a
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/0002-Fix-CVE-2018-12911.patch
> @@ -0,0 +1,82 @@
> +Backport upstream patch to fix CVE-2018-12911.
> +
> +Upstream-Status: Backport [https://trac.webkit.org/changeset/233404/webkit]
> +CVE: CVE-2018-12911
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +From 6a3897a790ff38184aca8032abcd89e8339fdcef Mon Sep 17 00:00:00 2001
> +From: "mcatanzaro@igalia.com"
> + <mcatanzaro@igalia.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
> +Date: Sun, 1 Jul 2018 01:15:38 +0000
> +Subject: [PATCH] Fix off-by-one error in xdg_mime_get_simple_globs
> + https://bugs.webkit.org/show_bug.cgi?id=186554
> +
> +Reviewed by Daniel Bates.
> +
> +We have an off-by-one error here in some code that was added for WebKit. (This is not an
> +issue with upstream xdgmime.)
> +
> +No new tests. This problem is caught by TestDownloads, but only when running with ASan
> +enabled.
> +
> +* xdgmime/src/xdgmimecache.c:
> +(get_simple_globs):
> +* xdgmime/src/xdgmimeglob.c:
> +(get_simple_globs):
> +
> +git-svn-id: http://svn.webkit.org/repository/webkit/trunk@233404 268f45cc-cd09-0410-ab3c-d52691b4dbfc
> +---
> + Source/ThirdParty/xdgmime/src/xdgmimecache.c |  5 ++++-
> + Source/ThirdParty/xdgmime/src/xdgmimeglob.c  |  5 ++++-
> + 3 files changed, 26 insertions(+), 2 deletions(-)
> +
> +diff --git a/Source/ThirdParty/xdgmime/src/xdgmimecache.c b/Source/ThirdParty/xdgmime/src/xdgmimecache.c
> +index 9600b9019e2..bdc1973b872 100644
> +--- a/Source/ThirdParty/xdgmime/src/xdgmimecache.c
> ++++ b/Source/ThirdParty/xdgmime/src/xdgmimecache.c
> +@@ -1047,6 +1047,9 @@ get_simple_globs (XdgMimeCache  *cache,
> +   xdg_uint32_t child_offset;
> +   int i;
> +
> ++  assert (*n >= 0);
> ++  assert (depth >= 0);
> ++
> +   if (*n >= n_globs)
> +     return FALSE;
> +
> +@@ -1055,7 +1058,7 @@ get_simple_globs (XdgMimeCache  *cache,
> +       xdg_uint32_t mime_offset = GET_UINT32 (cache->buffer, offset + 4);
> +
> +       if (strcasecmp (cache->buffer + mime_offset, mime) == 0) {
> +-        globs[*n] = malloc (depth * sizeof (char));
> ++        globs[*n] = malloc ((depth + 1) * sizeof (char));
> +         for (i = 0; i < depth; i++)
> +           globs[*n][depth - i - 1] = prefix[i];
> +         globs[*n][depth] = '\0';
> +diff --git a/Source/ThirdParty/xdgmime/src/xdgmimeglob.c b/Source/ThirdParty/xdgmime/src/xdgmimeglob.c
> +index 6fd90fc2fa3..ebe3a0de00c 100644
> +--- a/Source/ThirdParty/xdgmime/src/xdgmimeglob.c
> ++++ b/Source/ThirdParty/xdgmime/src/xdgmimeglob.c
> +@@ -484,6 +484,9 @@ get_simple_globs (XdgGlobHashNode *glob_hash_node,
> +                   xdg_unichar_t   *prefix,
> +                   int              depth)
> + {
> ++  assert (*n >= 0);
> ++  assert (depth >= 0);
> ++
> +   if (*n >= n_globs)
> +     return FALSE;
> +
> +@@ -495,7 +498,7 @@ get_simple_globs (XdgGlobHashNode *glob_hash_node,
> +         {
> +           int i;
> +
> +-          globs[*n] = malloc (depth * sizeof (char));
> ++          globs[*n] = malloc ((depth + 1) * sizeof (char));
> +           for (i = 0; i < depth; i++)
> +             globs[*n][depth - i - 1] = prefix[i];
> +           globs[*n][depth] = '\0';
> +--
> +2.17.0
> +
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
> index a528c5d891..be8d88fca8 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
> @@ -22,6 +22,8 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>             file://detect-gstreamer-gl.patch \
>             file://0012-soup-Forward-declare-URL-class.patch \
>             file://0001-Fix-PaintingData-has-no-member-named-lightVector-on-.patch \
> +           file://0001-Fix-CVE-2017-17821.patch \
> +           file://0002-Fix-CVE-2018-12911.patch \
>             "
>
>  SRC_URI[md5sum] = "efb69a0cc3cc67ef2647efec22e44c69"
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

