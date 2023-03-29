Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D626EC6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 02:49:32 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.15517.1680058165432564374
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 19:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=ZHqG1hcR;
 spf=pass (domain: mvista.com, ip: 209.85.167.48, mailfrom: vanusuri@mvista.com)
Received: by mail-lf1-f48.google.com with SMTP id h11so11362042lfu.8
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 19:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1680058163; x=1682650163;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ptotRpNfibAk1h7WITgJwu71lzGSj9XTo9lO2ujiIuw=;
        b=ZHqG1hcRIo9uvLX4ewBPWtrRw97Oh3Z+zB8vsrp8v8yZPMCa+T3yHPhK30MoEWA+Pj
         09pXCRorL6wp6uExiTj7mYahJlGiTvON+GpUsixA2P9X4tIHFbaP0yhtseid3/L6+M4q
         BCF8ZceL7BzK2GLWDw4l50QM/FDjEjn+UdcC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680058163; x=1682650163;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ptotRpNfibAk1h7WITgJwu71lzGSj9XTo9lO2ujiIuw=;
        b=wT4Gun9Qdyo7TEryBeSLuM9iqFHXbLogQg18nZFilb5/szkPqcWxh4slSI+39rdAj9
         P6qBb8XXGYf8E6jjUrUU9WYZu/lJvof2lE4BaXNg+WG+qJcta8ly8DS1Kqf9OOq310v6
         swAVgEIGezCdKCZ7OrFoMtaExdMFWP/jwtwFNG5XHydY7SSDC7If8kwcX1kVHYd9787H
         S69DA8LkTLSlSZuS9ChGsSs5sPXs+ZMeuBOPAYAlPs7nffopTPKuvRIzEhVsykJWxN09
         mBjLMtvvK0KgWzEFZIaU5HCC836/OT6Kcwmy6n2ZQ1yYUAhFx9eJsdNtD3phtD30qGx8
         44MQ==
X-Gm-Message-State: AAQBX9dD+ByRi6nYCVKMJ2Joj8JDdb8YSupgd99d/apk1QXUOc1hbyRV
	tJveFpB81o6LmnAWseqASFfkdx4iEbwXKXrvd0hvUw8TRLeJFB/FB1A=
X-Google-Smtp-Source: AKy350ZSzU4tEN4/G/nu9jb/XWWoOltiXWn1nfE3inmfRzEg7CVsrK8lpYnMovltmxte/aVv1A/f04w2N8GMH/HvwHE=
X-Received: by 2002:a05:6512:143:b0:4db:266c:4338 with SMTP id
 m3-20020a056512014300b004db266c4338mr5291314lfo.1.1680058162798; Tue, 28 Mar
 2023 19:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230320091151.1118311-1-vanusuri@mvista.com>
In-Reply-To: <20230320091151.1118311-1-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Wed, 29 Mar 2023 08:19:10 +0530
Message-ID: <CANQUz1-uJuDR_LeVoLyVRjHnPHdN7XMS6YnE_oXebOxJRhhnVw@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] git: Security fix for CVE-2023-22490
 and CVE-2023-23946
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fefdec05f80105f7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 02:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179257

--000000000000fefdec05f80105f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Any update for this patch?

Thanks & Regards,
Vijay

