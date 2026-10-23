Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10285.1792770659668080664
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 08:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DPbDVMhZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0f59a5fdeso9248307b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 08:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792770659; cv=none;
        d=google.com; s=arc-20260327;
        b=q/6Hy+FYfMOcM6S7EyuygifNxnWSULBCsnGFwm7EPNGXK0ryh9PMZPk/u5O43c3v3Y
         m6UMqP7E9lwstGuF96YIR9YuvXLFInnt8UVPhx/NwoKQ1QeyHoDXWg4sgkXQ5ZgJj3vf
         fY5XKBe7vI167iBfvirZ3lOjLS0HhjTtMiasfPlSrMlijotyfofrey3SWZehHfWF09lo
         uH4h7aqyxzGmIujlb+RHLcC0bJ39KL+Ek39YCAdB8hVbq29ZfgX0i2HY3mZfzW3Mg1DE
         DGklpyGjZvd1nQqupQcII2UrCV6EgMHv2lnbwf9BQY6DZ0uzT5zNwuT5eBCmTWMnQ2Rn
         ytOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g7UvWW+UBLrEM8ztd/gGN/6hKpG5hxUKVYw2H4orEis=;
        fh=6Z4xUuTqkcxNv6cvnn0HdSGcZYvnhz2BRm++iEwx924=;
        b=R0YZg/mQqn+xKQqwHo+2HXI5jGu92PAli4cCaU1XACnK5MOkI41MRF72BtIQQoIa+q
         k/ht55Sn4YXJErX5hvabMeTX5DBfDsNQX8NE2zHIH3kVpjQlRqY6FBQ30W+Nr07ogFSM
         cNBhZkG77ZiXLGOU5qy3gZRBqpNMCxA4pfbsp80JjQpdSitfBeWtXnB28ljzHvSdO8f9
         AvhgtlQsIqBhOZICy8tn+MUDmw//NycE4zp8+2RQjDxR0tHCdho6c4gkPZWGYe5bltgB
         Jv506gHHkZfp+genFNvEvas6+25zMbjJGiH/Nw/3PKcc0zp8hEenJ9ULIKlYPdoU1c3B
         ikxw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792770659; x=1793375459; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g7UvWW+UBLrEM8ztd/gGN/6hKpG5hxUKVYw2H4orEis=;
        b=DPbDVMhZkyBbGEeoDw1bk5sw4EQMnfANmnc2zYu3xGdgzb9Z51WUtfEa17EQH6sllo
         SvmbAG37BF5qMVgZ/+6i6XQcq/5BZblesA37OaJA0sOfQ2krWxZavT6+UBmMs2VMbrgv
         7b0d6gFKvB4PwuIs4lCiRroW6ShICX9ZhdMz89jm4CNBZHb8Mq/gTWlT/7MYs8K7YKdo
         f6+b/cb/WCF0P8KL3AnWPm8EAcUbN5IsDisrE1qfBDdFWhjsNSado1Y/XO3f2kyAeirN
         5m1vnwJE+2s3BtolNy1pQ8pSv3LwcfTFp9/GbvzRXYk5/uZWkozEHPYxSVAG9rUCH4x2
         Mgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792770659; x=1793375459;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g7UvWW+UBLrEM8ztd/gGN/6hKpG5hxUKVYw2H4orEis=;
        b=JASA2JcgM9p+8iygV7qiZbosS+rN1wCM5/eAGtzEVnpTyIgpZvlEjuO6Nh8EcFKUxI
         Z6ok4VFcel5XfVtrOQZWGeF9yzr9HkS25J/LcRpLsPQJ8gIeVQZTPxyWa5MjON7/5Wil
         KcnnZY+Twm30XZ03ID32x/LgJ+eEOsriuzqKZr2aWH99+bBU8np4AhNCYK35RKUcfvSj
         v5Lw5jOAB7rkU8OUqbiq5DeuwkJ0OyGgHWiyPxzYxnnyvZ+nVSSPb9gmw2v82zihyhBw
         nguSNyumzY3c14THE9dphH5YUr0wX7IRnxZljVJTf9Fq4AjbeUDiBeFYiAtmwGcIWULj
         X0vA==
X-Gm-Message-State: AFq9FYJWvegmu7XY5ER4Kf5y0V8CagT5ZOjArQlNxcCwJd/Dj+n0h4yp
	cmaTU3Pxa/lsF4Jl5RA3Iv2UbccwxlmHhgh2wXO7cQYNh8f7Za09R5QkZyPgq3jxdQjKChStOEJ
	1b14++PTswcqp3gGih5yoImDEIuMh/vG4kjIL
X-Gm-Gg: AYBFou0sKr1RoUxNKPSNFqR+uFzKDlrioHwIW5X19sKrW61MjaMZXyLg+rt+2oVSdqr
	79rUDmTs/b8FZlNN3qt/VDlmVzGmTANGY88KVbAZQyjgSJCDwqKQq8J/WxTYIdl9nYM7ec98JWX
	q6hQ7YpTAOrzQfB/HmJCwuJDoyjvTZi6YcqI8WFc5GLevcDO60hmxcmjHEys2+ujnw5d3yGXlVI
	JpCXz4MGzSmlkPkdphIqw4fwS16Ka5l+i1HitwymMv9KUG/uKZMJd3EW4XIZla9uhQW6v2RQYVN
	lYDr+ds7s+dYKgJWaCzUOqpy0g6x1qiQUaR1EbVqjTqKPThMA1dlq1zUEU11NwyK9t7kuCvRvmv
	lZTGZmMcdy9WZ768zzE5o7nziDLoE9lGlNDcMRM/DaIb+3/bHnizlHJkAlPiLBiq4BBUxJpAPRH
	WKzTr9ATxSv+X2MxTpHJr8Sw/jQpN637/JGYqVJHaNxyF09w+w+iLuxhLKxCOk108+1LJ3U/uZJ
	D5ovvRCZzfrZSNRfIKGHAfCkVEmyiLlSF9iMU6uYvL8JgV5AsMJwDOHTI3OfHjHTYLrcQ1h0USB
	H1Qc86jFLJMAqBA93OZml+a0QJgxOARVs9UDP0gskJj4i8YLNac7niBwdx4dxQDAD+a+aX764Ct
	OjPVgX0dDIkPdiyLRETYd
X-Received: by 2002:a05:690c:85:b0:8a9:b50a:bafa with SMTP id
 00721157ae682-8b157e86e85mr22572247b3.55.1792770658235; Fri, 23 Oct 2026
 08:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <20261023112949.77631-1-jaipaul.cheernam@est.tech> <20261023112949.77631-5-jaipaul.cheernam@est.tech>
