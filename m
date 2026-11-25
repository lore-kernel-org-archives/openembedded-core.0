Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49957.1795635437747341565
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 11:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NpSQ6hrW;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-536c8f958d7so47260341cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 11:37:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795635437; cv=none;
        d=google.com; s=arc-20260327;
        b=YWyygTNrSCmsjU73K/3Ni7H66IKFOUW+LNNlToScHKPRBCqYn4BU5utNVyTLRi3ufi
         R1Cpk7odJvCYEL69V2CCRq/5qKITsPiqyySMrT152EwZIC+Teup/B3b1w4uaqkNfasbE
         q6riEhYsRXhSpjOdCWnzqHvXsQQSj1y4t+LyGRZ0cJ2uLn/n4SvNdPyPb43He/fVuEYA
         7UwQJxzQkc6wS9u7gpKPVFeBYgvWNcZzoEfMAaNwumOqqChZP+GurI1BB/hZ20QMXenM
         MIX4ck8EABjb2r0ynT30Rq4yrHiTEQeEHTid6hX7yKlJasSPx+cAslPQp2t6QZ+BMv3F
         KZ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m1g7X3KBEve4iYkHY+sVJ9WCJD08NvZAYi76v+dnJ3A=;
        fh=QXvnPcIC0t2bKHutgdP7b0+Us/Q9YDgi26ycevlNmXw=;
        b=qwo1QaWxtx8D8tyZtpzJPvb2HHtZ8dq7kjHB2cTtyKsrxRPcWxqeJRoXkzM7FOIIs0
         CX+5WlUGsaZ049lPcFbudmScV+eMzU16RzNhGivW4FmJV+fUfIGJFerTBTdC0FWeyjCj
         roWUtplbDJd2u9vu/+z1KuPpKYgvqJhscb+L6tgzr6isAbkoECDsgHf5ce6FUZCWdbu5
         hu3TOIVkmS/fgO6oS+ZadkM0Z9KI919l5YyWTimQOE8IAgqBeFdxGqbLd4QtfPwISo82
         ifu8fiYXIPFgP+SCnU93rbgmdrqtCuE3BkCuLClMCf5vVyUJbUyBYIWjhnpdD5yBmt+Y
         iqMw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795635437; x=1796240237; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1g7X3KBEve4iYkHY+sVJ9WCJD08NvZAYi76v+dnJ3A=;
        b=NpSQ6hrWa0rqkb21bXZHpAdWAZ0v1NIhMZc2ZPkuDYC5+c9vSp/+JtnaDgFtYe0Vps
         lUZAec3Xlw1+WnxcA1vuGyowMswIpoF/Z9sE6QbzMpep2rkbPmHHNF1eAc8Unnq15S1o
         lYlNszQ3VauOTxZMHwqBgIgQL4Vi1rTbPJMF04/KhlUvRLSGAYgCzwWlwxDs3xUBZwT8
         bY7Lsyy3sAhNnyfaL2DEguqdXr/qv+XEnia7SJrHsugkVQGZpT51Jo7GDvFrrzmtqpPI
         XckdhsUIPpkJ8FQXZNudJY6ybc9cm1qqPjquuE1StqWfFUuHSwcSIjJY/wosbYumwn5B
         78yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635437; x=1796240237;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m1g7X3KBEve4iYkHY+sVJ9WCJD08NvZAYi76v+dnJ3A=;
        b=NcQC8blP1B7uq9TxHrVI3qIvr3Z5OGhBCKck8HpRQleZN3Jo20KqSThWhqUN6KapNd
         WZKhphnAS/2G409fChUNtG7NYujKUTfmII+GyWGLwNkXrltecPIHCMCbWWNb68eas7r+
         M8aUb34BJ039aZ14DoFMu2y2Jh0Re20ZVjnY+6ZDJ287dGJs1Ho3YBuoTJmUjWZLZIOQ
         xqZrlgI0IZcv771tU0M1UY1fGalZo1biZ2tBF+4Y7NmbWymJGH05hXGWzUE/SdaZf9ur
         Wrlnl6nUtwft4/mKfjHYmlaBlDnxa1jdz+NK6CMOTS4TZ9V1E6rcx+4C0RO+ywiGRF1D
         3gkA==
X-Gm-Message-State: APuU4Z+4E3qctGs9+1uXB8hvdZPjEDaPtajaNMPvRfWBCjmQRIpvsoXf
	lDFVTlOgtVDu2pr9RYythQ+ArZttnEHchBpR161+uj75rfHpaVO4kG5WgzenjLDeCHHlbeEkYwW
	41ECOdz5ExxTloKe0kwUSG6VUh5Uk8Ww=