On Mon, Mar 20, 2023 at 2:42=E2=80=AFPM <vanusuri@mvista.com> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Upstream-Status: Backport from
> https://github.com/git/git/commit/58325b93c5b6212697b088371809e9948fee805=
2
> &
> <https://github.com/git/git/commit/58325b93c5b6212697b088371809e9948fee80=
52&>
> https://github.com/git/git/commit/cf8f6ce02a13f4d1979a53241afbee15a293fce=
9
> &
> <https://github.com/git/git/commit/cf8f6ce02a13f4d1979a53241afbee15a293fc=
e9&>
> https://github.com/git/git/commit/bffc762f87ae8d18c6001bf0044a76004245754=
c
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../git/files/CVE-2023-22490-1.patch          | 179 +++++++++++++++++
>  .../git/files/CVE-2023-22490-2.patch          | 122 ++++++++++++
>  .../git/files/CVE-2023-22490-3.patch          | 154 +++++++++++++++
>  .../git/files/CVE-2023-23946.patch            | 184 ++++++++++++++++++
>  meta/recipes-devtools/git/git.inc             |   4 +
>  5 files changed, 643 insertions(+)
>  create mode 100644 meta/recipes-devtools/git/files/CVE-2023-22490-1.patc=
h
>  create mode 100644 meta/recipes-devtools/git/files/CVE-2023-22490-2.patc=
h
>  create mode 100644 meta/recipes-devtools/git/files/CVE-2023-22490-3.patc=
h
>  create mode 100644 meta/recipes-devtools/git/files/CVE-2023-23946.patch
>
> diff --git a/meta/recipes-devtools/git/files/CVE-2023-22490-1.patch
> b/meta/recipes-devtools/git/files/CVE-2023-22490-1.patch
> new file mode 100644
> index 0000000000..cc9b448c5c
> --- /dev/null
> +++ b/meta/recipes-devtools/git/files/CVE-2023-22490-1.patch
> @@ -0,0 +1,179 @@
> +From 58325b93c5b6212697b088371809e9948fee8052 Mon Sep 17 00:00:00 2001
> +From: Taylor Blau <me@ttaylorr.com>
> +Date: Tue, 24 Jan 2023 19:43:45 -0500
> +Subject: [PATCH 1/3] t5619: demonstrate clone_local() with ambiguous
> transport
> +
> +When cloning a repository, Git must determine (a) what transport
> +mechanism to use, and (b) whether or not the clone is local.
> +
> +Since f38aa83 (use local cloning if insteadOf makes a local URL,
> +2014-07-17), the latter check happens after the remote has been
> +initialized, and references the remote's URL instead of the local path.
> +This is done to make it possible for a `url.<base>.insteadOf` rule to
> +convert a remote URL into a local one, in which case the `clone_local()`
> +mechanism should be used.
> +
> +However, with a specially crafted repository, Git can be tricked into
> +using a non-local transport while still setting `is_local` to "1" and
> +using the `clone_local()` optimization. The below test case
> +demonstrates such an instance, and shows that it can be used to include
> +arbitrary (known) paths in the working copy of a cloned repository on a
> +victim's machine[^1], even if local file clones are forbidden by
> +`protocol.file.allow`.
> +
> +This happens in a few parts:
> +
> + 1. We first call `get_repo_path()` to see if the remote is a local
> +    path. If it is, we replace the repo name with its absolute path.
> +
> + 2. We then call `transport_get()` on the repo name and decide how to
> +    access it. If it was turned into an absolute path in the previous
> +    step, then we should always treat it like a file.
> +
> + 3. We use `get_repo_path()` again, and set `is_local` as appropriate.
> +    But it's already too late to rewrite the repo name as an absolute
> +    path, since we've already fed it to the transport code.
> +
> +The attack works by including a submodule whose URL corresponds to a
> +path on disk. In the below example, the repository "sub" is reachable
> +via the dumb HTTP protocol at (something like):
> +
> +    http://127.0.0.1:NNNN/dumb/sub.git
> +
> +However, the path "http:/127.0.0.1:NNNN/dumb" (that is, a top-level
> +directory called "http:", then nested directories "127.0.0.1:NNNN", and
> +"dumb") exists within the repository, too.
> +
> +To determine this, it first picks the appropriate transport, which is
> +dumb HTTP. It then uses the remote's URL in order to determine whether
> +the repository exists locally on disk. However, the malicious repository
> +also contains an embedded stub repository which is the target of a
> +symbolic link at the local path corresponding to the "sub" repository on
> +disk (i.e., there is a symbolic link at "http:/127.0.0.1/dumb/sub.git",
> +pointing to the stub repository via ".git/modules/sub/../../../repo").
> +
> +This stub repository fools Git into thinking that a local repository
> +exists at that URL and thus can be cloned locally. The affected call is
> +in `get_repo_path()`, which in turn calls `get_repo_path_1()`, which
> +locates a valid repository at that target.
> +
> +This then causes Git to set the `is_local` variable to "1", and in turn
> +instructs Git to clone the repository using its local clone optimization
> +via the `clone_local()` function.
> +
> +The exploit comes into play because the stub repository's top-level
> +"$GIT_DIR/objects" directory is a symbolic link which can point to an
> +arbitrary path on the victim's machine. `clone_local()` resolves the
> +top-level "objects" directory through a `stat(2)` call, meaning that we
> +read through the symbolic link and copy or hardlink the directory
> +contents at the destination of the link.
> +
> +In other words, we can get steps (1) and (3) to disagree by leveraging
> +the dangling symlink to pick a non-local transport in the first step,
> +and then set is_local to "1" in the third step when cloning with
> +`--separate-git-dir`, which makes the symlink non-dangling.
> +
> +This can result in data-exfiltration on the victim's machine when
> +sensitive data is at a known path (e.g., "/home/$USER/.ssh").
> +
> +The appropriate fix is two-fold:
> +
> + - Resolve the transport later on (to avoid using the local
> +   clone optimization with a non-local transport).
> +
> + - Avoid reading through the top-level "objects" directory when
> +   (correctly) using the clone_local() optimization.
> +
> +This patch merely demonstrates the issue. The following two patches will
> +implement each part of the above fix, respectively.
> +
> +[^1]: Provided that any target directory does not contain symbolic
> +  links, in which case the changes from 6f054f9 (builtin/clone.c:
> +  disallow `--local` clones with symlinks, 2022-07-28) will abort the
> +  clone.
> +
> +Reported-by: yvvdwf <yvvdwf@gmail.com>
> +Signed-off-by: Taylor Blau <me@ttaylorr.com>
> +Signed-off-by: Junio C Hamano <gitster@pobox.com>
> +
> +Upstream-Status: Backport
> +[
> https://github.com/git/git/commit/58325b93c5b6212697b088371809e9948fee805=
2
> ]
> +CVE: CVE-2023-22490
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + t/t5619-clone-local-ambiguous-transport.sh | 63 ++++++++++++++++++++++
> + 1 file changed, 63 insertions(+)
> + create mode 100644 t/t5619-clone-local-ambiguous-transport.sh
> +
> +diff --git a/t/t5619-clone-local-ambiguous-transport.sh
> b/t/t5619-clone-local-ambiguous-transport.sh
> +new file mode 100644
> +index 0000000..7ebd31a
> +--- /dev/null
> ++++ b/t/t5619-clone-local-ambiguous-transport.sh
> +@@ -0,0 +1,63 @@
> ++#!/bin/sh
> ++
> ++test_description=3D'test local clone with ambiguous transport'
> ++
> ++. ./test-lib.sh
> ++. "$TEST_DIRECTORY/lib-httpd.sh"
> ++
> ++if ! test_have_prereq SYMLINKS
> ++then
> ++      skip_all=3D'skipping test, symlink support unavailable'
> ++      test_done
> ++fi
> ++
> ++start_httpd
> ++
> ++REPO=3D"$HTTPD_DOCUMENT_ROOT_PATH/sub.git"
> ++URI=3D"$HTTPD_URL/dumb/sub.git"
> ++
> ++test_expect_success 'setup' '
> ++      mkdir -p sensitive &&
> ++      echo "secret" >sensitive/secret &&
> ++
> ++      git init --bare "$REPO" &&
> ++      test_commit_bulk -C "$REPO" --ref=3Dmain 1 &&
> ++
> ++      git -C "$REPO" update-ref HEAD main &&
> ++      git -C "$REPO" update-server-info &&
> ++
> ++      git init malicious &&
> ++      (
> ++              cd malicious &&
> ++
> ++              git submodule add "$URI" &&
> ++
> ++              mkdir -p repo/refs &&
> ++              touch repo/refs/.gitkeep &&
> ++              printf "ref: refs/heads/a" >repo/HEAD &&
> ++              ln -s "$(cd .. && pwd)/sensitive" repo/objects &&
> ++
> ++              mkdir -p "$HTTPD_URL/dumb" &&
> ++              ln -s "../../../.git/modules/sub/../../../repo/" "$URI" &=
&
> ++
> ++              git add . &&
> ++              git commit -m "initial commit"
> ++      ) &&
> ++
> ++      # Delete all of the references in our malicious submodule to
> ++      # avoid the client attempting to checkout any objects (which
> ++      # will be missing, and thus will cause the clone to fail before
> ++      # we can trigger the exploit).
> ++      git -C "$REPO" for-each-ref --format=3D"delete %(refname)" >in &&
> ++      git -C "$REPO" update-ref --stdin <in &&
> ++      git -C "$REPO" update-server-info
> ++'
> ++
> ++test_expect_failure 'ambiguous transport does not lead to arbitrary
> file-inclusion' '
> ++      git clone malicious clone &&
> ++      git -C clone submodule update --init &&
> ++
> ++      test_path_is_missing clone/.git/modules/sub/objects/secret
> ++'
> ++
> ++test_done
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/git/files/CVE-2023-22490-2.patch
> b/meta/recipes-devtools/git/files/CVE-2023-22490-2.patch
> new file mode 100644
> index 0000000000..0b5b40f827
> --- /dev/null
> +++ b/meta/recipes-devtools/git/files/CVE-2023-22490-2.patch
> @@ -0,0 +1,122 @@
> +From cf8f6ce02a13f4d1979a53241afbee15a293fce9 Mon Sep 17 00:00:00 2001
> +From: Taylor Blau <me@ttaylorr.com>
> +Date: Tue, 24 Jan 2023 19:43:48 -0500
> +Subject: [PATCH 2/3] clone: delay picking a transport until after
> get_repo_path()
> +
> +In the previous commit, t5619 demonstrates an issue where two calls to
> +`get_repo_path()` could trick Git into using its local clone mechanism
> +in conjunction with a non-local transport.
> +
> +That sequence is:
> +
> + - the starting state is that the local path https:/example.com/foo is a
> +   symlink that points to ../../../.git/modules/foo. So it's dangling.
> +
> + - get_repo_path() sees that no such path exists (because it's
> +   dangling), and thus we do not canonicalize it into an absolute path
> +
> + - because we're using --separate-git-dir, we create .git/modules/foo.
> +   Now our symlink is no longer dangling!
> +
> + - we pass the url to transport_get(), which sees it as an https URL.
> +
> + - we call get_repo_path() again, on the url. This second call was
> +   introduced by f38aa83 (use local cloning if insteadOf makes a
> +   local URL, 2014-07-17). The idea is that we want to pull the url
> +   fresh from the remote.c API, because it will apply any aliases.
> +
> +And of course now it sees that there is a local file, which is a
> +mismatch with the transport we already selected.
> +
> +The issue in the above sequence is calling `transport_get()` before
> +deciding whether or not the repository is indeed local, and not passing
> +in an absolute path if it is local.
> +
> +This is reminiscent of a similar bug report in [1], where it was
> +suggested to perform the `insteadOf` lookup earlier. Taking that
> +approach may not be as straightforward, since the intent is to store the
> +original URL in the config, but to actually fetch from the insteadOf
> +one, so conflating the two early on is a non-starter.
> +
> +Note: we pass the path returned by `get_repo_path(remote->url[0])`,
> +which should be the same as `repo_name` (aside from any `insteadOf`
> +rewrites).
> +
> +We *could* pass `absolute_pathdup()` of the same argument, which
> +86521ac (Bring local clone's origin URL in line with that of a remote
> +clone, 2008-09-01) indicates may differ depending on the presence of
> +".git/" for a non-bare repo. That matters for forming relative submodule
> +paths, but doesn't matter for the second call, since we're just feeding
> +it to the transport code, which is fine either way.
> +
> +[1]:
> https://lore.kernel.org/git/CAMoD=3DBi41mB3QRn3JdZL-FGHs4w3C2jGpnJB-CqSnd=
O7FMtfzA@mail.gmail.com/
> +
> +Signed-off-by: Jeff King <peff@peff.net>
> +Signed-off-by: Taylor Blau <me@ttaylorr.com>
> +Signed-off-by: Junio C Hamano <gitster@pobox.com>
> +
> +Upstream-Status: Backport
> +[
> https://github.com/git/git/commit/cf8f6ce02a13f4d1979a53241afbee15a293fce=
9
> ]
> +CVE: CVE-2023-22490
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + builtin/clone.c                            |  8 ++++----
> + t/t5619-clone-local-ambiguous-transport.sh | 15 +++++++++++----
> + 2 files changed, 15 insertions(+), 8 deletions(-)
> +
> +diff --git a/builtin/clone.c b/builtin/clone.c
> +index 53e04b1..b57e703 100644
> +--- a/builtin/clone.c
> ++++ b/builtin/clone.c
> +@@ -1112,10 +1112,6 @@ int cmd_clone(int argc, const char **argv, const
> char *prefix)
> +                   branch_top.buf);
> +       refspec_append(&remote->fetch, default_refspec.buf);
> +
> +-      transport =3D transport_get(remote, remote->url[0]);
> +-      transport_set_verbosity(transport, option_verbosity,
> option_progress);
> +-      transport->family =3D family;
> +-
> +       path =3D get_repo_path(remote->url[0], &is_bundle);
> +       is_local =3D option_local !=3D 0 && path && !is_bundle;
> +       if (is_local) {
> +@@ -1135,6 +1131,10 @@ int cmd_clone(int argc, const char **argv, const
> char *prefix)
> +       }
> +       if (option_local > 0 && !is_local)
> +               warning(_("--local is ignored"));
> ++
> ++      transport =3D transport_get(remote, path ? path : remote->url[0])=
;
> ++      transport_set_verbosity(transport, option_verbosity,
> option_progress);
> ++      transport->family =3D family;
> +       transport->cloning =3D 1;
> +
> +       transport_set_option(transport, TRANS_OPT_KEEP, "yes");
> +diff --git a/t/t5619-clone-local-ambiguous-transport.sh
> b/t/t5619-clone-local-ambiguous-transport.sh
> +index 7ebd31a..cce62bf 100644
> +--- a/t/t5619-clone-local-ambiguous-transport.sh
> ++++ b/t/t5619-clone-local-ambiguous-transport.sh
> +@@ -53,11 +53,18 @@ test_expect_success 'setup' '
> +       git -C "$REPO" update-server-info
> + '
> +
> +-test_expect_failure 'ambiguous transport does not lead to arbitrary
> file-inclusion' '
> ++test_expect_success 'ambiguous transport does not lead to arbitrary
> file-inclusion' '
> +       git clone malicious clone &&
> +-      git -C clone submodule update --init &&
> +-
> +-      test_path_is_missing clone/.git/modules/sub/objects/secret
> ++      test_must_fail git -C clone submodule update --init 2>err &&
> ++
> ++      test_path_is_missing clone/.git/modules/sub/objects/secret &&
> ++      # We would actually expect "transport .file. not allowed" here,
> ++      # but due to quirks of the URL detection in Git, we mis-parse
> ++      # the absolute path as a bogus URL and die before that step.
> ++      #
> ++      # This works for now, and if we ever fix the URL detection, it
> ++      # is OK to change this to detect the transport error.
> ++      grep "protocol .* is not supported" err
> + '
> +
> + test_done
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/git/files/CVE-2023-22490-3.patch
> b/meta/recipes-devtools/git/files/CVE-2023-22490-3.patch
> new file mode 100644
> index 0000000000..08fb7f840b
> --- /dev/null
> +++ b/meta/recipes-devtools/git/files/CVE-2023-22490-3.patch
> @@ -0,0 +1,154 @@
> +From bffc762f87ae8d18c6001bf0044a76004245754c Mon Sep 17 00:00:00 2001
> +From: Taylor Blau <me@ttaylorr.com>
> +Date: Tue, 24 Jan 2023 19:43:51 -0500
> +Subject: [PATCH 3/3] dir-iterator: prevent top-level symlinks without
> FOLLOW_SYMLINKS
> +
> +When using the dir_iterator API, we first stat(2) the base path, and
> +then use that as a starting point to enumerate the directory's contents.
> +
> +If the directory contains symbolic links, we will immediately die() upon
> +encountering them without the `FOLLOW_SYMLINKS` flag. The same is not
> +true when resolving the top-level directory, though.
> +
> +As explained in a previous commit, this oversight in 6f054f9
> +(builtin/clone.c: disallow `--local` clones with symlinks, 2022-07-28)
> +can be used as an attack vector to include arbitrary files on a victim's
> +filesystem from outside of the repository.
> +
> +Prevent resolving top-level symlinks unless the FOLLOW_SYMLINKS flag is
> +given, which will cause clones of a repository with a symlink'd
> +"$GIT_DIR/objects" directory to fail.
> +
> +Signed-off-by: Taylor Blau <me@ttaylorr.com>
> +Signed-off-by: Junio C Hamano <gitster@pobox.com>
> +
> +Upstream-Status: Backport
> +[
> https://github.com/git/git/commit/bffc762f87ae8d18c6001bf0044a76004245754=
c
> ]
> +CVE: CVE-2023-22490
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + dir-iterator.c             | 13 +++++++++----
> + dir-iterator.h             |  5 +++++
> + t/t0066-dir-iterator.sh    | 27 ++++++++++++++++++++++++++-
> + t/t5604-clone-reference.sh | 16 ++++++++++++++++
> + 4 files changed, 56 insertions(+), 5 deletions(-)
> +
> +diff --git a/dir-iterator.c b/dir-iterator.c
> +index b17e9f9..3764dd8 100644
> +--- a/dir-iterator.c
> ++++ b/dir-iterator.c
> +@@ -203,7 +203,7 @@ struct dir_iterator *dir_iterator_begin(const char
> *path, unsigned int flags)
> + {
> +       struct dir_iterator_int *iter =3D xcalloc(1, sizeof(*iter));
> +       struct dir_iterator *dir_iterator =3D &iter->base;
> +-      int saved_errno;
> ++      int saved_errno, err;
> +
> +       strbuf_init(&iter->base.path, PATH_MAX);
> +       strbuf_addstr(&iter->base.path, path);
> +@@ -213,10 +213,15 @@ struct dir_iterator *dir_iterator_begin(const char
> *path, unsigned int flags)
> +       iter->flags =3D flags;
> +
> +       /*
> +-       * Note: stat already checks for NULL or empty strings and
> +-       * inexistent paths.
> ++       * Note: stat/lstat already checks for NULL or empty strings and
> ++       * nonexistent paths.
> +        */
> +-      if (stat(iter->base.path.buf, &iter->base.st) < 0) {
> ++      if (iter->flags & DIR_ITERATOR_FOLLOW_SYMLINKS)
> ++              err =3D stat(iter->base.path.buf, &iter->base.st);
> ++      else
> ++              err =3D lstat(iter->base.path.buf, &iter->base.st);
> ++
> ++      if (err < 0) {
> +               saved_errno =3D errno;
> +               goto error_out;
> +       }
> +diff --git a/dir-iterator.h b/dir-iterator.h
> +index 0822915..e3b6ff2 100644
> +--- a/dir-iterator.h
> ++++ b/dir-iterator.h
> +@@ -61,6 +61,11 @@
> +  *   not the symlinks themselves, which is the default behavior. Broken
> +  *   symlinks are ignored.
> +  *
> ++ *   Note: setting DIR_ITERATOR_FOLLOW_SYMLINKS affects resolving the
> ++ *   starting path as well (e.g., attempting to iterate starting at a
> ++ *   symbolic link pointing to a directory without FOLLOW_SYMLINKS will
> ++ *   result in an error).
> ++ *
> +  * Warning: circular symlinks are also followed when
> +  * DIR_ITERATOR_FOLLOW_SYMLINKS is set. The iteration may end up with
> +  * an ELOOP if they happen and DIR_ITERATOR_PEDANTIC is set.
> +diff --git a/t/t0066-dir-iterator.sh b/t/t0066-dir-iterator.sh
> +index 92910e4..c826f60 100755
> +--- a/t/t0066-dir-iterator.sh
> ++++ b/t/t0066-dir-iterator.sh
> +@@ -109,7 +109,9 @@ test_expect_success SYMLINKS 'setup dirs with
> symlinks' '
> +       mkdir -p dir5/a/c &&
> +       ln -s ../c dir5/a/b/d &&
> +       ln -s ../ dir5/a/b/e &&
> +-      ln -s ../../ dir5/a/b/f
> ++      ln -s ../../ dir5/a/b/f &&
> ++
> ++      ln -s dir4 dir6
> + '
> +
> + test_expect_success SYMLINKS 'dir-iterator should not follow symlinks b=
y
> default' '
> +@@ -145,4 +147,27 @@ test_expect_success SYMLINKS 'dir-iterator should
> follow symlinks w/ follow flag
> +       test_cmp expected-follow-sorted-output actual-follow-sorted-outpu=
t
> + '
> +
> ++test_expect_success SYMLINKS 'dir-iterator does not resolve top-level
> symlinks' '
> ++      test_must_fail test-tool dir-iterator ./dir6 >out &&
> ++
> ++      grep "ENOTDIR" out
> ++'
> ++
> ++test_expect_success SYMLINKS 'dir-iterator resolves top-level symlinks
> w/ follow flag' '
> ++      cat >expected-follow-sorted-output <<-EOF &&
> ++      [d] (a) [a] ./dir6/a
> ++      [d] (a/f) [f] ./dir6/a/f
> ++      [d] (a/f/c) [c] ./dir6/a/f/c
> ++      [d] (b) [b] ./dir6/b
> ++      [d] (b/c) [c] ./dir6/b/c
> ++      [f] (a/d) [d] ./dir6/a/d
> ++      [f] (a/e) [e] ./dir6/a/e
> ++      EOF
> ++
> ++      test-tool dir-iterator --follow-symlinks ./dir6 >out &&
> ++      sort out >actual-follow-sorted-output &&
> ++
> ++      test_cmp expected-follow-sorted-output actual-follow-sorted-outpu=
t
> ++'
> ++
> + test_done
> +diff --git a/t/t5604-clone-reference.sh b/t/t5604-clone-reference.sh
> +index 4894237..615b981 100755
> +--- a/t/t5604-clone-reference.sh
> ++++ b/t/t5604-clone-reference.sh
> +@@ -354,4 +354,20 @@ test_expect_success SYMLINKS 'clone repo with
> symlinked or unknown files at obje
> +       test_must_be_empty T--shared.objects-symlinks.raw
> + '
> +
> ++test_expect_success SYMLINKS 'clone repo with symlinked objects
> directory' '
> ++      test_when_finished "rm -fr sensitive malicious" &&
> ++
> ++      mkdir -p sensitive &&
> ++      echo "secret" >sensitive/file &&
> ++
> ++      git init malicious &&
> ++      rm -fr malicious/.git/objects &&
> ++      ln -s "$(pwd)/sensitive" ./malicious/.git/objects &&
> ++
> ++      test_must_fail git clone --local malicious clone 2>err &&
> ++
> ++      test_path_is_missing clone &&
> ++      grep "failed to start iterator over" err
> ++'
> ++
> + test_done
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/git/files/CVE-2023-23946.patch
> b/meta/recipes-devtools/git/files/CVE-2023-23946.patch
> new file mode 100644
> index 0000000000..3629ff57b2
> --- /dev/null
> +++ b/meta/recipes-devtools/git/files/CVE-2023-23946.patch
> @@ -0,0 +1,184 @@
> +From fade728df1221598f42d391cf377e9e84a32053f Mon Sep 17 00:00:00 2001
> +From: Patrick Steinhardt <ps@pks.im>
> +Date: Thu, 2 Feb 2023 11:54:34 +0100
> +Subject: [PATCH] apply: fix writing behind newly created symbolic links
> +
> +When writing files git-apply(1) initially makes sure that none of the
> +files it is about to create are behind a symlink:
> +
> +```
> + $ git init repo
> + Initialized empty Git repository in /tmp/repo/.git/
> + $ cd repo/
> + $ ln -s dir symlink
> + $ git apply - <<EOF
> + diff --git a/symlink/file b/symlink/file
> + new file mode 100644
> + index 0000000..e69de29
> + EOF
> + error: affected file 'symlink/file' is beyond a symbolic link
> +```
> +
> +This safety mechanism is crucial to ensure that we don't write outside
> +of the repository's working directory. It can be fooled though when the
> +patch that is being applied creates the symbolic link in the first
> +place, which can lead to writing files in arbitrary locations.
> +
> +Fix this by checking whether the path we're about to create is
> +beyond a symlink or not. Tightening these checks like this should be
> +fine as we already have these precautions in Git as explained
> +above. Ideally, we should update the check we do up-front before
> +starting to reflect the computed changes to the working tree so that
> +we catch this case as well, but as part of embargoed security work,
> +adding an equivalent check just before we try to write out a file
> +should serve us well as a reasonable first step.
> +
> +Digging back into history shows that this vulnerability has existed
> +since at least Git v2.9.0. As Git v2.8.0 and older don't build on my
> +system anymore I cannot tell whether older versions are affected, as
> +well.
> +
> +Reported-by: Joern Schneeweisz <jschneeweisz@gitlab.com>
> +Signed-off-by: Patrick Steinhardt <ps@pks.im>
> +Signed-off-by: Junio C Hamano <gitster@pobox.com>
> +
> +Upstream-Status: Backport
> +[
> https://github.com/git/git/commit/fade728df1221598f42d391cf377e9e84a32053=
f
> ]
> +CVE: CVE-2023-23946
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + apply.c                  | 27 ++++++++++++++
> + t/t4115-apply-symlink.sh | 81 ++++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 108 insertions(+)
> +
> +diff --git a/apply.c b/apply.c
> +index f8a046a..4f303bf 100644
> +--- a/apply.c
> ++++ b/apply.c
> +@@ -4373,6 +4373,33 @@ static int create_one_file(struct apply_state
> *state,
> +       if (state->cached)
> +               return 0;
> +
> ++      /*
> ++       * We already try to detect whether files are beyond a symlink in
> our
> ++       * up-front checks. But in the case where symlinks are created by
> any
> ++       * of the intermediate hunks it can happen that our up-front chec=
ks
> ++       * didn't yet see the symlink, but at the point of arriving here
> there
> ++       * in fact is one. We thus repeat the check for symlinks here.
> ++       *
> ++       * Note that this does not make the up-front check obsolete as th=
e
> ++       * failure mode is different:
> ++       *
> ++       * - The up-front checks cause us to abort before we have written
> ++       *   anything into the working directory. So when we exit this wa=
y
> the
> ++       *   working directory remains clean.
> ++       *
> ++       * - The checks here happen in the middle of the action where we
> have
> ++       *   already started to apply the patch. The end result will be a
> dirty
> ++       *   working directory.
> ++       *
> ++       * Ideally, we should update the up-front checks to catch what
> would
> ++       * happen when we apply the patch before we damage the working
> tree.
> ++       * We have all the information necessary to do so.  But for now,
> as a
> ++       * part of embargoed security work, having this check would serve
> as a
> ++       * reasonable first step.
> ++       */
> ++      if (path_is_beyond_symlink(state, path))
> ++              return error(_("affected file '%s' is beyond a symbolic
> link"), path);
> ++
> +       res =3D try_create_file(state, path, mode, buf, size);
> +       if (res < 0)
> +               return -1;
> +diff --git a/t/t4115-apply-symlink.sh b/t/t4115-apply-symlink.sh
> +index 872fcda..1acb7b2 100755
> +--- a/t/t4115-apply-symlink.sh
> ++++ b/t/t4115-apply-symlink.sh
> +@@ -44,4 +44,85 @@ test_expect_success 'apply --index symlink patch' '
> +
> + '
> +
> ++test_expect_success 'symlink setup' '
> ++      ln -s .git symlink &&
> ++      git add symlink &&
> ++      git commit -m "add symlink"
> ++'
> ++
> ++test_expect_success SYMLINKS 'symlink escape when creating new files' '
> ++      test_when_finished "git reset --hard && git clean -dfx" &&
> ++
> ++      cat >patch <<-EOF &&
> ++      diff --git a/symlink b/renamed-symlink
> ++      similarity index 100%
> ++      rename from symlink
> ++      rename to renamed-symlink
> ++      --
> ++      diff --git /dev/null b/renamed-symlink/create-me
> ++      new file mode 100644
> ++      index 0000000..039727e
> ++      --- /dev/null
> ++      +++ b/renamed-symlink/create-me
> ++      @@ -0,0 +1,1 @@
> ++      +busted
> ++      EOF
> ++
> ++      test_must_fail git apply patch 2>stderr &&
> ++      cat >expected_stderr <<-EOF &&
> ++      error: affected file ${SQ}renamed-symlink/create-me${SQ} is beyon=
d
> a symbolic link
> ++      EOF
> ++      test_cmp expected_stderr stderr &&
> ++      ! test_path_exists .git/create-me
> ++'
> ++
> ++test_expect_success SYMLINKS 'symlink escape when modifying file' '
> ++      test_when_finished "git reset --hard && git clean -dfx" &&
> ++      touch .git/modify-me &&
> ++
> ++      cat >patch <<-EOF &&
> ++      diff --git a/symlink b/renamed-symlink
> ++      similarity index 100%
> ++      rename from symlink
> ++      rename to renamed-symlink
> ++      --
> ++      diff --git a/renamed-symlink/modify-me b/renamed-symlink/modify-m=
e
> ++      index 1111111..2222222 100644
> ++      --- a/renamed-symlink/modify-me
> ++      +++ b/renamed-symlink/modify-me
> ++      @@ -0,0 +1,1 @@
> ++      +busted
> ++      EOF
> ++
> ++      test_must_fail git apply patch 2>stderr &&
> ++      cat >expected_stderr <<-EOF &&
> ++      error: renamed-symlink/modify-me: No such file or directory
> ++      EOF
> ++      test_cmp expected_stderr stderr &&
> ++      test_must_be_empty .git/modify-me
> ++'
> ++
> ++test_expect_success SYMLINKS 'symlink escape when deleting file' '
> ++      test_when_finished "git reset --hard && git clean -dfx && rm
> .git/delete-me" &&
> ++      touch .git/delete-me &&
> ++
> ++      cat >patch <<-EOF &&
> ++      diff --git a/symlink b/renamed-symlink
> ++      similarity index 100%
> ++      rename from symlink
> ++      rename to renamed-symlink
> ++      --
> ++      diff --git a/renamed-symlink/delete-me b/renamed-symlink/delete-m=
e
> ++      deleted file mode 100644
> ++      index 1111111..0000000 100644
> ++      EOF
> ++
> ++      test_must_fail git apply patch 2>stderr &&
> ++      cat >expected_stderr <<-EOF &&
> ++      error: renamed-symlink/delete-me: No such file or directory
> ++      EOF
> ++      test_cmp expected_stderr stderr &&
> ++      test_path_is_file .git/delete-me
> ++'
> ++
> + test_done
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/git/git.inc
> b/meta/recipes-devtools/git/git.inc
> index 3c4c0fd37b..5eca2e21bf 100644
> --- a/meta/recipes-devtools/git/git.inc
> +++ b/meta/recipes-devtools/git/git.inc
> @@ -24,6 +24,10 @@ SRC_URI =3D
> "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=3Dtarball \
>             file://CVE-2022-41903-10.patch \
>             file://CVE-2022-41903-11.patch \
>             file://CVE-2022-41903-12.patch \
> +           file://CVE-2023-22490-1.patch \
> +           file://CVE-2023-22490-2.patch \
> +           file://CVE-2023-22490-3.patch \
> +           file://CVE-2023-23946.patch \
>             "
>  S =3D "${WORKDIR}/git-${PV}"
>
> --
> 2.25.1
>
>

--000000000000fefdec05f80105f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>Any update for this=
 patch?</div><div><br></div><div>Thanks &amp; Regards,</div><div>Vijay<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Mon, Mar 20, 2023 at 2:42=E2=80=AFPM &lt;<a href=3D"mailto:vanusuri=
@mvista.com">vanusuri@mvista.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Vijay Anusuri &lt;<a href=3D"mailto:=
vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
Upstream-Status: Backport from<br>
<a href=3D"https://github.com/git/git/commit/58325b93c5b6212697b088371809e9=
948fee8052&amp;" rel=3D"noreferrer" target=3D"_blank">https://github.com/gi=
t/git/commit/58325b93c5b6212697b088371809e9948fee8052<br>
&amp;</a><br>
<a href=3D"https://github.com/git/git/commit/cf8f6ce02a13f4d1979a53241afbee=
15a293fce9&amp;" rel=3D"noreferrer" target=3D"_blank">https://github.com/gi=
t/git/commit/cf8f6ce02a13f4d1979a53241afbee15a293fce9<br>
&amp;</a> <a href=3D"https://github.com/git/git/commit/bffc762f87ae8d18c600=
1bf0044a76004245754c" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/git/git/commit/bffc762f87ae8d18c6001bf0044a76004245754c</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../git/files/CVE-2023-22490-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 179 +++++++++++++++++<br>
=C2=A0.../git/files/CVE-2023-22490-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 122 ++++++++++++<br>
=C2=A0.../git/files/CVE-2023-22490-3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 154 +++++++++++++++<br>
=C2=A0.../git/files/CVE-2023-23946.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 184 ++++++++++++++++++<br>
=C2=A0meta/recipes-devtools/git/git.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A05 files changed, 643 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/git/files/CVE-2023-22490-1.p=
atch<br>
=C2=A0create mode 100644 meta/recipes-devtools/git/files/CVE-2023-22490-2.p=
atch<br>
=C2=A0create mode 100644 meta/recipes-devtools/git/files/CVE-2023-22490-3.p=
atch<br>
=C2=A0create mode 100644 meta/recipes-devtools/git/files/CVE-2023-23946.pat=
ch<br>
<br>
diff --git a/meta/recipes-devtools/git/files/CVE-2023-22490-1.patch b/meta/=
recipes-devtools/git/files/CVE-2023-22490-1.patch<br>
new file mode 100644<br>
index 0000000000..cc9b448c5c<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/git/files/CVE-2023-22490-1.patch<br>
@@ -0,0 +1,179 @@<br>
+From 58325b93c5b6212697b088371809e9948fee8052 Mon Sep 17 00:00:00 2001<br>
+From: Taylor Blau &lt;<a href=3D"mailto:me@ttaylorr.com" target=3D"_blank"=
>me@ttaylorr.com</a>&gt;<br>
+Date: Tue, 24 Jan 2023 19:43:45 -0500<br>
+Subject: [PATCH 1/3] t5619: demonstrate clone_local() with ambiguous trans=
port<br>
+<br>
+When cloning a repository, Git must determine (a) what transport<br>
+mechanism to use, and (b) whether or not the clone is local.<br>
+<br>
+Since f38aa83 (use local cloning if insteadOf makes a local URL,<br>
+2014-07-17), the latter check happens after the remote has been<br>
+initialized, and references the remote&#39;s URL instead of the local path=
.<br>
+This is done to make it possible for a `url.&lt;base&gt;.insteadOf` rule t=
o<br>
+convert a remote URL into a local one, in which case the `clone_local()`<b=
r>
+mechanism should be used.<br>
+<br>
+However, with a specially crafted repository, Git can be tricked into<br>
+using a non-local transport while still setting `is_local` to &quot;1&quot=
; and<br>
+using the `clone_local()` optimization. The below test case<br>
+demonstrates such an instance, and shows that it can be used to include<br=
>
+arbitrary (known) paths in the working copy of a cloned repository on a<br=
>
+victim&#39;s machine[^1], even if local file clones are forbidden by<br>
+`protocol.file.allow`.<br>
+<br>
+This happens in a few parts:<br>
+<br>
+ 1. We first call `get_repo_path()` to see if the remote is a local<br>
+=C2=A0 =C2=A0 path. If it is, we replace the repo name with its absolute p=
ath.<br>
+<br>
+ 2. We then call `transport_get()` on the repo name and decide how to<br>
+=C2=A0 =C2=A0 access it. If it was turned into an absolute path in the pre=
vious<br>
+=C2=A0 =C2=A0 step, then we should always treat it like a file.<br>
+<br>
+ 3. We use `get_repo_path()` again, and set `is_local` as appropriate.<br>
+=C2=A0 =C2=A0 But it&#39;s already too late to rewrite the repo name as an=
 absolute<br>
+=C2=A0 =C2=A0 path, since we&#39;ve already fed it to the transport code.<=
br>
+<br>
+The attack works by including a submodule whose URL corresponds to a<br>
+path on disk. In the below example, the repository &quot;sub&quot; is reac=
hable<br>
+via the dumb HTTP protocol at (something like):<br>
+<br>
+=C2=A0 =C2=A0 http://127.0.0.1:NNNN/dumb/sub.git<br>
+<br>
+However, the path &quot;http:/127.0.0.1:NNNN/dumb&quot; (that is, a top-le=
vel<br>
+directory called &quot;http:&quot;, then nested directories &quot;127.0.0.=
1:NNNN&quot;, and<br>
+&quot;dumb&quot;) exists within the repository, too.<br>
+<br>
+To determine this, it first picks the appropriate transport, which is<br>
+dumb HTTP. It then uses the remote&#39;s URL in order to determine whether=
<br>
+the repository exists locally on disk. However, the malicious repository<b=
r>
+also contains an embedded stub repository which is the target of a<br>
+symbolic link at the local path corresponding to the &quot;sub&quot; repos=
itory on<br>
+disk (i.e., there is a symbolic link at &quot;http:/<a href=3D"http://127.=
0.0.1/dumb/sub.git" rel=3D"noreferrer" target=3D"_blank">127.0.0.1/dumb/sub=
.git</a>&quot;,<br>
+pointing to the stub repository via &quot;.git/modules/sub/../../../repo&q=
uot;).<br>
+<br>
+This stub repository fools Git into thinking that a local repository<br>
+exists at that URL and thus can be cloned locally. The affected call is<br=
>
+in `get_repo_path()`, which in turn calls `get_repo_path_1()`, which<br>
+locates a valid repository at that target.<br>
+<br>
+This then causes Git to set the `is_local` variable to &quot;1&quot;, and =
in turn<br>
+instructs Git to clone the repository using its local clone optimization<b=
r>
+via the `clone_local()` function.<br>
+<br>
+The exploit comes into play because the stub repository&#39;s top-level<br=
>
+&quot;$GIT_DIR/objects&quot; directory is a symbolic link which can point =
to an<br>
+arbitrary path on the victim&#39;s machine. `clone_local()` resolves the<b=
r>
+top-level &quot;objects&quot; directory through a `stat(2)` call, meaning =
that we<br>
+read through the symbolic link and copy or hardlink the directory<br>
+contents at the destination of the link.<br>
+<br>
+In other words, we can get steps (1) and (3) to disagree by leveraging<br>
+the dangling symlink to pick a non-local transport in the first step,<br>
+and then set is_local to &quot;1&quot; in the third step when cloning with=
<br>
+`--separate-git-dir`, which makes the symlink non-dangling.<br>
+<br>
+This can result in data-exfiltration on the victim&#39;s machine when<br>
+sensitive data is at a known path (e.g., &quot;/home/$USER/.ssh&quot;).<br=
>
+<br>
+The appropriate fix is two-fold:<br>
+<br>
+ - Resolve the transport later on (to avoid using the local<br>
+=C2=A0 =C2=A0clone optimization with a non-local transport).<br>
+<br>
+ - Avoid reading through the top-level &quot;objects&quot; directory when<=
br>
+=C2=A0 =C2=A0(correctly) using the clone_local() optimization.<br>
+<br>
+This patch merely demonstrates the issue. The following two patches will<b=
r>
+implement each part of the above fix, respectively.<br>
+<br>
+[^1]: Provided that any target directory does not contain symbolic<br>
+=C2=A0 links, in which case the changes from 6f054f9 (builtin/clone.c:<br>
+=C2=A0 disallow `--local` clones with symlinks, 2022-07-28) will abort the=
<br>
+=C2=A0 clone.<br>
+<br>
+Reported-by: yvvdwf &lt;<a href=3D"mailto:yvvdwf@gmail.com" target=3D"_bla=
nk">yvvdwf@gmail.com</a>&gt;<br>
+Signed-off-by: Taylor Blau &lt;<a href=3D"mailto:me@ttaylorr.com" target=
=3D"_blank">me@ttaylorr.com</a>&gt;<br>
+Signed-off-by: Junio C Hamano &lt;<a href=3D"mailto:gitster@pobox.com" tar=
get=3D"_blank">gitster@pobox.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport<br>
+[<a href=3D"https://github.com/git/git/commit/58325b93c5b6212697b088371809=
e9948fee8052" rel=3D"noreferrer" target=3D"_blank">https://github.com/git/g=
it/commit/58325b93c5b6212697b088371809e9948fee8052</a>]<br>
+CVE: CVE-2023-22490<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ t/t5619-clone-local-ambiguous-transport.sh | 63 ++++++++++++++++++++++<br=
>
+ 1 file changed, 63 insertions(+)<br>
+ create mode 100644 t/t5619-clone-local-ambiguous-transport.sh<br>
+<br>
+diff --git a/t/t5619-clone-local-ambiguous-transport.sh b/t/t5619-clone-lo=
cal-ambiguous-transport.sh<br>
+new file mode 100644<br>
+index 0000000..7ebd31a<br>
+--- /dev/null<br>
++++ b/t/t5619-clone-local-ambiguous-transport.sh<br>
+@@ -0,0 +1,63 @@<br>
++#!/bin/sh<br>
++<br>
++test_description=3D&#39;test local clone with ambiguous transport&#39;<br=
>
++<br>
++. ./test-lib.sh<br>
++. &quot;$TEST_DIRECTORY/lib-httpd.sh&quot;<br>
++<br>
++if ! test_have_prereq SYMLINKS<br>
++then<br>
++=C2=A0 =C2=A0 =C2=A0 skip_all=3D&#39;skipping test, symlink support unava=
ilable&#39;<br>
++=C2=A0 =C2=A0 =C2=A0 test_done<br>
++fi<br>
++<br>
++start_httpd<br>
++<br>
++REPO=3D&quot;$HTTPD_DOCUMENT_ROOT_PATH/sub.git&quot;<br>
++URI=3D&quot;$HTTPD_URL/dumb/sub.git&quot;<br>
++<br>
++test_expect_success &#39;setup&#39; &#39;<br>
++=C2=A0 =C2=A0 =C2=A0 mkdir -p sensitive &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 echo &quot;secret&quot; &gt;sensitive/secret &amp;&a=
mp;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 git init --bare &quot;$REPO&quot; &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 test_commit_bulk -C &quot;$REPO&quot; --ref=3Dmain 1=
 &amp;&amp;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 git -C &quot;$REPO&quot; update-ref HEAD main &amp;&=
amp;<br>
++=C2=A0 =C2=A0 =C2=A0 git -C &quot;$REPO&quot; update-server-info &amp;&am=
p;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 git init malicious &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 (<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd malicious &amp;&amp;<=
br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git submodule add &quot;=
$URI&quot; &amp;&amp;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p repo/refs &amp;=
&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 touch repo/refs/.gitkeep=
 &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf &quot;ref: refs/h=
eads/a&quot; &gt;repo/HEAD &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s &quot;$(cd .. &amp=
;&amp; pwd)/sensitive&quot; repo/objects &amp;&amp;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p &quot;$HTTPD_UR=
L/dumb&quot; &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s &quot;../../../.gi=
t/modules/sub/../../../repo/&quot; &quot;$URI&quot; &amp;&amp;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git add . &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git commit -m &quot;init=
ial commit&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 ) &amp;&amp;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 # Delete all of the references in our malicious subm=
odule to<br>
++=C2=A0 =C2=A0 =C2=A0 # avoid the client attempting to checkout any object=
s (which<br>
++=C2=A0 =C2=A0 =C2=A0 # will be missing, and thus will cause the clone to =
fail before<br>
++=C2=A0 =C2=A0 =C2=A0 # we can trigger the exploit).<br>
++=C2=A0 =C2=A0 =C2=A0 git -C &quot;$REPO&quot; for-each-ref --format=3D&qu=
ot;delete %(refname)&quot; &gt;in &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 git -C &quot;$REPO&quot; update-ref --stdin &lt;in &=
amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 git -C &quot;$REPO&quot; update-server-info<br>
++&#39;<br>
++<br>
++test_expect_failure &#39;ambiguous transport does not lead to arbitrary f=
ile-inclusion&#39; &#39;<br>
++=C2=A0 =C2=A0 =C2=A0 git clone malicious clone &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 git -C clone submodule update --init &amp;&amp;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 test_path_is_missing clone/.git/modules/sub/objects/=
secret<br>
++&#39;<br>
++<br>
++test_done<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-devtools/git/files/CVE-2023-22490-2.patch b/meta/=
recipes-devtools/git/files/CVE-2023-22490-2.patch<br>
new file mode 100644<br>
index 0000000000..0b5b40f827<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/git/files/CVE-2023-22490-2.patch<br>
@@ -0,0 +1,122 @@<br>
+From cf8f6ce02a13f4d1979a53241afbee15a293fce9 Mon Sep 17 00:00:00 2001<br>
+From: Taylor Blau &lt;<a href=3D"mailto:me@ttaylorr.com" target=3D"_blank"=
>me@ttaylorr.com</a>&gt;<br>
+Date: Tue, 24 Jan 2023 19:43:48 -0500<br>
+Subject: [PATCH 2/3] clone: delay picking a transport until after get_repo=
_path()<br>
+<br>
+In the previous commit, t5619 demonstrates an issue where two calls to<br>
+`get_repo_path()` could trick Git into using its local clone mechanism<br>
+in conjunction with a non-local transport.<br>
+<br>
+That sequence is:<br>
+<br>
+ - the starting state is that the local path https:/<a href=3D"http://exam=
ple.com/foo" rel=3D"noreferrer" target=3D"_blank">example.com/foo</a> is a<=
br>
+=C2=A0 =C2=A0symlink that points to ../../../.git/modules/foo. So it&#39;s=
 dangling.<br>
+<br>
+ - get_repo_path() sees that no such path exists (because it&#39;s<br>
+=C2=A0 =C2=A0dangling), and thus we do not canonicalize it into an absolut=
e path<br>
+<br>
+ - because we&#39;re using --separate-git-dir, we create .git/modules/foo.=
<br>
+=C2=A0 =C2=A0Now our symlink is no longer dangling!<br>
+<br>
+ - we pass the url to transport_get(), which sees it as an https URL.<br>
+<br>
+ - we call get_repo_path() again, on the url. This second call was<br>
+=C2=A0 =C2=A0introduced by f38aa83 (use local cloning if insteadOf makes a=
<br>
+=C2=A0 =C2=A0local URL, 2014-07-17). The idea is that we want to pull the =
url<br>
+=C2=A0 =C2=A0fresh from the remote.c API, because it will apply any aliase=
s.<br>
+<br>
+And of course now it sees that there is a local file, which is a<br>
+mismatch with the transport we already selected.<br>
+<br>
+The issue in the above sequence is calling `transport_get()` before<br>
+deciding whether or not the repository is indeed local, and not passing<br=
>
+in an absolute path if it is local.<br>
+<br>
+This is reminiscent of a similar bug report in [1], where it was<br>
+suggested to perform the `insteadOf` lookup earlier. Taking that<br>
+approach may not be as straightforward, since the intent is to store the<b=
r>
+original URL in the config, but to actually fetch from the insteadOf<br>
+one, so conflating the two early on is a non-starter.<br>
+<br>
+Note: we pass the path returned by `get_repo_path(remote-&gt;url[0])`,<br>
+which should be the same as `repo_name` (aside from any `insteadOf`<br>
+rewrites).<br>
+<br>
+We *could* pass `absolute_pathdup()` of the same argument, which<br>
+86521ac (Bring local clone&#39;s origin URL in line with that of a remote<=
br>
+clone, 2008-09-01) indicates may differ depending on the presence of<br>
+&quot;.git/&quot; for a non-bare repo. That matters for forming relative s=
ubmodule<br>
+paths, but doesn&#39;t matter for the second call, since we&#39;re just fe=
eding<br>
+it to the transport code, which is fine either way.<br>
+<br>
+[1]: <a href=3D"https://lore.kernel.org/git/CAMoD=3DBi41mB3QRn3JdZL-FGHs4w=
3C2jGpnJB-CqSndO7FMtfzA@mail.gmail.com/" rel=3D"noreferrer" target=3D"_blan=
k">https://lore.kernel.org/git/CAMoD=3DBi41mB3QRn3JdZL-FGHs4w3C2jGpnJB-CqSn=
dO7FMtfzA@mail.gmail.com/</a><br>
+<br>
+Signed-off-by: Jeff King &lt;<a href=3D"mailto:peff@peff.net" target=3D"_b=
lank">peff@peff.net</a>&gt;<br>
+Signed-off-by: Taylor Blau &lt;<a href=3D"mailto:me@ttaylorr.com" target=
=3D"_blank">me@ttaylorr.com</a>&gt;<br>
+Signed-off-by: Junio C Hamano &lt;<a href=3D"mailto:gitster@pobox.com" tar=
get=3D"_blank">gitster@pobox.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport<br>
+[<a href=3D"https://github.com/git/git/commit/cf8f6ce02a13f4d1979a53241afb=
ee15a293fce9" rel=3D"noreferrer" target=3D"_blank">https://github.com/git/g=
it/commit/cf8f6ce02a13f4d1979a53241afbee15a293fce9</a>]<br>
+CVE: CVE-2023-22490<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ builtin/clone.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++----<br>
+ t/t5619-clone-local-ambiguous-transport.sh | 15 +++++++++++----<br>
+ 2 files changed, 15 insertions(+), 8 deletions(-)<br>
+<br>
+diff --git a/builtin/clone.c b/builtin/clone.c<br>
+index 53e04b1..b57e703 100644<br>
+--- a/builtin/clone.c<br>
++++ b/builtin/clone.c<br>
+@@ -1112,10 +1112,6 @@ int cmd_clone(int argc, const char **argv, const ch=
ar *prefix)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0branc=
h_top.buf);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0refspec_append(&amp;remote-&gt;fetch, default_r=
efspec.buf);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 transport =3D transport_get(remote, remote-&gt;url[0=
]);<br>
+-=C2=A0 =C2=A0 =C2=A0 transport_set_verbosity(transport, option_verbosity,=
 option_progress);<br>
+-=C2=A0 =C2=A0 =C2=A0 transport-&gt;family =3D family;<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D get_repo_path(remote-&gt;url[0], &amp;=
is_bundle);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0is_local =3D option_local !=3D 0 &amp;&amp; pat=
h &amp;&amp; !is_bundle;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_local) {<br>
+@@ -1135,6 +1131,10 @@ int cmd_clone(int argc, const char **argv, const ch=
ar *prefix)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (option_local &gt; 0 &amp;&amp; !is_local)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0warning(_(&quot;--l=
ocal is ignored&quot;));<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 transport =3D transport_get(remote, path ? path : re=
mote-&gt;url[0]);<br>
++=C2=A0 =C2=A0 =C2=A0 transport_set_verbosity(transport, option_verbosity,=
 option_progress);<br>
++=C2=A0 =C2=A0 =C2=A0 transport-&gt;family =3D family;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0transport-&gt;cloning =3D 1;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0transport_set_option(transport, TRANS_OPT_KEEP,=
 &quot;yes&quot;);<br>
+diff --git a/t/t5619-clone-local-ambiguous-transport.sh b/t/t5619-clone-lo=
cal-ambiguous-transport.sh<br>
+index 7ebd31a..cce62bf 100644<br>
+--- a/t/t5619-clone-local-ambiguous-transport.sh<br>
++++ b/t/t5619-clone-local-ambiguous-transport.sh<br>
+@@ -53,11 +53,18 @@ test_expect_success &#39;setup&#39; &#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0git -C &quot;$REPO&quot; update-server-info<br>
+ &#39;<br>
+ <br>
+-test_expect_failure &#39;ambiguous transport does not lead to arbitrary f=
ile-inclusion&#39; &#39;<br>
++test_expect_success &#39;ambiguous transport does not lead to arbitrary f=
ile-inclusion&#39; &#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0git clone malicious clone &amp;&amp;<br>
+-=C2=A0 =C2=A0 =C2=A0 git -C clone submodule update --init &amp;&amp;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 test_path_is_missing clone/.git/modules/sub/objects/=
secret<br>
++=C2=A0 =C2=A0 =C2=A0 test_must_fail git -C clone submodule update --init =
2&gt;err &amp;&amp;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 test_path_is_missing clone/.git/modules/sub/objects/=
secret &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 # We would actually expect &quot;transport .file. no=
t allowed&quot; here,<br>
++=C2=A0 =C2=A0 =C2=A0 # but due to quirks of the URL detection in Git, we =
mis-parse<br>
++=C2=A0 =C2=A0 =C2=A0 # the absolute path as a bogus URL and die before th=
at step.<br>
++=C2=A0 =C2=A0 =C2=A0 #<br>
++=C2=A0 =C2=A0 =C2=A0 # This works for now, and if we ever fix the URL det=
ection, it<br>
++=C2=A0 =C2=A0 =C2=A0 # is OK to change this to detect the transport error=
.<br>
++=C2=A0 =C2=A0 =C2=A0 grep &quot;protocol .* is not supported&quot; err<br=
>
+ &#39;<br>
+ <br>
+ test_done<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-devtools/git/files/CVE-2023-22490-3.patch b/meta/=
recipes-devtools/git/files/CVE-2023-22490-3.patch<br>
new file mode 100644<br>
index 0000000000..08fb7f840b<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/git/files/CVE-2023-22490-3.patch<br>
@@ -0,0 +1,154 @@<br>
+From bffc762f87ae8d18c6001bf0044a76004245754c Mon Sep 17 00:00:00 2001<br>
+From: Taylor Blau &lt;<a href=3D"mailto:me@ttaylorr.com" target=3D"_blank"=
>me@ttaylorr.com</a>&gt;<br>
+Date: Tue, 24 Jan 2023 19:43:51 -0500<br>
+Subject: [PATCH 3/3] dir-iterator: prevent top-level symlinks without FOLL=
OW_SYMLINKS<br>
+<br>
+When using the dir_iterator API, we first stat(2) the base path, and<br>
+then use that as a starting point to enumerate the directory&#39;s content=
s.<br>
+<br>
+If the directory contains symbolic links, we will immediately die() upon<b=
r>
+encountering them without the `FOLLOW_SYMLINKS` flag. The same is not<br>
+true when resolving the top-level directory, though.<br>
+<br>
+As explained in a previous commit, this oversight in 6f054f9<br>
+(builtin/clone.c: disallow `--local` clones with symlinks, 2022-07-28)<br>
+can be used as an attack vector to include arbitrary files on a victim&#39=
;s<br>
+filesystem from outside of the repository.<br>
+<br>
+Prevent resolving top-level symlinks unless the FOLLOW_SYMLINKS flag is<br=
>
+given, which will cause clones of a repository with a symlink&#39;d<br>
+&quot;$GIT_DIR/objects&quot; directory to fail.<br>
+<br>
+Signed-off-by: Taylor Blau &lt;<a href=3D"mailto:me@ttaylorr.com" target=
=3D"_blank">me@ttaylorr.com</a>&gt;<br>
+Signed-off-by: Junio C Hamano &lt;<a href=3D"mailto:gitster@pobox.com" tar=
get=3D"_blank">gitster@pobox.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport<br>
+[<a href=3D"https://github.com/git/git/commit/bffc762f87ae8d18c6001bf0044a=
76004245754c" rel=3D"noreferrer" target=3D"_blank">https://github.com/git/g=
it/commit/bffc762f87ae8d18c6001bf0044a76004245754c</a>]<br>
+CVE: CVE-2023-22490<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ dir-iterator.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 ++++++=
+++----<br>
+ dir-iterator.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +=
++++<br>
+ t/t0066-dir-iterator.sh=C2=A0 =C2=A0 | 27 ++++++++++++++++++++++++++-<br>
+ t/t5604-clone-reference.sh | 16 ++++++++++++++++<br>
+ 4 files changed, 56 insertions(+), 5 deletions(-)<br>
+<br>
+diff --git a/dir-iterator.c b/dir-iterator.c<br>
+index b17e9f9..3764dd8 100644<br>
+--- a/dir-iterator.c<br>
++++ b/dir-iterator.c<br>
+@@ -203,7 +203,7 @@ struct dir_iterator *dir_iterator_begin(const char *pa=
th, unsigned int flags)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dir_iterator_int *iter =3D xcalloc(1, si=
zeof(*iter));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dir_iterator *dir_iterator =3D &amp;iter=
-&gt;base;<br>
+-=C2=A0 =C2=A0 =C2=A0 int saved_errno;<br>
++=C2=A0 =C2=A0 =C2=A0 int saved_errno, err;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0strbuf_init(&amp;iter-&gt;base.path, PATH_MAX);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0strbuf_addstr(&amp;iter-&gt;base.path, path);<b=
r>
+@@ -213,10 +213,15 @@ struct dir_iterator *dir_iterator_begin(const char *=
path, unsigned int flags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0iter-&gt;flags =3D flags;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0* Note: stat already checks for NULL or empty =
strings and<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0* inexistent paths.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* Note: stat/lstat already checks for NULL or =
empty strings and<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* nonexistent paths.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 if (stat(iter-&gt;base.path.buf, &amp;iter-&gt;<a hr=
ef=3D"http://base.st" rel=3D"noreferrer" target=3D"_blank">base.st</a>) &lt=
; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 if (iter-&gt;flags &amp; DIR_ITERATOR_FOLLOW_SYMLINK=
S)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D stat(iter-&gt;ba=
se.path.buf, &amp;iter-&gt;<a href=3D"http://base.st" rel=3D"noreferrer" ta=
rget=3D"_blank">base.st</a>);<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D lstat(iter-&gt;b=
ase.path.buf, &amp;iter-&gt;<a href=3D"http://base.st" rel=3D"noreferrer" t=
arget=3D"_blank">base.st</a>);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (err &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0saved_errno =3D err=
no;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error_out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/dir-iterator.h b/dir-iterator.h<br>
+index 0822915..e3b6ff2 100644<br>
+--- a/dir-iterator.h<br>
++++ b/dir-iterator.h<br>
+@@ -61,6 +61,11 @@<br>
+=C2=A0 *=C2=A0 =C2=A0not the symlinks themselves, which is the default beh=
avior. Broken<br>
+=C2=A0 *=C2=A0 =C2=A0symlinks are ignored.<br>
+=C2=A0 *<br>
++ *=C2=A0 =C2=A0Note: setting DIR_ITERATOR_FOLLOW_SYMLINKS affects resolvi=
ng the<br>
++ *=C2=A0 =C2=A0starting path as well (e.g., attempting to iterate startin=
g at a<br>
++ *=C2=A0 =C2=A0symbolic link pointing to a directory without FOLLOW_SYMLI=
NKS will<br>
++ *=C2=A0 =C2=A0result in an error).<br>
++ *<br>
+=C2=A0 * Warning: circular symlinks are also followed when<br>
+=C2=A0 * DIR_ITERATOR_FOLLOW_SYMLINKS is set. The iteration may end up wit=
h<br>
+=C2=A0 * an ELOOP if they happen and DIR_ITERATOR_PEDANTIC is set.<br>
+diff --git a/t/t0066-dir-iterator.sh b/t/t0066-dir-iterator.sh<br>
+index 92910e4..c826f60 100755<br>
+--- a/t/t0066-dir-iterator.sh<br>
++++ b/t/t0066-dir-iterator.sh<br>
+@@ -109,7 +109,9 @@ test_expect_success SYMLINKS &#39;setup dirs with syml=
inks&#39; &#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p dir5/a/c &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ../c dir5/a/b/d &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ../ dir5/a/b/e &amp;&amp;<br>
+-=C2=A0 =C2=A0 =C2=A0 ln -s ../../ dir5/a/b/f<br>
++=C2=A0 =C2=A0 =C2=A0 ln -s ../../ dir5/a/b/f &amp;&amp;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 ln -s dir4 dir6<br>
+ &#39;<br>
+ <br>
+ test_expect_success SYMLINKS &#39;dir-iterator should not follow symlinks=
 by default&#39; &#39;<br>
+@@ -145,4 +147,27 @@ test_expect_success SYMLINKS &#39;dir-iterator should=
 follow symlinks w/ follow flag<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_cmp expected-follow-sorted-output actual-f=
ollow-sorted-output<br>
+ &#39;<br>
+ <br>
++test_expect_success SYMLINKS &#39;dir-iterator does not resolve top-level=
 symlinks&#39; &#39;<br>
++=C2=A0 =C2=A0 =C2=A0 test_must_fail test-tool dir-iterator ./dir6 &gt;out=
 &amp;&amp;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 grep &quot;ENOTDIR&quot; out<br>
++&#39;<br>
++<br>
++test_expect_success SYMLINKS &#39;dir-iterator resolves top-level symlink=
s w/ follow flag&#39; &#39;<br>
++=C2=A0 =C2=A0 =C2=A0 cat &gt;expected-follow-sorted-output &lt;&lt;-EOF &=
amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 [d] (a) [a] ./dir6/a<br>
++=C2=A0 =C2=A0 =C2=A0 [d] (a/f) [f] ./dir6/a/f<br>
++=C2=A0 =C2=A0 =C2=A0 [d] (a/f/c) [c] ./dir6/a/f/c<br>
++=C2=A0 =C2=A0 =C2=A0 [d] (b) [b] ./dir6/b<br>
++=C2=A0 =C2=A0 =C2=A0 [d] (b/c) [c] ./dir6/b/c<br>
++=C2=A0 =C2=A0 =C2=A0 [f] (a/d) [d] ./dir6/a/d<br>
++=C2=A0 =C2=A0 =C2=A0 [f] (a/e) [e] ./dir6/a/e<br>
++=C2=A0 =C2=A0 =C2=A0 EOF<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 test-tool dir-iterator --follow-symlinks ./dir6 &gt;=
out &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 sort out &gt;actual-follow-sorted-output &amp;&amp;<=
br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 test_cmp expected-follow-sorted-output actual-follow=
-sorted-output<br>
++&#39;<br>
++<br>
+ test_done<br>
+diff --git a/t/t5604-clone-reference.sh b/t/t5604-clone-reference.sh<br>
+index 4894237..615b981 100755<br>
+--- a/t/t5604-clone-reference.sh<br>
++++ b/t/t5604-clone-reference.sh<br>
+@@ -354,4 +354,20 @@ test_expect_success SYMLINKS &#39;clone repo with sym=
linked or unknown files at obje<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_must_be_empty T--shared.objects-symlinks.r=
aw<br>
+ &#39;<br>
+ <br>
++test_expect_success SYMLINKS &#39;clone repo with symlinked objects direc=
tory&#39; &#39;<br>
++=C2=A0 =C2=A0 =C2=A0 test_when_finished &quot;rm -fr sensitive malicious&=
quot; &amp;&amp;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 mkdir -p sensitive &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 echo &quot;secret&quot; &gt;sensitive/file &amp;&amp=
;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 git init malicious &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 rm -fr malicious/.git/objects &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 ln -s &quot;$(pwd)/sensitive&quot; ./malicious/.git/=
objects &amp;&amp;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 test_must_fail git clone --local malicious clone 2&g=
t;err &amp;&amp;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 test_path_is_missing clone &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 grep &quot;failed to start iterator over&quot; err<b=
r>
++&#39;<br>
++<br>
+ test_done<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-devtools/git/files/CVE-2023-23946.patch b/meta/re=
cipes-devtools/git/files/CVE-2023-23946.patch<br>
new file mode 100644<br>
index 0000000000..3629ff57b2<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/git/files/CVE-2023-23946.patch<br>
@@ -0,0 +1,184 @@<br>
+From fade728df1221598f42d391cf377e9e84a32053f Mon Sep 17 00:00:00 2001<br>
+From: Patrick Steinhardt &lt;<a href=3D"mailto:ps@pks.im" target=3D"_blank=
">ps@pks.im</a>&gt;<br>
+Date: Thu, 2 Feb 2023 11:54:34 +0100<br>
+Subject: [PATCH] apply: fix writing behind newly created symbolic links<br=
>
+<br>
+When writing files git-apply(1) initially makes sure that none of the<br>
+files it is about to create are behind a symlink:<br>
+<br>
+```<br>
+ $ git init repo<br>
+ Initialized empty Git repository in /tmp/repo/.git/<br>
+ $ cd repo/<br>
+ $ ln -s dir symlink<br>
+ $ git apply - &lt;&lt;EOF<br>
+ diff --git a/symlink/file b/symlink/file<br>
+ new file mode 100644<br>
+ index 0000000..e69de29<br>
+ EOF<br>
+ error: affected file &#39;symlink/file&#39; is beyond a symbolic link<br>
+```<br>
+<br>
+This safety mechanism is crucial to ensure that we don&#39;t write outside=
<br>
+of the repository&#39;s working directory. It can be fooled though when th=
e<br>
+patch that is being applied creates the symbolic link in the first<br>
+place, which can lead to writing files in arbitrary locations.<br>
+<br>
+Fix this by checking whether the path we&#39;re about to create is<br>
+beyond a symlink or not. Tightening these checks like this should be<br>
+fine as we already have these precautions in Git as explained<br>
+above. Ideally, we should update the check we do up-front before<br>
+starting to reflect the computed changes to the working tree so that<br>
+we catch this case as well, but as part of embargoed security work,<br>
+adding an equivalent check just before we try to write out a file<br>
+should serve us well as a reasonable first step.<br>
+<br>
+Digging back into history shows that this vulnerability has existed<br>
+since at least Git v2.9.0. As Git v2.8.0 and older don&#39;t build on my<b=
r>
+system anymore I cannot tell whether older versions are affected, as<br>
+well.<br>
+<br>
+Reported-by: Joern Schneeweisz &lt;<a href=3D"mailto:jschneeweisz@gitlab.c=
om" target=3D"_blank">jschneeweisz@gitlab.com</a>&gt;<br>
+Signed-off-by: Patrick Steinhardt &lt;<a href=3D"mailto:ps@pks.im" target=
=3D"_blank">ps@pks.im</a>&gt;<br>
+Signed-off-by: Junio C Hamano &lt;<a href=3D"mailto:gitster@pobox.com" tar=
get=3D"_blank">gitster@pobox.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport<br>
+[<a href=3D"https://github.com/git/git/commit/fade728df1221598f42d391cf377=
e9e84a32053f" rel=3D"noreferrer" target=3D"_blank">https://github.com/git/g=
it/commit/fade728df1221598f42d391cf377e9e84a32053f</a>]<br>
+CVE: CVE-2023-23946<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ apply.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=
7 ++++++++++++++<br>
+ t/t4115-apply-symlink.sh | 81 ++++++++++++++++++++++++++++++++++++++++<br=
>
+ 2 files changed, 108 insertions(+)<br>
+<br>
+diff --git a/apply.c b/apply.c<br>
+index f8a046a..4f303bf 100644<br>
+--- a/apply.c<br>
++++ b/apply.c<br>
+@@ -4373,6 +4373,33 @@ static int create_one_file(struct apply_state *stat=
e,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (state-&gt;cached)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* We already try to detect whether files are b=
eyond a symlink in our<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* up-front checks. But in the case where symli=
nks are created by any<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* of the intermediate hunks it can happen that=
 our up-front checks<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* didn&#39;t yet see the symlink, but at the p=
oint of arriving here there<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* in fact is one. We thus repeat the check for=
 symlinks here.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* Note that this does not make the up-front ch=
eck obsolete as the<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* failure mode is different:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* - The up-front checks cause us to abort befo=
re we have written<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0anything into the working direct=
ory. So when we exit this way the<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0working directory remains clean.=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* - The checks here happen in the middle of th=
e action where we have<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0already started to apply the pat=
ch. The end result will be a dirty<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0working directory.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* Ideally, we should update the up-front check=
s to catch what would<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* happen when we apply the patch before we dam=
age the working tree.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* We have all the information necessary to do =
so.=C2=A0 But for now, as a<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* part of embargoed security work, having this=
 check would serve as a<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* reasonable first step.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 if (path_is_beyond_symlink(state, path))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return error(_(&quot;aff=
ected file &#39;%s&#39; is beyond a symbolic link&quot;), path);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D try_create_file(state, path, mode, buf,=
 size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (res &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+diff --git a/t/t4115-apply-symlink.sh b/t/t4115-apply-symlink.sh<br>
+index 872fcda..1acb7b2 100755<br>
+--- a/t/t4115-apply-symlink.sh<br>
++++ b/t/t4115-apply-symlink.sh<br>
+@@ -44,4 +44,85 @@ test_expect_success &#39;apply --index symlink patch&#3=
9; &#39;<br>
+ <br>
+ &#39;<br>
+ <br>
++test_expect_success &#39;symlink setup&#39; &#39;<br>
++=C2=A0 =C2=A0 =C2=A0 ln -s .git symlink &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 git add symlink &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 git commit -m &quot;add symlink&quot;<br>
++&#39;<br>
++<br>
++test_expect_success SYMLINKS &#39;symlink escape when creating new files&=
#39; &#39;<br>
++=C2=A0 =C2=A0 =C2=A0 test_when_finished &quot;git reset --hard &amp;&amp;=
 git clean -dfx&quot; &amp;&amp;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 cat &gt;patch &lt;&lt;-EOF &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 diff --git a/symlink b/renamed-symlink<br>
++=C2=A0 =C2=A0 =C2=A0 similarity index 100%<br>
++=C2=A0 =C2=A0 =C2=A0 rename from symlink<br>
++=C2=A0 =C2=A0 =C2=A0 rename to renamed-symlink<br>
++=C2=A0 =C2=A0 =C2=A0 --<br>
++=C2=A0 =C2=A0 =C2=A0 diff --git /dev/null b/renamed-symlink/create-me<br>
++=C2=A0 =C2=A0 =C2=A0 new file mode 100644<br>
++=C2=A0 =C2=A0 =C2=A0 index 0000000..039727e<br>
++=C2=A0 =C2=A0 =C2=A0 --- /dev/null<br>
++=C2=A0 =C2=A0 =C2=A0 +++ b/renamed-symlink/create-me<br>
++=C2=A0 =C2=A0 =C2=A0 @@ -0,0 +1,1 @@<br>
++=C2=A0 =C2=A0 =C2=A0 +busted<br>
++=C2=A0 =C2=A0 =C2=A0 EOF<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 test_must_fail git apply patch 2&gt;stderr &amp;&amp=
;<br>
++=C2=A0 =C2=A0 =C2=A0 cat &gt;expected_stderr &lt;&lt;-EOF &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 error: affected file ${SQ}renamed-symlink/create-me$=
{SQ} is beyond a symbolic link<br>
++=C2=A0 =C2=A0 =C2=A0 EOF<br>
++=C2=A0 =C2=A0 =C2=A0 test_cmp expected_stderr stderr &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 ! test_path_exists .git/create-me<br>
++&#39;<br>
++<br>
++test_expect_success SYMLINKS &#39;symlink escape when modifying file&#39;=
 &#39;<br>
++=C2=A0 =C2=A0 =C2=A0 test_when_finished &quot;git reset --hard &amp;&amp;=
 git clean -dfx&quot; &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 touch .git/modify-me &amp;&amp;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 cat &gt;patch &lt;&lt;-EOF &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 diff --git a/symlink b/renamed-symlink<br>
++=C2=A0 =C2=A0 =C2=A0 similarity index 100%<br>
++=C2=A0 =C2=A0 =C2=A0 rename from symlink<br>
++=C2=A0 =C2=A0 =C2=A0 rename to renamed-symlink<br>
++=C2=A0 =C2=A0 =C2=A0 --<br>
++=C2=A0 =C2=A0 =C2=A0 diff --git a/renamed-symlink/modify-me b/renamed-sym=
link/modify-me<br>
++=C2=A0 =C2=A0 =C2=A0 index 1111111..2222222 100644<br>
++=C2=A0 =C2=A0 =C2=A0 --- a/renamed-symlink/modify-me<br>
++=C2=A0 =C2=A0 =C2=A0 +++ b/renamed-symlink/modify-me<br>
++=C2=A0 =C2=A0 =C2=A0 @@ -0,0 +1,1 @@<br>
++=C2=A0 =C2=A0 =C2=A0 +busted<br>
++=C2=A0 =C2=A0 =C2=A0 EOF<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 test_must_fail git apply patch 2&gt;stderr &amp;&amp=
;<br>
++=C2=A0 =C2=A0 =C2=A0 cat &gt;expected_stderr &lt;&lt;-EOF &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 error: renamed-symlink/modify-me: No such file or di=
rectory<br>
++=C2=A0 =C2=A0 =C2=A0 EOF<br>
++=C2=A0 =C2=A0 =C2=A0 test_cmp expected_stderr stderr &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 test_must_be_empty .git/modify-me<br>
++&#39;<br>
++<br>
++test_expect_success SYMLINKS &#39;symlink escape when deleting file&#39; =
&#39;<br>
++=C2=A0 =C2=A0 =C2=A0 test_when_finished &quot;git reset --hard &amp;&amp;=
 git clean -dfx &amp;&amp; rm .git/delete-me&quot; &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 touch .git/delete-me &amp;&amp;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 cat &gt;patch &lt;&lt;-EOF &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 diff --git a/symlink b/renamed-symlink<br>
++=C2=A0 =C2=A0 =C2=A0 similarity index 100%<br>
++=C2=A0 =C2=A0 =C2=A0 rename from symlink<br>
++=C2=A0 =C2=A0 =C2=A0 rename to renamed-symlink<br>
++=C2=A0 =C2=A0 =C2=A0 --<br>
++=C2=A0 =C2=A0 =C2=A0 diff --git a/renamed-symlink/delete-me b/renamed-sym=
link/delete-me<br>
++=C2=A0 =C2=A0 =C2=A0 deleted file mode 100644<br>
++=C2=A0 =C2=A0 =C2=A0 index 1111111..0000000 100644<br>
++=C2=A0 =C2=A0 =C2=A0 EOF<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 test_must_fail git apply patch 2&gt;stderr &amp;&amp=
;<br>
++=C2=A0 =C2=A0 =C2=A0 cat &gt;expected_stderr &lt;&lt;-EOF &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 error: renamed-symlink/delete-me: No such file or di=
rectory<br>
++=C2=A0 =C2=A0 =C2=A0 EOF<br>
++=C2=A0 =C2=A0 =C2=A0 test_cmp expected_stderr stderr &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 test_path_is_file .git/delete-me<br>
++&#39;<br>
++<br>
+ test_done<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/=
git.inc<br>
index 3c4c0fd37b..5eca2e21bf 100644<br>
--- a/meta/recipes-devtools/git/git.inc<br>
+++ b/meta/recipes-devtools/git/git.inc<br>
@@ -24,6 +24,10 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/software/scm/git/g=
it-${PV}.tar.gz;name=3Dtarball \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2022-41903-10.patch \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2022-41903-11.patch \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2022-41903-12.patch \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-22490-1.patch \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-22490-2.patch \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-22490-3.patch \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-23946.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git-${PV}&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000fefdec05f80105f7--

