Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2B59D754A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 13:18:54 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id a141-v6so5593889oii.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 06:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JGFG2bPwYOur19G99EQxa36UOnIRRdFb+ZyfOIj29w8=;
	b=ZkCsQlxX5xHmw/DV9IMoVDRsNHaxS/XoAuj+nrYMoNUJ+Aimv8gfSq9+wH6gFiBNzB
	WdLFvmbLsxckkyNmlSpmVe/Rsl0yFd8ntPlKBdsIGGXQlsdKc8yBUVj95tfGmbmwsrwr
	VBqc+YFJRYlCa1Qc+kuNkf/ChC6fPN+xXZbDhnW8mgq+83UazjMfurKkDUcRyBxEfJWf
	TwVLdQCbHce5pdWQN5rhURbdGordStP6l+FGbrfB+YVPTVA+iorg213EtONHf5ATpO1A
	Ld3ylAXIhQMInp6ImvGGNTsIvuxUiuCDLPN0xcb0uvOqThWHWOX09Tolbf8vIBICv2ys
	5kqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JGFG2bPwYOur19G99EQxa36UOnIRRdFb+ZyfOIj29w8=;
	b=PLkj4erLz86Gbx66eHGxaRS9ZkOII32Lj8ANm4sx64YTalVfaqC4qKZRmlRGcDTBFj
	8z+S5oWIy4ByuRIFakKfRWpH6dZFKnzNhmCQdGbQ9UAuyPq/PMoBcmS1obRwAFql2PbI
	mNbWyToHtKM45lTap/UecpQMSfMedEzLLRUFGWrLjFLdHhcz9hZ9mYNHkhdQ7vxygQq5
	tD+2mC/VQtFazs+xi9ocJu3TfOg4ttPxt2pXXsR6zeYVmhvdkKNv/FfC/pUuzNlCwM/b
	qbeXSDTqhJ+JwUhMfF6MPS8zMdr1epQZbOLPrl6zVEb8gJ70BXAGGq/iXKeljKcIg0Wa
	59wg==
X-Gm-Message-State: APt69E2eE3aSBPZ+xRzMaWk8H2Qwh07fK3R55URPggTKRZyVxMlsjbIv
	HM3lsLrLFsjx/c2vqGJC9z9hkidFJv6+NncY7Mr5ZQ==
X-Google-Smtp-Source: ADUXVKI+QtN10p151b7U9tTCkpPGMVjrApgs3xpb3ynCj+Si+p2UdEbE0oI+y8L47gjzYciEEGTUG8gz5FsRSQB+huk=
X-Received: by 2002:aca:cd4d:: with SMTP id
	d74-v6mr1307571oig.170.1528982335068; 
	Thu, 14 Jun 2018 06:18:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 06:18:34
	-0700 (PDT)
In-Reply-To: <20180614033554.17470-1-jpuhlman@mvista.com>
References: <20180614033554.17470-1-jpuhlman@mvista.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Jun 2018 14:18:34 +0100
Message-ID: <CAJTo0LYokf=4SUU_qmcXUhYCA7T+WzKGQFrM=_eGZp0uH-CMoA@mail.gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Qemu: CVE-2018-11806 slirp heap buffer overflow
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
X-List-Received-Date: Thu, 14 Jun 2018 13:18:54 -0000
Content-Type: text/plain; charset="UTF-8"

This patch needs an Upstream-Status: Backport and CVE tag in the
header (at the top of the patch from upstream).

Ross

On 14 June 2018 at 04:35, Jeremy Puhlman <jpuhlman@mvista.com> wrote:
> ---
>  ...018-11806-QEMU-slirp-heap-buffer-overflow.patch | 65 ++++++++++++++++++++++
>  meta/recipes-devtools/qemu/qemu_2.12.0.bb          |  1 +
>  2 files changed, 66 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch b/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
> new file mode 100644
> index 0000000000..002a1332bf
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
> @@ -0,0 +1,65 @@
> +From dc21a9d2951f0a2a7e63633e2b5c68c54e4edc4b Mon Sep 17 00:00:00 2001
> +From: Jeremy Puhlman <jpuhlman@mvista.com>
> +Date: Thu, 14 Jun 2018 01:28:49 +0000
> +Subject: [PATCH] CVE-2018-11806 QEMU: slirp: heap buffer overflow
> +
> +Subject: [Qemu-devel] [PATCH 1/2] slirp: correct size computation while concatenating mbuf
> +Date:  Tue, 5 Jun 2018 23:38:35 +0530
> +From: Prasad J Pandit <address@hidden>
> +
> +While reassembling incoming fragmented datagrams, 'm_cat' routine
> +extends the 'mbuf' buffer, if it has insufficient room. It computes
> +a wrong buffer size, which leads to overwriting adjacent heap buffer
> +area. Correct this size computation in m_cat.
> +
> +Reported-by: ZDI Disclosures <address@hidden>
> +Signed-off-by: Prasad J Pandit <address@hidden>
> +---
> + slirp/mbuf.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> +---
> + slirp/mbuf.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/slirp/mbuf.c b/slirp/mbuf.c
> +index 5ff2455..7fb4501 100644
> +--- a/slirp/mbuf.c
> ++++ b/slirp/mbuf.c
> +@@ -138,7 +138,7 @@ m_cat(struct mbuf *m, struct mbuf *n)
> +        * If there's no room, realloc
> +        */
> +       if (M_FREEROOM(m) < n->m_len)
> +-              m_inc(m,m->m_size+MINCSIZE);
> ++               m_inc(m, m->m_len + n->m_len);
> +
> +       memcpy(m->m_data+m->m_len, n->m_data, n->m_len);
> +       m->m_len += n->m_len;
> +@@ -158,12 +158,12 @@ m_inc(struct mbuf *m, int size)
> +
> +         if (m->m_flags & M_EXT) {
> +         datasize = m->m_data - m->m_ext;
> +-          m->m_ext = g_realloc(m->m_ext, size);
> ++          m->m_ext = g_realloc(m->m_ext, size + datasize);
> +         m->m_data = m->m_ext + datasize;
> +         } else {
> +         char *dat;
> +         datasize = m->m_data - m->m_dat;
> +-          dat = g_malloc(size);
> ++          dat = g_malloc(size + datasize);
> +         memcpy(dat, m->m_dat, m->m_size);
> +
> +         m->m_ext = dat;
> +@@ -171,7 +171,7 @@ m_inc(struct mbuf *m, int size)
> +         m->m_flags |= M_EXT;
> +         }
> +
> +-        m->m_size = size;
> ++        m->m_size = size + datasize;
> +
> + }
> +
> +--
> +2.13.3
> +
> diff --git a/meta/recipes-devtools/qemu/qemu_2.12.0.bb b/meta/recipes-devtools/qemu/qemu_2.12.0.bb
> index 21796df9d7..98db44a8ef 100644
> --- a/meta/recipes-devtools/qemu/qemu_2.12.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_2.12.0.bb
> @@ -21,6 +21,7 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
>             file://0009-apic-fixup-fallthrough-to-PIC.patch \
>             file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
>             file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
> +           file://0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch \
>             "
>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
>
> --
> 2.14.1.459.g238e487
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