X-Gm-Gg: AZFdTZc4cPWiOOHJmgWXcbuhnoR/1LQojS8fTIFDtISXtugdgfDscno5fi2CPn7F3gD
	S0E2uOXo3j3ycHxDMa265fpD9g4dk7pMPT8d3fAPRMdaAy7LopMLVJ7JpcCk5ynehBBRxwk5rq9
	U/vErj9cMFzQy+255nFBhrdHOaPLzDuAxbJ1REhr28KRkJjgkd7scmAuwSGZFMQHtIxYYYJTDjF
	dOgEaiuiJdQUOWIfiYTQrq1VGFnUV2JSX7fFpr10hHm5f+ZTjG9VU+RWzfeVF5FVTeSnbnD5fOG
	zbf0sEKfuDNuaFDYM7eGTURl0L1HJZNsbFFMHK0ooeREkpSu/sSOUSfcrWP4Z4jizBDGtnlyS1Y
	LlTWzZL9qVy91ibAPcqj64sB/i4Sk7HPMmNfdaVOIzn//9kh+QXh/n2L0cidtXl5YLGD4iGw=
X-Received: by 2002:ac8:690c:0:b0:55c:b10f:4c25 with SMTP id
 d75a77b69052e-55d769b927dmr352803851cf.21.1795635436408; Wed, 25 Nov 2026
 11:37:16 -0800 (PST)
MIME-Version: 1.0
References: <DS4PPF6EA6DD735F76F124E4E7191CF3350CD432@DS4PPF6EA6DD735.namprd11.prod.outlook.com>
In-Reply-To: <DS4PPF6EA6DD735F76F124E4E7191CF3350CD432@DS4PPF6EA6DD735.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 Nov 2026 20:37:04 +0100
X-Gm-Features: Aa3M54rWUAKnDmajEqFGeAPks9JIO5RB7cnS9eG5yYqChYDU72WC63XW6qVn2SY
Message-ID: <CANNYZj-6RX7MhX4uUByUhHjER2_1hNbq9GnXuoDqocjLUO57pA@mail.gmail.com>
Subject: Re: [OE-core] remove-elfutils-patch.patch
To: amardare@cisco.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005552e606611ef4cd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 19:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251245

--0000000000005552e606611ef4cd
Content-Type: text/plain; charset="UTF-8"

Hello Adrian,

the patch itself is fine and appreciated, but is it possible to send the
patch directly inline, using 'git send-email'? Generally patch attachments
aren't taken into testing, and the project requires proper email based
submissions.

Alex

On Wed, 25 Nov 2026 at 20:24, Adrian Mardare (amardare) via
openembedded-core <amardare=cisco.com@lists.openembedded.org> wrote:

> Please review the attached patch for elfutils component.
> Also provided below as text
>
> From 58595d5a42d0f775c6dcf7038fdfaa1b1bf9c2cf Mon Sep 17 00:00:00 2001
>
> From: Adrian Mardare amardare@cisco.com
>
> Date: Wed, 25 Nov 2026 11:59:42 -0500
>
> Subject: [PATCH] Remove elfutils patch
>
>
>
> The changes in patch
>
> 0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch are wrong
> and
>
> the patch should be removed ( ** also see Note1 below ** )
>
>
>
> In particular this change in elf_end():
>
>
>
>                 /* The section data is allocated if we couldn't mmap
>
>                    the file.  Or if we had to decompress.  */
>
> -               if (elf->map_address == NULL
>
> +               if ((elf->map_address == NULL
>
>                     || scn->rawdata_base == scn->zdata_base
>
>                     || (scn->flags & ELF_F_MALLOCED) != 0)
>
> +                   && (scn->data_list.data.d.d_buf != NULL))
>
>                   free (scn->rawdata_base);
>
>
>
> is now conditioning the free (scn->rawdata_base) by
> scn->data_list.data.d.d_buf!=NULL
>
> While the allocation itself uses "scn->rawdata.d.d_buf"
>
> Line 333 does the allocation:   scn->rawdata_base = scn->rawdata.d.d_buf =
> malloc (size);
>
>
>
> The patch introduces memory leaks for the allocation at Line 333
> elfutils-0.191/libelf/elf_getdata.c:333
>
> Two such leaks are detected / shown below:
>
>
>
> When run under a leak detection one can see:
>
>
>
> Direct leak of 626 byte(s) in 1 object(s) allocated from:
>
>     #0 0x7f282d2716bf in ___interceptor_malloc
> (/auto/compiler-migration/22/10/llvm-cisco/compiler-rt/lib/lsan/lsan_interceptors.cpp:74)
>
>     #1 0x7f282bf8a9df in __libelf_set_rawdata_wrlock
> (../../elfutils-0.191/libelf/elf_getdata.c:333)
>
>     #2 0x7f282bf8a586 in elf_strptr
> (../../elfutils-0.191/libelf/elf_strptr.c:163)
>
>     #3 0x7f282c55d404 in elf_sym_str (libbpf.c:3557)
>
>     #4 0x7f282c559564 in bpf_object__elf_collect (libbpf.c:3849)
>
>     #5 0x7f282c548a8e in bpf_object_open (libbpf.c:7978)
>
>     #6 0x7f282c548b43 in bpf_object__open_file (libbpf.c:8001)
>
>
>
> Direct leak of 321 byte(s) in 1 object(s) allocated from:
>
>     #0 0x7f282d2716bf in ___interceptor_malloc
> (/auto/compiler-migration/22/10/llvm-cisco/compiler-rt/lib/lsan/lsan_interceptors.cpp:74)
>
>     #1 0x7f282bf8a9df in __libelf_set_rawdata_wrlock
> (../../elfutils-0.191/libelf/elf_getdata.c:333)
>
>     #2 0x7f282bf8a718 in elf_rawdata
> (../../elfutils-0.191/libelf/elf_rawdata.c:68)
>
>     #3 0x7f282c558d7c in bpf_object__elf_init (libbpf.c:1556)
>
>     #4 0x7f282c548a6f in bpf_object_open (libbpf.c:7976)
>
>     #5 0x7f282c548b43 in bpf_object__open_file (libbpf.c:8001)
>
>
>
> In both cases the cleanup is done correctly in libbpf by calling
> bpf_object__elf_finish() -> elf_end() however
>
> the bogus check in elf_end() skips the free (scn->rawdata_base)
>
>
>
> After removing the
> 0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
>
> the leak output is clean.
>
>
>
> ** Note1 **: The patch
> 0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch was never
> accepted by the elfutils upstream community.
>
> The problem it tries to solve is a prelink bug ( double free in prelink )
>
> Quote from libelf upstream community comment:
>
> "I think that prelink is preparing the ELF file, but then half way
>
> through encounters an error. It then frees all the ELF section data it
>
> believed it created itself. But because of the error it probably didn't
>
> (yet) do that. And so frees some data that it got directly from
>
> elf_getdata () and didn't create itself. Then it calls elf_end () and
>
> libelf also thinks it owns that data and frees it again."
>
>
>
> Signed-off-by: Adrian Mardare admardare@gmail.com
>
> ---
>
> .../elfutils/elfutils_0.197.bb                |  1 -
>
> ...-check-data_list.data.d.d_buf-before.patch | 43 -------------------
>
> 2 files changed, 44 deletions(-)
>
> delete mode 100644
> meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
>
>
>
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.197.bb
> b/meta/recipes-devtools/elfutils/elfutils_0.197.bb
>
> index 253e1a65f0..deca3dae90 100644
>
> --- a/meta/recipes-devtools/elfutils/elfutils_0.197.bb
>
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.197.bb
>
> @@ -14,7 +14,6 @@ SRC_URI = "
> https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
>
>             file://run-ptest \
>
>             file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
> \
>
>             file://0003-fixheadercheck.patch \
>
> -
> file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch \
>
>             file://0001-skip-the-test-when-gcc-not-deployed.patch \
>
>             file://ptest.patch \
>
>
> file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
>
> diff --git
> a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
> b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
>
> deleted file mode 100644
>
> index 47f28885a9..0000000000
>
> ---
> a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
>
> +++ /dev/null
>
> @@ -1,43 +0,0 @@
>
> -From 6305e20927bc39367009efd1ecb71ce20a006ed6 Mon Sep 17 00:00:00 2001
>
> -From: Robert Yang liezhi.yang@windriver.com
>
> -Date: Thu, 16 Aug 2018 09:58:26 +0800
>
> -Subject: [PATCH] libelf/elf_end.c: check data_list.data.d.d_buf before
> free it
>
> -
>
> -The one which actually saves the data is data_list.data.d.d_buf, so check
> it
>
> -before free rawdata_base.
>
> -
>
> -This can fix a segmentation fault when prelink libqb_1.0.3:
>
> -prelink: /usr/lib/libqb.so.0.18.2: Symbol section index outside of
> section numbers
>
> -
>
> -The segmentation fault happens when prelink call elf_end().
>
> -
>
> -Upstream-Status: Submitted [
> https://sourceware.org/ml/elfutils-devel/2018-q3/msg00085.html]
>
> -
>
> -Signed-off-by: Robert Yang liezhi.yang@windriver.com
>
> ----
>
> - libelf/elf_end.c | 6 ++++--
>
> - 1 file changed, 4 insertions(+), 2 deletions(-)
>
> -
>
> -diff --git a/libelf/elf_end.c b/libelf/elf_end.c
>
> -index 9df2e16..339d7ed 100644
>
> ---- a/libelf/elf_end.c
>
> -+++ b/libelf/elf_end.c
>
> -@@ -176,14 +176,16 @@ elf_end (Elf *elf)
>
> -                                 architecture doesn't require overly
> stringent
>
> -                                 alignment the raw data buffer is the
> same as the
>
> -                                 one used for presenting to the caller.
> */
>
> --                             if (scn->data_base != scn->rawdata_base)
>
> -+                            if ((scn->data_base != scn->rawdata_base)
>
> -+                                && (scn->data_list.data.d.d_buf != NULL))
>
> -                                free (scn->data_base);
>
> -
>
> -                              /* The section data is allocated if we
> couldn't mmap
>
> -                                 the file.  Or if we had to decompress.
> */
>
> --                             if (elf->map_address == NULL
>
> -+                            if ((elf->map_address == NULL
>
> -                                  || scn->rawdata_base == scn->zdata_base
>
> -                                  || (scn->flags & ELF_F_MALLOCED) != 0)
>
> -+                                && (scn->data_list.data.d.d_buf != NULL))
>
> -                                free (scn->rawdata_base);
>
> -
>
> -                              /* Free the list of data buffers for the
> section.
>
> --
>
> 2.34.1
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#251242):
> https://lists.openembedded.org/g/openembedded-core/message/251242
> Mute This Topic: https://lists.openembedded.org/mt/122451502/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000005552e606611ef4cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Adrian,</div><div><br></div><div>the patch itse=
lf is fine and appreciated, but is it possible to send the patch directly i=
nline, using &#39;git send-email&#39;? Generally patch attachments aren&#39=
;t taken into testing, and the project requires proper email based submissi=
ons.</div><div><br></div><div>Alex</div></div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 25 No=
v 2026 at 20:24, Adrian Mardare (amardare) via openembedded-core &lt;amarda=
re=3D<a href=3D"mailto:cisco.com@lists.openembedded.org">cisco.com@lists.op=
enembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div class=3D"msg-3181816872882076358">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-3181816872882076358WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Please review the att=
ached patch for elfutils component.<br>
Also provided below as text<br>
<br>
From 58595d5a42d0f775c6dcf7038fdfaa1b1bf9c2cf Mon Sep 17 00:00:00 2001<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">From: Adrian Mardare =
<a href=3D"mailto:amardare@cisco.com" target=3D"_blank">
amardare@cisco.com</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Date: Wed, 25 Nov 202=
6 11:59:42 -0500<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Subject: [PATCH] Remo=
ve elfutils patch<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">The changes in patch<=
u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">0001-libelf-elf_end.c=
-check-data_list.data.d.d_buf-before.patch are wrong and<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">the patch should be r=
emoved ( ** also see Note1 below ** )<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">In particular this ch=
ange in elf_end():<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Th=
e section data is allocated if we couldn&#39;t mmap<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 the file.=C2=A0 Or if we had to decompress.=C2=A0 */<u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (elf-=
&gt;map_address =3D=3D NULL<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">+=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((elf=
-&gt;map_address =3D=3D NULL<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 || scn-&gt;rawdata_base =3D=3D scn-&gt;zdata_base<u></u>=
<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 || (scn-&gt;flags &amp; ELF_F_MALLOCED) !=3D 0)<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">+=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 &amp;&amp; (scn-&gt;data_list.data.d.d_buf !=3D NULL))<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 free (scn-&gt;rawdata_base);<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">is now conditioning t=
he free (scn-&gt;rawdata_base) by scn-&gt;data_list.data.d.d_buf!=3DNULL<u>=
</u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">While the allocation =
itself uses &quot;scn-&gt;rawdata.d.d_buf&quot;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Line 333 does the all=
ocation:=C2=A0=C2=A0 scn-&gt;rawdata_base =3D scn-&gt;rawdata.d.d_buf =3D m=
alloc (size);<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">The patch introduces =
memory leaks for the allocation at Line 333 elfutils-0.191/libelf/elf_getda=
ta.c:333<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Two such leaks are de=
tected / shown below:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">When run under a leak=
 detection one can see:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Direct leak of 626 by=
te(s) in 1 object(s) allocated from:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0 #0=
 0x7f282d2716bf in ___interceptor_malloc (/auto/compiler-migration/22/10/ll=
vm-cisco/compiler-rt/lib/lsan/lsan_interceptors.cpp:74)<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0 #1=
 0x7f282bf8a9df in __libelf_set_rawdata_wrlock (../../elfutils-0.191/libelf=
/elf_getdata.c:333)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0 #2=
 0x7f282bf8a586 in elf_strptr (../../elfutils-0.191/libelf/elf_strptr.c:163=
)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0 #3=
 0x7f282c55d404 in elf_sym_str (libbpf.c:3557)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0 #4=
 0x7f282c559564 in bpf_object__elf_collect (libbpf.c:3849)<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0 #5=
 0x7f282c548a8e in bpf_object_open (libbpf.c:7978)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0 #6=
 0x7f282c548b43 in bpf_object__open_file (libbpf.c:8001)<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Direct leak of 321 by=
te(s) in 1 object(s) allocated from:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0 #0=
 0x7f282d2716bf in ___interceptor_malloc (/auto/compiler-migration/22/10/ll=
vm-cisco/compiler-rt/lib/lsan/lsan_interceptors.cpp:74)<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0 #1=
 0x7f282bf8a9df in __libelf_set_rawdata_wrlock (../../elfutils-0.191/libelf=
/elf_getdata.c:333)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0 #2=
 0x7f282bf8a718 in elf_rawdata (../../elfutils-0.191/libelf/elf_rawdata.c:6=
8)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0 #3=
 0x7f282c558d7c in bpf_object__elf_init (libbpf.c:1556)<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0 #4=
 0x7f282c548a6f in bpf_object_open (libbpf.c:7976)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0 #5=
 0x7f282c548b43 in bpf_object__open_file (libbpf.c:8001)<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">In both cases the cle=
anup is done correctly in libbpf by calling bpf_object__elf_finish() -&gt; =
elf_end() however<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">the bogus check in el=
f_end() skips the free (scn-&gt;rawdata_base)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">After removing the 00=
01-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">the leak output is cl=
ean.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">** Note1 **: The patc=
h 0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch was never=
 accepted by the elfutils upstream community.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">The problem it tries =
to solve is a prelink bug ( double free in prelink )<u></u><u></u></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Quote from libelf ups=
tream community comment:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">&quot;I think that pr=
elink is preparing the ELF file, but then half way<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">through encounters an=
 error. It then frees all the ELF section data it<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">believed it created i=
tself. But because of the error it probably didn&#39;t<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">(yet) do that. And so=
 frees some data that it got directly from<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">elf_getdata () and di=
dn&#39;t create itself. Then it calls elf_end () and<u></u><u></u></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">libelf also thinks it=
 owns that data and frees it again.&quot;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Signed-off-by: Adrian=
 Mardare
<a href=3D"mailto:admardare@gmail.com" target=3D"_blank">admardare@gmail.co=
m</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">---<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">.../elfutils/<a href=
=3D"http://elfutils_0.197.bb" target=3D"_blank">elfutils_0.197.bb</a>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 -<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">...-check-data_list.d=
ata.d.d_buf-before.patch | 43 -------------------<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">2 files changed, 44 d=
eletions(-)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">delete mode 100644 me=
ta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.da=
ta.d.d_buf-before.patch<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">diff --git a/meta/rec=
ipes-devtools/elfutils/<a href=3D"http://elfutils_0.197.bb" target=3D"_blan=
k">elfutils_0.197.bb</a> b/meta/recipes-devtools/elfutils/<a href=3D"http:/=
/elfutils_0.197.bb" target=3D"_blank">elfutils_0.197.bb</a><u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">index 253e1a65f0..dec=
a3dae90 100644<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">--- a/meta/recipes-de=
vtools/elfutils/<a href=3D"http://elfutils_0.197.bb" target=3D"_blank">elfu=
tils_0.197.bb</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">+++ b/meta/recipes-de=
vtools/elfutils/<a href=3D"http://elfutils_0.197.bb" target=3D"_blank">elfu=
tils_0.197.bb</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">@@ -14,7 +14,6 @@ SRC=
_URI =3D &quot;<a href=3D"https://sourceware.org/elfutils/ftp/$%7BPV%7D/$%7=
BBP%7D.tar.bz2" target=3D"_blank">https://sourceware.org/elfutils/ftp/${PV}=
/${BP}.tar.bz2</a> \<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>
file://run-ptest</a> \<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>
file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch</a> \<u></u>=
<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>
file://0003-fixheadercheck.patch</a> \<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>
file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch</a> =
\<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>
file://0001-skip-the-test-when-gcc-not-deployed.patch</a> \<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>
file://ptest.patch</a> \<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>
file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch</a> =
\<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">diff --git a/meta/rec=
ipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d=
_buf-before.patch b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_en=
d.c-check-data_list.data.d.d_buf-before.patch<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">deleted file mode 100=
644<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">index 47f28885a9..000=
0000000<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">--- a/meta/recipes-de=
vtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-be=
fore.patch<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">+++ /dev/null<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">@@ -1,43 +0,0 @@<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-From 6305e20927bc393=
67009efd1ecb71ce20a006ed6 Mon Sep 17 00:00:00 2001<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-From: Robert Yang <a=
 href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">
liezhi.yang@windriver.com</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-Date: Thu, 16 Aug 20=
18 09:58:26 +0800<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-Subject: [PATCH] lib=
elf/elf_end.c: check data_list.data.d.d_buf before free it<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-The one which actual=
ly saves the data is data_list.data.d.d_buf, so check it<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-before free rawdata_=
base.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-This can fix a segme=
ntation fault when prelink libqb_1.0.3:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-prelink: /usr/lib/li=
bqb.so.0.18.2: Symbol section index outside of section numbers<u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-The segmentation fau=
lt happens when prelink call elf_end().<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-Upstream-Status: Sub=
mitted [<a href=3D"https://sourceware.org/ml/elfutils-devel/2018-q3/msg0008=
5.html" target=3D"_blank">https://sourceware.org/ml/elfutils-devel/2018-q3/=
msg00085.html</a>]<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-Signed-off-by: Rober=
t Yang <a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">
liezhi.yang@windriver.com</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">----<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">- libelf/elf_end.c | =
6 ++++--<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">- 1 file changed, 4 i=
nsertions(+), 2 deletions(-)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-diff --git a/libelf/=
elf_end.c b/libelf/elf_end.c<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-index 9df2e16..339d7=
ed 100644<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">---- a/libelf/elf_end=
.c<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-+++ b/libelf/elf_end=
.c<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-@@ -176,14 +176,16 @=
@ elf_end (Elf *elf)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">- =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0architecture doesn&#39;t require overly stringent<u></u>=
<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">- =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0alignment the raw data buffer is the same as the<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">- =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0one used for presenting to the caller.=C2=A0 */<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">--=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if (scn-&gt;data_base !=3D scn-&gt;rawdata_base)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-+=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((=
scn-&gt;data_base !=3D scn-&gt;rawdata_base)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-+=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 &amp;&amp; (scn-&gt;data_list.data.d.d_buf !=3D NULL))<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">- =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0free (scn-&gt;data_base);<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">- <u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">- =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 /* The section data is allocated if we couldn&#39;t mmap<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">- =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0the file.=C2=A0 Or if we had to decompress.=C2=A0 */<u><=
/u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">--=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if (elf-&gt;map_address =3D=3D NULL<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-+=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((=
elf-&gt;map_address =3D=3D NULL<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">- =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0=C2=A0|| scn-&gt;rawdata_base =3D=3D scn-&gt;zdata_base<=
u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">- =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0=C2=A0|| (scn-&gt;flags &amp; ELF_F_MALLOCED) !=3D 0)<u>=
</u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-+=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 &amp;&amp; (scn-&gt;data_list.data.d.d_buf !=3D NULL))<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">- =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0free (scn-&gt;rawdata_base);<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">- <u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">- =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 /* Free the list of data buffers for the section.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-- <u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">2.34.1<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
</div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#251242): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/251242" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/251242</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122451502/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122451502/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div>

--0000000000005552e606611ef4cd--