In-Reply-To: <20261023112949.77631-5-jaipaul.cheernam@est.tech>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Oct 2026 08:50:32 -0700
X-Gm-Features: AclHuK_HIjoU9zJluYUu2Xqu4fQHqVx088C8q4fRxsSanP9_v-WRW__BgapfUz4
Message-ID: <CAMKF1srno3VQTBa1ZfZvGeqX+DyfhP8-ydL_Hr=UuHmieLxnLQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/6] strace: upgrade 7.2 -> 7.3
To: jaipaul.cheernam@est.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003f7896065e83f299"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 15:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248557

--0000000000003f7896065e83f299
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 4:30=E2=80=AFAM Jaipaul Cheernam via lists.openembe=
dded.org
<jaipaul.cheernam=3Dest.tech@lists.openembedded.org> wrote:

> NEWS: https://github.com/strace/strace/blob/v7.3/NEWS
>
> - Fix indentation for SRC_URI
> - Refresh existing patches
> - Add 0001-Handle-both-bpf-link-and-bpf_link-anon_inode-names.patch for
> ptest fix
>   PR is still open https://github.com/strace/strace/pull/429
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> Testsuite summary for strace 7.3
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>  TOTAL: 1525
>  PASS:  1172
>  SKIP:  352
>  XFAIL: 0
>  FAIL:  1
>  XPASS: 0
>  ERROR: 0
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  ...f-link-and-bpf_link-anon_inode-names.patch | 135 ++++++++++++++++++
>  ...toconf-macro-to-detect-largefile-sup.patch |   4 +-
>  ...kport-ax_prog_cc_for_build.m4-macros.patch |   2 +-
>  ...001-strace-fix-reproducibilty-issues.patch |  12 +-
>  ...002-tests-Replace-off64_t-with-off_t.patch |   2 +-
>  .../strace/strace/Makefile-ptest.patch        |   6 +-
>  .../strace/strace/ptest-spacesave.patch       |   6 +-
>  .../strace/strace/skip-load.patch             |   2 +-
>  .../strace/strace/update-gawk-paths.patch     |   2 +-
>  .../strace/{strace_7.2.bb =3D> strace_7.3.bb}   |   5 +-
>  10 files changed, 156 insertions(+), 20 deletions(-)
>  create mode 100644
> meta/recipes-devtools/strace/strace/0001-Handle-both-bpf-link-and-bpf_lin=
k-anon_inode-names.patch
>  rename meta/recipes-devtools/strace/{strace_7.2.bb =3D> strace_7.3.bb}
> (92%)
>
> diff --git
> a/meta/recipes-devtools/strace/strace/0001-Handle-both-bpf-link-and-bpf_l=
ink-anon_inode-names.patch
> b/meta/recipes-devtools/strace/strace/0001-Handle-both-bpf-link-and-bpf_l=
ink-anon_inode-names.patch
> new file mode 100644
> index 00000000000..4e5235b9683
> --- /dev/null
> +++
> b/meta/recipes-devtools/strace/strace/0001-Handle-both-bpf-link-and-bpf_l=
ink-anon_inode-names.patch
> @@ -0,0 +1,135 @@
> +From fa20cc5e8c736ec606efaa18427f0fd49cc45d12 Mon Sep 17 00:00:00 2001
> +From: Zkingom <15024777017@163.com>
> +Date: Thu, 22 Oct 2026 19:20:15 +0800
> +Subject: [PATCH] Handle both "bpf-link" and "bpf_link" anon_inode names
> for
> + BPF links
> +
> +The kernel uses two different anon_inode name strings for BPF link file
> +descriptors due to an inconsistency introduced across two commits:
> +
> +- commit 70ed506c3bbc ("bpf: Introduce pinnable bpf_link abstraction")
> +  introduced bpf_link_new_fd() with anon_inode_getfd("bpf-link", ...),
> +  matching the naming convention used by other BPF objects ("bpf-map",
> +  "bpf-prog", "bpf-stats").
> +- commit babf3164095b ("bpf: Add bpf_link_new_file that doesn't install
> +  FD") added bpf_link_new_file(), later renamed to bpf_link_prime(),
> +  with anon_inode_getfile("bpf_link", ...), using an underscore instead
> +  of a hyphen.
> +
> +As a result, BPF link file descriptors appear as anon_inode:bpf-link
> +when obtained via BPF_LINK_GET_FD_BY_ID or BPF_OBJ_GET from bpffs, and
> +as anon_inode:bpf_link when returned by BPF_LINK_CREATE.
> +
> +Recognize both names to correctly identify BPF link descriptors
> +regardless of how they were obtained.
> +
> +* src/bpf.c (print_bpf_obj_info): Recognize anon_inode:bpf_link.
> +* tests/bpf-obj_get_info_by_fd-link.c (main): Obtain the link fd
> +path dynamically and skip when procfs is unavailable.
> +* tests/gen_tests.in (bpf-obj_get_info_by_fd-link): Filter out
> +setup calls preceding the information query.
> +* NEWS: Mention the fix.
> +
> +Signed-off-by: Xu Zhou <15024777017@163.com>
> +Signed-off-by: Zkingom <15024777017@163.com>
> +Assisted-by: Codex:GPT-6.1-Sol
> +
> +Upstream-Status: Submitted [https://github.com/strace/strace/pull/429]
> +
> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +---
> + NEWS                                |  8 ++++++++
> + src/bpf.c                           |  3 ++-
> + tests/bpf-obj_get_info_by_fd-link.c | 11 ++++++++---
> + tests/gen_tests.in                  |  2 +-
> + 4 files changed, 19 insertions(+), 5 deletions(-)
> +
> +diff --git a/NEWS b/NEWS
> +index eb5465a66c..da93026b4f 100644
> +--- a/NEWS
> ++++ b/NEWS
> +@@ -1,3 +1,11 @@
> ++Noteworthy changes in release ?.? (????-??-??)
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ++
> ++* Bug fixes
> ++
> ++  * Fixed decoding of BPF_OBJ_GET_INFO_BY_FD for BPF links created by
> ++    BPF_LINK_CREATE.
> ++
> + Noteworthy changes in release 7.3 (2026-10-22)
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +diff --git a/src/bpf.c b/src/bpf.c
> +index 3b09f45955..1498d5c0f2 100644
> +--- a/src/bpf.c
> ++++ b/src/bpf.c
> +@@ -1662,7 +1662,8 @@ print_bpf_obj_info(struct tcb * const tcp, uint32_=
t
> bpf_fd, uint64_t info,
> +       } obj_printers[] =3D {
> +               { "anon_inode:bpf-map", print_bpf_map_info },
> +               { "anon_inode:bpf-prog", print_bpf_prog_info },
> +-              { "anon_inode:bpf-link", print_bpf_link_info }
> ++              { "anon_inode:bpf-link", print_bpf_link_info },
> ++              { "anon_inode:bpf_link", print_bpf_link_info }
> +       };
> +
> +       if (entering(tcp)) {
> +diff --git a/tests/bpf-obj_get_info_by_fd-link.c
> b/tests/bpf-obj_get_info_by_fd-link.c
> +index 9536f0222f..c5f60ffc95 100644
> +--- a/tests/bpf-obj_get_info_by_fd-link.c
> ++++ b/tests/bpf-obj_get_info_by_fd-link.c
> +@@ -14,6 +14,7 @@
> + #include <stddef.h>
> + #include <stdio.h>
> + #include <stdint.h>
> ++#include <stdlib.h>
> + #include <string.h>
> + #include <unistd.h>
> +
> +@@ -43,6 +44,8 @@ sys_bpf(kernel_ulong_t cmd, void *attr, kernel_ulong_t
> size)
> + int
> + main(void)
> + {
> ++      skip_if_unavailable("/proc/self/fd/");
> ++
> +       static const struct bpf_insn cgroup_prog[] =3D {
> +               { /* r0 =3D 1 (allow) */
> +                       .code    =3D BPF_ALU64 | BPF_K | BPF_MOV,
> +@@ -97,10 +100,11 @@ main(void)
> +       if (ret < 0)
> +               perror_msg_and_skip("BPF_OBJ_GET_INFO_BY_FD");
> +
> ++      char *link_fd_path =3D get_fd_path(link_fd);
> +       printf("bpf(BPF_OBJ_GET_INFO_BY_FD"
> +-             ", {info=3D{bpf_fd=3D%d<anon_inode:bpf-link>"
> ++             ", {info=3D{bpf_fd=3D%d<%s>"
> +              ", info_len=3D%zu",
> +-             link_fd, LINK_INFO_SZ);
> ++             link_fd, link_fd_path, LINK_INFO_SZ);
> +       if (get_info_attr.info_len !=3D LINK_INFO_SZ)
> +               printf(" =3D> %u", get_info_attr.info_len);
> +       printf(", info=3D{type=3D");
> +@@ -110,8 +114,9 @@ main(void)
> +       printf(", cgroup=3D{cgroup_id=3D%" PRIu64,
> link_info->cgroup.cgroup_id);
> +       printf(", attach_type=3D");
> +       printxval(bpf_attach_type, link_info->cgroup.attach_type,
> "BPF_???");
> +-      printf("}}}, %zu) =3D %s\n", sizeof(get_info_attr), errstr);
> ++      printf("}}}}, %zu) =3D %s\n", sizeof(get_info_attr), errstr);
> +
> ++      free(link_fd_path);
> +       puts("+++ exited with 0 +++");
> +       return 0;
> + }
> +diff --git a/tests/gen_tests.in b/tests/gen_tests.in
> +index 71393c72a6..6bf0e91db9 100644
> +--- a/tests/gen_tests.in
> ++++ b/tests/gen_tests.in
> +@@ -31,7 +31,7 @@ arch_prctl-success-Xverbose  +prctl-success.sh
> ARCH_PRCTL_INJECT_RETVALS=3D"0 1 2 3
> + at_fdcwd-pathmax      -a36 --trace=3Dopenat -y -P sample
> + bpf   -a20
> + bpf-obj_get_info_by_fd        -a20 -y -e trace=3Dbpf
> +-bpf-obj_get_info_by_fd-link   -a20 -y -v -e trace=3Dbpf
> ++bpf-obj_get_info_by_fd-link   -a20 -y -v -e trace=3Dbpf
> "QUIRK:START-OF-TEST-OUTPUT:bpf(BPF_OBJ_GET_INFO_BY_FD"
> + bpf-obj_get_info_by_fd-prog   -a20 -y -e trace=3Dbpf
> + bpf-obj_get_info_by_fd-prog-v -a20 -y -v -e trace=3Dbpf
> + bpf-obj_get_info_by_fd-v      -a20 -y -v -e trace=3Dbpf
> diff --git
> a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-t=
o-detect-largefile-sup.patch
> b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-t=
o-detect-largefile-sup.patch
> index 25f32d17348..ebcd316e9fb 100644
> ---
> a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-t=
o-detect-largefile-sup.patch
> +++
> b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-t=
o-detect-largefile-sup.patch
> @@ -1,4 +1,4 @@
> -From 334b66af1329bc6970c9ff9ee668af6cc2133b8f Mon Sep 17 00:00:00 2001
> +From dff502ff4ae95a310ea10eeda0aaf5626de3890b Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 15 Dec 2022 15:54:27 -0800
>  Subject: [PATCH] configure: Use autoconf macro to detect largefile suppo=
rt
> @@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 2 insertions(+)
>
>  diff --git a/configure.ac b/configure.ac
> -index 956bb85..0812725 100644
> +index 9bec14b..57406f5 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -43,6 +43,8 @@ AC_PROG_INSTALL
> diff --git
> a/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_bui=
ld.m4-macros.patch
> b/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_bui=
ld.m4-macros.patch
> index 60e51411973..478bb7b9d9b 100644
> ---
> a/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_bui=
ld.m4-macros.patch
> +++
> b/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_bui=
ld.m4-macros.patch
> @@ -1,4 +1,4 @@
> -From b402cfcdfb782ab3a8b264b23536a4de5f709746 Mon Sep 17 00:00:00 2001
> +From de4d51c010e12a8c843dd3e241e392cd8cbcc6ca Mon Sep 17 00:00:00 2001
>  From: Khem Raj <khem.raj@oss.qualcomm.com>
>  Date: Fri, 10 Apr 2026 23:39:47 +0000
>  Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
> diff --git
> a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issu=
es.patch
> b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issu=
es.patch
> index 4907b16a1c7..8a8b18d698e 100644
> ---
> a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issu=
es.patch
> +++
> b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issu=
es.patch
> @@ -1,4 +1,4 @@
> -From 5905b406c5325442f2001339937ad22b2d068b15 Mon Sep 17 00:00:00 2001
> +From a99f2283ed13b03185b67ddda507aed3aa0f595e Mon Sep 17 00:00:00 2001
>  From: Jeremy Puhlman <jpuhlman@mvista.com>
>  Date: Wed, 11 Mar 2020 19:56:55 +0000
>  Subject: [PATCH] strace: fix reproducibilty issues
> @@ -13,19 +13,19 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/tests/gen_tests.sh b/tests/gen_tests.sh
> -index 3c6228a..43b94ea 100755
> +index d71e1c1..c191673 100755
>  --- a/tests/gen_tests.sh
>  +++ b/tests/gen_tests.sh
> -@@ -46,7 +46,7 @@ while read -r name arg0 args; do {
> +@@ -52,7 +52,7 @@ while read -r name arg0 args; do {
>
>         hdr=3D"\
>   #!/bin/sh -efu
>  -# Generated by $0 from $input ($name $arg0 $args); do not edit."
>  +# Generated by $(basename $0) from $input ($name $arg0 $args); do not
> edit."
>
> -       case "$arg0" in
> -               +*)
> -@@ -102,7 +102,7 @@ while read -r name arg0 args; do {
> +       # A generated test may be sourced while another build regenerates
> it.
> +       # Replace the file atomically so the reader keeps its original
> contents.
> +@@ -112,7 +112,7 @@ while read -r name arg0 args; do {
>
>   if [ -n "$names" ]; then
>         {
> diff --git
> a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off=
_t.patch
> b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off=
_t.patch
> index e7842688550..88a81519bf9 100644
> ---
> a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off=
_t.patch
> +++
> b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off=
_t.patch
> @@ -1,4 +1,4 @@
> -From bcca8619f749ba78a4ce78d39c603e2606175175 <(260)%20617-5175> Mon Sep
> 17 00:00:00 2001
> +From 85eb02371ea47e79f912fa03dbe03c849c093b36 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 15 Dec 2022 15:56:13 -0800
>  Subject: [PATCH] tests: Replace off64_t with off_t
> diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> index 1e3c8ee2aa8..0352a82234b 100644
> --- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> +++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> @@ -1,4 +1,4 @@
> -From 2749699b77b4fcce7e6e960f246259b05f3dafcc Mon Sep 17 00:00:00 2001
> +From f7ad423f864c5f882c7e220f564a21e9421ac73b Mon Sep 17 00:00:00 2001
>  From: Gabriel Barbu <gabriel.barbu@enea.com>
>  Date: Thu, 25 Jul 2013 15:28:33 +0200
>  Subject: [PATCH] strace: Add ptest
> @@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>   1 file changed, 20 insertions(+)
>
>  diff --git a/tests/Makefile.am b/tests/Makefile.am
> -index 84a9638..23fd218 100644
> +index 12b63b2..1ddf782 100644
>  --- a/tests/Makefile.am
>  +++ b/tests/Makefile.am
>  @@ -18,6 +18,7 @@ SIZEOF_LONG =3D @SIZEOF_LONG@
> @@ -24,7 +24,7 @@ index 84a9638..23fd218 100644
>   AM_CFLAGS =3D $(WARN_CFLAGS) $(TEST_WARN_CFLAGS)
>   bundled_CPPFLAGS =3D
>   if USE_BUNDLED_HEADERS
> -@@ -968,3 +969,22 @@ check-valgrind-local: $(check_LIBRARIES)
> $(check_PROGRAMS)
> +@@ -982,3 +983,22 @@ check-valgrind-local: $(check_LIBRARIES)
> $(check_PROGRAMS)
>   CLEANFILES =3D ksysent.h
>
>   include ../src/scno.am
> diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
> b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
> index 00f404c0036..3f6289d3a1a 100644
> --- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
> +++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
> @@ -1,4 +1,4 @@
> -From ae538d4dcb0ea7265d72671b7dd3537ca1356437 Mon Sep 17 00:00:00 2001
> +From 0bcea4d97bdbfba5920ceb56215a911c9d529dc6 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Wed, 29 May 2019 00:10:32 +0100
>  Subject: [PATCH] strace: Tweak ptest disk space management
> @@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [specific to OE image
> space issues]
>   1 file changed, 1 insertion(+)
>
>  diff --git a/tests/gen_tests.sh b/tests/gen_tests.sh
> -index f22ad08..3c6228a 100755
> +index 2a7fada..d71e1c1 100755
>  --- a/tests/gen_tests.sh
>  +++ b/tests/gen_tests.sh
> -@@ -84,6 +84,7 @@ while read -r name arg0 args; do {
> +@@ -93,6 +93,7 @@ while read -r name arg0 args; do {
>                 $hdr
>                 . "\${srcdir=3D.}/init.sh"
>                 run_strace_match_diff $arg0 $args
> diff --git a/meta/recipes-devtools/strace/strace/skip-load.patch
> b/meta/recipes-devtools/strace/strace/skip-load.patch
> index 610dd94fe9d..cab890f1482 100644
> --- a/meta/recipes-devtools/strace/strace/skip-load.patch
> +++ b/meta/recipes-devtools/strace/strace/skip-load.patch
> @@ -1,4 +1,4 @@
> -From 2653515537b66a4b1286be107e9ef406c55040b4 Mon Sep 17 00:00:00 2001
> +From 5c9048988e5000fb0f175afde05a23be2ef0fa15 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@arm.com>
>  Date: Sat, 30 Aug 2025 00:47:03 +0200
>  Subject: [PATCH] strace: skip a number of load-sensitive tests
> diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
> b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
> index 8895b0ff9e2..764f0af1163 100644
> --- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
> +++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
> @@ -1,4 +1,4 @@
> -From be1b3d74ca4ffb3c8d3e38fdb96f23d5920f8ef1 Mon Sep 17 00:00:00 2001
> +From 3c4da31783f127d18cf1b64ca33ac46a512da2cb Mon Sep 17 00:00:00 2001
>  From: Andre McCurdy <armccurdy@gmail.com>
>  Date: Mon, 18 Jan 2016 11:01:00 -0800
>  Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
> diff --git a/meta/recipes-devtools/strace/strace_7.2.bb
> b/meta/recipes-devtools/strace/strace_7.3.bb
> similarity index 92%
> rename from meta/recipes-devtools/strace/strace_7.2.bb
> rename to meta/recipes-devtools/strace/strace_7.3.bb
> index 3f7aaab3e6c..61c8b744b5e 100644
> --- a/meta/recipes-devtools/strace/strace_7.2.bb
> +++ b/meta/recipes-devtools/strace/strace_7.3.bb
> @@ -14,12 +14,13 @@ SRC_URI =3D
> "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
>             file://skip-load.patch \
>
> file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
>             file://0002-tests-Replace-off64_t-with-off_t.patch \
> -
> file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
> +           file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch =
\
> +
>  file://0001-Handle-both-bpf-link-and-bpf_link-anon_inode-names.patch \
>             "
>  SRC_URI:append:libc-musl =3D "\
>             file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
>             "
>

I think above patch is no longer needed since the tests are now fixed to
work on musl see
https://github.com/strace/strace/commit/2b7d533ac7aef9a9d97dddcb582d622b8c0=
fc0c6

Please run the tests on musl target as well to ensure its the case.


> -SRC_URI[sha256sum] =3D
> "4bde6246926890dcee824f6e6ac42a06752f47d77e5097d86e3c0d6d4b709fe5"
> +SRC_URI[sha256sum] =3D
> "529634c40910895a9a1f3c5c1e65da2ca9ed72fb158dfc4bcc89efdf05e39b72"
>
>  inherit autotools github-releases ptest
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248546):
> https://lists.openembedded.org/g/openembedded-core/message/248546
> Mute This Topic: https://lists.openembedded.org/mt/121898413/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003f7896065e83f299
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 23,=
 2026 at 4:30=E2=80=AFAM Jaipaul Cheernam via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;jaipaul.cheernam=3D<a href=3D"m=
ailto:est.tech@lists.openembedded.org">est.tech@lists.openembedded.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">NEWS:=
 <a href=3D"https://github.com/strace/strace/blob/v7.3/NEWS" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/strace/strace/blob/v7.3/NEWS</a><=
br>
<br>
- Fix indentation for SRC_URI<br>
- Refresh existing patches<br>
- Add 0001-Handle-both-bpf-link-and-bpf_link-anon_inode-names.patch for pte=
st fix<br>
=C2=A0 PR is still open <a href=3D"https://github.com/strace/strace/pull/42=
9" rel=3D"noreferrer" target=3D"_blank">https://github.com/strace/strace/pu=
ll/429</a><br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
Testsuite summary for strace 7.3<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
=C2=A0TOTAL: 1525<br>
=C2=A0PASS:=C2=A0 1172<br>
=C2=A0SKIP:=C2=A0 352<br>
=C2=A0XFAIL: 0<br>
=C2=A0FAIL:=C2=A0 1<br>
=C2=A0XPASS: 0<br>
=C2=A0ERROR: 0<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
<br>
Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
---<br>
=C2=A0...f-link-and-bpf_link-anon_inode-names.patch | 135 +++++++++++++++++=
+<br>
=C2=A0...toconf-macro-to-detect-largefile-sup.patch |=C2=A0 =C2=A04 +-<br>
=C2=A0...kport-ax_prog_cc_for_build.m4-macros.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0...001-strace-fix-reproducibilty-issues.patch |=C2=A0 12 +-<br>
=C2=A0...002-tests-Replace-off64_t-with-off_t.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0.../strace/strace/Makefile-ptest.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A06 +-<br>
=C2=A0.../strace/strace/ptest-spacesave.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A06 +-<br>
=C2=A0.../strace/strace/skip-load.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../strace/strace/update-gawk-paths.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../strace/{<a href=3D"http://strace_7.2.bb" rel=3D"noreferrer" targe=
t=3D"_blank">strace_7.2.bb</a> =3D&gt; <a href=3D"http://strace_7.3.bb" rel=
=3D"noreferrer" target=3D"_blank">strace_7.3.bb</a>}=C2=A0 =C2=A0|=C2=A0 =
=C2=A05 +-<br>
=C2=A010 files changed, 156 insertions(+), 20 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/strace/strace/0001-Handle-bo=
th-bpf-link-and-bpf_link-anon_inode-names.patch<br>
=C2=A0rename meta/recipes-devtools/strace/{<a href=3D"http://strace_7.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">strace_7.2.bb</a> =3D&gt; <a href=3D"=
http://strace_7.3.bb" rel=3D"noreferrer" target=3D"_blank">strace_7.3.bb</a=
>} (92%)<br>
<br>
diff --git a/meta/recipes-devtools/strace/strace/0001-Handle-both-bpf-link-=
and-bpf_link-anon_inode-names.patch b/meta/recipes-devtools/strace/strace/0=
001-Handle-both-bpf-link-and-bpf_link-anon_inode-names.patch<br>
new file mode 100644<br>
index 00000000000..4e5235b9683<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/strace/strace/0001-Handle-both-bpf-link-and-bpf=
_link-anon_inode-names.patch<br>
@@ -0,0 +1,135 @@<br>
+From fa20cc5e8c736ec606efaa18427f0fd49cc45d12 Mon Sep 17 00:00:00 2001<br>
+From: Zkingom &lt;<a href=3D"mailto:15024777017@163.com" target=3D"_blank"=
>15024777017@163.com</a>&gt;<br>
+Date: Thu, 22 Oct 2026 19:20:15 +0800<br>
+Subject: [PATCH] Handle both &quot;bpf-link&quot; and &quot;bpf_link&quot;=
 anon_inode names for<br>
+ BPF links<br>
+<br>
+The kernel uses two different anon_inode name strings for BPF link file<br=
>
+descriptors due to an inconsistency introduced across two commits:<br>
+<br>
+- commit 70ed506c3bbc (&quot;bpf: Introduce pinnable bpf_link abstraction&=
quot;)<br>
+=C2=A0 introduced bpf_link_new_fd() with anon_inode_getfd(&quot;bpf-link&q=
uot;, ...),<br>
+=C2=A0 matching the naming convention used by other BPF objects (&quot;bpf=
-map&quot;,<br>
+=C2=A0 &quot;bpf-prog&quot;, &quot;bpf-stats&quot;).<br>
+- commit babf3164095b (&quot;bpf: Add bpf_link_new_file that doesn&#39;t i=
nstall<br>
+=C2=A0 FD&quot;) added bpf_link_new_file(), later renamed to bpf_link_prim=
e(),<br>
+=C2=A0 with anon_inode_getfile(&quot;bpf_link&quot;, ...), using an unders=
core instead<br>
+=C2=A0 of a hyphen.<br>
+<br>
+As a result, BPF link file descriptors appear as anon_inode:bpf-link<br>
+when obtained via BPF_LINK_GET_FD_BY_ID or BPF_OBJ_GET from bpffs, and<br>
+as anon_inode:bpf_link when returned by BPF_LINK_CREATE.<br>
+<br>
+Recognize both names to correctly identify BPF link descriptors<br>
+regardless of how they were obtained.<br>
+<br>
+* src/bpf.c (print_bpf_obj_info): Recognize anon_inode:bpf_link.<br>
+* tests/bpf-obj_get_info_by_fd-link.c (main): Obtain the link fd<br>
+path dynamically and skip when procfs is unavailable.<br>
+* tests/<a href=3D"http://gen_tests.in" rel=3D"noreferrer" target=3D"_blan=
k">gen_tests.in</a> (bpf-obj_get_info_by_fd-link): Filter out<br>
+setup calls preceding the information query.<br>
+* NEWS: Mention the fix.<br>
+<br>
+Signed-off-by: Xu Zhou &lt;<a href=3D"mailto:15024777017@163.com" target=
=3D"_blank">15024777017@163.com</a>&gt;<br>
+Signed-off-by: Zkingom &lt;<a href=3D"mailto:15024777017@163.com" target=
=3D"_blank">15024777017@163.com</a>&gt;<br>
+Assisted-by: Codex:GPT-6.1-Sol<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/strace/strace/pu=
ll/429" rel=3D"noreferrer" target=3D"_blank">https://github.com/strace/stra=
ce/pull/429</a>]<br>
+<br>
+Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
+---<br>
+ NEWS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++++++<br>
+ src/bpf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++-<br>
+ tests/bpf-obj_get_info_by_fd-link.c | 11 ++++++++---<br>
+ tests/<a href=3D"http://gen_tests.in" rel=3D"noreferrer" target=3D"_blank=
">gen_tests.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
+ 4 files changed, 19 insertions(+), 5 deletions(-)<br>
+<br>
+diff --git a/NEWS b/NEWS<br>
+index eb5465a66c..da93026b4f 100644<br>
+--- a/NEWS<br>
++++ b/NEWS<br>
+@@ -1,3 +1,11 @@<br>
++Noteworthy changes in release ?.? (????-??-??)<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
++<br>
++* Bug fixes<br>
++<br>
++=C2=A0 * Fixed decoding of BPF_OBJ_GET_INFO_BY_FD for BPF links created b=
y<br>
++=C2=A0 =C2=A0 BPF_LINK_CREATE.<br>
++<br>
+ Noteworthy changes in release 7.3 (2026-10-22)<br>
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+ <br>
+diff --git a/src/bpf.c b/src/bpf.c<br>
+index 3b09f45955..1498d5c0f2 100644<br>
+--- a/src/bpf.c<br>
++++ b/src/bpf.c<br>
+@@ -1662,7 +1662,8 @@ print_bpf_obj_info(struct tcb * const tcp, uint32_t =
bpf_fd, uint64_t info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} obj_printers[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;anon_inode:=
bpf-map&quot;, print_bpf_map_info },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;anon_inode:=
bpf-prog&quot;, print_bpf_prog_info },<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;anon_inode:bpf-l=
ink&quot;, print_bpf_link_info }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;anon_inode:bpf-l=
ink&quot;, print_bpf_link_info },<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;anon_inode:bpf_l=
ink&quot;, print_bpf_link_info }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (entering(tcp)) {<br>
+diff --git a/tests/bpf-obj_get_info_by_fd-link.c b/tests/bpf-obj_get_info_=
by_fd-link.c<br>
+index 9536f0222f..c5f60ffc95 100644<br>
+--- a/tests/bpf-obj_get_info_by_fd-link.c<br>
++++ b/tests/bpf-obj_get_info_by_fd-link.c<br>
+@@ -14,6 +14,7 @@<br>
+ #include &lt;stddef.h&gt;<br>
+ #include &lt;stdio.h&gt;<br>
+ #include &lt;stdint.h&gt;<br>
++#include &lt;stdlib.h&gt;<br>
+ #include &lt;string.h&gt;<br>
+ #include &lt;unistd.h&gt;<br>
+ <br>
+@@ -43,6 +44,8 @@ sys_bpf(kernel_ulong_t cmd, void *attr, kernel_ulong_t s=
ize)<br>
+ int<br>
+ main(void)<br>
+ {<br>
++=C2=A0 =C2=A0 =C2=A0 skip_if_unavailable(&quot;/proc/self/fd/&quot;);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0static const struct bpf_insn cgroup_prog[] =3D =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ /* r0 =3D 1 (allo=
w) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0.code=C2=A0 =C2=A0 =3D BPF_ALU64 | BPF_K | BPF_MOV,<br>
+@@ -97,10 +100,11 @@ main(void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror_msg_and_skip=
(&quot;BPF_OBJ_GET_INFO_BY_FD&quot;);<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 char *link_fd_path =3D get_fd_path(link_fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;bpf(BPF_OBJ_GET_INFO_BY_FD&quot;<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;, {info=3D{bpf_fd=
=3D%d&lt;anon_inode:bpf-link&gt;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;, {info=3D{bpf_fd=
=3D%d&lt;%s&gt;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;, info_len=3D%zu&qu=
ot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link_fd, LINK_INFO_SZ);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link_fd, link_fd_path, LI=
NK_INFO_SZ);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (get_info_attr.info_len !=3D LINK_INFO_SZ)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot; =3D&g=
t; %u&quot;, get_info_attr.info_len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;, info=3D{type=3D&quot;);<br>
+@@ -110,8 +114,9 @@ main(void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;, cgroup=3D{cgroup_id=3D%&quot; PR=
Iu64, link_info-&gt;cgroup.cgroup_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;, attach_type=3D&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0printxval(bpf_attach_type, link_info-&gt;cgroup=
.attach_type, &quot;BPF_???&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;}}}, %zu) =3D %s\n&quot;, sizeof(get_in=
fo_attr), errstr);<br>
++=C2=A0 =C2=A0 =C2=A0 printf(&quot;}}}}, %zu) =3D %s\n&quot;, sizeof(get_i=
nfo_attr), errstr);<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 free(link_fd_path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0puts(&quot;+++ exited with 0 +++&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+ }<br>
+diff --git a/tests/<a href=3D"http://gen_tests.in" rel=3D"noreferrer" targ=
et=3D"_blank">gen_tests.in</a> b/tests/<a href=3D"http://gen_tests.in" rel=
=3D"noreferrer" target=3D"_blank">gen_tests.in</a><br>
+index 71393c72a6..6bf0e91db9 100644<br>
+--- a/tests/<a href=3D"http://gen_tests.in" rel=3D"noreferrer" target=3D"_=
blank">gen_tests.in</a><br>
++++ b/tests/<a href=3D"http://gen_tests.in" rel=3D"noreferrer" target=3D"_=
blank">gen_tests.in</a><br>
+@@ -31,7 +31,7 @@ arch_prctl-success-Xverbose=C2=A0 +prctl-success.sh ARCH=
_PRCTL_INJECT_RETVALS=3D&quot;0 1 2 3<br>
+ at_fdcwd-pathmax=C2=A0 =C2=A0 =C2=A0 -a36 --trace=3Dopenat -y -P sample<b=
r>
+ bpf=C2=A0 =C2=A0-a20<br>
+ bpf-obj_get_info_by_fd=C2=A0 =C2=A0 =C2=A0 =C2=A0 -a20 -y -e trace=3Dbpf<=
br>
+-bpf-obj_get_info_by_fd-link=C2=A0 =C2=A0-a20 -y -v -e trace=3Dbpf<br>
++bpf-obj_get_info_by_fd-link=C2=A0 =C2=A0-a20 -y -v -e trace=3Dbpf &quot;Q=
UIRK:START-OF-TEST-OUTPUT:bpf(BPF_OBJ_GET_INFO_BY_FD&quot;<br>
+ bpf-obj_get_info_by_fd-prog=C2=A0 =C2=A0-a20 -y -e trace=3Dbpf<br>
+ bpf-obj_get_info_by_fd-prog-v -a20 -y -v -e trace=3Dbpf<br>
+ bpf-obj_get_info_by_fd-v=C2=A0 =C2=A0 =C2=A0 -a20 -y -v -e trace=3Dbpf<br=
>
diff --git a/meta/recipes-devtools/strace/strace/0001-configure-Use-autocon=
f-macro-to-detect-largefile-sup.patch b/meta/recipes-devtools/strace/strace=
/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch<br>
index 25f32d17348..ebcd316e9fb 100644<br>
--- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro=
-to-detect-largefile-sup.patch<br>
+++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro=
-to-detect-largefile-sup.patch<br>
@@ -1,4 +1,4 @@<br>
-From 334b66af1329bc6970c9ff9ee668af6cc2133b8f Mon Sep 17 00:00:00 2001<br>
+From dff502ff4ae95a310ea10eeda0aaf5626de3890b Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Thu, 15 Dec 2022 15:54:27 -0800<br>
=C2=A0Subject: [PATCH] configure: Use autoconf macro to detect largefile su=
pport<br>
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 2 insertions(+)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index 956bb85..0812725 100644<br>
+index 9bec14b..57406f5 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0@@ -43,6 +43,8 @@ AC_PROG_INSTALL<br>
diff --git a/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_c=
c_for_build.m4-macros.patch b/meta/recipes-devtools/strace/strace/0001-m4-B=
ackport-ax_prog_cc_for_build.m4-macros.patch<br>
index 60e51411973..478bb7b9d9b 100644<br>
--- a/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_b=
uild.m4-macros.patch<br>
+++ b/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_b=
uild.m4-macros.patch<br>
@@ -1,4 +1,4 @@<br>
-From b402cfcdfb782ab3a8b264b23536a4de5f709746 Mon Sep 17 00:00:00 2001<br>
+From de4d51c010e12a8c843dd3e241e392cd8cbcc6ca Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.com" targe=
t=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
=C2=A0Date: Fri, 10 Apr 2026 23:39:47 +0000<br>
=C2=A0Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros<br>
diff --git a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducib=
ilty-issues.patch b/meta/recipes-devtools/strace/strace/0001-strace-fix-rep=
roducibilty-issues.patch<br>
index 4907b16a1c7..8a8b18d698e 100644<br>
--- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-is=
sues.patch<br>
+++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-is=
sues.patch<br>
@@ -1,4 +1,4 @@<br>
-From 5905b406c5325442f2001339937ad22b2d068b15 Mon Sep 17 00:00:00 2001<br>
+From a99f2283ed13b03185b67ddda507aed3aa0f595e Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Jeremy Puhlman &lt;<a href=3D"mailto:jpuhlman@mvista.com" targe=
t=3D"_blank">jpuhlman@mvista.com</a>&gt;<br>
=C2=A0Date: Wed, 11 Mar 2020 19:56:55 +0000<br>
=C2=A0Subject: [PATCH] strace: fix reproducibilty issues<br>
@@ -13,19 +13,19 @@ Signed-off-by: Jeremy Puhlman &lt;<a href=3D"mailto:jpu=
hlman@mvista.com" target=3D"_blank">jpuhlman@mvista.com</a>&gt;<br>
=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/tests/gen_tests.sh b/tests/gen_tests.sh<br>
-index 3c6228a..43b94ea 100755<br>
+index d71e1c1..c191673 100755<br>
=C2=A0--- a/tests/gen_tests.sh<br>
=C2=A0+++ b/tests/gen_tests.sh<br>
-@@ -46,7 +46,7 @@ while read -r name arg0 args; do {<br>
+@@ -52,7 +52,7 @@ while read -r name arg0 args; do {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hdr=3D&quot;\<br>
=C2=A0 #!/bin/sh -efu<br>
=C2=A0-# Generated by $0 from $input ($name $arg0 $args); do not edit.&quot=
;<br>
=C2=A0+# Generated by $(basename $0) from $input ($name $arg0 $args); do no=
t edit.&quot;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;$arg0&quot; in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+*)<br>
-@@ -102,7 +102,7 @@ while read -r name arg0 args; do {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# A generated test may be sourced while another=
 build regenerates it.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Replace the file atomically so the reader kee=
ps its original contents.<br>
+@@ -112,7 +112,7 @@ while read -r name arg0 args; do {<br>
<br>
=C2=A0 if [ -n &quot;$names&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
diff --git a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t=
-with-off_t.patch b/meta/recipes-devtools/strace/strace/0002-tests-Replace-=
off64_t-with-off_t.patch<br>
index e7842688550..88a81519bf9 100644<br>
--- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-o=
ff_t.patch<br>
+++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-o=
ff_t.patch<br>
@@ -1,4 +1,4 @@<br>
-From bcca8619f749ba78a4ce78d39c603e<a href=3D"tel:(260)%20617-5175" value=
=3D"+12606175175" target=3D"_blank">2606175175</a> Mon Sep 17 00:00:00 2001=
<br>
+From 85eb02371ea47e79f912fa03dbe03c849c093b36 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Thu, 15 Dec 2022 15:56:13 -0800<br>
=C2=A0Subject: [PATCH] tests: Replace off64_t with off_t<br>
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/met=
a/recipes-devtools/strace/strace/Makefile-ptest.patch<br>
index 1e3c8ee2aa8..0352a82234b 100644<br>
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch<br>
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch<br>
@@ -1,4 +1,4 @@<br>
-From 2749699b77b4fcce7e6e960f246259b05f3dafcc Mon Sep 17 00:00:00 2001<br>
+From f7ad423f864c5f882c7e220f564a21e9421ac73b Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Gabriel Barbu &lt;<a href=3D"mailto:gabriel.barbu@enea.com" tar=
get=3D"_blank">gabriel.barbu@enea.com</a>&gt;<br>
=C2=A0Date: Thu, 25 Jul 2013 15:28:33 +0200<br>
=C2=A0Subject: [PATCH] strace: Add ptest<br>
@@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mit=
tal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
=C2=A0 1 file changed, 20 insertions(+)<br>
<br>
=C2=A0diff --git a/tests/Makefile.am b/tests/Makefile.am<br>
-index 84a9638..23fd218 100644<br>
+index 12b63b2..1ddf782 100644<br>
=C2=A0--- a/tests/Makefile.am<br>
=C2=A0+++ b/tests/Makefile.am<br>
=C2=A0@@ -18,6 +18,7 @@ SIZEOF_LONG =3D @SIZEOF_LONG@<br>
@@ -24,7 +24,7 @@ index 84a9638..23fd218 100644<br>
=C2=A0 AM_CFLAGS =3D $(WARN_CFLAGS) $(TEST_WARN_CFLAGS)<br>
=C2=A0 bundled_CPPFLAGS =3D<br>
=C2=A0 if USE_BUNDLED_HEADERS<br>
-@@ -968,3 +969,22 @@ check-valgrind-local: $(check_LIBRARIES) $(check_PROG=
RAMS)<br>
+@@ -982,3 +983,22 @@ check-valgrind-local: $(check_LIBRARIES) $(check_PROG=
RAMS)<br>
=C2=A0 CLEANFILES =3D ksysent.h<br>
<br>
=C2=A0 include ../src/<a href=3D"http://scno.am" rel=3D"noreferrer" target=
=3D"_blank">scno.am</a><br>
diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/me=
ta/recipes-devtools/strace/strace/ptest-spacesave.patch<br>
index 00f404c0036..3f6289d3a1a 100644<br>
--- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch<br>
+++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch<br>
@@ -1,4 +1,4 @@<br>
-From ae538d4dcb0ea7265d72671b7dd3537ca1356437 Mon Sep 17 00:00:00 2001<br>
+From 0bcea4d97bdbfba5920ceb56215a911c9d529dc6 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
=C2=A0Date: Wed, 29 May 2019 00:10:32 +0100<br>
=C2=A0Subject: [PATCH] strace: Tweak ptest disk space management<br>
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [specific to OE image sp=
ace issues]<br>
=C2=A0 1 file changed, 1 insertion(+)<br>
<br>
=C2=A0diff --git a/tests/gen_tests.sh b/tests/gen_tests.sh<br>
-index f22ad08..3c6228a 100755<br>
+index 2a7fada..d71e1c1 100755<br>
=C2=A0--- a/tests/gen_tests.sh<br>
=C2=A0+++ b/tests/gen_tests.sh<br>
-@@ -84,6 +84,7 @@ while read -r name arg0 args; do {<br>
+@@ -93,6 +93,7 @@ while read -r name arg0 args; do {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $hdr<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 . &quot;\${srcdir=
=3D.}/init.sh&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 run_strace_match_di=
ff $arg0 $args<br>
diff --git a/meta/recipes-devtools/strace/strace/skip-load.patch b/meta/rec=
ipes-devtools/strace/strace/skip-load.patch<br>
index 610dd94fe9d..cab890f1482 100644<br>
--- a/meta/recipes-devtools/strace/strace/skip-load.patch<br>
+++ b/meta/recipes-devtools/strace/strace/skip-load.patch<br>
@@ -1,4 +1,4 @@<br>
-From 2653515537b66a4b1286be107e9ef406c55040b4 Mon Sep 17 00:00:00 2001<br>
+From 5c9048988e5000fb0f175afde05a23be2ef0fa15 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=
=3D"_blank">ross.burton@arm.com</a>&gt;<br>
=C2=A0Date: Sat, 30 Aug 2025 00:47:03 +0200<br>
=C2=A0Subject: [PATCH] strace: skip a number of load-sensitive tests<br>
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/=
meta/recipes-devtools/strace/strace/update-gawk-paths.patch<br>
index 8895b0ff9e2..764f0af1163 100644<br>
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch<br>
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch<br>
@@ -1,4 +1,4 @@<br>
-From be1b3d74ca4ffb3c8d3e38fdb96f23d5920f8ef1 Mon Sep 17 00:00:00 2001<br>
+From 3c4da31783f127d18cf1b64ca33ac46a512da2cb Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com" target=
=3D"_blank">armccurdy@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 18 Jan 2016 11:01:00 -0800<br>
=C2=A0Subject: [PATCH] update gawk paths, /bin/gawk -&gt; /usr/bin/gawk<br>
diff --git a/meta/recipes-devtools/strace/<a href=3D"http://strace_7.2.bb" =
rel=3D"noreferrer" target=3D"_blank">strace_7.2.bb</a> b/meta/recipes-devto=
ols/strace/<a href=3D"http://strace_7.3.bb" rel=3D"noreferrer" target=3D"_b=
lank">strace_7.3.bb</a><br>
similarity index 92%<br>
rename from meta/recipes-devtools/strace/<a href=3D"http://strace_7.2.bb" r=
el=3D"noreferrer" target=3D"_blank">strace_7.2.bb</a><br>
rename to meta/recipes-devtools/strace/<a href=3D"http://strace_7.3.bb" rel=
=3D"noreferrer" target=3D"_blank">strace_7.3.bb</a><br>
index 3f7aaab3e6c..61c8b744b5e 100644<br>
--- a/meta/recipes-devtools/strace/<a href=3D"http://strace_7.2.bb" rel=3D"=
noreferrer" target=3D"_blank">strace_7.2.bb</a><br>
+++ b/meta/recipes-devtools/strace/<a href=3D"http://strace_7.3.bb" rel=3D"=
noreferrer" target=3D"_blank">strace_7.3.bb</a><br>
@@ -14,12 +14,13 @@ SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/v${PV}/st=
race-${PV}.tar.xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://skip-load.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-configure-Use-autocon=
f-macro-to-detect-largefile-sup.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-tests-Replace-off64_t=
-with-off_t.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001=
-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-m4-Backport-ax_prog_c=
c_for_build.m4-macros.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Handle-both-bpf-link-=
and-bpf_link-anon_inode-names.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI:append:libc-musl =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Ignore-pwritev-pwrite=
64-tests-on-musl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br></blockquote><div><br><=
/div><div>I think above patch is no longer needed since the tests are now f=
ixed to work on musl see=C2=A0</div><div><a href=3D"https://github.com/stra=
ce/strace/commit/2b7d533ac7aef9a9d97dddcb582d622b8c0fc0c6">https://github.c=
om/strace/strace/commit/2b7d533ac7aef9a9d97dddcb582d622b8c0fc0c6</a></div><=
div><br></div><div>Please run the tests on musl target as well to ensure it=
s the case.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
-SRC_URI[sha256sum] =3D &quot;4bde6246926890dcee824f6e6ac42a06752f47d77e509=
7d86e3c0d6d4b709fe5&quot;<br>
+SRC_URI[sha256sum] =3D &quot;529634c40910895a9a1f3c5c1e65da2ca9ed72fb158df=
c4bcc89efdf05e39b72&quot;<br>
<br>
=C2=A0inherit autotools github-releases ptest<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#248546): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/248546" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/248546</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121898413/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121898413/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000003f7896065e83f299--
